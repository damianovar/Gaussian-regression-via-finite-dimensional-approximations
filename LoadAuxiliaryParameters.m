
% kernel
% load( sprintf('../MatFiles/%s.mat', kernel) );
load( sprintf('C:\\Users\\damiano\\Desktop\\%s.mat', kernel) );


% Nystrom
% load( sprintf('../MatFiles/%s.Nystrom.mat', kernel) );
load( sprintf('C:\\Users\\damiano\\Desktop\\%s.mat', Nystrom) );
%
% beard-trick so to avoid duplicating the code 
tNystromParameters.aaafEigenfunctions = tNystromParameters.aaafBasisFunctions;

tKernelParameters.iNumberOfDimensions	= GetNumberOfDimensions( tKernelParameters );
k										= GetEigenfunctionsBound( tKernelParameters );
tKernelParameters.fTemporalDecay		= 0.99;


% copy the main parameters for simplicity
tParameters.alpha			= alpha;
tParameters.sigma2			= sigma2;
tKernelParameters.sigma2	= sigma2;

warning('to fix - normalization of nystrom eigenvalues')
% tNystromParameters.afEigenvalues = tNystromParameters.afEigenvalues / 1000;


tParameters.bLoadCommunicationProtocolFromFile		= false;
tParameters.strCommunicationProtocolFilepath		= '../MatFiles/CommunicationsManager.mat';
tParameters.bLoadAgentsFromFile						= false;
tParameters.bSaveResults							= false;
tParameters.bPrintDebugInformation					= false;



% ----------------------------------------------------------------------- %
% GRAPH
tParameters.iNumberOfAgents					= 3;
tParameters.strKindOfGraph					= 'random geometric'; % 'line' | 'cycle' | 'random geometric' | 'bidimensional grid'
tParameters.fCommunicationRadius			= 1.8; % for random geometric graphs
tParameters.aiBidimensionalGridDimensions	= [4, 5];
tParameters.bUseSelfLoops					= false;



% ----------------------------------------------------------------------- %
% COMMUNICATION PROTOCOL
tParameters.bForcePersistentActivationOfNodes		= true;							% every node must be activated at least once in the time interval specified below
tParameters.fIntervalOfPersistentActivationOfNodes	= 5*tParameters.iNumberOfAgents; % bounded intercommunications interval
tParameters.bForcePersistentActivationOfLinks		= true;							% every link must be activated at least once in the time interval specified below
tParameters.fIntervalOfPersistentActivationOfLinks	= tParameters.iNumberOfAgents^2; % bounded intercommunications interval
%
tParameters.bUseDirectedCommunications				= false;	% true = directed,  false = undirected
tParameters.bUseBroadcastCommunications				= false;	% true = broadcast, false = gossip
tParameters.bExtractLinksStartingFromANode			= true;		% true = randomly select a node then randomly select a neighbor | false = randomly select a link
%
tParameters.iMaximalNumberOfCommunications			= 10000;	% enforce termination



% ----------------------------------------------------------------------- %
% CONSENSUS
tParameters.strConsensusKind				= 'gossip'; % see Agent.SetConsensusKind()
tParameters.fGossipConsensusWeight			= 0.5;



