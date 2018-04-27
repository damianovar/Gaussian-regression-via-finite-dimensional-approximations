function ffGeneratedSignal = GenerateSignalFromEigenfunctionsWeights(	...
									tKernelParameters,					...
									afEigenfunctionsWeights				)
	%
	% for readability
	iNumberOfEigenfunctions	=								...
		min(	numel(tKernelParameters.afEigenvalues),		...
				numel(afEigenfunctionsWeights)				);
	%
	switch( tKernelParameters.iNumberOfDimensions )
		%
		case 1
			%
			% initialization of the generated signal
			ffGeneratedSignal = zeros( size(tKernelParameters.aafEigenfunctions(:,1)) );
			%
			% calculation of the generated signal
			for iEigenfunction = 1:iNumberOfEigenfunctions;
				%
				ffGeneratedSignal =										...
					ffGeneratedSignal									...
					+	(	afEigenfunctionsWeights( iEigenfunction )	...
						*	tKernelParameters.aafEigenfunctions( :, iEigenfunction ) );
				%
			end;%
		%
		case 2
			%
			% initialization of the generated signal
			ffGeneratedSignal = zeros( size(tKernelParameters.aaafEigenfunctions(:,:,1)) );
			%
			% calculation of the generated signal
			for iEigenfunction = 1:iNumberOfEigenfunctions;
				%
				ffGeneratedSignal =										...
					ffGeneratedSignal									...
					+	(	afEigenfunctionsWeights( iEigenfunction )	...
						*	tKernelParameters.aaafEigenfunctions( :, :, iEigenfunction ) );
				%
			end;%
		%
		otherwise
			%
			error('dimensionality not yet supported');
		%
	end;% switch
	%
end % function

