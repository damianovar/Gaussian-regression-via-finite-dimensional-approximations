function afOutput = GetMonodimensionalGaussian( tGenerator, afAxis, varargin )
	%
	iNumberOfGaussians = numel(varargin{1});
	%
	% storage allocation
	afOutput = zeros( size(afAxis) );
	%
	for iGaussianIndex = 1:iNumberOfGaussians;
		%
		afParameters = cell2mat(varargin{1}{iGaussianIndex});
		%
		fMean		= afParameters(1);
		fVariance	= afParameters(2);
		fWeight		= afParameters(3);
		%
		afOutput =													...
				afOutput											...
			+		fWeight											...
				*	( 1 / sqrt(2 * pi * fVariance) )				...
				*	exp												...
					(												...
						-0.5 * (( afAxis - fMean ).^2) / fVariance	...
					);
		%
	end;%
	%
end %
