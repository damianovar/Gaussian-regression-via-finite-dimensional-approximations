function fSpectralRadius = GetSpectralRadius( tGraph )
	%
	afEigenvalues = eig( tGraph.aafMetropolisWeights );
	%
	afSortedAbs = sort( abs(afEigenvalues), 'ascend' );
	%
	fSpectralRadius = afSortedAbs( end - 1 );
	%
end %
