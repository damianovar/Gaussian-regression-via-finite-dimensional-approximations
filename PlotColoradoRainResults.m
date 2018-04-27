figure(1)
surf(ffEstimatedProcessSUREFA)
hold on;
scatter3(iiTrainingInputLocationsIndexes(:,2), iiTrainingInputLocationsIndexes(:,1), afTrainingMeasurements, '*');
scatter3(iiTestInputLocationsIndexes(:,2), iiTestInputLocationsIndexes(:,1), afTestMeasurements, 'filled');
title('estimated process through FA + SURE')
% savefig('../Figures/estimated process through FA + SURE')
hold off;

figure(2)
surf(ffEstimatedProcessOracleFA)
hold on;
scatter3(iiTrainingInputLocationsIndexes(:,2), iiTrainingInputLocationsIndexes(:,1), afTrainingMeasurements, '*');
scatter3(iiTestInputLocationsIndexes(:,2), iiTestInputLocationsIndexes(:,1), afTestMeasurements, 'filled');
title('estimated process through FA + Oracle')
% savefig('../Figures/estimated process through FA + Oracle')
hold off;

figure(3)
surf(ffEstimatedProcessSUREFANystrom)
hold on;
scatter3(iiTrainingInputLocationsIndexes(:,2), iiTrainingInputLocationsIndexes(:,1), afTrainingMeasurements, '*');
scatter3(iiTestInputLocationsIndexes(:,2), iiTestInputLocationsIndexes(:,1), afTestMeasurements, 'filled');
title('estimated process through FA Nystrom + SURE')
% savefig('../Figures/estimated process through FA Nystrom + SURE')
hold off;

figure(4)
plot(afPotentialGammasFA, afTestRSSsFA, '-r');
hold on;
plot(afPotentialGammasFA, afSURERisksFA, '--k');
plot(afPotentialGammasFA, afSURERisksFANystrom, ':k');
plot(afPotentialGammasFA, afTestFitsFA, '-b');
plot(afPotentialGammasFA, afTestFitsFANystrom, ':b');
set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')
title('test RSSs vs SURE risks for FA');
legend('test RSSs', 'SURE risks FA', 'SURE risks FA Nystrom', 'test fits FA', 'test fits FA Nystrom');
xlabel('gammas');
% savefig('../Figures/test RSSs vs SURE risks for FA')
hold off;

% -------------------------


figure(5)
surf(ffEstimatedProcessSUREFB)
hold on;
scatter3(iiTrainingInputLocationsIndexes(:,2), iiTrainingInputLocationsIndexes(:,1), afTrainingMeasurements, '*');
scatter3(iiTestInputLocationsIndexes(:,2), iiTestInputLocationsIndexes(:,1), afTestMeasurements, 'filled');
title('estimated process through FB + SURE')
% savefig('../Figures/estimated process through FB + SURE')
hold off;

figure(6)
surf(ffEstimatedProcessOracleFB)
hold on;
scatter3(iiTrainingInputLocationsIndexes(:,2), iiTrainingInputLocationsIndexes(:,1), afTrainingMeasurements, '*');
scatter3(iiTestInputLocationsIndexes(:,2), iiTestInputLocationsIndexes(:,1), afTestMeasurements, 'filled');
title('estimated process through FB + Oracle')
% savefig('../Figures/estimated process through FB + Oracle')
hold off;

figure(6)
surf(ffEstimatedProcessSUREFBNystrom)
hold on;
scatter3(iiTrainingInputLocationsIndexes(:,2), iiTrainingInputLocationsIndexes(:,1), afTrainingMeasurements, '*');
scatter3(iiTestInputLocationsIndexes(:,2), iiTestInputLocationsIndexes(:,1), afTestMeasurements, 'filled');
title('estimated process through FB + SURE + Nystrom')
% savefig('../Figures/estimated process through FB + SURE + Nystrom')
hold off;

figure(7)
plot(aiPotentialEs, aafSURERisksFB, '-r');
hold on;
plot(aiPotentialEs, aafTestRSSsFB, '--k');
plot(aiPotentialEs, aafTestRSSsFBNystrom, ':k');
plot(aiPotentialEs, aafTestFitsFB, '-b');
plot(aiPotentialEs, aafTestFitsFBNystrom, ':b');
hold off
set(gca, 'YScale', 'log');
% set(gca, 'ZScale', 'log');
title('SURE risks for FB');
% savefig('../Figures/SURE risks for FB');
xlabel('Es')
% ylabel('gammas')
% view(30,60);
hold off;
% 
% fEstimatedGammaSUREFA
% fEstimatedGammaOracleFA
% iEstimatedESUREFB
% iEstimatedEOracleFB
% fEstimatedGammaSUREFB
% fEstimatedGammaOracleFB

% --------------------

figure(8)
scatter(afRSSOracleFA, afRSSSureFA)
title('RSS oracle vs Sure FA');
axis equal;
% savefig('../Figures/RSS oracle vs Sure FA')

figure(9)
scatter(afRSSOracleFB, afRSSSureFB)
title('RSS oracle vs Sure FB');
axis equal;
% savefig('../Figures/RSS oracle vs Sure FB')

figure(10)
scatter(afRSSOracleFA, afRSSSureFANystrom)
title('RSS oracle vs Sure FA Nystrom');
axis equal;
% savefig('../Figures/RSS oracle vs Sure FA')

figure(11)
scatter(afRSSOracleFB, afRSSSureFBNystrom)
title('RSS oracle vs Sure FB Nystrom');
axis equal;
% savefig('../Figures/RSS oracle vs Sure FB')


