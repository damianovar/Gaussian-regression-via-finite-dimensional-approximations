function GenerateGaussianKernel( tGenerator, fVariance )
	%
	%
	if( fVariance <= 0 )
		%
		error( 'Non-positive variance???' );
		%
	end;%
	%
	%
	switch( tGenerator.tInputDomain.iNumberOfDimensions )
		%
		case 1
			tGenerator.GenerateMonodimensionalGaussianKernel( fVariance );
		%
		case 2
			tGenerator.GenerateBidimensionalGaussianKernel( fVariance );
		%
		case 3
			tGenerator.GenerateTridimensionalGaussianKernel( fVariance );
		%
		otherwise
			tGenerator.ffKernel = [];
		%
	end;%
	%
	%
end %
