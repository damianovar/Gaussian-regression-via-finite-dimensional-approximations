% usage examples:
%
%
% monodimensional domain:
% GenerateExponentialMeasure( {0.4} )
% GenerateExponentialMeasure( {0.4, 0.3} )
%
% bidimensional domain:
% GenerateExponentialMeasure( {0.4}, {0.3, 0.5} )
% GenerateExponentialMeasure( {0.4, 0.3} )
%
% tridimensional domain as before, with one cell more
%
%
% possible structures of the various cells:
%
% {a}      -> single exponential, starting from the first location
% {a, b}   -> double exponential: one starting from the first
%             location, and one starting frome the last location
%
%
function GenerateExponentialMeasure( tGenerator, varargin )
	%
	%
	if( tGenerator.tInputDomain.iNumberOfDimensions ~= (nargin-1) )
		%
		error('Number of dimensions passed in "GenerateExponentialMeasure" inconsistent with the dimension of the input domain.\n\n');
		%
	end;%
	%
	%
	switch( nargin-1 )
		%
		% ---------------------------------------------------------
		case 1
			tGenerator.ffDomainMeasure =							...
				tGenerator.GetMonodimensionalExponential(			...
								tGenerator.tInputDomain.afXAxis,	...
								varargin{1} );
		%
		%
		% ---------------------------------------------------------
		case 2
			%
			% storage allocation
			tGenerator.ffDomainMeasure =								...
				zeros(	numel(tGenerator.tInputDomain.afXAxis),			...
						numel(tGenerator.tInputDomain.afYAxis)	);
			%
			afExponentialAlongX =									...
				tGenerator.GetMonodimensionalExponential(			...
								tGenerator.tInputDomain.afXAxis,	...
								varargin{1});
			%
			afExponentialAlongY =									...
				tGenerator.GetMonodimensionalExponential(			...
								tGenerator.tInputDomain.afXAxis,	...
								varargin{2});
			%
			for iXIndex = 1:numel(tGenerator.tInputDomain.afXAxis);
				for iYIndex = 1:numel(tGenerator.tInputDomain.afYAxis);
					%
					tGenerator.ffDomainMeasure(iXIndex, iYIndex) =	...
							afExponentialAlongX(iXIndex)			...
						*	afExponentialAlongY(iYIndex);
					%
				end;%
			end;%
		%
		%
		% ---------------------------------------------------------
		case 3
			%
			% storage allocation
			tGenerator.ffDomainMeasure =								...
				ones(	numel(tGenerator.tInputDomain.afXAxis),			...
						numel(tGenerator.tInputDomain.afYAxis),			...
						numel(tGenerator.tInputDomain.afZAxis)	);
			%
			afExponentialAlongX =									...
				tGenerator.GetMonodimensionalExponential(			...
								tGenerator.tInputDomain.afXAxis,	...
								varargin{1});
			%
			afExponentialAlongY =									...
				tGenerator.GetMonodimensionalExponential(			...
								tGenerator.tInputDomain.afXAxis,	...
								varargin{2});
			%
			afExponentialAlongZ =									...
				tGenerator.GetMonodimensionalExponential(			...
								tGenerator.tInputDomain.afXAxis,	...
								varargin{3});
			%
			for iXIndex = 1:numel(tGenerator.tInputDomain.afXAxis);
				for iYIndex = 1:numel(tGenerator.tInputDomain.afYAxis);
					for iZIndex = 1:numel(tGenerator.tInputDomain.afZAxis);
						%
						tGenerator.ffDomainMeasure(iXIndex, iYIndex, iZIndex) =	...
								afExponentialAlongX(iXIndex)					...
							*	afExponentialAlongY(iYIndex)					...
							*	afExponentialAlongZ(iZIndex);
						%
					end;%
				end;%
			end;%
		%
	end;%
	%
	%
	tGenerator.NormalizeMeasure();
	%
	%
end %
