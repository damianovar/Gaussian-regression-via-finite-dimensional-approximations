% algorithm:
%
% if
%		communications are synchronous
% then
%		iSender == 1
%		aiReceivers == 2:end
% else
%		perform extractions normally
%
function [ iSender, aiReceivers ] = ExtractSenderAndReceivers( tCommunicationsManager )
	%
	if( tCommunicationsManager.bUseSynchronousCommunications )
		%
		iSender		= 1;
		aiReceivers = 2:tCommunicationsManager.tGraph.iNumberOfNodes;
		%
	else%
		%
		iSender = tCommunicationsManager.ExtractNode();
		%
		% extract the (possibly more than one) receivers
		aiReceivers = tCommunicationsManager.ExtractReceivers( iSender );
		%
	end;% if communications are synchronous / asynchronous
	%
end %
