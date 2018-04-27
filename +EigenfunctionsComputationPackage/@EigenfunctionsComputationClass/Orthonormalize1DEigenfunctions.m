function Orthonormalize1DEigenfunctions( tComputer )
	%
	%
	% storage allocation
	aafOrthonormalEigenfunctions = zeros( size(tComputer.ffEigenfunctions) );
	%
	%
	% actual normalization
	for iEigenfunction = 1:tComputer.iNumberOfEigenfunctions;
		%
% 		size(tComputer.ffEigenfunctions( :, iEigenfunction ))
% 		size(tComputer.ffDomainMeasure)
		%
		fCurrentEigenfunctionL2MuNorm =									...
			sum															...
			(															...
					tComputer.ffEigenfunctions( :, iEigenfunction )	...
				.*	tComputer.ffEigenfunctions( :, iEigenfunction )	...
				.*	tComputer.tMeasure.ffDomainMeasure'				...
			);
		%
		%
		aafOrthonormalEigenfunctions( :, iEigenfunction ) =				...
				tComputer.ffEigenfunctions( :, iEigenfunction )		...
			./	sqrt( fCurrentEigenfunctionL2MuNorm );
		%
		%
		% DEBUG
		fprintf('Unnormalized eigenfunction %d: L2_mu norm = %.5f\n', iEigenfunction, fCurrentEigenfunctionL2MuNorm);
		%
	end;%
	%
	%
	% save the results
	tComputer.ffEigenfunctions = aafOrthonormalEigenfunctions;
	%
	%
	% DEBUG
	fprintf('\n\nCheck eigenfunctions orthonormality:\n');
	for iEigenfunctionA = 1:4;
		for iEigenfunctionB = 1:4;
			%
			fCurrentL2MuInnerProduct =										...
				sum															...
				(															...
						tComputer.ffEigenfunctions( :, iEigenfunctionA )	...
					.*	tComputer.ffEigenfunctions( :, iEigenfunctionB )	...
					.*	tComputer.tMeasure.ffDomainMeasure'				...
				);
			%
			fprintf('<phi_%d , phi_%d> = %.3f\n', iEigenfunctionA, iEigenfunctionB, fCurrentL2MuInnerProduct);
			%
		end;%
	end;%
	fprintf('\n');
	%
	%
end %
