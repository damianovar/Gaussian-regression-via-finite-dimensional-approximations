clc;
close all;
clear all;
import EigenfunctionsComputationPackage.*;


% load the parameters
E		= 20;
EA		= 20;
EB		= 0;
MM		= 500:100:5000;
maxMC	= 1000;
alpha	= 0.05;
sigma2	= 0.01;
afPotentialSigma2s = logspace(-10, 5, 50);
kernel	= '2D.Kgaussian.Muniform';
LoadAuxiliaryParameters;
LoadNetwork;


% storage allocation
afErrorInEstimatingSigma2 = zeros(maxMC, 1);


for M = MM;
	%
	for MCrun = 1:maxMC;
		%
		[ffTrueProcess, afTrueParameters] = GenerateTrueProcess( tKernelParameters );
		%
		[ffInputLocations, iiInputLocationsIndexes, afMeasurements] = MeasureProcess( ffTrueProcess, M, sigma2, tKernelParameters, atAgents );
		%
		[fEstimatedSigma2_CC, fEstimatedSigma2_DA] = EstimateHyperparameters( ffInputLocations, iiInputLocationsIndexes, afMeasurements, afPotentialSigma2s, EA, tKernelParameters );
		%
		afErrorInEstimatingSigma2(MCrun) = fEstimatedSigma2_CC - fEstimatedSigma2_DA;
		%
	end;% MCrun
	%
	figure(M)
	hist(afErrorInEstimatingSigma2, round(maxMC/10));
	xlabel('error')
	ylabel('frequency')
	%
end;% MM



% TODO
% do MC verification of the tighteness of the bounds
% 
% for iTime = 1:100;
% 	%
% 	[ ffTrueProcess, afTrueParameters ] = UpdateProcess( afTrueParameters, tKernelParameters );
% 	pause(0.1)
% 	PlotRealization( tKernelParameters, ffTrueProcess );
% 	%
% end;%

