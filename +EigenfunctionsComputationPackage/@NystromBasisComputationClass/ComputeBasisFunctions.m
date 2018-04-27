function ComputeBasisFunctions( tComputer )
	%
	% DEBUG
	fprintf('started computing the Nystrom basis functions...\n');
	%
	% memo: tComputer.aafKernelMatrix = U * S * U'
	[U, S, V] = svd( tComputer.aafKernelMatrix );
	%
	% for readability
	E = tComputer.iNumberOfBasisFunctions;
	%
	switch tComputer.tInputDomain.iNumberOfDimensions
		%
		case 1
			% storage allocation
			tComputer.ffBasisFunctions = zeros( numel(tComputer.tKernel.ffKernel(:, 1)), E );
			%
			% cycle on the various basis functions
			for e = 1:E;
				%
				% cycle on the Nystrom input locations
				for n = 1:tComputer.iNumberOfInputLocations;
					%
					% for readability
					iInputLocationIndex = tComputer.iiInputLocationsIndexes(n);
					%
					tComputer.ffBasisFunctions(:, e) =								...
							tComputer.ffBasisFunctions(:, e)						...
						+	U(n,e) * tComputer.tKernel.ffKernel(:, iInputLocationIndex);
					%
				end;% cycle on the input locations
				%
				% save also the eigenvalues
				tComputer.afEigenvalues(e) = S(e, e);
				%
			end;% cycle on e
		%
		case 2
			% storage allocation
			tComputer.ffBasisFunctions = zeros(	numel(tComputer.tKernel.ffKernel(:, 1, 1, 1)), 		...
												numel(tComputer.tKernel.ffKernel(1, :, 1, 1)),	E	);
			%
			% cycle on the various basis functions
			for e = 1:E;
				%
				% cycle on the Nystrom input locations
				for n = 1:tComputer.iNumberOfInputLocations;
					%
					% for readability
					iInputLocationXIndex = tComputer.iiInputLocationsIndexes(n, 1);
					iInputLocationYIndex = tComputer.iiInputLocationsIndexes(n, 2);
					%
					tComputer.ffBasisFunctions(:, :, e) =							...
							tComputer.ffBasisFunctions(:, :, e)						...
						+	U(n,e) * squeeze(tComputer.tKernel.ffKernel(:, :, iInputLocationXIndex, iInputLocationYIndex));
					%
				end;% cycle on the input locations
				%
				% save also the eigenvalues
				tComputer.afEigenvalues(e) = S(e, e);
				%
			end;% cycle on e
		%
		otherwise
			%
			% cycle on the various basis functions
			for e = 1:E;
				%
				% save the eigenvalues
				tComputer.afEigenvalues(e) = S(e, e);
				%
			end;% cycle on e
		%
	end;% switch on the dimension of the input space
	%
	% in any case save the eigenvectors
	tComputer.aafEigenvectors = U;
	%
	% DEBUG
	fprintf('computation of the Nystrom basis functions and eigenvalues done!\n');
	%
end % function

