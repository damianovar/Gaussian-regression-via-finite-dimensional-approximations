function PlotMonodimensionalMeasure( tGenerator )
	%
	figure(100)
	plot( tGenerator.tInputDomain.afXAxis, tGenerator.ffDomainMeasure );
	title('Measure');
	%
end %
