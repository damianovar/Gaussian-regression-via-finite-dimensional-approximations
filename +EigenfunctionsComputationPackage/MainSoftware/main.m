% cleaning
clear;
clear classes;
clear all;
close all;
clc;
tParameters.bSomeErrorOccurred = false; % for debug purposes


LoadParameters;
CompleteParameters; % this performs operations that the user shouldn't touch


% ----------------------------------------------------
% GENERATION OF THE INFORMATION FOR THE EIGENFUNCTIONS
% AS LOOK UP TABLES
% 
% steps:
%
% 1) generate the input domain
% 2) generate the measure
% 3) if ( dimensionality is 1 ) then
%       3.a) generate the kernel
%       3.b) generate the eigenfunctions and eigenvalues
%    else
%       3.a) generate a temporary 1D-kernel
%       3.b) generate the temporary 1D-eigenfunctions and eigenvalues
%       3.c) combine the 1D-eigenfunctions and eigenvalues to find 
% 5) export the results
%
% switch depending on the dimensionality
if( tParameters.iInputDomainDimension == 1 )
	%
	% create the input domain
	tInputDomain = EigenfunctionsComputationPackage.InputDomainGenerationClass( tParameters );
	%
	% create the measure
	tMeasure = EigenfunctionsComputationPackage.MeasureGenerationClass(	...
					tInputDomain,										...
					tParameters		);
	%
	% create the 1D kernel
	tKernel = EigenfunctionsComputationPackage.KernelGenerationClass(	...
					tInputDomain,										...
					tParameters		);
	%
	% create the 1D eigenfunctions and eigenvalues
	tComputer = EigenfunctionsComputationPackage.EigenfunctionsComputationClass(	...
					tInputDomain,													...
					tMeasure,														...
					tKernel,														...
					tParameters	);
	%
elseif( tParameters.iInputDomainDimension == 2 )
	%
	% for each dimension compute the corresponding eigenfunctions
	for iDimension = 1:tParameters.iInputDomainDimension;
		%
		% get the correct parameters
		t1DParameters = GetParametersOfDimension( iDimension, tParameters );
		%
		% create the input domain relative to that specific dimension
		t1DInputDomain = EigenfunctionsComputationPackage.InputDomainGenerationClass( t1DParameters );
		%
		% create the measure relative to that specific dimension
		t1DMeasure = EigenfunctionsComputationPackage.MeasureGenerationClass(	...
						t1DInputDomain,											...
						t1DParameters		);
		%
		% create the 1D kernel
		t1DKernel		= EigenfunctionsComputationPackage.KernelGenerationClass(	...
							t1DInputDomain,											...
							t1DParameters		);
		%
		% create the eigenfunctions and eigenvalues relative to this dimension
		t1DComputer = EigenfunctionsComputationPackage.EigenfunctionsComputationClass(	...
						t1DInputDomain,													...
						t1DMeasure,														...
						t1DKernel,														...
						t1DParameters	);
		%
		% save the important 1D results
		t1DResults(iDimension).aafEigenfunctions		= t1DComputer.ffEigenfunctions;
		t1DResults(iDimension).afEigenvalues			= t1DComputer.afEigenvalues;
		t1DResults(iDimension).iNumberOfEigenfunctions	= t1DComputer.iNumberOfEigenfunctions;
		%
		% cleaning the memory, just to be sure
		clear t1DComputer;
		clear t1DInputDomain;
		clear t1DMeasure;
		clear t1DKernel;
		clear t1DParameters;
		%
	end;%
	%
	% combine the 1D results so to get the 2D results
	tComputer = EigenfunctionsComputationPackage.EigenfunctionsComputationClass();
	tComputer.Combine1DResults( t1DResults, tParameters );
	%
end;%


% ----------------------------------------------------
% GENERATION OF THE INFORMATION FOR THE EIGENFUNCTIONS
% COMPUTED USING THE NYSTROM METHOD
% 
% steps:
%
% 1) generate the input domain
% 2) generate the measure
% 3) generate the kernel
% 4) generate the object implementing the Nystrom algorithm

% creation of the input domain
tInputDomain = EigenfunctionsComputationPackage.InputDomainGenerationClass( tParameters );

% creation of the measure
tMeasure = EigenfunctionsComputationPackage.MeasureGenerationClass(	...
				tInputDomain,										...
				tParameters		);

% creation of the kernel
tKernel = EigenfunctionsComputationPackage.KernelGenerationClass(	...
				tInputDomain,										...
				tParameters		);

% creation of the object that will implement the Nystrom algorithm
tNystromComputer = EigenfunctionsComputationPackage.NystromBasisComputationClass(	...
				tInputDomain,														...
				tMeasure,															...
				tKernel,															...
				tParameters	);

% ----------------------------------------------------
% results
%
% steps:
%
% 1) in any case export the Nystrom computer
% 2) export the LUT only if the input domain dimension is small enough
%
ExportNystromResults;
%
if( tParameters.iInputDomainDimension <= 2 )
	%
	ExportResults;
	GenerateRealization;
	SendMailAlert;
	%
else%
	%
	warning('nothing has been exported for the closed form eigenfunctions, since the input domain dimension was too high')
	%
end;%

% close all;
