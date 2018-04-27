function fSampledBasisfunction = SampleBasisfunctionUsingNystrom( afInputLocation, e, tNystromComputer )
	%
	% initialization
	fSampledBasisfunction = 0;
	%
	% if e is larger than the number of eigenvalues in the Nystrom computer then return
	if( e > numel(tNystromComputer.afEigenvalues) )
		%
		return;
		%
	end;%
	%
	switch( tNystromComputer.strKernelType )
		%
		case 'gaussian'
			for n = 1:numel(tNystromComputer.ffInputLocations(:,1))
				fSampledBasisfunction = fSampledBasisfunction	...
					+ tNystromComputer.aafEigenvectors(n, e) * ...
					exp( -0.5 * (norm( afInputLocation - tNystromComputer.ffInputLocations(n, :) )^2) / tNystromComputer.fKernelVariance );
			end;% for n
		%
		case 'laplacian'
			for n = 1:numel(tNystromComputer.ffInputLocations(:,1))
				fSampledBasisfunction = fSampledBasisfunction	...
					+ tNystromComputer.aafEigenvectors(n, e) * ...
					exp( - (norm( afInputLocation - tNystromComputer.ffInputLocations(n, :) )) / tNystromComputer.fKernelVariance );
			end;% for n
		%
		otherwise
			error('unsupported kernel type')
		%
	end;% switch
   	%
end % function

