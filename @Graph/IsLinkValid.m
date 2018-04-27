function bIsValid = IsLinkValid(tGraph, iSender, iReceiver)
	%
	% check if the indexes are meaningful
	if(											...
			iSender < 1							...
		||	iSender > tGraph.iNumberOfNodes	...
		||	iReceiver < 1						...
		||	iReceiver > tGraph.iNumberOfNodes	...
	  )
		%
		bIsValid = false;
		return;
		%
	end;%
	%
	% here we can also check if the link is in the adjacency matrix
	bIsValid = tGraph.aaiAdjacencyMatrix( iSender, iReceiver );
	%
end %
