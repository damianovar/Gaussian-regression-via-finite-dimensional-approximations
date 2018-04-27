function bUseBroadcastCommunications = ShouldUseBroadcastCommunications( strConsensusKind )
	%
	%
	switch strConsensusKind
		%
		%
		% -----------------------------------------------------------------
		case {'gossip', 'accelerated gossip'}
			%
			bUseBroadcastCommunications = false;
		%
		%
		% -----------------------------------------------------------------
		case {'max', 'hadjicostis'}
			%
			bUseBroadcastCommunications = true;
		%
		%
		% -----------------------------------------------------------------
		otherwise
			%
			error('invalid consensus kind');
		%
		%
	end;% switch
	%
	%
end %
