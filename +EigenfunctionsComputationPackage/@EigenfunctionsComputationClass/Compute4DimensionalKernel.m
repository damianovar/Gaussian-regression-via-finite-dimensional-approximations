function Compute4DimensionalKernel( tComputer )
	%
	% for readability
	iNumberOfEigenvalues = numel( tComputer.afEigenvalues );
	iNumberOfSamplesOfXAxis = numel( tComputer.tInputDomain.afXAxis );
	iNumberOfSamplesOfYAxis = numel( tComputer.tInputDomain.afYAxis );
	%
	% storage allocation
	aaaafKernel = zeros(	iNumberOfSamplesOfXAxis, iNumberOfSamplesOfYAxis,	...
							iNumberOfSamplesOfXAxis, iNumberOfSamplesOfYAxis	);
	%
	for iE = 1:iNumberOfEigenvalues;
		%
		for iX = 1:iNumberOfSamplesOfXAxis;
		for iY = 1:iNumberOfSamplesOfYAxis;
			%
			aaaafKernel(:, :, iX, iY) =							...
					aaaafKernel(:, :, iX, iY)					...
				+												...
					tComputer.afEigenvalues( iE )				...
				*	tComputer.ffEigenfunctions(  :,  :, iE )	...
				*	tComputer.ffEigenfunctions( iX, iY, iE );
			%
		end;%
		end;%
		%
		% DEBUG
		if( mod(iE, 10) == 0 )
			fprintf('processed component %d on %d\n', iE, iNumberOfEigenvalues);
		end;
		%
	end;% eigenfunction index
	%
	% save the results
	tComputer.tKernel = EigenfunctionsComputationPackage.KernelGenerationClass();
	tComputer.tKernel.tInputDomain	= tComputer.tInputDomain;
	tComputer.tKernel.ffKernel		= aaaafKernel;
	%
end %
