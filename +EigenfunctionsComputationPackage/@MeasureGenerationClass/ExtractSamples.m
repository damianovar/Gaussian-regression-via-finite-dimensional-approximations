function [ ffSamples, iiSamplesIndexes ] = ExtractSamples( tGenerator, iNumberOfSamples )
	%
	switch( tGenerator.tInputDomain.iNumberOfDimensions )
		%
		case 1
			[ ffSamples, iiSamplesIndexes ] = tGenerator.Extract1DSamples( iNumberOfSamples );
		%
		case 2
			[ ffSamples, iiSamplesIndexes ] = tGenerator.Extract2DSamples( iNumberOfSamples );
		%
		otherwise
			% in this case it is going to be 
			ffSamples = rand( iNumberOfSamples, tGenerator.tInputDomain.iNumberOfDimensions );
			iiSamplesIndexes = 1:iNumberOfSamples;
		%
	end;%
	%
end % function

