function aafSampledKernel = BuildSampledKernelMatrix( iiInputLocationsIndexes, tKernelParameters )
	%
	M = numel( iiInputLocationsIndexes(:, 1) );
	%
	aafSampledKernel = zeros(M, M);
	%
	for m1 = 1:M;
	for m2 = 1:M;
		%
		aafSampledKernel(m1, m2) = SampleKernelAt( iiInputLocationsIndexes(m1), iiInputLocationsIndexes(m2), tKernelParameters );
		%
	end;%
	end;%
	%
end %

