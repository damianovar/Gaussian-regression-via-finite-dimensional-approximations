% SaveToTxtFile.m
%
%
% inputs:
%
% * strFileName          = full path
% * aafNodesPositions    = matrix with each row being the x and y of the nodes
% * aaiAdjacencyMatrix   = adjacency matrix
% * strCommunicationKind = 'directed' | 'undirected'
% * aafNodesStatus       = **NOT REQUIRED**, if passed it must be a matrix
%                          with a number of rows equal to the number of nodes 
%
%
% outputs:
%
% "strFileName.NodesPositions", containing:
% * 1st column = x-values
% * 2nd column = y-values
% * from 3rd column = vector of the status -- MAY NOT EXIST
%
% "strFileName.LinksList", containing a list of rows, each row indicating a
% link as follows:
% * x_start, y_start, x_start - x_end, y_start - y_end
%
%
function SaveToTxtFile( tCommunicationsManager, strFileName )
	%
	TODO nodes status
	%
	% compute if the status of the nodes has been provided or not
	if( numel( tCommunicationsManager.aafNodesStatus ) > 0 )
		%
		bNodesStatusIsProvided	= true;
		iStatusDimensionality	= size( tCommunicationsManager.aafNodesStatus(1, :) );
		%
	else%
		%
		bNodesStatusIsProvided = false;
		%
	end;%
	%
	% create the filenames
	strNodesPositionsFileName	= strcat(strFileName, '.NodesPositions');
	strLinksListFileName		= strcat(strFileName, '.LinksList');
	%
	% ---------------------------------------------------------------------
	% open the file
	fidNodes = fopen(strNodesPositionsFileName, 'w');
	%
	% header -- notice that it depends on the existence or not of the
	% status vector
	fprintf(fidNodes, 'x y');
	%
	if( bNodesStatusIsProvided )
		%
		for iDimension = 1:iStatusDimensionality;
			%
			fprintf(fidNodes, ' s%d', iDimension);
			%
		end;%
		%
	end;%
	%
	fprintf(fidNodes, '\n');
	%
	% write the data
	for iNode = 1:tCommunicationsManager.tGraph.iNumberOfNodes;
		%
		fprintf(fidNodes, '%.5f %.5f', tCommunicationsManager.tGraph.aafNodesPositions(iNode, 1), tCommunicationsManager.tGraph.aafNodesPositions(iNode, 2) );
		%
		if( bNodesStatusIsProvided )
			%
			for iDimension = 1:iStatusDimensionality;
				%
				fprintf(fidNodes, ' %.5f', tCommunicationsManager.aafNodesStatus(iNode, iDimension));
				%
			end;%
			%
		end;%
		%
		fprintf(fidNodes, '\n');
		%
	end;%
	%
	% close the file
	fclose(fidNodes);
	clear fidNodes;
	%
	fprintf('%s exported\n', strNodesPositionsFileName);
	%
	% ---------------------------------------------------------------------
	% open the file
	fidLinks = fopen(strLinksListFileName, 'w');
	%
	% header
	fprintf(fidLinks, 'xstart ystart towardsx towardsy\n');
	%
	switch tCommunicationsManager.strCommunicationKind
		%
		case 'directed'
			%
			for iNodeA = 1:tCommunicationsManager.tGraph.iNumberOfNodes;
				%
				for iNodeB = 1:tCommunicationsManager.tGraph.iNumberOfNodes;
					%
					if(iNodeA == iNodeB)
						%
						continue;
						%
					else%
						%
						% check if there is the link
						if( tCommunicationsManager.tGraph.GetAdjacencyMatrix()(iNodeA, iNodeB) )
							%
							fprintf(fidLinks, '%.5f %.5f %.5f %.5f',											...
									tCommunicationsManager.tGraph.aafNodesPositions(iNodeA, 1),										...
									tCommunicationsManager.tGraph.aafNodesPositions(iNodeA, 2),										...
									tCommunicationsManager.tGraph.aafNodesPositions(iNodeB, 1) - tCommunicationsManager.tGraph.aafNodesPositions(iNodeA, 1),	...
									tCommunicationsManager.tGraph.aafNodesPositions(iNodeB, 2) - tCommunicationsManager.tGraph.aafNodesPositions(iNodeA, 2));
							%
							fprintf(fidLinks, '\n');
							%
						end;%
						%
					end;% nodes are the same
					%
				end;% cycle on node B
				%
			end;% cycle on node A
		%
		case 'undirected'
			%
			for iNodeA = 1:tCommunicationsManager.tGraph.iNumberOfNodes;
				%
				for iNodeB = iNodeA+1:tCommunicationsManager.tGraph.iNumberOfNodes;
					%
					% check if there is the link
					if( tCommunicationsManager.tGraph.GetAdjacencyMatrix()(iNodeA, iNodeB) )
						%
						fprintf(fidLinks, '%.5f %.5f %.5f %.5f',											...
								tCommunicationsManager.tGraph.aafNodesPositions(iNodeA, 1),										...
								tCommunicationsManager.tGraph.aafNodesPositions(iNodeA, 2),										...
								tCommunicationsManager.tGraph.aafNodesPositions(iNodeB, 1) - tCommunicationsManager.tGraph.aafNodesPositions(iNodeA, 1),	...
								tCommunicationsManager.tGraph.aafNodesPositions(iNodeB, 2) - tCommunicationsManager.tGraph.aafNodesPositions(iNodeA, 2));
						%
						fprintf(fidLinks, '\n');
						%
					end;%
					%
				end;% cycle on node B
				%
			end;% cycle on node A
		%
		otherwise
			%
			error('wrong communication kind selection -- must be directed or undirected');
		%
	end;% switch
	%
	% close the file
	fclose(fidLinks);
	clear fidLinks;
	%
	fprintf('%s exported\n', strLinksListFileName);
	%
end %

