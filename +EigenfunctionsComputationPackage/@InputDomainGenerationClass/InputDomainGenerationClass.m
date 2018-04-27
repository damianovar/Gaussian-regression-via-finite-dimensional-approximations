classdef InputDomainGenerationClass < handle
	%
	% ---------------------------------------------------------------------
	properties
		%
		bPrintDebugInformation;
		strLabel;
		%
		iNumberOfDimensions;
		iNumberOfInputLocations;
		%
		afXAxis;
		afYAxis;
		afZAxis;
		%
		bSomeErrorOccurred;
		%
	end %
	%
	%
	% ---------------------------------------------------------------------
	methods
		%
		% standard constructor
		function tDomain = InputDomainGenerationClass( tParameters )
			%
			% -------------------------------------------------------------
			% initialization
			tDomain.bPrintDebugInformation	= tParameters.bPrintDebugInformation;
			tDomain.strLabel				= 'standard input domain';
			tDomain.bSomeErrorOccurred		= false;
			%
			%
			% -------------------------------------------------------------
			% actual computation
			switch( tParameters.iInputDomainDimension )
				%
				case 1
					tDomain.iNumberOfDimensions = 1;
					tDomain.afXAxis = tParameters.cInputDomain{1};
					%
					tDomain.iNumberOfInputLocations = numel( tDomain.afXAxis );
				%
				case 2
					tDomain.iNumberOfDimensions = 2;
					tDomain.afXAxis = tParameters.cInputDomain{1};
					tDomain.afYAxis = tParameters.cInputDomain{2};
					%
					tDomain.iNumberOfInputLocations =		numel( tDomain.afXAxis )	...
														*	numel( tDomain.afYAxis );
				%
				case 3
					tDomain.iNumberOfDimensions = 3;
					tDomain.afXAxis = tParameters.cInputDomain{1};
					tDomain.afYAxis = tParameters.cInputDomain{2};
					tDomain.afZAxis = tParameters.cInputDomain{3};
					%
					tDomain.iNumberOfInputLocations =		numel( tDomain.afXAxis )	...
														*	numel( tDomain.afYAxis )	...
														*	numel( tDomain.afZAxis );
				%
				otherwise
					tDomain.iNumberOfInputLocations	= 0;
					tDomain.iNumberOfDimensions		= tParameters.iInputDomainDimension;
					% in this case for now the measure is assumed uniform
				%
			end;%
			%
			%
		end %
		%
		%
	end %
	%
	%
end %
