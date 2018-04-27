% handles global properties like bounded intercommunication intervals
%
classdef CommunicationsManager < handle
	%
	% ---------------------------------------------------------------------
	properties
		%
		bPrintDebugInformation;
		%
		tGraph;
		%
		bUseDirectedCommunications;		% true = directed,  false = undirected
		bUseBroadcastCommunications;	% true = broadcast, false = gossip
		bUseSynchronousCommunications;
		%
		iCurrentTime;
		%
		bExtractLinksStartingFromANode;
		bLoadFromFile;
		%
		bForcePersistentActivationOfNodes;
		fIntervalOfPersistentActivationOfNodes;
		bForcePersistentActivationOfLinks;
		fIntervalOfPersistentActivationOfLinks;
		%
		% these quantities maintain information useful to assure
		% bounded intercommunication intervals assumptions (et similia)
		aaiActivatingLinksCounters;	% how many times every link has been activated
		aiActivatingNodesCounters;	% how many times every node has been activated
		aafActivatingLinksTimers;	% last time that every link has been activated
		afActivatingNodesTimers;	% last time that every node has been activated
		%
		iPersistentActivationOfNodesViolationsCounter;
		iPersistentActivationOfLinksViolationsCounter;
		%
		% if the communication protocol is loaded from file
		aiListOfSenders;
		aacListOfReceivers;
		%
	end %
	%
	%
	% ---------------------------------------------------------------------
	methods
		%
		% standard constructor
		function tCommunicationsManager = CommunicationsManager( tParameters )
			%
			tCommunicationsManager.bPrintDebugInformation			= tParameters.bPrintDebugInformation;
			tCommunicationsManager.bUseDirectedCommunications		= tParameters.bUseDirectedCommunications;
			tCommunicationsManager.bUseBroadcastCommunications		= tParameters.bUseBroadcastCommunications;
			tCommunicationsManager.CheckIfUsingSynchronousCommunications( tParameters.strConsensusKind );
			%
			tCommunicationsManager.tGraph							= Graph( tParameters );
			%
			tCommunicationsManager.bExtractLinksStartingFromANode	= tParameters.bExtractLinksStartingFromANode;
			tCommunicationsManager.bLoadFromFile					= tParameters.bLoadCommunicationProtocolFromFile;
			%
			tCommunicationsManager.bForcePersistentActivationOfNodes			= tParameters.bForcePersistentActivationOfNodes;
			tCommunicationsManager.fIntervalOfPersistentActivationOfNodes		= tParameters.fIntervalOfPersistentActivationOfNodes;
			tCommunicationsManager.bForcePersistentActivationOfLinks			= tParameters.bForcePersistentActivationOfLinks;
			tCommunicationsManager.fIntervalOfPersistentActivationOfLinks		= tParameters.fIntervalOfPersistentActivationOfLinks;
			%
			tCommunicationsManager.iPersistentActivationOfNodesViolationsCounter	= 0;
			tCommunicationsManager.iPersistentActivationOfLinksViolationsCounter	= 0;
			%
			if( tCommunicationsManager.bLoadFromFile )
				%
				tCommunicationsManager =							...
					CommunicationsManager.LoadFromMatFile(	...
						tParameters.strCommunicationProtocolFilepath );
				%
			end;%
			%
			tCommunicationsManager.Reset();
			%
			if( tCommunicationsManager.bPrintDebugInformation )
				%
				fprintf('Communications manager succesfully constructed\n');
				%
			end;%
			%
		end %
		%
	end %
	%
	%
	methods (Static = true)
		%
		bUseBroadcastCommunications = ShouldUseBroadcastCommunications( strConsensusKind );
		tCommunicationsManager		= LoadFromMatFile( strFileName );
		%
	end	%
	%
	%
end %
 
