function k = GetEigenfunctionsBound( tKernelParameters )
	%
	switch( tKernelParameters.iNumberOfDimensions )
		%
		case 1
			k = max( max( tKernelParameters.aafEigenfunctions ) );
		% 
		case 2
			k = max( max( max( tKernelParameters.aaafEigenfunctions ) ) );
		% 
		case 3
			k = max( max( max( max( tKernelParameters.aaaafEigenfunctions ) ) ) );
		%
		otherwise
			error('not supported input domain dimensionality')
		%
	end;%
	%
end %


