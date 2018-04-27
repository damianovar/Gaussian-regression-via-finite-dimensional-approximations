function tNode = Reset( tNode )
	%
	% set the counters
	tNode.iConsensusStepsCounter = 0;
	%
	% initialize the random vectors
	tNode = tNode.InitializeConsensusVector( tNode.iNumberOfElements, [] );
	%
end %
