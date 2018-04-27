function GenerateKernel( tKernel, tParameters )
	%
	switch( tParameters.strKernelKind )
		%
		case 'stablespline'
			tKernel.GenerateStableSplineKernel( tParameters.fStableSplineKernelExponentialDecay );
		%
		case 'cubicspline'
			tKernel.GenerateCubicSplineKernel();
		%
		case 'gaussian'
			tKernel.GenerateGaussianKernel( tParameters.fGaussianKernelVariance );
		%
		case 'laplacian'
			tKernel.GenerateLaplacianKernel( tParameters.fLaplacianKernelScale );
		%
		otherwise
			tKernel.bSomeErrorOccurred = true;
			error( 'incorrect kernel kind selection!' );
		%
	end;%
	%
end %
