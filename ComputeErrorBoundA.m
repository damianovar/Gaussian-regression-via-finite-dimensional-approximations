function boundA = ComputeErrorBoundA( alpha, epsilonA, M, E, k, sigma2, tKernelParameters )
	%
	% for readability
	lambdas = tKernelParameters.afEigenvalues;
	%
	boundA =	...
		...
		... first term
			( k * M ) / (1 - alpha)	...
		*	( sum( (lambdas(1:E).^2) ./ ((epsilonA * M * lambdas(1:E) + sigma2).^2) ) )	...
		*	( sum( lambdas(E+1:end) ) ) ...
		...
		... second term
		+	sigma2 / (1 - alpha)	...
		*	( sum( (lambdas(1:E)) ./ ((epsilonA * M * lambdas(1:E) + sigma2)) ) )	...
		...
		... third term
		+	sum( lambdas(E+1:end) );
	%
end %

