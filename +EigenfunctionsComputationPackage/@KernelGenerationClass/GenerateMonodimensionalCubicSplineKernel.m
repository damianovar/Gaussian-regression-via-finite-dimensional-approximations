% kernel latex formulae:
% - cubic splines:   K( s, t ) = W( s, t )
% - stable splines:  K( s, t, \beta ) = W( e^{-\beta s}, e^{-\beta t} )
%
% where:
%   W( s, t ) =
%   | (s^2 / 2) * (t - (s/3))   if s <= t
%   | (t^2 / 2) * (s - (t/3))   if s >  t
%
% NOTE: when computing K(s,t) we will have to check if s > t and then set
% sMax = s, sMin = t (or viceversa); if not we will have errors
%
%
function GenerateMonodimensionalCubicSplineKernel( tGenerator )
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
			fMax = max(fFirstInputLocationValue, fSecondInputLocationValue);
			fMin = min(fFirstInputLocationValue, fSecondInputLocationValue);
			%
			tGenerator.ffKernel(	iFirstInputLocationIndex,		...
									iSecondInputLocationIndex )	=	...
				( fMin^2 )											...
				*													...
				( fMax - (fMin / 3) )								...
				/													...
				2;
			%
		end;%
		%
	end;%
	%
end %
