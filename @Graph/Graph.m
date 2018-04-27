% handles global properties like bounded intercommunication intervals
%
classdef Graph < handle
	%
	% ---------------------------------------------------------------------
	properties
		%
		bPrintDebugInformation;
		%
		iCurrentTime;
		%
		iNumberOfNodes;
		iNumberOfEdges;
		%
		strKindOfGraph;
		%
		aafNodesPositions;
		aaiAdjacencyMatrix;
		aaiEdgeNodeIncidenceMatrix;
		%
		aafMetropolisWeights;
		%
		aaiDistancesInHops;
		iDiameter;
		iRadius;
		%
		fCommunicationRadius;			% -1 indicates that the network is not a geometric network
		aiBidimensionalGridDimensions;	% -1 indicates that the network is not a bidimensional grid
		bUseSelfLoops;
		%
	end %
	%
	%
	% ---------------------------------------------------------------------
	methods
		%
		% standard constructor
		function tGraph = Graph( tParameters )
			%
			tGraph.bPrintDebugInformation				= tParameters.bPrintDebugInformation;
			%
			tGraph.iNumberOfNodes						= tParameters.iNumberOfAgents;
			tGraph.strKindOfGraph						= tParameters.strKindOfGraph;
			%
			tGraph.fCommunicationRadius					= tParameters.fCommunicationRadius;
			tGraph.aiBidimensionalGridDimensions		= tParameters.aiBidimensionalGridDimensions;
			tGraph.bUseSelfLoops						= tParameters.bUseSelfLoops;
			%
			tGraph.GenerateGraph();
			%
			tGraph.ComputeDistancesBetweenAllNodes();
			tGraph.ComputeDiameter();
			tGraph.ComputeRadius();
			tGraph.ComputeEdgeNodeIncidenceMatrix();
			%
			tGraph.aafMetropolisWeights = tGraph.ComputeMetropolisWeights();
			%
			if( tGraph.bPrintDebugInformation )
				%
				tGraph.Plot();
				fprintf('Network succesfully constructed\n');
				%
			end;%
			%
		end %
		%
	end %
	%
	%
end %
 
