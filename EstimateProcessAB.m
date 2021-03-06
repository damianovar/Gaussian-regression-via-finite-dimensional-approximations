function [	ffEstimatedProcess,					...
			afEstimatedCoefficients	]	=		...
				EstimateProcess(				...
					iiInputLocationsIndexes,	...
					afMeasurements,				...
					gamma,						...
					EA,							...
					EB,							...
					tKernelParameters			)
	%
	% computation of the auxiliary matrices
	GA		= ComputeG( iiInputLocationsIndexes, EA, tKernelParameters );
	G  		= ComputeG( iiInputLocationsIndexes, EA+EB, tKernelParameters );
	Lambda	= diag( tKernelParameters.afEigenvalues(1:(EA+EB)) );
	M		= numel( afMeasurements );
	sigma2	= tKernelParameters.sigma2;
	%
	afEstimatedCoefficients =									...
		inv (													...
				blkdiag( GA' * GA / M, eye( EB ) )				...
				+												...
				gamma * ( sigma2 / M ) * inv( Lambda )			...
			)													...
		*	(													...
				G' * afMeasurements / M							...
			);
	%
	ffEstimatedProcess =								...
		GenerateSignalFromEigenfunctionsWeights(		...
			tKernelParameters,							...
			afEstimatedCoefficients						);
	%
end %

