function GenerateBidimensionalGridGraph( tGraph )
	%
	% sanity check
	if( tGraph.iNumberOfNodes ~= tGraph.aiBidimensionalGridDimensions(1) * tGraph.aiBidimensionalGridDimensions(2) )
		%
		error('number of nodes inconsistent with the definition of the grid dimensions');
		%
	end;%
	%
	% set the nodes coordinates
	tGraph.aafNodesPositions = zeros(tGraph.iNumberOfNodes, 2);
	%
	for iNodeIndex = 1:tGraph.iNumberOfNodes;
		%
		iXIndex = mod( iNodeIndex, tGraph.aiBidimensionalGridDimensions(1) );
		iYIndex = ceil( iNodeIndex / tGraph.aiBidimensionalGridDimensions(1) );
		%
		tGraph.aafNodesPositions(iNodeIndex, 1)	= iXIndex;
		tGraph.aafNodesPositions(iNodeIndex, 2)	= iYIndex;
		%
		% DEBUG
		fprintf('node %d:   ( %d %d )\n', iNodeIndex, iXIndex, iYIndex);
		%
	end;%
	%
	%
	% set the nodes connections
	tGraph.fCommunicationRadius = 1.1;
	tGraph.UpdateRandomGeometricLinks();
	%
end %
