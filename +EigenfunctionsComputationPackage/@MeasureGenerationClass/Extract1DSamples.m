function [ afSamples, aiSamplesIndexes ] = Extract1DSamples( tGenerator, iNumberOfSamples )
	%
	afSamplesFromUniform	= rand(iNumberOfSamples, 1);
	aiSamplesIndexes		= zeros(iNumberOfSamples, 1);
	%
	for iSample = 1:iNumberOfSamples;
		%
		aiSamplesIndexes(iSample) = find( afSamplesFromUniform(iSample) <= tGenerator.tInputDomain.afXAxis, 1, 'first' );
		%
	end;%
	%
	afSamples = tGenerator.tInputDomain.afXAxis( aiSamplesIndexes );
	%
	% force the outputs to be vectors
	afSamples			= afSamples(:);
	aiSamplesIndexes	= aiSamplesIndexes(:);
	%
end % function

