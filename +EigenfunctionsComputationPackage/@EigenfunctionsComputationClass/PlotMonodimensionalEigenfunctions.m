function PlotMonodimensionalEigenfunctions( tComputer )
	%
	for iEigenfunction = 1:5
		%
		figure(300 + iEigenfunction)
		plot(	tComputer.tInputDomain.afXAxis,					...
				tComputer.ffEigenfunctions(:, iEigenfunction)	);
		title(sprintf('Eigenfunction %d', iEigenfunction));
		%
	end;%
	%
end %
