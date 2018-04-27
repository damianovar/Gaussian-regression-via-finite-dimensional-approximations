% Algorithm: raise the adjacency matrix up to the moment where it has no
% zero elements
%
function ComputeRadius( tGraph )
	%
	% initialization of the algorithm
	bEveryRowHasAZero				= true;
	tGraph.iRadius				= 0;
	aaiRaisedAdjacencyMatrix		= eye( tGraph.iNumberOfNodes );
	aaiSelfLoopedAdjacencyMatrix	= tGraph.GetSelfLoopedAdjacencyMatrix();
	%
	while( bEveryRowHasAZero )
		%
		tGraph.iRadius			= tGraph.iRadius + 1;
		aaiRaisedAdjacencyMatrix	= aaiRaisedAdjacencyMatrix * aaiSelfLoopedAdjacencyMatrix;
		%
% 		% DEBUG
%  		fprintf('Radius computation: trying d = %d\n', tGraph.iRadius);
		for iRow = 1:tGraph.iNumberOfNodes;
			%
			if( sum( aaiRaisedAdjacencyMatrix(iRow, :) == zeros(1, tGraph.iNumberOfNodes) ) == 0 )
				%
				bEveryRowHasAZero = false;
				%
			end;%
			%
		end;%
		%
		if( tGraph.iRadius > tGraph.iNumberOfNodes )
			%
			tGraph.iRadius = -1;
			fprintf('WARNING: there is more than one connected components (warning from "ComputeRadius()")\n');
			return;
			%
		end;%
		%
	end;%
	%
	% DEBUG
% 	fprintf('Radius computation: true d = %d\n', tGraph.iRadius);
	%
end %
