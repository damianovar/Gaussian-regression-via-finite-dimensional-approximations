function [	aafTrainingRSSs,										...
			aafTrainingFits,										...
			aafTrainingCEs,											...
			aafTestRSSs,											...
			aafTestFits,											...
			aafTestCEs,												...
			aafSURERisks		] =									...
				EstimateGammaWithDistributedSUREForFB(				...
								ffXTraining,						...
								afYTraining,						...
								ffXTest,							...
								afYTest,							...
								afPotentialGammas,					...
								aiPotentialEs,						...
								tNystromComputer					)
	%
	% initialize with dummy values
	aafTrainingRSSs			= zeros(numel(afPotentialGammas), numel(aiPotentialEs));
	aafTrainingFits			= zeros(numel(afPotentialGammas), numel(aiPotentialEs));
	aafTrainingFitsNum		= zeros(numel(afPotentialGammas), numel(aiPotentialEs));
	aafTrainingFitsDen		= zeros(numel(afPotentialGammas), numel(aiPotentialEs));
	aafTrainingCEs			= zeros(numel(afPotentialGammas), numel(aiPotentialEs));
	aafTestRSSs				= zeros(numel(afPotentialGammas), numel(aiPotentialEs));
	aafTestFits				= zeros(numel(afPotentialGammas), numel(aiPotentialEs));
	aafTestFitsNum			= zeros(numel(afPotentialGammas), numel(aiPotentialEs));
	aafTestFitsDen			= zeros(numel(afPotentialGammas), numel(aiPotentialEs));
	aafTestCEs				= zeros(numel(afPotentialGammas), numel(aiPotentialEs));
	aafSURERisks			= zeros(numel(afPotentialGammas), numel(aiPotentialEs));
	%
	% for readability
	M			= numel( afYTraining );
	sigma2		= tNystromComputer.sigma2;
	Emax		= max(aiPotentialEs);
	Gcomplete	= ComputeG( ffXTraining, Emax, tNystromComputer );
	GGMcomplete	= ( Gcomplete' * Gcomplete ) / M;
	approximatedSigma	= sigma2 * tNystromComputer.aafExpectedGGM(1:Emax, 1:Emax) / M;
	z					= ( Gcomplete' * afYTraining ) / M;
	aafKForRegression	=	(tNystromComputer.aafEigenvectors(:,1:Emax)')	...
						*	 tNystromComputer.aafKernelMatrix				...
						*	(tNystromComputer.aafEigenvectors(:,1:Emax) );
	fAverageMeasurement = mean([afYTraining; afYTest]);
	%
	% cycle on the potential gammas and Es
	for iGammaIndex = 1:numel(afPotentialGammas);
		%
		for iEIndex 	= 1:numel(aiPotentialEs);
			%
			% for readability
			gamma 	= afPotentialGammas(iGammaIndex);
			E 		= aiPotentialEs(iEIndex);
			%
			% estimate the coefficients plus get the hatted training samples
			[ afYHatTraining, afEstimatedCoefficients ] =			...
				EstimateProcessB(	ffXTraining,					...
									Gcomplete(:, 1:E),				...
									aafKForRegression(1:E, 1:E),	...
									afYTraining,					...
									gamma,							...
									sigma2,							...
									E,								...
									tNystromComputer				);
			%
			% get the simulated samples in the test set
			afYHatTest = GenerateSamplesFromBasisfunctionsWeights(	...
					tNystromComputer,								...
					afEstimatedCoefficients,						...
					ffXTest											);
			%
			% compute the variables for finding the SURE risk:
			% first, pad afEstimatedCoefficients with an opportune number of zeros
			afEstimatedCoefficients	= [ afEstimatedCoefficients; zeros(Emax - E, 1) ];
			%
			z_hat = GGMcomplete * afEstimatedCoefficients;
			%
			approximatedS =														...
					tNystromComputer.aafExpectedGGM(1:Emax, 1:Emax)				...
				*	[ eye(E) ; zeros(Emax - E, E) ]								...
				*	inv															...
					(															...
						tNystromComputer.aafExpectedGGM(1:E, 1:E)				...
						+														...
						gamma * ( sigma2 / M ) * aafKForRegression(1:E, 1:E)	...
					);
			%
			% pad opportunely
			approximatedS = [ approximatedS , zeros( Emax, Emax - E ) ];
			%
			aafSURERisks(iGammaIndex, iEIndex) = (norm( z - z_hat )^2) + 2 * trace(approximatedS * approximatedSigma);
			%
			% computation of the residuals
			for iTrainingDatum = 1:numel(afYTraining)
				%
				fCurrentDistance =					...
						afYTraining(iTrainingDatum)	...
					-	afYHatTraining(iTrainingDatum);
				%
				aafTrainingRSSs(iGammaIndex, iEIndex) = aafTrainingRSSs(iGammaIndex, iEIndex) + fCurrentDistance^2;
				aafTrainingFitsNum(iGammaIndex, iEIndex) = aafTrainingFitsNum(iGammaIndex, iEIndex) + (fCurrentDistance)^2;
				aafTrainingFitsDen(iGammaIndex, iEIndex) = aafTrainingFitsDen(iGammaIndex, iEIndex) + (afYTraining(iTrainingDatum) - fAverageMeasurement)^2;
				%
			end;%
			%
			for iTestDatum = 1:numel(afYTest)
				%
				fCurrentDistance = 			...
						afYTest(iTestDatum)	...
					-	afYHatTest(iTestDatum);
				%
				aafTestRSSs(iGammaIndex, iEIndex) = aafTestRSSs(iGammaIndex, iEIndex) + (fCurrentDistance^2);
				aafTestFitsNum(iGammaIndex, iEIndex) = aafTestFitsNum(iGammaIndex, iEIndex) + (fCurrentDistance)^2;
				aafTestFitsDen(iGammaIndex, iEIndex) = aafTestFitsDen(iGammaIndex, iEIndex) + (afYTest(iTestDatum) - fAverageMeasurement)^2;
				%
			end;%
			%
			% compute the classification errors
			aafTrainingCEs(iGammaIndex, iEIndex)	= ComputeClassificationError( afYTraining, afYHatTraining );
			aafTestCEs(iGammaIndex, iEIndex)		= ComputeClassificationError( afYTest, afYHatTest );
			%
			% normalize the residuals
			aafTrainingRSSs(iGammaIndex, iEIndex)	= aafTrainingRSSs(iGammaIndex, iEIndex)	/ numel(afYTraining);
			aafTestRSSs(iGammaIndex, iEIndex) 		= aafTestRSSs(iGammaIndex, iEIndex)		/ numel(afYTest);
			%
			% finalize the computation of the fit indexes
			aafTrainingFits(iGammaIndex, iEIndex)	= 100 * (1 - sqrt(aafTrainingFitsNum(iGammaIndex, iEIndex))	./ sqrt(aafTrainingFitsDen(iGammaIndex, iEIndex)));
			aafTestFits(iGammaIndex, iEIndex)		= 100 * (1 - sqrt(aafTestFitsNum(iGammaIndex, iEIndex))		./ sqrt(aafTestFitsDen(iGammaIndex, iEIndex)));
			%
			% DEBUG
			iFigureIndex = randi(2000,1);
			fprintf('estimating FB, E = %d (%d of %d), test RSS = %.6f, fit = %.6f (fig.%d)\n', E, iEIndex, numel(aiPotentialEs), aafTestRSSs(iGammaIndex, iEIndex), aafTestFits(iGammaIndex, iEIndex), iFigureIndex);
			%
% 			% DEBUG
% 			figure(iFigureIndex)
% 			scatter(afYTest, afYHatTest);
% 			xmin = min(afYHatTest);
% 			xmax = max(afYHatTest);
% 			axis( [xmin xmax xmin xmax] );
% 			grid on;
% 			title(sprintf('estimating FB, E = %d (%d of %d), test RSS = %.3f, fit = %.3f (fig.%d)\n', E, iEIndex, numel(aiPotentialEs), aafTestRSSs(iGammaIndex, iEIndex), aafTestFits(iGammaIndex, iEIndex), iFigureIndex));
% 			%
% 			% DEBUG
% 			figure(iFigureIndex+1)
% 			plot((afYTraining - afYHatTraining)/sqrt(sigma2));
% 			grid on;
% 			title(sprintf('weighted residuals in training for FB, E = %d', E));
% 			%
% 			% DEBUG
% 			figure(iFigureIndex+2)
% 			plot((afYTest - afYHatTest)/sqrt(sigma2));
% 			grid on;
% 			title(sprintf('weighted residuals in test for FB, E = %d', E));
			%
		end;% cycle on the potential gammas
		%
	end;% cycle on the potential Es
	%
end % function

