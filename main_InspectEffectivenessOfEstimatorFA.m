E				= 21;
MM				= logspace(2,5,4);
iNumberOfMCRuns	= 100;
gamma			= 1;


for M = MM;
	%
	for iMCRun = 1:iNumberOfMCRuns;
		%
		fprintf('effectiveness fA, M %d, \t MC run %d\n', M, iMCRun);
		%
		[ffTrueProcess, afTrueParameters] = GenerateTrueProcess( tKernelParameters );
		[ffInputLocations, iiInputLocationsIndexes, afMeasurements] = MeasureProcess( ffTrueProcess, M, tKernelParameters, atAgents );
		%
		[ ffEstimatedFA, afEstimatedCoefficientsFA ] = EstimateProcessA( iiInputLocationsIndexes, afMeasurements, gamma, E, tKernelParameters );
		%
		afEstimatedCoefficientsFA(end+1:numel(afTrueParameters),1) = 0;
		afErrorNormsA(iMCRun) =	sum(((afEstimatedCoefficientsFA - afTrueParameters).^2));
		%
	end;% MC 
	%
	fMSEA(M) = mean(afErrorNormsA);
	% 
	MatlabToTikZ.ExportLineplot(						...
		sprintf('../../ArticleJournal/Data/EffectivenessOfEstimators/BoxplotsFA_M%d_E%d.txt', M, E),	...
		[												...
			(1:iNumberOfMCRuns)',						...
			log(afErrorNormsA)',						...
		],												...
		[,												...
			{'MCrunIndex','logErrorNormsNormalA'},
		]);
	%	
end;% M

figure(1)
plot(log(fMSEA(MM)),'b');


