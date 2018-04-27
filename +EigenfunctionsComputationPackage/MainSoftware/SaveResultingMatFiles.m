tKernelParameters.strKernelKind		= tParameters.strKernelKind;
tKernelParameters.strMeasureKind	= tParameters.strMeasureKind;
%
tKernelParameters.afEigenvalues		= tComputer.afEigenvalues;
%
switch( tComputer.tInputDomain.iNumberOfDimensions )
	%
	case 1
		tKernelParameters.afDomain			= tComputer.tInputDomain.afXAxis;
		tKernelParameters.afMeasure			= tComputer.tMeasure.ffDomainMeasure;
		tKernelParameters.aafEigenfunctions	= tComputer.ffEigenfunctions;
		tKernelParameters.aafKernel			= tComputer.tKernel.ffKernel;
	%
	case 2
		tKernelParameters.afDomainXAxis			= tComputer.tInputDomain.afXAxis;
		tKernelParameters.afDomainYAxis			= tComputer.tInputDomain.afYAxis;
		tKernelParameters.aafMeasure			= tComputer.tMeasure.ffDomainMeasure;
		tKernelParameters.aaafEigenfunctions	= tComputer.ffEigenfunctions;
		tKernelParameters.aaaafKernel			= tComputer.tKernel.ffKernel;
	%
	otherwise
		%
		error('Dimensionality not yet supported!!');
	%
end;%
%
%
if( isfield(tParameters, 'fGaussianKernelVariance') )
	%
	tKernelParameters.tHyperparameters.fGaussianKernelVariance				= tParameters.fGaussianKernelVariance;
	%
end;%
%
if( isfield(tParameters, 'fLaplacianKernelScale') )
	%
	tKernelParameters.tHyperparameters.fLaplacianKernelScale				= tParameters.fLaplacianKernelScale;
	%
end;%
%
if( isfield(tParameters, 'fStableSplineKernelExponentialDecay') )
	%
	tKernelParameters.tHyperparameters.fStableSplineKernelExponentialDecay	= tParameters.fStableSplineKernelExponentialDecay;
	%
end;%


if( tParameters.bSaveResultingFiles )
	%
	strFilePath = sprintf( '%s.mat', tParameters.strMatFilesPrefix );
	%
	save(	strFilePath,			...
			'tKernelParameters',	...
			'-V6');
	%
	fprintf('\nThe mat-file containing the results has been saved in:\n\t %s.mat\n',	...
			tParameters.strMatFilesPrefix );
	%
	% cleaning
	clear strFilePath;
	%
else%
	%
	fprintf('\nResults have not been saved.\n\n');
	%
end;%
