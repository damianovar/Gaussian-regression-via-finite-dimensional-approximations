figure(1000 * iUCIDatasetIndex + 100 * iKernelType + 1 * iKernelVarianceIndex);
plot(log10(afPotentialGammasFA), afTestRSSsFA, '-r');
hold on;
plot(log10(afPotentialGammasFA), afTestFitsFA, '-k');
plot(log10(afPotentialGammasFA), afTestCEsFA, '-y');
plot(log10(afPotentialGammasFA), afSURERisksFA, '-b');
xlabel('log10 potential gammas');
ylabel('KPI');
hold off;
legend('test RSS FA', 'test fits FA', 'test CEs FA', 'SURE risks FA');
title(sprintf('dataset %s, kernel %s, variance %.3f', astrUCIDatasets{iUCIDatasetIndex}, astrKernelTypes{iKernelType}, afKernelVariances(iKernelVarianceIndex)));


figure(1000 + 1000 * iUCIDatasetIndex + 100 * iKernelType + 1 * iKernelVarianceIndex);
plot(aiPotentialEs, aafTestRSSsFB(:), '-r');
hold on;
plot(aiPotentialEs, aafTestFitsFB(:), '-k');
plot(aiPotentialEs, aafTestCEsFB(:), '-y');
plot(aiPotentialEs, aafSURERisksFB(:), '-b');
xlabel('potential Es');
ylabel('KPI');
hold off;
legend('test RSS FB', 'test fits FB', 'test CEs FB', 'SURE risks FB');
title(sprintf('dataset %s, kernel %s, variance %.3f', astrUCIDatasets{iUCIDatasetIndex}, astrKernelTypes{iKernelType}, afKernelVariances(iKernelVarianceIndex)));

