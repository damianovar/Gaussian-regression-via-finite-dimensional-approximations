function Plot( tComputator )
	%
	switch( tComputator.tInputDomain.iNumberOfDimensions )
		%
		case 1
			tComputator.PlotMonodimensionalEigenfunctions();
		%
		case 2
			tComputator.PlotBidimensionalEigenfunctions();
		%
		otherwise
			fprintf('The dimensionality of the eigenfunctions is too high => I am not going to plot it.\n')
		%
	end;%
	%
end %
