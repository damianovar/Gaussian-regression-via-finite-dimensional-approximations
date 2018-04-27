function CheckIfUsingSynchronousCommunications( tCommunicationsManager, strConsensusKind )
	%
	switch( strConsensusKind )
		%
		case { 'gossip', 'accelerated gossip', 'hadjicostis', 'asynchronous max'}
			%
			tCommunicationsManager.bUseSynchronousCommunications = false;
		%
		case { 'synchronous metropolis', 'accelerated synchronous metropolis', 'synchronous max'}
			%
			tCommunicationsManager.bUseSynchronousCommunications = true;
		%
		otherwise
			%
			disp(strConsensusKind);
			error('wrong consensus kind selection!');
		%
	end;%
	%
end %
