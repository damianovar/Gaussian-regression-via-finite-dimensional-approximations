function fSampledKernel = SampleKernelAt( iiInputLocationsIndexesA, iiInputLocationsIndexesB, tKernelParameters )
	%
	% initialization
	fSampledKernel = 0;
	%
	for e = 1:numel(tKernelParameters.afEigenvalues);
		%
		switch( tKernelParameters.iNumberOfDimensions )
			%
			case 1
				fSampledKernel = fSampledKernel +							...
						tKernelParameters.afEigenvalues(e)					...
					*	SampleSignalAt(										...
							iiInputLocationsIndexesA,						...
							tKernelParameters.aafEigenfunctions(:, e)	)	...
					*	SampleSignalAt(										...
							iiInputLocationsIndexesB,						...
							tKernelParameters.aafEigenfunctions(:, e)		);
			%
			case 2
				fSampledKernel = fSampledKernel +										...
						tKernelParameters.afEigenvalues(e)								...
					*	SampleSignalAt(													...
							iiInputLocationsIndexesA,									...
							squeeze(tKernelParameters.aaafEigenfunctions(:, :, e)) )	...
					*	SampleSignalAt(													...
							iiInputLocationsIndexesB,									...
							squeeze(tKernelParameters.aaafEigenfunctions(:, :, e)) );
			%
			otherwise
				error('not supported input domain dimensionality')
			%
		end;% switch
		%
	end;% cycle on the eigenfunctions
	%
end %
