% function ExportLineplot(strFileName,     ...
%                         aafSignals,      ...
%                         astrHeader,      ... optional
%                         iSamplingPeriod, ... optional
%                         iPrecision,      ... optional
%                         abJulianDates    ) % optional
%
% @strFileName  is the path to the .txt file that will be written
%
% @aafSignals is "column-wise", i.e., each column of aafSignals is a signal
%             notice: if there exists just one column, then that column is
%             considered as the "y". The "x" is then added automatically as
%             1:numel(y)
%
% @astrHeader  is optional, if not given then the header is 'x y1 y2 ...' or
%              'x, y1, y2, ...' depending on the presence or not of julian
%              dates. It is an array of cells, e.g., [ {a1}, {b5}, {time} ]
%
% @iSamplingPeriod  if set to "n" then the method prints 1 sample every n (but
%                   notice that the first and the last one are always kept).
%                   It is optional, if not given then the sampling period is 1
%
% @iPrecision  represents how many digits are written in the file per sample
%
% @abJulianDates  it says which signals are julian dates. A "true" forces the
%                 corresponding signal to be printed in a 
%                                  "year-month-day hour:min"
%                 format. This is done by using the corresponding method
%                 Time.JulianDateToString_TikZ(), so that eventually that column
%                 will be a set of strings. Notice that if there are some trues
%                 then, to help the parsing of the file, the various columns are
%                 separated by commas and not by spaces
%
function ExportLineplot(	strFileName,		...
							aafSignals,			...
							astrHeader,			... optional, if not given then the header is 'x y1 y2 ...'
							iSamplingPeriod,	...	optional, if not given then the sampling period is 1
							iPrecision,			... optional, if not given then the precision is 5 digits after the comma
							abJulianDates		) % optional, it not given then the signals are not to be converted
	%
	%
	% --------------------------------------------------------------------------
	% FLAGS
	%
	% for readability
	iNumberOfSignals 	= size( aafSignals, 2 );
	iNumberOfSamples  	= size( aafSignals, 1 );
	%
	% flag if there exists the header
	bHeaderIsPresent			= ( nargin > 2 );
	bSamplingPeriodIsPresent	= ( nargin > 3 );
	bPrecisionIsPresent			= ( nargin > 4 );
	bJulianDatesFlagsArePresent	= ( nargin > 5 );
	%
	% consistency checks
	if( bHeaderIsPresent )
		if( iNumberOfSignals ~= numel(astrHeader) )
			error('number of signals (%d) different from the number of elements in the header (%d): check if there is a transposed to be put in the signals or you forgot some elements in the header', iNumberOfSignals, numel(astrHeader) );
		end;%
	end;%
	if( bJulianDatesFlagsArePresent )
		if( iNumberOfSignals ~= numel(abJulianDates) )
			error('number of signals (%d) different from the number of flags on the Julian Dates (%d): check if there is a transposed to be put in the julian dates booleans vector', iNumberOfSignals, numel(abJulianDates) );
		end;%
	end;%
	%
	% set the sampling period to 1 if not present
	if( ~bSamplingPeriodIsPresent )
		%
		iSamplingPeriod = 1;
		%
	end;%
	%
	% set the precision to 5 if not present
	if( ~bPrecisionIsPresent )
		%
		iPrecision = 5;
		%
	end;%
	%
	% infer if there are columns to be written as dates
	if( ~bJulianDatesFlagsArePresent )
		%
		abJulianDates = zeros( iNumberOfSignals, 1 );
		%
	end;%
	%
	% if there exists at least one true then use commas
	bShouldUseCommasAsSeparators = sum(abJulianDates);
	%
	% for debug purposes
	iHowManySamplesHaveBeenWritten = 0;
	%
	%
	% --------------------------------------------------------------------------
	% HEADER
	%
	% open the file
	fid = fopen(strFileName, 'w');
	%
	% if the number of signals is 1, then add the "fake" x
	if( iNumberOfSignals == 1 )
		%
		aafSignals = [ (1:iNumberOfSamples)', aafSignals ];
		iNumberOfSignals = 2;
		abJulianDates = zeros( iNumberOfSignals, 1 );
		%
	end;%
	%
	% write the header -- if not present we must construct it
	if( ~bHeaderIsPresent )
		%
		astrHeader = MatlabToTikZ.ConstructDefaultHeader( aafSignals, abJulianDates );
		%
	end;%
	%
	% start actually writing the header
	strHeader = astrHeader{1};
	%
	for iSignal = 2:iNumberOfSignals;
		%
		if( bShouldUseCommasAsSeparators )
			%
			strHeader = strcat( strHeader, ',\t', astrHeader{iSignal} );
			%
		else%
			%
			strHeader = strcat( strHeader, '\t', astrHeader{iSignal} );
			%
		end;%
		%
	end;%
	%
	% add the newline
	strHeader = strcat( strHeader, '\n');
	%
	% write it on file
	fprintf(fid, strHeader);
	%
	%
	%
	% --------------------------------------------------------------------------
	% DATA
	%
	% write the data (but consider that the last datum is always written)
	for iSample = 1:iSamplingPeriod:iNumberOfSamples-1;
		%
		for iSignal = 1:iNumberOfSignals;
			%
			if( abJulianDates(iSignal) )
				%
				% case it is a julian date => convert to string
% 				fprintf(fid, '%s,\t', Time.JulianDateToString_TikZ( aafSignals(iSample, iSignal) ){1} );
				%
			else%
				%
				% case it is not a julian date => do not convert
				if( bShouldUseCommasAsSeparators && (iSignal < iNumberOfSignals) )
					%
					fprintf(fid, '%.*f,\t', iPrecision, aafSignals(iSample, iSignal) );
					%
				else%
					%
					fprintf(fid, '%.*f\t', iPrecision, aafSignals(iSample, iSignal) );
					%
				end;%
				%
			end;%
			%
		end;% cycle on the various signals
		%
		fprintf(fid, '\n');
		iHowManySamplesHaveBeenWritten = iHowManySamplesHaveBeenWritten + 1;
		%
	end;% all the data but last datum
	%
	% always write the last datum
	for iSignal = 1:iNumberOfSignals;
		%
		if( abJulianDates(iSignal) )
			%
			% case it is a julian date => convert to string
% 			fprintf(fid, '%s,\t', Time.JulianDateToString_TikZ( aafSignals(iNumberOfSamples, iSignal) ){1} );
			%
		else%
			%
			% case it is not a julian date => do not convert
			if( bShouldUseCommasAsSeparators && (iSignal < iNumberOfSignals) )
				%
				fprintf(fid, '%.*f,\t', iPrecision, aafSignals(iNumberOfSamples, iSignal) );
				%
			else%
				%
				fprintf(fid, '%.*f\t', iPrecision, aafSignals(iNumberOfSamples, iSignal) );
				%
			end;%
			%
		end;%
		%
		iHowManySamplesHaveBeenWritten = iHowManySamplesHaveBeenWritten + 1;
		%
	end;% last datum
	%
	% close the file
	fclose(fid);
	clear fid;
	%
	fprintf('%s exported. Written %d samples.\n', strFileName, iHowManySamplesHaveBeenWritten);
	%
end %
