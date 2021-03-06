function iNode = ExtractNode( tCommunicationsManager )
	%
	if( tCommunicationsManager.bLoadFromFile )
		%
		% check if the current desired time exists in the file
		if(		tCommunicationsManager.iCurrentTime						...
			>	numel( tCommunicationsManager.aiListOfSenders ) )
			%
			error('the file containing the communication protocol has fewer communication steps than the ones required in LoadParameters() -- change the value!');
			%
		else%
			%
			% here the current desired time exists, thus load it
			iNode = tCommunicationsManager.aiListOfSenders( tCommunicationsManager.iCurrentTime );
			%
			% then update the counters
			tCommunicationsManager.UpdateNodeActivationsCounter( iNode );
			%
		end;%
		%
	else%
		%
		% extract
		iNode = tCommunicationsManager.ExtractRandomNode();
		%
		% save the information
		tCommunicationsManager.aiListOfSenders( tCommunicationsManager.iCurrentTime ) = iNode;
		%
	end;% if node should be generated from file / randomly
	%
end %
