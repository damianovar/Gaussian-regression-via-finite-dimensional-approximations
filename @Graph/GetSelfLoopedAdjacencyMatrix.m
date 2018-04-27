function aaiSelfLoopedAdjacencyMatrix = GetSelfLoopedAdjacencyMatrix( tGraph )
	%
	aaiSelfLoopedAdjacencyMatrix = tGraph.aaiAdjacencyMatrix;
	%
	for iNode = 1:tGraph.iNumberOfNodes;
		%
		aaiSelfLoopedAdjacencyMatrix(iNode, iNode) = 1;
		%
	end;%
	%
end %
