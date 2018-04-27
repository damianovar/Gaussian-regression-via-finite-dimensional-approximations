function Export1DBasisFunctionsIntoTxtFiles( tComputer, tParameters )
	%
	afStretchedBasisFunctionsDomain =						...
		linspace(	tComputer.tInputDomain.afXAxis(1),		...
					tComputer.tInputDomain.afXAxis(end),	...
					tParameters.iNumberOfSamplesPerDimensionWhenExportingTxtFiles);
	%
	%
	for iBasisFunction = 1:min(tComputer.iNumberOfBasisFunctions, 20);
		%
		%
		% stretch the current eigenfunction
		afStretchedBasisFunction =												...
			StretchSignal(	tComputer.ffBasisFunctions( :, iBasisFunction ),	...
							tComputer.tInputDomain.afXAxis,						...
							afStretchedBasisFunctionsDomain	);
		%
		%
		% compute the filename
		strFileName = sprintf(	'%s.BasisFunction%d.txt',				...
								tParameters.strNystromTxtFilesPrefix,	...
								iBasisFunction)
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
		for iSample = 1:numel(afStretchedBasisFunctionsDomain);
			%
			fprintf(fid,										...
					'%.10f %.10f\n',							...
					afStretchedBasisFunctionsDomain( iSample ),	...
					afStretchedBasisFunction(iSample) );
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

