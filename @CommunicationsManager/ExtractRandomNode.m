% assumption: the graph is connected
%
% it has selfloops iff aaiAjacencyMatrix admits selfloops
%
function iNode = ExtractRandomNode( tCommunicationsManager )
	%
	% check if some nodes must activate
	aiNodesThatMustActivateNow = tCommunicationsManager.GetNodesViolatingPersistentActivation();
	%
	% if no nodes must commnicate then extract randomly, otherwise extract
	% randomly among the ones that must activate now
	if( numel(aiNodesThatMustActivateNow) > 0 )
		%
		aiNodesThatCanActivate = aiNodesThatMustActivateNow;
		%
	else%
		%
		aiNodesThatCanActivate = 1:tCommunicationsManager.tGraph.iNumberOfNodes;
		%
	end;%
	%
	% for readability
	iNumberOfNodesThatCanActivate = numel( aiNodesThatCanActivate );
	%
	% select the node
	iNodeIndex	= randi( iNumberOfNodesThatCanActivate );
	iNode		= aiNodesThatCanActivate( iNodeIndex );
	%
	% update the counters
	tCommunicationsManager.UpdateNodeActivationsCounter( iNode );
	%
end %
