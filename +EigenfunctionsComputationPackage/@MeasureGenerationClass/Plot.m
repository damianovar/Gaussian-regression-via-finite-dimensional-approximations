function Plot( tGenerator )
	%
	%
	switch( tGenerator.tInputDomain.iNumberOfDimensions )
		%
		case 1
			tGenerator.PlotMonodimensionalMeasure();
		%
		case 2
			tGenerator.PlotBidimensionalMeasure();
		%
		otherwise
			fprintf('The dimensionality of the measure is too high => I am not going to plot it.\n')
		%
	end;%
	%
end %
