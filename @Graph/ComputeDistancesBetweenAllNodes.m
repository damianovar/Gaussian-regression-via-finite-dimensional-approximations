function ComputeDistancesBetweenAllNodes( tGraph )
	%
	% initialization
	tGraph.aaiDistancesInHops = zeros( size( tGraph.aaiAdjacencyMatrix ) );
	%
	for iNodeA = 1:tGraph.iNumberOfNodes;
		%
		for iNodeB = (iNodeA+1):tGraph.iNumberOfNodes;
			%
			tGraph.aaiDistancesInHops(iNodeA, iNodeB) = tGraph.ComputeDistanceBetweenNodes( iNodeA, iNodeB );
			tGraph.aaiDistancesInHops(iNodeB, iNodeA) = tGraph.aaiDistancesInHops( iNodeA, iNodeB );
			%
		end;%
		%
	end;%
	%
	% TODO: manage directed graphs
	%
end %
