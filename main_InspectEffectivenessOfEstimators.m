Emax			= numel(tKernelParameters.afEigenvalues)-1;
MM				= logspace(2,5,4);
iNumberOfMCRuns	= 10;
gamma			= 1;


for M = MM;
	%
	% find the EB that minimizes the bound
	EB = GetBestEForEstimatorFB(alpha, M, Emax, k, sigma2, tKernelParameters);
	%
	% find the EA that corresponds to the same communication complexity of fB
	EA = round( (sqrt(4*EB + 1) - 1) / 2 );
	%
	for iMCRun = 1:iNumberOfMCRuns;
		%
		fprintf('effectiveness fA and fB, M %d, EA %d, EB %d, \t MC run %d\n', M, EA, EB, iMCRun);
		%
		[ffTrueProcess, afTrueParameters] = GenerateTrueProcess( tKernelParameters );
		[ffInputLocations, iiInputLocationsIndexes, afMeasurements] = MeasureProcess( ffTrueProcess, M, tKernelParameters, atAgents );
		%
		[ ffEstimatedFA, afEstimatedCoefficientsFA ] = EstimateProcessA( iiInputLocationsIndexes, afMeasurements, gamma, EA, tKernelParameters );
		[ ffEstimatedFB, afEstimatedCoefficientsFB ] = EstimateProcessB( iiInputLocationsIndexes, afMeasurements, gamma, EB, tKernelParameters );
		%
		afEstimatedCoefficientsFB(end+1:numel(afTrueParameters),1) = 0;
		afEstimatedCoefficientsFA(end+1:numel(afTrueParameters),1) = 0;
		%
		afErrorNormsA(iMCRun) =	sum(((afEstimatedCoefficientsFA - afTrueParameters).^2));
		afErrorNormsB(iMCRun) =	sum(((afEstimatedCoefficientsFB - afTrueParameters).^2));
		%
	end;% MC 
	%
	fMSEA(M) = mean(afErrorNormsA);
	fMSEB(M) = mean(afErrorNormsB);
	% 
	MatlabToTikZ.ExportLineplot(						...
		sprintf('../../ArticleJournal/Data/EffectivenessOfEstimators/BoxplotsFA_M%d_E%d.txt', M, EA),	...
		[												...
			(1:iNumberOfMCRuns)',						...
			log(afErrorNormsA)',						...
		],												...
		[,												...
			{'MCrunIndex','logErrorNormsNormalA'},
		]);
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


figure(1)
plot(log(fMSEA(MM)),'b');
hold on;
plot(log(fMSEB(MM)),'r');
hold off;

