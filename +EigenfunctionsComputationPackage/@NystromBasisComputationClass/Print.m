function Print( tComputer )
	%
	fprintf( sprintf('%s\n', tComputer.strLabel) );
	%
	fprintf('Input domain dimensionality: %d\n', tComputer.tInputDomain.iNumberOfDimensions);
	fprintf('Number of input locations:   %d\n', tComputer.iNumberOfInputLocations);
	fprintf('input locations: \n');
	disp(tComputer.ffInputLocations);
	fprintf('input locations indexes: \n');
	disp(tComputer.iiInputLocationsIndexes);
	fprintf('number of basis functions: \n');
	disp(tComputer.iNumberOfBasisFunctions);
	fprintf('size and number of the basis functions: \n');
	disp(size(tComputer.ffBasisFunctions));
% 	fprintf('kernel matrix: \n');
% 	disp(tComputer.aafKernelMatrix);
% 	fprintf('approximated kernel matrix: \n');
% 	disp(tComputer.aafApproximatedKernelMatrix);
	%
end % function

