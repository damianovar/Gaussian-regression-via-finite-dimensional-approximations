function [	ffInputLocations,				...
			iiInputLocationsIndexes,		...
			afMeasurements			] =		...
				MeasureProcess(				...
					ffTrueProcess,			...
					M,						...
					tKernelParameters,		...
					atAgents				)
	%
	ffInputLocations		= [];
	iiInputLocationsIndexes	= [];
	sigma2					= tKernelParameters.sigma2;
	%
	switch( tKernelParameters.iNumberOfDimensions )
		%
		case 1
			iiInputLocationsIndexes = randi( [1, numel(tKernelParameters.afDomain)], M, 1 );
			ffInputLocations = tKernelParameters.afDomain( iiInputLocationsIndexes )';
			afMeasurements = ffTrueProcess( iiInputLocationsIndexes ) + sqrt(sigma2) * randn( M, 1 );
		%
		case 2
			aiXInputLocationIndexes = randi( [1, numel(tKernelParameters.afDomainXAxis)], M, 1 );
			aiYInputLocationIndexes = randi( [1, numel(tKernelParameters.afDomainYAxis)], M, 1 );
			iiInputLocationsIndexes = [ aiXInputLocationIndexes, aiYInputLocationIndexes ];
			%
			ffInputLocations	= zeros(M, 2);
			afMeasurements		= zeros(M, 1);
			afNoises			= sqrt(sigma2) * randn( M, 1 );
			for m = 1:M;
				%
				ffInputLocations(m, 1)	= tKernelParameters.afDomainXAxis( aiXInputLocationIndexes(m) );
				ffInputLocations(m, 2)	= tKernelParameters.afDomainYAxis( aiYInputLocationIndexes(m) );
				afMeasurements(m)		= ffTrueProcess( aiXInputLocationIndexes(m), aiYInputLocationIndexes(m) ) + afNoises(m);
				%
			end;%
			%
		otherwise
			error('not supported input domain dimensionality')
		%
	end;%
	%
% 	% for readability
% 	iNumberOfAgents = numel(atAgents);
% 	%
% 	for iAgent = 1:iNumberOfAgents;
% 		%
% 		% compute which measurements are owned by this agent
% 		if( iAgent == 1 )
% 			%
% 			iStartingMeasurementIndex	= 1;
% 			iEndingMeasurementIndex		= floor( M / iNumberOfAgents );
% 			%
% 		else%
% 			%
% 			iStartingMeasurementIndex	= iEndingMeasurementIndex + 1;
% 			iEndingMeasurementIndex		= iStartingMeasurementIndex + floor( M / iNumberOfAgents );
% 			%
% 			if( iAgent == iNumberOfAgents )
% 				%
% 				iEndingMeasurementIndex	= M;
% 				%
% 			end;%
% 			%
% 		end;%
% 		%
% 		atAgents(iAgent).afMeasurements				= afMeasurements( iStartingMeasurementIndex:iEndingMeasurementIndex );
% 		atAgents(iAgent).ffInputLocations			= ffInputLocations( iStartingMeasurementIndex:iEndingMeasurementIndex, : );
% 		atAgents(iAgent).iiInputLocationsIndexes	= iiInputLocationsIndexes( iStartingMeasurementIndex:iEndingMeasurementIndex, : );
% 		%
% 		% TODO?
% % 		atAgents(iAgent).ComputeAuxiliaryVariables();
% 		%
% 	end;%
	%
end %

