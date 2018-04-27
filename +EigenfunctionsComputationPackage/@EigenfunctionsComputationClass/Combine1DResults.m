% algorithm
%
% - from the one dimensional eigenfunctions and eigenvalues compute the 2
%   dimensional ones
% - then from the 2 dimensional eigenfunctions compute the 4 dimensional kernel
%
function Combine1DResults( tComputer, t1DResults, tParameters )
	%
	%
	% basic settings
	tComputer.bPrintDebugInformation	= tParameters.bPrintDebugInformation;
	tComputer.strLabel					= 'multidimensional eigenfunctions computator';
	%
	%
	% input domain
	tComputer.tInputDomain = EigenfunctionsComputationPackage.InputDomainGenerationClass( tParameters );
	%
	%
	% measure
	tComputer.tMeasure = EigenfunctionsComputationPackage.MeasureGenerationClass(	...
							tComputer.tInputDomain,									...
							tParameters		);
	%
	%
	% eigenfunctions
	if(  tParameters.iInputDomainDimension == 2  )
		%
		[afEigenvalues, aiOriginalIndexesInDimension1, aiOriginalIndexesInDimension2] = ...
			tComputer.ComputeEigenvaluesOf2DEigenfunctions( t1DResults(1).afEigenvalues, t1DResults(2).afEigenvalues );
		%
		tComputer.afEigenvalues = afEigenvalues;
		%
		tComputer.iNumberOfEigenfunctions = numel( afEigenvalues );
		%
		% compute the actual eigenfunctions
		tComputer.Compute2DEigenfunctions(				...
					t1DResults(1).aafEigenfunctions,	...
					t1DResults(2).aafEigenfunctions,	...
					aiOriginalIndexesInDimension1,		...
					aiOriginalIndexesInDimension2		);
		%
		% remove the irrelevant ones
		tComputer.RemoveIrrelevantEigenfunctions( tParameters );
		%
		% then, in case, compute the kernel
		if( tParameters.bCompute2DKernels )
			%
			tComputer.Compute4DimensionalKernel();
			%
		else%
			%
			tComputer.tKernel = EigenfunctionsComputationPackage.KernelGenerationClass();
			tComputer.tKernel.tInputDomain	= tComputer.tInputDomain;
			tComputer.tKernel.ffKernel		= [];
			%
		end;%
		%
	else%
		%
		error('\n\n ');
		%
	end;%
	%
	%
	% orthonomalize the eigenfunctions
	tComputer.OrthonormalizeEigenfunctions();
	%
	%
	if( tComputer.bPrintDebugInformation )
		%
		tComputer.Print();
		tComputer.Plot();
		%
	end;%
	%
end %
