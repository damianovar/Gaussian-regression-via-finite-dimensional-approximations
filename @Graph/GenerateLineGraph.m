function GenerateLineGraph( tGraph )
	%
	% initialization
	aaiIdentity		= eye( tGraph.iNumberOfNodes );
	aaiUpperPart	= zeros( size( aaiIdentity ) );
	%
	% find the upper part
	aaiUpperPart( :, 2:tGraph.iNumberOfNodes )	= ...
		aaiIdentity( :, 1:(tGraph.iNumberOfNodes-1)  );
	%
	% find the upper part
	aaiLowerPart = aaiUpperPart';
	%
	% create the adjacency matrix without selfloops
	tGraph.aaiAdjacencyMatrix = aaiLowerPart + aaiUpperPart;
	%
	% in case add the self loops
	if( tGraph.bUseSelfLoops )
		%
		tGraph.aaiAdjacencyMatrix = tGraph.aaiAdjacencyMatrix + aaiIdentity;
		%
	end;%
	%
	% set the nodes coordinates
	tGraph.aafNodesPositions			= zeros(tGraph.iNumberOfNodes, 2);
	tGraph.aafNodesPositions(:, 1)	= linspace(0, 1, tGraph.iNumberOfNodes);
	%
end %
