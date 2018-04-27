% -------------------------------------------------------------------------
% filepaths
%
addpath 'C:/Users/damiano/Dropbox/DistributedRegression/Matlab/MFiles/'
tParameters.strResultingMatFilesDirectory	= 'C:/Users/damiano/Dropbox/DistributedRegression/Matlab/MatFiles/';
tParameters.strResultingTxtFilesDirectory	= 'C:/Users/damiano/Dropbox/DistributedRegression/Matlab/MatFiles/';


% -------------------------------------------------------------------------
% input domain
tParameters.iInputDomainDimension	= 4;
%
switch tParameters.iInputDomainDimension
	case 1
	   	tParameters.cInputDomain	= { linspace(0, 1, 100) }; % 1D
	case 2
	   	tParameters.cInputDomain	= { linspace(0, 1, 20), linspace(0, 1, 20) }; % 2D
	otherwise
	   	tParameters.cInputDomain	= [];
end;


% -------------------------------------------------------------------------
% measure
%
tParameters.strMeasureKind = 'uniform'; % [ 'exponential' | 'gaussian' | 'uniform' ]
%
switch tParameters.iInputDomainDimension
	case 1 
		tParameters.cExponentialMeasureParameters		= { [5, 5] }; % 1D
	case 2 
		tParameters.cExponentialMeasureParameters		= { [0.4, 0.5], [0.3, 0.6] }; % 2D
	otherwise
		tParameters.cExponentialMeasureParameters		= [];
end;
%
switch tParameters.iInputDomainDimension
	case 1 
		tParameters.cGaussianMeasureParameters		= { { [0.5, 0.01, 1] } }; % 1D
	case 2 
		tParameters.cGaussianMeasureParameters		= { { [0.4, 0.6, 0.2], [0.3, 0.3, 0.7] }, { [0.4, 0.6, 0.2], [0.3, 0.3, 0.7] } }; % 2D
	otherwise
		tParameters.cGaussianMeasureParameters		= [];
end;%


% -------------------------------------------------------------------------
% kernel
%
% for a list of kernels, see:
% http://crsouza.blogspot.com/2010/03/kernel-functions-for-machine-learning.html
%
tParameters.strKernelKind		= 'gaussian'; % [ 'gaussian' | 'stablespline' | 'cubicspline' | 'laplacian' ]
tParameters.fGaussianKernelVariance					= 0.05;
tParameters.fLaplacianKernelScale					= 0.1;
tParameters.fStableSplineKernelExponentialDecay		= 1.0;
%
% flags for skipping the computation of multidimensional kernels
tParameters.bCompute2DKernels					= false;
tParameters.bCompute3DKernels					= false;


% -------------------------------------------------------------------------
% Nystrom method
tParameters.iNumberOfNystromInputLocations		= 1000;


% -------------------------------------------------------------------------
% decomposition accuracy
%
tParameters.fPercentageOfVarianceToBeCaptured		= 1 - 10^(-4);
tParameters.iMinimalNumberOfEigenfunctionsToBeSaved = 80;


% -------------------------------------------------------------------------
% recording of the output
%
tParameters.iNumberOfRealizations	= 5;
%
tParameters.iNumberOfSamplesPerDimensionWhenExportingTxtFiles = 20;
tParameters.bPrintDebugInformation	= true;
tParameters.bPlotDebugInformation	= true;
tParameters.bSaveResultingFiles		= true;
%
tParameters.bEnableMailAlert		= false;
tParameters.strEMailAddress			= 'TODO@TODO';
tParameters.strSmtpServer			= 'TODO';
tParameters.bSendFiguresViaMail		= false;
tParameters.bSendMatFilesViaMail	= false;

