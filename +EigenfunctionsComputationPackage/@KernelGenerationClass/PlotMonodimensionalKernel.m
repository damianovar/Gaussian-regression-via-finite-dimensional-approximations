function PlotMonodimensionalKernel( tGenerator )
	%
	figure(200)
	surf(	tGenerator.tInputDomain.afXAxis,	...
			tGenerator.tInputDomain.afXAxis,	...
			tGenerator.ffKernel );
	title('Kernel');
	%
end %
