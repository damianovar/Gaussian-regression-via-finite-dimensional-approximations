function UpdatePositionOfNode( tGraph, iNode, afNewPosition )
	%
	tGraph.aafNodesPositions(iNode, :) = afNewPosition;
	%
	if( strcmp(tGraph.strKindOfGraph, 'random geometric' ) )
		%
		tGraph.UpdateRandomGeometricLinks();
		%
		if( ~tGraph.IsConnected() )
			%
			fprintf('WARNING: the network is disconnected\n');
			%
		end;%
		%
	end;%
	%
end %
