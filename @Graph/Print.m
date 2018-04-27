function Print( tGraph )
	%
	fprintf('number of nodes: %d \n', tGraph.iNumberOfNodes);
	fprintf('number of edges: %d \n', tGraph.iNumberOfEdges);
	%
	fprintf('adjacency matrix: \n');
	disp( tGraph.aaiAdjacencyMatrix );
	%
	fprintf('edge-node incidence matrix: \n');
	disp( tGraph.aaiEdgeNodeIncidenceMatrix );
	%
end %
