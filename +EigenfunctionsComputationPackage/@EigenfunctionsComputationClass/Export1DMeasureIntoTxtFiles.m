function Export1DMeasureIntoTxtFile( tComputer, tParameters )
	%
	%
	afStretchedMeasureDomain =								...
		linspace(	tComputer.tInputDomain.afXAxis(1),		...
					tComputer.tInputDomain.afXAxis(end),	...
					tParameters.iNumberOfSamplesPerDimensionWhenExportingTxtFiles);
	%
	% stretch the measure
	afStretchedMeasure =									...
		StretchSignal(	tComputer.tMeasure.ffDomainMeasure,	...
						tComputer.tInputDomain.afXAxis,		...
						afStretchedMeasureDomain	);
	%
	% compute the filename
	strFileName = sprintf( '%s.Measure.txt', tParameters.strTxtFilesPrefix );
	%
	%
	% open the file
	fid = fopen(strFileName, 'w');
	%
	%
	% write the header
	fprintf(fid, 'x y\n');
	%
	%
	% write the data
	for iSample = 1:numel(afStretchedMeasureDomain);
		%
		fprintf(fid,								...
				'%.10f %.10f\n',					...
				afStretchedMeasureDomain(iSample),	...
				afStretchedMeasure(iSample)	);
		%
	end;%
	%
	%
	% close the file
	fclose(fid);
	%
	%
end %
