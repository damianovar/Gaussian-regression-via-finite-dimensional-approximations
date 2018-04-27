function [	afTrainingRSSs,											...
			afTrainingFits,											...
			afTrainingCEs,											...
			afTestRSSs,												...
			afTestFits,												...
			afTestCEs,												...
			afSURERisks		] =										...
				EstimateGammaWithDistributedSUREForFA(				...
								ffXTraining,						...
								afYTraining,						...
								ffXTest,							...
								afYTest,							...
								afPotentialGammas,					...
								E,									...
								tNystromComputer					)
	%
	% initialize with dummy values
	afTrainingRSSs			= zeros(numel(afPotentialGammas), 1);
	afTrainingFits			= zeros(numel(afPotentialGammas), 1);
	afTrainingFitsNum		= zeros(numel(afPotentialGammas), 1);
	afTrainingFitsDen		= zeros(numel(afPotentialGammas), 1);
	afTrainingCEs			= zeros(numel(afPotentialGammas), 1);
	afTestRSSs				= zeros(numel(afPotentialGammas), 1);
	afTestFits				= zeros(numel(afPotentialGammas), 1);
	afTestFitsNum			= zeros(numel(afPotentialGammas), 1);
	afTestFitsDen			= zeros(numel(afPotentialGammas), 1);
	afTestCEs				= zeros(numel(afPotentialGammas), 1);
	afSURERisks				= zeros(numel(afPotentialGammas), 1);
	%
	% for readability
	M		= numel( afYTraining );
	G		= ComputeG( ffXTraining, E, tNystromComputer );
	GGM		= ( G' * G / M );
	sigma2	= tNystromComputer.sigma2;
	Sigma	= sigma2 * GGM / M;
	z		= ( G' * afYTraining ) / M;
	aafKForRegression =	(tNystromComputer.aafEigenvectors(:,1:E)')	...
					*	 tNystromComputer.aafKernelMatrix			...
					*	(tNystromComputer.aafEigenvectors(:,1:E) );
	fAverageMeasurement = mean([afYTraining; afYTest]);
	%
	% cycle on the potential gammas
	for iGammaIndex = 1:numel(afPotentialGammas);
		%
		% for readability
		gamma = afPotentialGammas(iGammaIndex);
		%
		% estimate the coefficients plus get the hatted training samples
		[ afYHatTraining, afEstimatedCoefficients ] =	...
			EstimateProcessA(	ffXTraining,			...
								G,						...
								aafKForRegression,		...
								afYTraining,			...
								gamma,					...
								sigma2,					...
								E,						...
								tNystromComputer		);
		%
		% get the simulated samples in the test set
		afYHatTest = GenerateSamplesFromBasisfunctionsWeights(	...
				tNystromComputer,								...
				afEstimatedCoefficients,						...
				ffXTest											);
		%
		% compute the variables for finding the SURE risk
		S = GGM * inv(												...
						GGM											...
						+											...
						gamma * ( sigma2 / M ) * aafKForRegression	...
					);
		%
		% compute the current SURE risk
		afSURERisks(iGammaIndex) = (norm( z - S * z )^2) + 2 * trace( S * Sigma );
		%
		% computation of the residuals
		for iTrainingDatum = 1:numel(afYTraining)
			%
			fCurrentDistance =					...
					afYTraining(iTrainingDatum)	...
				-	afYHatTraining(iTrainingDatum);
			%
			afTrainingRSSs(iGammaIndex)		= afTrainingRSSs(iGammaIndex) + fCurrentDistance^2;
			afTrainingFitsNum(iGammaIndex)	= afTrainingFitsNum(iGammaIndex) + (fCurrentDistance)^2;
			afTrainingFitsDen(iGammaIndex)	= afTrainingFitsDen(iGammaIndex) + (afYTraining(iTrainingDatum) - fAverageMeasurement)^2;
			%
		end;%
		%
		for iTestDatum = 1:numel(afYTest)
			%
			fCurrentDistance =			...
					afYTest(iTestDatum)	...
				-	afYHatTest(iTestDatum);
			%
			afTestRSSs(iGammaIndex) = afTestRSSs(iGammaIndex) + fCurrentDistance^2;
			afTestFitsNum(iGammaIndex) = afTestFitsNum(iGammaIndex) + (fCurrentDistance)^2;
			afTestFitsDen(iGammaIndex) = afTestFitsDen(iGammaIndex) + (afYTest(iTestDatum) - fAverageMeasurement)^2;
			%
		end;%
		%
		% compute the classification errors
		afTrainingCEs(iGammaIndex)	= ComputeClassificationError( afYTraining, afYHatTraining );
		afTestCEs(iGammaIndex)		= ComputeClassificationError( afYTest, afYHatTest );
		%
		% normalize the residuals for the RSS
		afTrainingRSSs(iGammaIndex) 	= afTrainingRSSs(iGammaIndex)	/ numel(afYTraining);
		afTestRSSs(iGammaIndex) 		= afTestRSSs(iGammaIndex)		/ numel(afYTest);
		%
		% finalize the computation of the fit indexes
		afTrainingFits(iGammaIndex)	= 100 * (1 - sqrt(afTrainingFitsNum(iGammaIndex))	./ sqrt(afTrainingFitsDen(iGammaIndex)));
		afTestFits(iGammaIndex)		= 100 * (1 - sqrt(afTestFitsNum(iGammaIndex))		./ sqrt(afTestFitsDen(iGammaIndex)));
		%
		% DEBUG
		iFigureIndex = randi(2000,1);
		fprintf('Estimated FA, gamma = %.10f (%d of %d), test RSS = %.6f, fit = %.6f (fig.%d)\n', afPotentialGammas(iGammaIndex), iGammaIndex, numel(afPotentialGammas), afTestRSSs(iGammaIndex), afTestFits(iGammaIndex), iFigureIndex);
		%
% 		% DEBUG
% 		figure(iFigureIndex)
% 		scatter(afYTest, afYHatTest);
% 		xmin = min(afYHatTest);
% 		xmax = max(afYHatTest);
% 		axis( [xmin xmax xmin xmax] );
% 		grid on;
% 		title(sprintf('Estimated FA, gamma = %.10f (%d of %d), test RSS = %.3f, fit = %.3f (fig.%d)\n', afPotentialGammas(iGammaIndex), iGammaIndex, numel(afPotentialGammas), afTestRSSs(iGammaIndex), afTestFits(iGammaIndex), iFigureIndex));
% 		%
% 		% DEBUG
% 		figure(iFigureIndex+1)
% 		plot((afYTraining - afYHatTraining)/sqrt(sigma2));
% 		grid on;
% 		title(sprintf('weighted residuals in training for FA, gamma = %.10f', afPotentialGammas(iGammaIndex)));
% 		%
% 		% DEBUG
% 		figure(iFigureIndex+2)
% 		plot((afYTest - afYHatTest)/sqrt(sigma2));
% 		grid on;
% 		title(sprintf('weighted residuals in test for FA, gamma = %.10f', afPotentialGammas(iGammaIndex)));
		%
	end;% cycle on the potential gammas
	%
end % function

