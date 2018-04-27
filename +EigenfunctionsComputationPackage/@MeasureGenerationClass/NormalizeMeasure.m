function NormalizeMeasure( tGenerator )
	%
	%
	% integration by marginalization
	fSum = tGenerator.ffDomainMeasure;
	%
	for iDimension = 1:tGenerator.tInputDomain.iNumberOfDimensions;
		%
		fSum = sum( fSum );
		%
	end;%
	%
	%
	% actual normalization
	tGenerator.ffDomainMeasure = tGenerator.ffDomainMeasure / fSum;
	%
	%
end %
