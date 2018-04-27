function sigma2noise = EstimateMeasurementNoiseVariance(ffInputLocations, afMeasurements, tNystromComputer )
	%
	% DEBUG
	fprintf('started estimating the variance of the measurement noise\n');
	%
	% compute the LS solution
	gamma = 0;
	sigma2noise = 1; % initially we don't know the sigma2noise
	E = min( [200, numel( tNystromComputer.afEigenvalues ), numel(ffInputLocations(:,1))] );
	G = ComputeG( ffInputLocations, E, tNystromComputer );
	aafKForRegression =	(tNystromComputer.aafEigenvectors(:,1:E)')	...
					*	 tNystromComputer.aafKernelMatrix			...
					*	(tNystromComputer.aafEigenvectors(:,1:E) );
	%
	[ ffEstimatedF, ~ ] = EstimateProcessA(	ffInputLocations,	...
											G,					...
											aafKForRegression,	...
											afMeasurements,		...
											gamma,				...
											sigma2noise,		...
											E,					...
											tNystromComputer	);
	%
	% compute the residuals
	fTrainingRSSs = 0;
	for iTrainingDatum = 1:numel(afMeasurements)
		%
		fCurrentDistance =						...
				afMeasurements(iTrainingDatum)	...
			-	ffEstimatedF(iTrainingDatum);
		%
		fTrainingRSSs = fTrainingRSSs + fCurrentDistance^2;
		%
	end;%
	%
	% update the estimate
	sigma2noise = fTrainingRSSs / ( numel(afMeasurements) - E );
	%
	% DEBUG
	fprintf('estimated variance of the measurement noise = %.3f\n', sigma2noise);
	%
end % function

