function PlotBidimensionalEigenfunctions( tComputer )
	%
	for iEigenfunction = 1:5
		%
		figure(300 + iEigenfunction)
		surf(	tComputer.tInputDomain.afYAxis,						...
				tComputer.tInputDomain.afXAxis,						...
				tComputer.ffEigenfunctions(:, :, iEigenfunction)	);
		title(sprintf('Eigenfunction %d', iEigenfunction));
		xlabel('Y domain axis');
		ylabel('X domain axis');
		%
	end;%
	%
end %
