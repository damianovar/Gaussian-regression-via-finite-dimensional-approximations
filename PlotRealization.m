function PlotRealization(	tKernelParameters,	...
							ffRealization,		...
							ffInputLocations,	... optional
							afMeasurements,		... optional
							iFigureIndex		) % optional
	%
	if( nargin < 5 )
		%
		iFigureIndex = 500;
		%
	end;%
	%
	switch( tKernelParameters.iNumberOfDimensions )
		%
		case 1
			figure(iFigureIndex)
			plot( tKernelParameters.afDomain, ffRealization );
			hold on
			if( nargin == 3 )
				scatter( ffInputLocations, zeros( size( ffInputLocations ) ), 'x' );	
			end;%
			if( nargin > 3 )
				scatter( ffInputLocations, afMeasurements, 'filled' );	
			end;%
			axis([0, 1, -3, 3]);
			hold off
		%
		case 2
			figure(iFigureIndex)
			surf( tKernelParameters.afDomainXAxis', tKernelParameters.afDomainYAxis', ffRealization' );
			hold on
			if( nargin == 3 )
				scatter3( ffInputLocations(:, 1), ffInputLocations(:, 2), zeros( size( ffInputLocations(:, 1) ) ), 'x' );	
			end;%
			if( nargin > 3 )
				scatter3( ffInputLocations(:, 1), ffInputLocations(:, 2), afMeasurements, 'o' );	
			end;%
			axis([0, 1, 0, 1, -3, 3]);
			view(3)
			hold off
		%
		otherwise
			error('not supported input domain dimensionality')
		%
	end;%
	%
end %
