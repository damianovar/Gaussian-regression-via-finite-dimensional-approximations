EE				= 5:5:80;
MM				= 1000:1000:10000;
iNumberOfMCRuns	= 100;
gamma			= 1;


for E = EE;
for M = MM;
	%
	[boundA(M,E), boundB(M,E)] = ComputeBounds(alpha, M, E, k, sigma2, tKernelParameters);
	%
% 	for iMCRun = 1:iNumberOfMCRuns;
% 		%
% 		fprintf('conservativeness bound, M %d, E %d, \t MC run %d\n', M, E, iMCRun);
% 		%
% 		[ffTrueProcess, afTrueParameters] = GenerateTrueProcess( tKernelParameters );
% 		[ffInputLocations, iiInputLocationsIndexes, afMeasurements] = MeasureProcess( ffTrueProcess, M, tKernelParameters, atAgents );
% 		%
% 		[ ffEstimatedFA, afEstimatedCoefficientsFA ] = EstimateProcessA( iiInputLocationsIndexes, afMeasurements, gamma, E, tKernelParameters );
% 		%
% 		[ ffEstimatedFB, afEstimatedCoefficientsFB ] = EstimateProcessB( iiInputLocationsIndexes, afMeasurements, gamma, E, tKernelParameters );
% 		%
% 		% pad the coefficients vectors
% 		afEstimatedCoefficientsFA(end+1:numel(afTrueParameters),1) = 0;
% 		afEstimatedCoefficientsFB(end+1:numel(afTrueParameters),1) = 0;
% 		%
% 		afErrorNormsA(iMCRun) =	sum(((afEstimatedCoefficientsFA - afTrueParameters).^2));
% 		afErrorNormsB(iMCRun) =	sum(((afEstimatedCoefficientsFB - afTrueParameters).^2));
% 		%
% 	end;% MC 
% 	%
% 	fMSEA(M,E) = mean(afErrorNormsA);
% 	fMSEB(M,E) = mean(afErrorNormsB);
% 	% 
% 	MatlabToTikZ.ExportLineplot(						...
% 		sprintf('../../ArticleJournal/Data/ConservativenessOfBound/BoxplotsFA_M%d_E%d.txt', M, E),	...
% 		[												...
% 			(1:iNumberOfMCRuns)',						...
% 			log(afErrorNormsA)',						...
% 		],												...
% 		[,												...
% 			{'MCrunIndex','logErrorNormsNormalA'},
% 		]);
% 	% 
% 	MatlabToTikZ.ExportLineplot(						...
% 		sprintf('../../ArticleJournal/Data/ConservativenessOfBound/BoxplotsFB_M%d_E%d.txt', M, E),	...
% 		[												...
% 			(1:iNumberOfMCRuns)',						...
% 			log(afErrorNormsB)',						...
% 		],												...
% 		[,												...
% 			{'MCrunIndex','logErrorNormsNormalB'},
% 		]);
	%	
end;% M
end;% E

% figure(1)
% plot(log(boundB(M,EE))','b');
% hold on;
% plot(log(fMSEB(M,EE)),'r');
% hold off;
% 
% for M = MM;
% 	%
% 	MatlabToTikZ.ExportLineplot(						...
% 		sprintf('../../ArticleJournal/Data/ConservativenessOfBound/BoundsAndMSEs_M%d.txt', M),	...
% 		[												...
% 			EE',										...
% 			log(boundA(M,EE))',							...
% 			log(boundB(M,EE))',							...
% 			log(fMSEA(M,EE))',							...
% 			log(fMSEB(M,EE))',							...
% 		],												...
% 		[												...
% 			{'EE'},										...
% 			{'logBoundA'},								...
% 			{'logBoundB'},								...
% 			{'logMSEA'},								...
% 			{'logMSEB'},								...
% 		]);
% 	%
% 	% DEBUG
% % 	figure(M)
% % 	plot(log(boundA(M,EE))','b');
% % 	hold on;
% % 	plot(log(boundB(M,EE))','r');
% % 	hold off;
% 	%
% end;% M


figure(1)
surf(EE, MM, boundA(MM, EE))
xlabel('M')
ylabel('E')


figure(2)
surf(EE, MM, boundB(MM, EE))
xlabel('M')
ylabel('E')



