function aiViolatingNodes = GetNodesViolatingPersistentActivation( tCommunicationsManager )
	%
	if( tCommunicationsManager.bForcePersistentActivationOfNodes )
		%
		% find all the labels
		aiViolatingNodes =																					...
			(																								...
				( tCommunicationsManager.iCurrentTime - tCommunicationsManager.afActivatingNodesTimers )	...
				>																							...
				tCommunicationsManager.fIntervalOfPersistentActivationOfNodes								...
			)																								...
			.* (1:tCommunicationsManager.tGraph.iNumberOfNodes)';
		%
		% remove the zeros
		aiViolatingNodes = aiViolatingNodes( aiViolatingNodes ~= 0 );
		%
	else%
		%
		aiViolatingNodes = [];
		%
	end;%
	%
	%
	if( sum(aiViolatingNodes) > 0 )
		%
		tCommunicationsManager.iPersistentActivationOfNodesViolationsCounter = ...
			tCommunicationsManager.iPersistentActivationOfNodesViolationsCounter + 1;
		%
	end;%
	%
end %
