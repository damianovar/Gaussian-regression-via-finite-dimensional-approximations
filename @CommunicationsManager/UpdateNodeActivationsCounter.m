function UpdateNodeActivationsCounter( tCommunicationsManager, iNode )
	%
	tCommunicationsManager.aiActivatingNodesCounters(iNode) = ...
		tCommunicationsManager.aiActivatingNodesCounters(iNode) + 1;
	%
	tCommunicationsManager.afActivatingNodesTimers(iNode) = ...
		tCommunicationsManager.iCurrentTime;
	%
end %
