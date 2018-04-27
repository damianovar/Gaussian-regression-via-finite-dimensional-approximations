function aabViolatingLinks = GetLinksViolatingPersistentActivation( tCommunicationsManager, fCurrentTime )
	%
	if( tCommunicationsManager.bForcePersistentActivationOfLinks )
		%
		% find all the labels
		aabViolatingLinks =												...
			(															...
				( fCurrentTime - tCommunicationsManager.aafActivatingLinksTimers )	...
				>														...
				tCommunicationsManager.fIntervalOfPersistentActivationOfLinks			...
			)															...
			.*															...
			tCommunicationsManager.tGraph.GetAdjacencyMatrix();
		%
	else%
		%
		aabViolatingLinks = zeros( size( tCommunicationsManager.tGraph.GetAdjacencyMatrix() ) );
		%
	end;%
	%
	%
	if( sum(sum(aabViolatingLinks)) > 0 )
		%
		tCommunicationsManager.iPersistentActivationOfLinksViolationsCounter = ...
			tCommunicationsManager.iPersistentActivationOfLinksViolationsCounter + 1;
		%
	end;%
	%
end %
