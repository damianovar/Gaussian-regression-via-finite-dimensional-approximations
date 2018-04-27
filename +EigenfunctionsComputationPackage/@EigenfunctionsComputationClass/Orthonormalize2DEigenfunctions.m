function Orthonormalize2DEigenfunctions( tComputer )
	%
	%
	% storage allocation
	aaafOriginalEigenfunctions		= tComputer.ffEigenfunctions;
	aaafOrthonormalEigenfunctions	= zeros( size( aaafOriginalEigenfunctions ) );
	%
	%
	% actual normalization
	for iEigenfunction = 1:tComputer.iNumberOfEigenfunctions;
		%
% 		size(tComputer.ffEigenfunctions( :, iEigenfunction ))
% 		size(tComputer.ffDomainMeasure)
		%
		fCurrentEigenfunctionL2MuNorm =									...
			sum(sum														...
			(															...
					aaafOriginalEigenfunctions( :, :, iEigenfunction )	...
				.*	aaafOriginalEigenfunctions( :, :, iEigenfunction )	...
				.*	tComputer.tMeasure.ffDomainMeasure					...
			));
		%
		%
		aaafOrthonormalEigenfunctions( :, :, iEigenfunction ) =				...
				aaafOriginalEigenfunctions( :, :, iEigenfunction )			...
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
	tComputer.ffEigenfunctions = aaafOrthonormalEigenfunctions;
	%
	%
	% DEBUG
	fprintf('\n\nCheck eigenfunctions orthonormality:\n');
	for iEigenfunctionA = 1:4;
		for iEigenfunctionB = 1:4;
			%
			fCurrentL2MuInnerProduct =										...
				sum(sum														...
				(															...
						aaafOriginalEigenfunctions( :, :, iEigenfunctionA )	...
					.*	aaafOriginalEigenfunctions( :, :, iEigenfunctionB )	...
					.*	tComputer.tMeasure.ffDomainMeasure					...
				));
			%
			fprintf('<phi_%d , phi_%d> = %.3f\n', iEigenfunctionA, iEigenfunctionB, fCurrentL2MuInnerProduct);
			%
		end;%
	end;%
	fprintf('\n');
	%
	%
end %
