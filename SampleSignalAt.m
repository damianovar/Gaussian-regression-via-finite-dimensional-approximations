function ffSampledSignal = SampleSignalAt(	iiInputLocationsIndexes,	...
											ffOriginalSignal			)
	%
	iNumberOfDimensions = numel( iiInputLocationsIndexes );
	%
	switch( iNumberOfDimensions )
		%
		case 1
			ffSampledSignal = ffOriginalSignal( iiInputLocationsIndexes );
		%
		case 2
			ffSampledSignal = ffOriginalSignal( iiInputLocationsIndexes(1), iiInputLocationsIndexes(2) );
			%
		otherwise
			error('not supported input domain dimensionality')
		%
	end;%
	%
	%
end %
