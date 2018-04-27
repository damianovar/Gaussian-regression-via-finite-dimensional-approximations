classdef Agent < handle
	%
	properties
		%
		bPrintDebugInformation;
		iLabel;
		%
		afMeasurements;
		ffInputLocations;
		iiInputLocationsIndexes;
		%
		afConsensusVector;
		fGossipWeight;
		%
		iConsensusStepsCounter;
		bHasConverged;
		%
	end %
	%
	%
	methods
		%
		% standard constructor
		function tAgent = Agent(	iLabel )
		if( nargin > 0 ) % (for instantiation of arrays)
			%
			tAgent.bPrintDebugInformation	= true;
			%
			% set the labels
			tAgent.SetLabels( iLabel );
			%
			% set the counters
			tAgent.iConsensusStepsCounter	= 0;
			tAgent.bHasConverged			= false;
			%
			tAgent.afMeasurements			= [];
			tAgent.ffInputLocations			= [];
			tAgent.iiInputLocationsIndexes	= [];
			%
		end;% nargin > 0 (for instantiation of arrays)
		end %
		%
	end %
	%
	%
	methods (Static = true)
		%
		fDissensus			= DissensusOf( atAgents );
		tAgent				= LoadFromMatFile( strFilename );
		atAgents			= Allocate( tParameters );
		bShouldTerminate	= ShouldTerminate( atAgents );
		%
		PrintAll( atAgents, tKernelParameters, bBeVerbose );
		%
	end	%
	%
	%
end %
