function UpdateLinkActivationsCounter( tCommunicationsManager, iSender, iReceiver )
	%
	% update only if meaningful
	if( iSender > 0 && iReceiver > 0 )
		%
		tCommunicationsManager.aaiActivatingLinksCounters(iSender, iReceiver) = ...
			tCommunicationsManager.aaiActivatingLinksCounters(iSender, iReceiver) + 1;
		%
		tCommunicationsManager.aafActivatingLinksTimers(iSender, iReceiver) = ...
			tCommunicationsManager.iCurrentTime;
		%
		% update also the other link if the communications are undirected
		if( ~tCommunicationsManager.bUseDirectedCommunications )
			%
			tCommunicationsManager.aaiActivatingLinksCounters(iReceiver, iSender) = ...
				tCommunicationsManager.aaiActivatingLinksCounters(iReceiver, iSender) + 1;
			%
			tCommunicationsManager.aafActivatingLinksTimers(iReceiver, iSender) = ...
				tCommunicationsManager.iCurrentTime;
			%
		end;%
		%
	end;%
	%
end %
