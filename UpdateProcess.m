function [ ffNewProcess, afNewEigenfunctionsWeights ] = UpdateProcess( afOldEigenfunctionsWeights, tKernelParameters )
	%
	for iEigenfunction = 1:numel( afOldEigenfunctionsWeights )
		%
		fStDev = sqrt(		tKernelParameters.afEigenvalues(iEigenfunction)		...
						*	(1 - tKernelParameters.fTemporalDecay^2)			);
		%
		afNewEigenfunctionsWeights(iEigenfunction) =											...
				tKernelParameters.fTemporalDecay * afOldEigenfunctionsWeights(iEigenfunction)	...
			+	fStDev * randn();
		%
	end;%
	%
	ffNewProcess =											...
		GenerateSignalFromEigenfunctionsWeights(			...
			tKernelParameters,								...
			afNewEigenfunctionsWeights						);
	%
end %

