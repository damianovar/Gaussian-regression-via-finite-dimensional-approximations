function ffEstimatedSamples = GenerateSamplesFromBasisfunctionsWeights(	...
				tNystromComputer,										...
				afBasisfunctionsWeights,								...
				ffInputLocations										)
	%
	% for readability
	iNumberOfBasisfunctions	=								...
		min(	numel(tNystromComputer.afEigenvalues),		...
				numel(afBasisfunctionsWeights)				);
	%
	% in case there are some excess weights, remove them
	afBasisfunctionsWeights = afBasisfunctionsWeights(1:iNumberOfBasisfunctions);
	%
	for iSample = 1:numel(ffInputLocations(:,1))
		%
		for iBasisfunction = 1:iNumberOfBasisfunctions;
			%
			afSampledBasisfunctions(iBasisfunction) =	...
				SampleBasisfunctionUsingNystrom( ffInputLocations(iSample, :), iBasisfunction, tNystromComputer );
			%
		end;%
		%
		ffEstimatedSamples(iSample, 1) = afBasisfunctionsWeights' * afSampledBasisfunctions';
		%
	end;%
	%
end % function

