function UpdateRandomGeometricLinks( tGraph )
	%
	% initialization
	tGraph.aaiAdjacencyMatrix = zeros( tGraph.iNumberOfNodes, tGraph.iNumberOfNodes );
	%
	for iNodeA = 1:tGraph.iNumberOfNodes;
	for iNodeB = (iNodeA+1):tGraph.iNumberOfNodes;
		%
		fEuclideanDistance =																			...
			(																							...
				(tGraph.aafNodesPositions( iNodeA, 1 ) - tGraph.aafNodesPositions( iNodeB, 1 ))^2	...
				+																						...
				(tGraph.aafNodesPositions( iNodeA, 2 ) - tGraph.aafNodesPositions( iNodeB, 2 ))^2	...
			)^(0.5);
		%
		if( fEuclideanDistance <= tGraph.fCommunicationRadius )
			%
			tGraph.aaiAdjacencyMatrix( iNodeA, iNodeB ) = 1;
			tGraph.aaiAdjacencyMatrix( iNodeB, iNodeA ) = 1;
			%
			% DEBUG
% 			fprintf('(%.3f %.3f) - (%.3f %.3f)  =>  %.4f\n', tGraph.aafNodesPositions( iNodeA, 1 ), tGraph.aafNodesPositions( iNodeA, 2 ), tGraph.aafNodesPositions( iNodeB, 1 ), tGraph.aafNodesPositions( iNodeB, 2 ), fEuclideanDistance);
			%
		end;%
		%
	end;%
	end;%
	%
end %
