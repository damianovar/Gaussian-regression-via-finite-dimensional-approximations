Emax			= numel(tKernelParameters.afEigenvalues)-1;
MM				= logspace(2,6,5);
iNumberOfMCRuns	= 100;
gamma			= 1;


for M = MM;
	%
	% find the EB that minimizes the bound
	EB = GetBestEForEstimatorFB(alpha, M, Emax, k, sigma2, tKernelParameters);
	%
	for iMCRun = 1:iNumberOfMCRuns;
		%
		fprintf('effectiveness fB, M %d, \t MC run %d\n', M, iMCRun);
		%
		[ffTrueProcess, afTrueParameters] = GenerateTrueProcess( tKernelParameters );
		[ffInputLocations, iiInputLocationsIndexes, afMeasurements] = MeasureProcess( ffTrueProcess, M, tKernelParameters, atAgents );
		%
		[ ffEstimatedFB, afEstimatedCoefficientsFB ] = EstimateProcessB( iiInputLocationsIndexes, afMeasurements, gamma, EB, tKernelParameters );
		%
		afEstimatedCoefficientsFB(end+1:numel(afTrueParameters),1) = 0;
		afErrorNormsB(iMCRun) =	sum(((afEstimatedCoefficientsFB - afTrueParameters).^2));
		%
	end;% MC 
	% 
	MatlabToTikZ.ExportLineplot(						...
		sprintf('../../ArticleJournal/Data/EffectivenessOfEstimators/BoxplotsFB_M%d_E%d.txt', M, EB),	...
		[												...
			(1:iNumberOfMCRuns)',						...
			log(afErrorNormsB)',						...
		],												...
		[,												...
			{'MCrunIndex','logErrorNormsNormalB'},
		]);
	%	
end;% M

