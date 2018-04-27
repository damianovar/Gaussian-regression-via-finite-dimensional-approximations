function [ aafSamples, aaiSamplesIndexes ] = Extract2DSamples( tGenerator, iNumberOfSamples )
	%
	[ afSamplesOnX, aiSamplesIndexesOnX ] = tGenerator.Extract1DSamples( iNumberOfSamples );
	[ afSamplesOnY, aiSamplesIndexesOnY ] = tGenerator.Extract1DSamples( iNumberOfSamples );
	%
	aafSamples			= [ afSamplesOnX, afSamplesOnY ];
	aaiSamplesIndexes	= [ aiSamplesIndexesOnX, aiSamplesIndexesOnY ];
	%
end % function

