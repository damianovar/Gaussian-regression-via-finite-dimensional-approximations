function PlotBidimensionalBasisFunctions( tComputer )
	%
	for iBasisFunction = 1:min(5,tComputer.iNumberOfBasisFunctions)
		%
		figure(300 + iBasisFunction)
		surf(	tComputer.tInputDomain.afYAxis,						...
				tComputer.tInputDomain.afXAxis,						...
				tComputer.ffBasisFunctions(:, :, iBasisFunction)	);
		title(sprintf('Basis function %d', iBasisFunction));
		xlabel('Y domain axis');
		ylabel('X domain axis');
		%
	end;%
	%
end %
