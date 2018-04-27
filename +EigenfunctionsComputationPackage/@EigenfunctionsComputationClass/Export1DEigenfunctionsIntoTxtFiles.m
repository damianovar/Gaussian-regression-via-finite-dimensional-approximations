function Export1DEigenfunctionsIntoTxtFiles( tComputer, tParameters )
	%
	afStretchedEigenfunctionsDomain =						...
		linspace(	tComputer.tInputDomain.afXAxis(1),		...
					tComputer.tInputDomain.afXAxis(end),	...
					tParameters.iNumberOfSamplesPerDimensionWhenExportingTxtFiles);
	%
	%
	for iEigenfunction = 1:min(tComputer.iNumberOfEigenfunctions, 20);
		%
		%
		% stretch the current eigenfunction
		afStretchedEigenfunction =												...
			StretchSignal(	tComputer.ffEigenfunctions( :, iEigenfunction ),	...
							tComputer.tInputDomain.afXAxis,						...
							afStretchedEigenfunctionsDomain	);
		%
		%
		% compute the filename
		strFileName = sprintf(	'%s.Eigenfunction%d.txt',		...
								tParameters.strTxtFilesPrefix,	...
								iEigenfunction)
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
		for iSample = 1:numel(afStretchedEigenfunctionsDomain);
			%
			fprintf(fid,										...
					'%.10f %.10f\n',							...
					afStretchedEigenfunctionsDomain( iSample ),	...
					afStretchedEigenfunction(iSample) );
			%
		end;%
		%
		%
		% close the file
		fclose(fid);
		%
	end %
	%
end %

