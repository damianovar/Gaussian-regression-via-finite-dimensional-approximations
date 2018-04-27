% ALGORITHM
%
% this is a change of reference:
%
%  1              x       # of samples
%  |              |          |
%  ---------------------------
%  |              |          |
%  a            alpha        b
%
%  b - alpha     # of samples - x
% ----------- = ------------------
%    b - a       # of samples - 1
%
% =>
%
% x = #sample - (((b - alpha) / (b - a)) * (#sample - 1))
%
function fInterpolatedSampleIndex =											...
			ConvertSamplingLocationToSamplingIndex(	fSamplingLocation,		...
													afOriginalSignalDomain	)
	%
	%
	% for readability (see explainations above)
	iNumberOfSamples	= numel(afOriginalSignalDomain);
	fA					= afOriginalSignalDomain(1);
	fB					= afOriginalSignalDomain(iNumberOfSamples);
	fAlpha				= fSamplingLocation;
	%
	%
	fInterpolatedSampleIndex =	... 
		iNumberOfSamples 		...
		-	(					...
				(fB - fAlpha)	...
				/				...
				(fB - fA)		...
			)					...
			*					...
			(iNumberOfSamples - 1);
	%
	%
end	% function
