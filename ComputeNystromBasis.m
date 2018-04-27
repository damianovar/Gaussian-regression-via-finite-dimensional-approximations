% generate the input locations
switch astrNystromGenerationMethod
	%
	case 'random'
		tNystromComputer.ffInputLocations = rand( iNumberOfSamplesForNystrom, tNystromComputer.iNumberOfDimensions );
	%
	case 'training-set'
		tNystromComputer.ffInputLocations = ffXTraining;
	%
	case 'whole-dataset'
		tNystromComputer.ffInputLocations = [ffXTraining; ffXTest];
	%
	otherwise
		error('wrong Nystrom generation method')
	%
end;%
%
% in case, trim the number of samples
if(	iNumberOfSamplesForNystrom > 0	&&	...
   	iNumberOfSamplesForNystrom < numel( tNystromComputer.ffInputLocations(:,1) ) )
	%
	aiPermutations = randperm(iNumberOfSamplesForNystrom);
	aiSamples = aiPermutations(1:iNumberOfSamplesForNystrom);
	tNystromComputer.ffInputLocations = tNystromComputer.ffInputLocations(aiSamples,:);
	%
end;%
%
iNumberOfSamplesForNystrom = numel( tNystromComputer.ffInputLocations(:,1) );


% compute the kernel matrix
for i = 1:iNumberOfSamplesForNystrom;
for j = 1:iNumberOfSamplesForNystrom;
	%
	switch( tNystromComputer.strKernelType )
		%
		case 'gaussian'
			tNystromComputer.aafKernelMatrix( i, j ) = exp( -0.5 * (norm( tNystromComputer.ffInputLocations(i, :) - tNystromComputer.ffInputLocations(j, :) )^2) / tNystromComputer.fKernelVariance );
		%
		case 'laplacian'
			tNystromComputer.aafKernelMatrix( i, j ) = exp( - (norm( tNystromComputer.ffInputLocations(i, :) - tNystromComputer.ffInputLocations(j, :) )) / tNystromComputer.fKernelVariance );
		%
		otherwise
			error('unsupported kernel type');
		%
	end;%
	%
end;%
end;%

% perform the SVD and save the meaningful things
[U, S, V] = svd( tNystromComputer.aafKernelMatrix );
tNystromComputer.afEigenvalues = diag(S);
tNystromComputer.aafEigenvectors = U;

% compute the expected G'G/M
G = ComputeG( tNystromComputer.ffInputLocations, numel(tNystromComputer.ffInputLocations(:,1)), tNystromComputer );
tNystromComputer.aafExpectedGGM = G' * G / numel(tNystromComputer.ffInputLocations(:,1));

% DEBUG
fprintf('finished evaluating the kernel matrix of the Nystrom computer\n');
