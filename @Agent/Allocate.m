function atAgents = Allocate( tParameters )
	%
	% allocate the consensus nodes
	for iAgent = 1:tParameters.iNumberOfAgents;
		%
		if( tParameters.bLoadAgentsFromFile )
			%
			atAgents(iAgent) =								...
				Agent.LoadFromMatFile(						...
					sprintf('MatFiles/Agent%d.mat', iAgent)	); %#ok<AGROW>
			%
		else%
			%
			atAgents(iAgent) = Agent(iAgent);
			%
		end;%
		%
	end;%
	%
end %
