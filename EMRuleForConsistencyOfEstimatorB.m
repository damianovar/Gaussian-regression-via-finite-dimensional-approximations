function fValue = EMRuleForConsistencyOfEstimatorB( a, b, M, E, k )
	%
	fValue = 										...
		E * log(E) * k * (1 + b)					...
	-	( M / M^a ) - ( M - M / M^a ) * log( 1 - 1 / M^a );
	%
end %

