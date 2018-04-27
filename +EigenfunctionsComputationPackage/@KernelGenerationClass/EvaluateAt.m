function fEvaluation = EvaluateAt( tKernel, tParameters, afFirstInputLocation, afSecondInputLocation )
	%
	switch( tParameters.strKernelKind )
		%
		case 'stablespline'
% 			fEvaluation = tParameters.fStableSplineKernelExponentialDecay
			warning('TODO')
		%
		case 'cubicspline'
			warning('TODO')
		%
		case 'gaussian'
			fEvaluation = exp( -0.5 * (norm( afFirstInputLocation - afSecondInputLocation )^2) / tParameters.fGaussianKernelVariance );
		%
		case 'laplacian'
			fEvaluation = exp( - norm( afFirstInputLocation - afSecondInputLocation ) / tParameters.fLaplacianKernelVariance );
		%
		otherwise
			tKernel.bSomeErrorOccurred = true;
			error( 'incorrect kernel kind selection!' );
		%
	end;%
	%
end % function

