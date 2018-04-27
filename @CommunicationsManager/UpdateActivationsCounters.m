function UpdateActivationsCounters( tCommunicationsManager, iSender, iReceiver, fCurrentTime )
	%
	tCommunicationsManager.UpdateNodeActivationsCounter( iSender, fCurrentTime );
	%
	% update for the receiver only if actually there is a receiver
	if( iReceiver > 0 )
		%
		tCommunicationsManager.UpdateLinkActivationsCounter( iSender, iReceiver, fCurrentTime );
		%
	end;%
	%
end %
