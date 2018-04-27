function GenerateCubicSplineKernel( tGenerator )
	%
	%
	switch( tGenerator.tInputDomain.iNumberOfDimensions )
		%
		case 1
			tGenerator.GenerateMonodimensionalCubicSplineKernel();
		%
		case 2
			tGenerator.GenerateBidimensionalCubicSplineKernel();
		%
		case 3
			tGenerator.GenerateTridimensionalCubicSplineKernel();
		%
		otherwise
			error( 'Too high dimension for kernel generation' );
		%
	end;%
	%
	%
end %
