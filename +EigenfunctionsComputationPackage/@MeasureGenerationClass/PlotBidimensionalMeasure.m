function PlotBidimensionalMeasure( tGenerator )
	%
	figure(2)
	surf(	tGenerator.tInputDomain.afYAxis,	...
			tGenerator.tInputDomain.afXAxis,	...
			tGenerator.ffDomainMeasure			);
	title('Measure');
	xlabel('Y domain axis');
	ylabel('X domain axis');
	%
end %
