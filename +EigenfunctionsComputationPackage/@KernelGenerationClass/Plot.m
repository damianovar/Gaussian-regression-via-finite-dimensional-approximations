function Plot( tGenerator )
	%
	switch( tGenerator.tInputDomain.iNumberOfDimensions )
		%
		case 1
			tGenerator.PlotMonodimensionalKernel();
		%
		otherwise
			fprintf('The dimensionality of the kernel is too high => I am not going to plot it.\n')
		%
	end;%
	%
end %
