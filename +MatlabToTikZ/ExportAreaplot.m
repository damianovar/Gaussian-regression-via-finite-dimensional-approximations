% function ExportAreaplot(strFileName,     ...
%                         afX,             ...
%                         afUpperY,        ...
%                         afLowerY,        ...
%                         astrHeader,      ... optional
%                         iSamplingPeriod, ... optional
%                         iPrecision,      ... optional
%                         bIsXInJulianDates) % optional
%
function ExportAreaplot(	strFileName,		...
							afX,				...
							afUpperY,			...
							afLowerY,			...
							astrHeader,			... optional, if not given then the header is 'x y1 y2 ...'
							iSamplingPeriod,	...	optional, if not given then the sampling period is 1
							iPrecision,			... optional, if not given then the precision is 5 digits after the comma
							bIsXInJulianDates	) % optional, it not given then the signals are not to be converted
	%
	%
	% --------------------------------------------------------------------------
	% FLAGS
	%
	% flag if there exists the header
	bHeaderIsPresent			= ( nargin > 4 );
	bSamplingPeriodIsPresent	= ( nargin > 5 );
	bPrecisionIsPresent			= ( nargin > 6 );
	bJulianDatesFlagsArePresent	= ( nargin > 7 );
	%
	% consistency checks
	if( bHeaderIsPresent )
		if( numel(astrHeader) ~= 2 )
			error('The elements of the header must be 2');
		end;%
	end;%
	%
	if( bJulianDatesFlagsArePresent )
		if( numel(bIsXInJulianDates) ~= 1 )
			error('inconsistent number of the flags of the julian dates: it must be 1');
		end;%
	end;%
	%
	if( numel(afX) ~= numel(afUpperY) || numel(afX) ~= numel(afLowerY) )
		error('the number of samples of the various signals must be the same');
	end;%
	%
	% set the header if not present
	if( ~bHeaderIsPresent )
		%
		astrHeader = [ {'x'}; {'y'} ];
		%
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
		bIsXInJulianDates = false;
		%
	end;%
	%
	% reshape the signals
	afX 		= reshape(afX, numel(afX), 1);
	afUpperY 	= reshape(afUpperY, numel(afUpperY), 1);
	afLowerY 	= reshape(afLowerY, numel(afLowerY), 1);
	%
	% create the signal
	afExtendedX = [ afX; flipud(afX) ];
	afExtendedY = [ afUpperY ; flipud(afLowerY) ];
	%
	% call the right export
	MatlabToTikZ.ExportLineplot(	strFileName,					...
									[afExtendedX, afExtendedY],		...
									astrHeader,						...
									iSamplingPeriod,				...
									iPrecision,						...
									[bIsXInJulianDates, false]		);
	%
end %
