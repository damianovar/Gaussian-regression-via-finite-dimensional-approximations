% the in-neighbors are the nodes for which there is a link from them to the node passed as argument
% the out-neighbors are the nodes for which there is a link to them from the node passed as argument
%
% Algorithm:
%
% - consider the column of the edges-nodes incidence matrix relative to the node passed as argument
% - see which rows of the edges-nodes incidence matrix are non-null in that column
% - see who is the other element (column-wise) of that rows that is non-null: that is the neighbor
%
function [	aiInneighbors,						...
			aiOutneighbors	] =					...
				GetInAndOutneighborsOfNode(		...
					tGraph,						...
					iNode						)
	%
	% storage allocation
	aiInneighbors	= [];
	aiOutneighbors	= [];
	%
	% cycle on the various rows of the edge-nodes incidence matrix
	for iRow = 1:tGraph.iNumberOfEdges;
		%
		% check if this edge starts from the considered node
		if( tGraph.aaiEdgeNodeIncidenceMatrix(iRow, iNode) == 1 )
			%
			% get the neighbor index
			iCurrentInneighbor = find( tGraph.aaiEdgeNodeIncidenceMatrix(iRow, :) == -1 );
			%
			% consistency check
			if( numel(iCurrentInneighbor) ~= 1 )
				%
				error('there must be a bug in the construction of the edge-nodes incidence matrix, because there is not just one -1 in a certain row, and instead there should be only one');
				%
			end;%
			%
			aiInneighbors = [	aiInneighbors ;		...
								iCurrentInneighbor 	];
			%
		end;%
		%
		% check if this edge starts to the considered node
		if( tGraph.aaiEdgeNodeIncidenceMatrix(iRow, iNode) == -1 )
			%
			% get the neighbor index
			iCurrentOutneighbor = find( tGraph.aaiEdgeNodeIncidenceMatrix(iRow, :) == 1 );
			%
			% consistency check
			if( numel(iCurrentOutneighbor) ~= 1 )
				%
				error('there must be a bug in the construction of the edge-nodes incidence matrix, because there is not just one 1 in a certain row, and instead there should be only one');
				%
			end;%
			%
			aiOutneighbors = [	aiOutneighbors ;		...
								iCurrentOutneighbor 	];
			%
		end;%
		%
	end;%
	%
end % function

