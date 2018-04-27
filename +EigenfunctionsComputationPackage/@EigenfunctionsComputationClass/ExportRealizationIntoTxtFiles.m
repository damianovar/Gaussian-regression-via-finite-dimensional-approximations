function ExportRealizationIntoTxtFiles(	tComputer,		...
										tParameters,	...
										ffRealization,	...
										iRealizationIndex )
	%
	switch( tComputer.tInputDomain.iNumberOfDimensions )
		%
		case 1
			%
			tComputer.Export1DRealizationIntoTxtFiles( tParameters, ffRealization, iRealizationIndex );
		%
		case 2
			%
			tComputer.Export2DRealizationIntoTxtFiles( tParameters, ffRealization, iRealizationIndex );
		%
		otherwise
			%
			error('not managed input domain dimensionality');
		%
	end;%
	%
end %

