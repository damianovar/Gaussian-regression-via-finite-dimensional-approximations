function ComputeSystemMatrix( tComputer )
	%
	%
	if( tComputer.tInputDomain.iNumberOfDimensions > 1 )
		%
		error('Unsupported multidimensional kernels up to now :/\n');
		%
	end;%
	%
	%
	tComputer.aafSystemMatrix = zeros( tComputer.tInputDomain.iNumberOfInputLocations );
	%
	%
	for iFirstInputLocation = 1:tComputer.tInputDomain.iNumberOfInputLocations;
		%
		for iSecondInputLocation = 1:tComputer.tInputDomain.iNumberOfInputLocations;
			%
			tComputer.aafSystemMatrix( iFirstInputLocation, iSecondInputLocation ) =			...
					tComputer.tKernel.ffKernel( iFirstInputLocation, iSecondInputLocation )		...
				*	tComputer.tMeasure.ffDomainMeasure( iSecondInputLocation );
			%
		end;%
		%
	end;%
	%
end %

