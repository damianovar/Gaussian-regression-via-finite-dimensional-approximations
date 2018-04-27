function GenerateLaplacianKernel( tGenerator, fScale )
	%
	%
	if( fScale <= 0 )
		%
		error( 'Negative scale???' );
		%
	end;%
	%
	%
	switch( tGenerator.tInputDomain.iNumberOfDimensions )
		%
		case 1
			tGenerator.GenerateMonodimensionalLaplacianKernel( fScale );
		%
		case 2
			tGenerator.GenerateBidimensionalLaplacianKernel( fScale );
		%
		case 3
			tGenerator.GenerateTridimensionalLaplacianKernel( fScale );
		%
		otherwise
			tGenerator.ffKernel = [];
		%
	end;%
	%
	%
end %
