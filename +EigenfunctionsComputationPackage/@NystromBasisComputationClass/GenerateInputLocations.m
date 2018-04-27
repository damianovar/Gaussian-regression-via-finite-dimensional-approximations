function GenerateInputLocations( tComputer )
	%
	% DEBUG
	fprintf('starting extracting the input locations...\n');
	%
	[ tComputer.ffInputLocations, tComputer.iiInputLocationsIndexes ] =	...
		tComputer.tMeasure.ExtractSamples( tComputer.iNumberOfInputLocations );
	%
	% DEBUG
	fprintf('extraction of the input locations done!\n');
	%
end % function

