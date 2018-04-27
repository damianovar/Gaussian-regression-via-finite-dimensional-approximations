% TODO optimize
%
function Export2DBasisFunctionsIntoTxtFiles( tComputer, tParameters )
	%
	afStretchedXAxis =										...
		linspace(	tComputer.tInputDomain.afXAxis(1),		...
					tComputer.tInputDomain.afXAxis(end),	...
					tParameters.iNumberOfSamplesPerDimensionWhenExportingTxtFiles);
	%
	afStretchedYAxis =										...
		linspace(	tComputer.tInputDomain.afYAxis(1),		...
					tComputer.tInputDomain.afYAxis(end),	...
					tParameters.iNumberOfSamplesPerDimensionWhenExportingTxtFiles);
	%
	for iBasisFunction = 1:min(tComputer.iNumberOfBasisFunctions, 10);
		%
		% compute the filename
		strFileName = sprintf(	'%s.BasisFunction%d.txt',				...
								tParameters.strNystromTxtFilesPrefix,	...
								iBasisFunction);
		%
		aafStretchedBasisFunction =												...
			Stretch2DSignal(	tComputer.ffBasisFunctions(:,:,iBasisFunction),	...
								tComputer.tInputDomain.afXAxis,					...
								tComputer.tInputDomain.afYAxis,					...
								afStretchedXAxis,								...
								afStretchedYAxis );
		%
		% open the file
		fid = fopen(strFileName, 'w');
		%
		%
		% write the data -- X VARIES
		for iY = 1:numel(afStretchedXAxis);
			%
			for iX = 1:numel(afStretchedXAxis);
				%
				fprintf(fid,							...
						'%.10f %.10f %.10f\n',			...
						afStretchedXAxis( iX ),			...
						afStretchedYAxis( iY ),			...
						aafStretchedBasisFunction(iX, iY) );
				%
			end;%
			%
			fprintf(fid, '\n');
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

