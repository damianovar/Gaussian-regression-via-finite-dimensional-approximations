% algorithm
%
% - from the one dimensional eigenfunctions and eigenvalues compute the 2
%   dimensional ones
% - then from the 2 dimensional eigenfunctions compute the 4 dimensional kernel
%
function Combine1DResults( tComputer, t1DResults, tParameters )
	%
	% basic settings
	tComputer.bPrintDebugInformation	= tParameters.bPrintDebugInformation;
	tComputer.strLabel					= 'multidimensional Nystrom basis computer';
	%
	% input domain
	tComputer.tInputDomain = EigenfunctionsComputationPackage.InputDomainGenerationClass( tParameters );
	%
	% measure
	tComputer.tMeasure = EigenfunctionsComputationPackage.MeasureGenerationClass(	...
							tComputer.tInputDomain,									...
							tParameters		);
	%
	% eigenfunctions
	if(  tParameters.iInputDomainDimension == 2  )
		%
		% compute the actual eigenfunctions
		tComputer.Compute2DEigenfunctions(				...
					t1DResults(1).aafBasisFunctions,	...
					t1DResults(2).aafBasisFunctions,	...
					aiOriginalIndexesInDimension1,		...
					aiOriginalIndexesInDimension2		);
		%
	else%
		%
		error('too high input domain dimensionality for now!\n\n');
		%
	end;%
	%
	if( tComputer.bPrintDebugInformation )
		%
		tComputer.Print();
		tComputer.Plot();
		%
	end;%
	%
end %
