function ffGeneratedSignal = GenerateSignalFromEigenfunctionsWeights(	...
									ffEigenfunctions,					...
									iNumberOfDimensions,				...
									afEigenfunctionsWeights)
	%
	% for readability
	iNumberOfEigenfunctions	= numel(afEigenfunctionsWeights);
	%
	switch( iNumberOfDimensions )
		%
		case 1
			%
			% initialization of the generated signal
			ffGeneratedSignal = zeros( size(ffEigenfunctions(:,1)) );
			%
			% calculation of the generated signal
			for iEigenfunction = 1:iNumberOfEigenfunctions;
				%
				ffGeneratedSignal =										...
					ffGeneratedSignal									...
					+	(	afEigenfunctionsWeights( iEigenfunction )	...
						*	ffEigenfunctions( :, iEigenfunction ) );
				%
			end;%
		%
		case 2
			%
			% initialization of the generated signal
			ffGeneratedSignal = zeros( size(ffEigenfunctions(:,:,1)) );
			%
			% calculation of the generated signal
			for iEigenfunction = 1:iNumberOfEigenfunctions;
				%
				ffGeneratedSignal =										...
					ffGeneratedSignal									...
					+	(	afEigenfunctionsWeights( iEigenfunction )	...
						*	ffEigenfunctions( :, :, iEigenfunction ) );
				%
			end;%
		%
		case 3
			%
			% initialization of the generated signal
			ffGeneratedSignal = zeros( size(ffEigenfunctions(:,:,:,1)) );
			%
			% calculation of the generated signal
			for iEigenfunction = 1:iNumberOfEigenfunctions;
				%
				ffGeneratedSignal =										...
					ffGeneratedSignal									...
					+	(	afEigenfunctionsWeights( iEigenfunction )	...
						*	ffEigenfunctions( :, :, :, iEigenfunction ) );
				%
			end;%
		%
		otherwise
			%
			error('dimensionality not yet supported');
	%
end % function
