function Plot( tGraph )
	%
	figure(86341324);
	refresh(86341324);
	scatter(tGraph.aafNodesPositions(:,1), ...
			tGraph.aafNodesPositions(:,2));
	axis equal;
	title('communication graph');
	%
	hold on;
	%
	for iNodeA = 1:tGraph.iNumberOfNodes;
		%
		for iNodeB = (iNodeA+1):tGraph.iNumberOfNodes;
			%
			% if they are connected then draw the link
			if(  tGraph.AreNodesNeighbors(iNodeA, iNodeB) )
				%
				line(	[tGraph.aafNodesPositions(iNodeA, 1), tGraph.aafNodesPositions(iNodeB, 1)],	...
						[tGraph.aafNodesPositions(iNodeA, 2), tGraph.aafNodesPositions(iNodeB, 2)]	);
				%
			end;%
			%
		end;%
		%
	end;%
	%
	hold off;
	%
end %
