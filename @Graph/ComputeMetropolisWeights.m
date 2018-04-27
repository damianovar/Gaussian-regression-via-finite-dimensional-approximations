function aafWeights = ComputeMetropolisWeights( tGraph )
	%
	% storage allocation
	aafWeights = zeros( tGraph.iNumberOfNodes, tGraph.iNumberOfNodes );
	%
	%
	% compute the degrees of the nodes
	aiNodesDegrees = zeros( tGraph.iNumberOfNodes, 1 );
	%
	for iNode = 1:tGraph.iNumberOfNodes;
		%
		bUseSelfloops = false;
		aiNodesDegrees(iNode) = numel( tGraph.GetNeighborsOfNode(iNode, bUseSelfloops) );
		%
	end;%
	%
	%
	% compute the Metropolis weights - first pass, do not consider the
	% self-loops weights
	for iNodeA = 1:tGraph.iNumberOfNodes;
	for iNodeB = 1:tGraph.iNumberOfNodes;
		%
		if( iNodeA ~= iNodeB )
			%
			% case the nodes are neighbors
			if( tGraph.AreNodesNeighbors( iNodeA, iNodeB ) )
				%
				aafWeights(iNodeA, iNodeB) =									...
					1															...
					/															...
					( 1 + max( aiNodesDegrees(iNodeA), aiNodesDegrees(iNodeB) ) );
				%
			end;%
			%
		end;%
		%
	end;%
	end;%
	%
	%
	% compute the Metropolis weights - second pass, do not consider the
	% self-loops weights
	for iNodeA = 1:tGraph.iNumberOfNodes;
		%
		fSum = 1;
		%
		for iNodeB = 1:tGraph.iNumberOfNodes;
			%
			if	(													...
					( iNodeA ~= iNodeB )							...
					&&												...
					tGraph.AreNodesNeighbors( iNodeA, iNodeB )	...
				)
				%
				fSum = fSum - aafWeights(iNodeA, iNodeB);
				%
			end;%
			%
		end;%
		%
		aafWeights(iNodeA, iNodeA) = fSum;
		%
	end;%
	%
	%
	if( tGraph.bPrintDebugInformation )
		%
		fprintf('\nChecking whether Metropolis weights have been computed correctly:\n');
		disp(aafWeights * ones(tGraph.iNumberOfNodes, 1))
		disp(ones(1, tGraph.iNumberOfNodes) * aafWeights)
		%
	end;%
	%
end %
