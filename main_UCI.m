clc;
close all;
clear all;
import EigenfunctionsComputationPackage.*;
diary('results.txt')
diary on
warning('off','MATLAB:nearlySingularMatrix')


% load the parameters
astrNystromGenerationMethod			= 'training-set'; % 'random' | 'training-set'| 'whole-dataset'
iMaxDatasetSize						= 9400; % limit the number of samples; -1 => use all the possible ones
iNumberOfSamplesForNystrom			= min(200, iMaxDatasetSize); % limit the number of samples; -1 => use all the possible ones
%
afKernelVariances					= [1];%logspace(-2,2,10);
%
astrKernelTypes						= [{'gaussian'}];
astrUCIDatasets						=	[									...
											{'CCPP/CCPP'},					... kvA 0.2 kvB 0.2, all samples
...											{'CPUPerformance/machine'},		... kvA 1.0 kvB 1.0, all samples
...											{'Concrete/concrete'},			... bad
...											{'Adult/adult'},				... bad
...											{'ForestCover/covtype'},		... bad
...											{'Appliances/appliances'},		...
										];
astrUCIDatasetsTypes				= [{'regression'}, {'regression'}, {'regression'}, {'regression'}, {'regression'}];
%
% astrKernelTypes					= [{'gaussian'}, {'laplacian'}];
% astrUCIDatasets					= [{'CCPP/CCPP'}, {'Concrete/concrete'}, {'CPUPerformance/machine'}, {'Adult/adult'}, {'ForestCover/covtype'}];
% astrUCIDatasetsTypes				= [{'regression'}, {'classification'}, {'regression'}];
%
afPotentialGammasFA					= [0, logspace(-5,2,8)];
afPotentialGammasFB					= 0;
Emax								= 30;
aiPotentialEs						= 1:1:Emax;


for iUCIDatasetIndex = 1:numel(astrUCIDatasets)
	%
	% DEBUG
	fprintf('\n\n############################\nstarted processing the dataset %s\n\n', astrUCIDatasets{iUCIDatasetIndex});
	%
	[ffXTraining, ffXTest, afYTraining, afYTest, aafNormalizationFactors] = ...
		LoadUCIDataset(astrUCIDatasets{iUCIDatasetIndex}, iMaxDatasetSize);
	%
	InitializeKPIs;
	%
	for iKernelType = 1:numel(astrKernelTypes);
	for iKernelVarianceIndex = 1:numel(afKernelVariances);
		fCurrentTimer = tic;
		%
		% DEBUG
		fprintf('\n--------------------------\nstarted using kernel %s with variance %.3f\n\n', astrKernelTypes{iKernelType}, afKernelVariances(iKernelVarianceIndex));
		%
		tNystromComputer.strKernelType			= astrKernelTypes{iKernelType};
		tNystromComputer.fKernelVariance		= afKernelVariances(iKernelVarianceIndex);
		tNystromComputer.iNumberOfDimensions	= numel( ffXTraining(1,:) );
		%
		ComputeNystromBasis;
		%
%		tNystromComputer.sigma2 = EstimateMeasurementNoiseVariance(	[ffXTraining; ffXTest],	...
%	   																[afYTraining; afYTest],	...
%																	tNystromComputer );
 		tNystromComputer.sigma2 = 1;
		%
		% estimate with FA
		[	afTrainingRSSsFA,										...
			afTrainingFitsFA,										...
			afTrainingCEsFA,										...
			afTestRSSsFA,											...
			afTestFitsFA,											...
			afTestCEsFA,											...
			afSURERisksFA		] =									...
				EstimateGammaWithDistributedSUREForFA(				...
								ffXTraining,						...
								afYTraining,						...
								ffXTest,							...
								afYTest,							...
								afPotentialGammasFA,				...
								Emax,								...
								tNystromComputer					);
		%	
		% estimate with FB
		[	aafTrainingRSSsFB,										...
			aafTrainingFitsFB,										...
			aafTrainingCEsFB,										...
			aafTestRSSsFB,											...
			aafTestFitsFB,											...
			aafTestCEsFB,											...
			aafSURERisksFB		] =									...
				EstimateGammaWithDistributedSUREForFB(				...
								ffXTraining,						...
								afYTraining,						...
								ffXTest,							...
								afYTest,							...
								afPotentialGammasFB,				...
								aiPotentialEs,						...
								tNystromComputer					);
		%
		UpdateKPIs;
% 		PlotCurrentKPIs;
		%
		fprintf('--> this learning round has taken %f seconds\n', toc(fCurrentTimer));
	end;% for iKernelVarianceIndex
	end;% for iKernelType
	%
	% DEBUG
	fprintf('\n\n------------------\nDataset %s\n', astrUCIDatasets{iUCIDatasetIndex});
	fprintf('FA:\n');
	fprintf('best kernel variance             = %.5f\n', afKernelVariances(iBestKernelVarianceIndexForTestRSSFAPlusOracle));
	fprintf('best oracle RSS                  = %.5f\n', fBestTestRSSFAPlusOracle);
	fprintf('corresponding SURE RSS           = %.5f\n', fCorrespondingTestRSSFAPlusSURE);
	fprintf('best oracle fit                  = %.5f\n', fBestTestFitFAPlusOracle);
	fprintf('corresponding SURE fit           = %.5f\n', fCorrespondingTestFitFAPlusSURE);
	fprintf('gamma of best oracle RSS         = %.5f\n', fBestGammaAccordingToOracleForFAForRSS);
	fprintf('gamma of corresponding SURE RSS  = %.5f\n', fBestGammaAccordingToSUREForFAForRSS);
	fprintf('\nFB:\n');
	fprintf('best kernel variance             = %.5f\n', afKernelVariances(iBestKernelVarianceIndexForTestRSSFBPlusOracle));
	fprintf('best oracle RSS                  = %.5f\n', fBestTestRSSFBPlusOracle);
	fprintf('corresponding SURE RSS           = %.5f\n', fCorrespondingTestRSSFBPlusSURE);
	fprintf('best oracle fit                  = %.5f\n', fBestTestFitFBPlusOracle);
	fprintf('corresponding SURE fit           = %.5f\n', fCorrespondingTestFitFBPlusSURE);
	fprintf('E of best oracle RSS             = %.5f\n', iBestEAccordingToOracleForFBForRSS);
	fprintf('E of corresponding SURE RSS      = %.5f\n', iBestEAccordingToSUREForFBForRSS);
	fprintf('estimated sigma 2                = %.5f\n', tNystromComputer.sigma2);
	%
	SaveKPIs;
	%
end;% for iUCIDatasetIndex

ExportKPIs;
diary off



