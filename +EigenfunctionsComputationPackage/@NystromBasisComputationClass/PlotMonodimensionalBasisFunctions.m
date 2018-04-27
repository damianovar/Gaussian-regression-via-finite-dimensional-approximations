function PlotMonodimensionalBasisFunctions( tComputer )
	%
	for iBasisFunction = 1:min(5,tComputer.iNumberOfBasisFunctions)
		%
		figure(300 + iBasisFunction)
		plot(	tComputer.tInputDomain.afXAxis,					...
				tComputer.ffBasisFunctions(:, iBasisFunction)	);
		title(sprintf('Basis function %d', iBasisFunction));
		%
	end;%
	%
end %
