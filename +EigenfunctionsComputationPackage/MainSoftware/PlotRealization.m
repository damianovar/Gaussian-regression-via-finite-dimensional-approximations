function PlotRealization(	tInputDomain,	...
							ffRealization,	...
							iRealization	)
	%
	switch( tInputDomain.iNumberOfDimensions )
		%
		case 1
			%
			figure(500 + iRealization)
			plot( tInputDomain.afXAxis, ffRealization );
			title(sprintf('%d-th realization example', iRealization));
		%
		%
		case 2
			%
			figure(500 + iRealization)
			surf( tInputDomain.afXAxis', tInputDomain.afYAxis', ffRealization' );
			title(sprintf('%d-th realization example', iRealization));
		%
		%
		otherwise
			%
			error('not supported input domain dimensionality')
		%
	end;%
	%
end %
