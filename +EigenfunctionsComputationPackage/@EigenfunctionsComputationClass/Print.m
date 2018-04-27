function Print( tComputator )
	%
	fprintf( sprintf('%s\n', tComputator.strLabel) );
	%
	fprintf('Input domain dimensionality:       %d\n', tComputator.tInputDomain.iNumberOfDimensions );
	fprintf('Number of selected eigenfunctions: %d\n', numel(tComputator.afEigenvalues));
	fprintf('Eigenvalues: \n');
	disp(tComputator.afEigenvalues);
	%
end %
