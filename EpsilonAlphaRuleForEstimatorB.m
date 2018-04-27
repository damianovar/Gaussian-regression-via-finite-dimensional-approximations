function fValue = EpsilonAlphaRuleForEstimatorA( epsilon, alpha, M, E, k )
	%
	fValue = 										...
		( 1 - epsilon + epsilon .* log(epsilon) )	...
	-	( E * k / M ) .* log( 2 * E / alpha );
	%
end %

