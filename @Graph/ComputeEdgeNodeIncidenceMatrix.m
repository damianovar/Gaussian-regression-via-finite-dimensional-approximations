% the edge-node incidence matrix is defined as follows:
%
% - it has iNumberOfEdges rows
% - it has iNumberOfNodes columns
% - for each edge (i,j) (say, the e-th, where the ordering is calligraphic):
%   - there is a +1 in position (e,i)
%   - there is a -1 in position (e,j)
%
function ComputeEdgeNodeIncidenceMatrix( tGraph )
	%
	% storage allocation
	tGraph.aaiEdgeNodeIncidenceMatrix = zeros( tGraph.iNumberOfEdges, tGraph.iNumberOfNodes );
	%
	% sweep the whole adjacency matrix looking for edges
	iEdgeCounter = 0;
	%
	for iDepartingNode = 1:tGraph.iNumberOfNodes;
		%
		for iArrivingNode = 1:tGraph.iNumberOfNodes;
			%
			% skip the self loops
			if( iDepartingNode == iArrivingNode )
				%
				continue;
				%
			end;%
			%
			% check if there is an edge or not
			if( tGraph.aaiAdjacencyMatrix(iDepartingNode, iArrivingNode) ~= 0 )
				%
				% mark that there has been encountered an edge
				iEdgeCounter = iEdgeCounter + 1;
				%
				tGraph.aaiEdgeNodeIncidenceMatrix(iEdgeCounter, iDepartingNode)	=  1;
				tGraph.aaiEdgeNodeIncidenceMatrix(iEdgeCounter, iArrivingNode)	= -1;
				%
			end;%
			%
		end;%
		%
	end;%
	%
	% consistency check
	if( tGraph.iNumberOfEdges ~= iEdgeCounter )
		%
		error('there is some bug either in the construction of the edge-node incidence matrix or in the computation of the number of edges');
		%
	end;%
	%
end % function
