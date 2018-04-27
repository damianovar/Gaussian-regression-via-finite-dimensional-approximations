% aiNeighbors = GetNeighborsOfNode( tGraph, iNode, bUseSelfloops )
%
function aiNeighbors = GetNeighborsOfNode( tGraph, iNode, bUseSelfloops )
	%
	% for readability
	aiAdjacencyRow = tGraph.aaiAdjacencyMatrix(iNode, :);
	%
	% set if to use the selfloops or not
	aiAdjacencyRow(iNode) = bUseSelfloops;
	%
	% understand who is a neighbor
	aiNeighborsPositions = ( aiAdjacencyRow ~= 0 );
	%
	% set their indexes
	aiNeighborsIndexes =							...
		( aiNeighborsPositions )					...
		.*											...
		( 1:numel(aiAdjacencyRow) );
	%
	% return just the neighbors indexes
	aiNeighbors = aiNeighborsIndexes( aiNeighborsPositions );
	%
end %
