tNystromParameters.strKernelKind	= tParameters.strKernelKind;
tNystromParameters.strMeasureKind	= tParameters.strMeasureKind;
%
switch( tNystromComputer.tInputDomain.iNumberOfDimensions )
	%
	case 1
		tNystromParameters.afDomain				= tNystromComputer.tInputDomain.afXAxis;
		tNystromParameters.afMeasure			= tNystromComputer.tMeasure.ffDomainMeasure;
		tNystromParameters.afEigenvalues		= tNystromComputer.afEigenvalues;
		tNystromParameters.aafBasisFunctions	= tNystromComputer.ffBasisFunctions;
		tNystromParameters.aafKernel			= tNystromComputer.tKernel.ffKernel;
	%
	case 2
		tNystromParameters.afDomainXAxis		= tNystromComputer.tInputDomain.afXAxis;
		tNystromParameters.afDomainYAxis		= tNystromComputer.tInputDomain.afYAxis;
		tNystromParameters.aafMeasure			= tNystromComputer.tMeasure.ffDomainMeasure;
		tNystromParameters.afEigenvalues		= tNystromComputer.afEigenvalues;
		tNystromParameters.aaafBasisFunctions	= tNystromComputer.ffBasisFunctions;
		tNystromParameters.aaaafKernel			= tNystromComputer.tKernel.ffKernel;
	%
	otherwise
		tNystromParameters.afDomain				= [];
		tNystromParameters.iNumberOfDimensions 	= tNystromComputer.tInputDomain.iNumberOfDimensions;
		tNystromParameters.afMeasure			= [];
		tNystromParameters.afEigenvalues		= tNystromComputer.afEigenvalues;
		tNystromParameters.aafBasisFunctions	= [];
		tNystromParameters.fKernelVariance		= tParameters.fGaussianKernelVariance;
		tNystromParameters.aafEigenvectors		= tNystromComputer.aafEigenvectors;
		tNystromParameters.ffInputLocations		= tNystromComputer.ffInputLocations; 
	%
end;%


if( tParameters.bSaveResultingFiles )
	%
	strFilePath = sprintf( '%s.mat', tParameters.strNystromMatFilesPrefix );
	%
	save(	strFilePath,			...
			'tNystromParameters',	...
			'-V6');
	%
	fprintf('\nThe mat-file containing the Nystrom results has been saved in:\n\t %s.mat\n',	...
			tParameters.strNystromMatFilesPrefix );
	%
	% cleaning
	clear strFilePath;
	%
else%
	%
	fprintf('\nResults have not been saved.\n\n');
	%
end;%

