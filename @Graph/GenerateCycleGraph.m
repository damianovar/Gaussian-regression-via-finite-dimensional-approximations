function GenerateCycleGraph( tGraph )
	%
	% initialization
	aaiIdentity		= eye( tGraph.iNumberOfNodes );
	aaiUpperPart	= zeros( size( aaiIdentity ) );
	%
	% find the upper part
	aaiUpperPart( :, 2:tGraph.iNumberOfNodes )	= ...
		aaiIdentity( :, 1:(tGraph.iNumberOfNodes-1)  );
	%
	aaiUpperPart( 1, tGraph.iNumberOfNodes ) = 1;
	%
	% find the upper part
	aaiLowerPart = aaiUpperPart';
	%
	% find the adjacency matrix
	tGraph.aaiAdjacencyMatrix = aaiIdentity + aaiLowerPart + aaiUpperPart;
	%
	% set the nodes coordinates
	aafNodesPositions = zeros(tGraph.iNumberOfNodes, 2);
	%
	afAngles = linspace(0, 2*pi, tGraph.iNumberOfNodes+1);
	%
	for iNode = 1:tGraph.iNumberOfNodes;
		%
		tGraph.aafNodesPositions(iNode, 1) = cos(afAngles(iNode));
		tGraph.aafNodesPositions(iNode, 2) = sin(afAngles(iNode));
		%
	end;%
	%
end %
