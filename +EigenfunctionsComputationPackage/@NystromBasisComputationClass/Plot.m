function Plot( tComputer )
	%
	switch( tComputer.tInputDomain.iNumberOfDimensions )
		%
		case 1
			tComputer.PlotMonodimensionalBasisFunctions();
		%
		case 2
			tComputer.PlotBidimensionalBasisFunctions();
		%
		otherwise
			fprintf('The dimensionality of the basis functions is too high => I am not going to plot them.\n')
		%
	end;%
	%
end %
