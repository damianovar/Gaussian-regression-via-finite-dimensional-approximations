% currently working through linear interpolation
%
% it is necessary to change the reference system for the sampling location
%
function fSampledSignal = SampleSignalAt(	afOriginalSignal,		...
											afOriginalSignalDomain,	...
											fSamplingLocation )
	%
	% make a change of reference system (from reals to indexes)
	fInterpolatedSampleIndex =												...
			ConvertSamplingLocationToSamplingIndex(	fSamplingLocation,		...
													afOriginalSignalDomain	);
	%
	% sample the signal at the requested (real) index
	fSampledSignal = InterpolateSignalAt(	fInterpolatedSampleIndex,	...
											afOriginalSignal			);
	%
end %
