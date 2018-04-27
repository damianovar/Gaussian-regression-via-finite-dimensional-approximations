function GenerateGraph( tGraph )
	%
	switch tGraph.strKindOfGraph
		%
		case 'line'
			tGraph.GenerateLineGraph();
		%
		case 'cycle'
			tGraph.GenerateCycleGraph();
		%
		case 'random geometric'
			tGraph.GenerateRandomGeometricGraph();
		%
		case 'bidimensional grid'
			tGraph.GenerateBidimensionalGridGraph();
		%
		otherwise
			disp(tGraph.strKindOfGraph);
			error('Not supported kind of graph');
		%
	end;%
	%
	% compute the number of edges:
	% - get the adjacency matrix
	% - compute the number of nonnull entries
	aaiSelfLoopedAdjacencyMatrix = tGraph.GetSelfLoopedAdjacencyMatrix();
	%
	tGraph.iNumberOfEdges = sum( aaiSelfLoopedAdjacencyMatrix(:) ~= 0 ) - tGraph.iNumberOfNodes;
	%
end %
