% output: 1st/2nd components = gossip matrix
%         3rd component      = time index
%
% NOTICE: NO INTERCOMMUNICATION BOUNDED INTERVALS ARE HERE ASSURED!
%
function aaafGossipMatrices =									...
	GenerateSymmetricGossipMatrices(	aaiAdjacencyMatrix,		...
										fSymmetricGossipWeight,	...
										iHowManyMatrices		)
	%
	% storage allocation
	aaafGossipMatrices =							...
		zeros(	numel(aaiAdjacencyMatrix(1, :)),	...
				numel(aaiAdjacencyMatrix(1, :)),	...
				iHowManyMatrices					);
	%
	% generation of the various matrices
	for iTime = 1:iHowManyMatrices;
		%
		% initialize the gossip matrix
		aaafGossipMatrices(:, :, iTime) = eye( size(aaiAdjacencyMatrix) );
		%
		% get the random link
		[iNodeA, iNodeB] = ExtractRandomLink( aaiAdjacencyMatrix );
		%
		% modify the corresponding weights
		aaafGossipMatrices(iNodeA, iNodeB, iTime) = fSymmetricGossipWeight;
		aaafGossipMatrices(iNodeB, iNodeA, iTime) = fSymmetricGossipWeight;
		aaafGossipMatrices(iNodeA, iNodeA, iTime) = 1 - fSymmetricGossipWeight;
		aaafGossipMatrices(iNodeB, iNodeB, iTime) = 1 - fSymmetricGossipWeight;
		%
	end;%
	%
end %
