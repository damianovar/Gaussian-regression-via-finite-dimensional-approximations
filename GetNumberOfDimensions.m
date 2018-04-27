function iNumberOfDimensions = GetNumberOfDimensions( tKernelParameters )
	%
	if( isfield( tKernelParameters, 'aafEigenfunctions' ) )
		%
		iNumberOfDimensions = 1;
		%
	elseif( isfield( tKernelParameters, 'aaafEigenfunctions' ) )
		%
		iNumberOfDimensions = 2;
		%
	elseif( isfield( tKernelParameters, 'aaaafEigenfunctions' ) )
		%
		iNumberOfDimensions = 3;
		%
	else%
		%
		error('not supported input domain dimensionality')
		%
	end;%
	%
end %


