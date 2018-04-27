function GenerateBidimensionalGaussianKernel( tGenerator, fVariance )
	%
	% for readability
	iNumberOfXInputLocations = numel( tGenerator.tInputDomain.afXAxis );
	iNumberOfYInputLocations = numel( tGenerator.tInputDomain.afYAxis );
	%
	% storage allocation
	tGenerator.ffKernel = zeros(	iNumberOfXInputLocations, iNumberOfYInputLocations,	...
									iNumberOfXInputLocations, iNumberOfYInputLocations	);
	%
	% cycle on the various couples of locations
	for iFirstXInputLocationIndex = 1:iNumberOfXInputLocations;
	for iFirstYInputLocationIndex = 1:iNumberOfYInputLocations;
		%
		for iSecondXInputLocationIndex = 1:iNumberOfXInputLocations;
		for iSecondYInputLocationIndex = 1:iNumberOfYInputLocations;
			%
			fFirstXInputLocationValue	= tGenerator.tInputDomain.afXAxis( iFirstXInputLocationIndex );
			fFirstYInputLocationValue	= tGenerator.tInputDomain.afYAxis( iFirstYInputLocationIndex );
			%
			fSecondXInputLocationValue	= tGenerator.tInputDomain.afXAxis( iSecondXInputLocationIndex );
			fSecondYInputLocationValue	= tGenerator.tInputDomain.afYAxis( iSecondYInputLocationIndex );
			%
			% for readability
			a = [ fFirstXInputLocationValue; fFirstYInputLocationValue ];
			b = [ fSecondXInputLocationValue; fSecondYInputLocationValue ];
			%
			tGenerator.ffKernel(	iFirstXInputLocationIndex,	iFirstYInputLocationIndex,			...
									iSecondXInputLocationIndex,	iSecondYInputLocationIndex	)	=	...
				exp								...
				(								...
					-	0.5 * (norm( a - b )^2)	...
					/	fVariance				...
				);
			%
		end;%
		end;% cycle on second input location
		%
	end;%
	end;% cycle on first input location
	%
end % function

