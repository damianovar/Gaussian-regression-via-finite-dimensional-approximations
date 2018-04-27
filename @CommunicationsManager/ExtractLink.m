function [iSender, iReceiver] = ExtractLink( tCommunicationsManager, iCurrentTime )
	%
	if( tCommunicationsManager.bLoadFromFile )
		%
		iSender		= tCommunicationsManager.aiListOfSenders( iCurrentTime );
		iReceiver	= cell2mat(tCommunicationsManager.aacListOfReceivers{ iCurrentTime });
		%
		% TODO
		if( numel( iReceiver ) ~= 1 )
			%
			error('multicast still not supported, sorry :(');
			%
		end;%
		%
		% update the counters
		tCommunicationsManager.UpdateLinkActivationsCounter( iSender, iReceiver, iCurrentTime );
		%
	else%
		%
		[iSender, iReceiver] = tCommunicationsManager.ExtractRandomLink( iCurrentTime );
		%
		% save the information
		tCommunicationsManager.aiListOfSenders( iCurrentTime ) = iSender;
		tCommunicationsManager.aacListOfReceivers{ iCurrentTime } = { iReceiver };
		%
	end;%
	%
end %
