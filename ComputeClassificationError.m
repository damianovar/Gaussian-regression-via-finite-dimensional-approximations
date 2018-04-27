function fErrorInPercentage = ComputeClassificationError(afMeasured, afEstimated)
	%
	% make the things become "-1" and "+1" even if they are relative to regression things
	afMeasured( afMeasured >= 0 ) = +1;
	afMeasured( afMeasured <  0 ) = -1;
	%
	afEstimated( afEstimated >= 0 ) = +1;
	afEstimated( afEstimated <  0 ) = -1;
	%
	fErrorInPercentage = sum( (afMeasured .* afEstimated) < 0 ) / numel(afMeasured) * 100;
	%
end % function

