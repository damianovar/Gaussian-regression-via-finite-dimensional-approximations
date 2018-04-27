function afExponential = GetMonodimensionalExponential( tGenerator, afAxis, varargin )
	%
	ffExponentialParameters = cell2mat(varargin{1});
	%
	% first exponential, for sure
	afExponential = exp( - afAxis * ffExponentialParameters(1) );
	%
	%
	% check if the varargin is composed by 2 scalars
	if( numel( ffExponentialParameters ) == 2 )
		%
		afFlippedExponential = exp( - afAxis * ffExponentialParameters(2) );
		afExponential = afExponential + fliplr( afFlippedExponential );
		%
	end;%
	%
end %
