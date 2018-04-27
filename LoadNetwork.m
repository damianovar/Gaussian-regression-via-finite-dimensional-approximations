tCommunicationsManager = CommunicationsManager( tParameters );

% DEBUG
% tCommunicationsManager.tGraph.Plot();

% export for LaTeX
% MatlabToTikZ.ExportGraph( './+Network/Databases/Graph.txt', tCommunicationsManager.tGraph );

% in case we want to use the same graph for all the simulations
% tCommunicationsManager.SaveToMatFile( './+Network/Databases/Graph.mat' );
% tCommunicationsManager.LoadFromMatFile( './+Network/Databases/Graph.mat' );

atAgents = Agent.Allocate( tParameters );

