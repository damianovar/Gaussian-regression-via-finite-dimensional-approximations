function [ffX, afY] = Generate1DDataset()
	%
	tLoad = load('../MatFiles/1D.Kgaussian.Muniform.mat');
	tKernelParameters = tLoad.tKernelParameters;
	tKernelParameters.iNumberOfDimensions	= 1;
	tKernelParameters.sigma2				= 0.01;
	M										= 1000;
	%
	[ffTrueProcess, afTrueParameters] = GenerateTrueProcess( tKernelParameters );
	%
	ffTrueProcess = real(ffTrueProcess);
	%
	[ffX, ~, afY] = MeasureProcess( ffTrueProcess, M, tKernelParameters, [] );
	%
	% DEBUG
	figure(999);
	plot(tKernelParameters.afDomain, ffTrueProcess);
	hold on
	scatter( ffX, afY, 'b*' );
	%
end % function

