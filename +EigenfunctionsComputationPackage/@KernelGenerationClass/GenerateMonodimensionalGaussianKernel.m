function GenerateMonodimensionalGaussianKernel( tGenerator, fVariance )
	%
	%
	% for readability
	iNumberOfInputLocations = numel( tGenerator.tInputDomain.afXAxis );
	%
	% storage allocation
	tGenerator.ffKernel = zeros( iNumberOfInputLocations, iNumberOfInputLocations );
	%
	% cycle on the various couples of locations
	for iFirstInputLocationIndex = 1:iNumberOfInputLocations;
		%
		for iSecondInputLocationIndex = 1:iNumberOfInputLocations;
			%
			fFirstInputLocationValue	= tGenerator.tInputDomain.afXAxis( iFirstInputLocationIndex );
			fSecondInputLocationValue	= tGenerator.tInputDomain.afXAxis( iSecondInputLocationIndex );
			%
			tGenerator.ffKernel(	iFirstInputLocationIndex,							...
									iSecondInputLocationIndex )	=						...
				exp																		...
				(																		...
					-	0.5																...
					*	(( fFirstInputLocationValue - fSecondInputLocationValue )^2)	...
					/	fVariance														...
				);
			%
		end;%
		%
	end;%
	%
end %
