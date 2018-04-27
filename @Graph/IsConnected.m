function bIsConnected = IsConnected( tGraph )
	%
	aaiSelfloopLessAdjacencyMatrix =	...
		tGraph.aaiAdjacencyMatrix - diag(diag(tGraph.aaiAdjacencyMatrix));
	%
	aiNodesDegrees = sum(aaiSelfloopLessAdjacencyMatrix);
	%
	aaiLaplacianMatrix = diag( aiNodesDegrees ) - aaiSelfloopLessAdjacencyMatrix;
	%
	afLaplaciansEigenvalues = sort(eig( aaiLaplacianMatrix ), 'ascend');
	%
	bIsConnected = ( (afLaplaciansEigenvalues(2)^2) > eps );
	%
end %
