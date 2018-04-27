function fEstimatedGamma =						...
				EstimateGammaWithOracle(		...
					afTrueParameters,			...
					ffInputLocations,			...
					iiInputLocationsIndexes,	...
					afMeasurements,				...
					afPotentialGammas,			...
					E,							...
					tKernelParameters			)
	%
	% initialize with dummy values
	fEstimatedGamma	= -1;
	fBestRisk		= 9999999999999999;
	%
	% for readability
	Lambda		= diag( tKernelParameters.afEigenvalues(1:E) );
	M			= numel( afMeasurements );
	sigma2		= tKernelParameters.sigma2;
	%
	% cycle on the potential gammas
	for iGammaIndex = 1:numel(afPotentialGammas);
		%
		gamma = afPotentialGammas(iGammaIndex);
		%
		[ ffEstimatedFAOracle, afEstimatedCoefficientsFAOracle ] = EstimateProcessA( iiInputLocationsIndexes, afMeasurements, gamma, E, tKernelParameters );
		%
		afEstimatedCoefficientsFAOracle(end+1:numel(afTrueParameters)) = 0;
		%
		estimatedRisk = sum(((afEstimatedCoefficientsFAOracle - afTrueParameters).^2));
		%
		% save the current gamma if it is the best one
		if fBestRisk > estimatedRisk;
			%
			fBestRisk = estimatedRisk;
			fEstimatedGamma = gamma;
			%
		end;%
		%
	end;% cycle on the potential gammas
	%
end % function

