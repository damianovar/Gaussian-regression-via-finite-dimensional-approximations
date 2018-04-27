function GenerateStableSplineKernel( tGenerator, fExponentialDecay )
	%
	%
	if( fExponentialDecay <= 0 )
		%
		error( 'Negative exponential decay???' );
		%
	end;%
	%
	%
	switch( tGenerator.tInputDomain.iNumberOfDimensions )
		%
		case 1
			tGenerator.GenerateMonodimensionalStableSplineKernel( fExponentialDecay );
		%
		case 2
			tGenerator.GenerateBidimensionalStableSplineKernel( fExponentialDecay );
		%
		case 3
			tGenerator.GenerateTridimensionalStableSplineKernel( fExponentialDecay );
		%
		otherwise
			error( 'Too high dimension for kernel generation' );
		%
	end;%
	%
	%
end %
