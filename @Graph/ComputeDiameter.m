% Algorithm: raise the adjacency matrix up to the moment where it has no
% zero elements
%
function ComputeDiameter( tGraph )
	%
	% initialization of the algorithm
	bThereIsAZero					= true;
	tGraph.iDiameter				= 0;
	aaiRaisedAdjacencyMatrix		= eye( tGraph.iNumberOfNodes );
	aaiSelfLoopedAdjacencyMatrix	= tGraph.GetSelfLoopedAdjacencyMatrix();
	%
	while( bThereIsAZero )
		%
		tGraph.iDiameter			= tGraph.iDiameter + 1;
		aaiRaisedAdjacencyMatrix	= aaiRaisedAdjacencyMatrix * aaiSelfLoopedAdjacencyMatrix;
		%
% 		% DEBUG
%  		fprintf('Diameter computation: trying d = %d\n', tGraph.iDiameter);
		if( sum( aaiRaisedAdjacencyMatrix(:) == zeros(tGraph.iNumberOfNodes^2, 1) ) == 0 )
			%
			bThereIsAZero = false;
			%
		end;%
		%
		if( tGraph.iDiameter > tGraph.iNumberOfNodes )
			%
			tGraph.iDiameter = -1;
			fprintf('WARNING: there is more than one connected components (warning from "ComputeDiameter()")\n');
			return;
			%
		end;%
		%
	end;%
	%
	% DEBUG
% 	fprintf('Diameter computation: true d = %d\n', iDiameter);
	%
end %
