function Export1DRealizationIntoTxtFiles(	tComputer,		...
											tParameters,	...
											afRealization,	...
											iRealizationIndex )
	%
	%
	afStretchedDomain =						...
		linspace(	tComputer.tInputDomain.afXAxis(1),		...
					tComputer.tInputDomain.afXAxis(end),	...
					tParameters.iNumberOfSamplesPerDimensionWhenExportingTxtFiles);
	%
	%
	% stretch the current eigenfunction
	afStretchedRealization =							...
		StretchSignal(	afRealization,					...
						tComputer.tInputDomain.afXAxis,	...
						afStretchedDomain	);
	%
	%
	% compute the filename
	strFileName = sprintf(	'%s.Realization%d.txt',			...
							tParameters.strTxtFilesPrefix,	...
							iRealizationIndex				);
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
	for iSample = 1:numel(afStretchedDomain);
		%
		fprintf(fid,							...
				'%.10f %.10f\n',				...
				afStretchedDomain( iSample ),	...
				afStretchedRealization(iSample) );
		%
	end;%
	%
	%
	% close the file
	fclose(fid);
	%
	%
end %

