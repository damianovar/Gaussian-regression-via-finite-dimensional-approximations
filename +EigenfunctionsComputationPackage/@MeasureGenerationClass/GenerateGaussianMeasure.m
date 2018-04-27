% usage examples:
%
%
% monodimensional domain:
% GenerateGaussianMeasure( {{0.4, 0.5, 0.6}} ) % single gaussian
% GenerateGaussianMeasure( {{0.4, 0.5, 0.6}, {0.1, 0.2, 0.3}} ) % gaussian
% mixture
%
% bidimensional and tridimensional domains as before, with more cells
%
%
% possible structures of the various cells:
%
% {{m1, v1, w1}} -> single gaussian with mean m1, variance v1 and
%                   weight w1
% 
% {{m1, v1, w1}, ..., {mN, vN, wN}} -> mixture of gaussians, each
%                   with its own mean variance and weight
%
function GenerateGaussianMeasure( tGenerator, varargin )
	%
	%
	if( tGenerator.tInputDomain.iNumberOfDimensions ~= (nargin-1) )
		%
		error('Number of dimensions passed in "GenerateGaussianMeasure" inconsistent with the dimension of the input domain.\n\n');
		%
	end;%
	%
	%
	%
	switch( nargin-1 )
		%
		% ---------------------------------------------------------
		case 1
			tGenerator.ffDomainMeasure =							...
				tGenerator.GetMonodimensionalGaussian(				...
								tGenerator.tInputDomain.afXAxis,	...
								varargin{1});
		%
		%
		% ---------------------------------------------------------
		case 2
			%
			% storage allocation
			tGenerator.ffDomainMeasure =							...
				zeros(	numel(tGenerator.tInputDomain.afXAxis),		...
						numel(tGenerator.tInputDomain.afYAxis)	);
			%
			afGaussianAlongX =										...
				tGenerator.GetMonodimensionalGaussian(				...
								tGenerator.tInputDomain.afXAxis,	...
								varargin{1});
			%
			afGaussianAlongY =										...
				tGenerator.GetMonodimensionalGaussian(				...
								tGenerator.tInputDomain.afXAxis,	...
								varargin{2});
			%
			for iXIndex = 1:numel(tGenerator.tInputDomain.afXAxis);
				for iYIndex = 1:numel(tGenerator.tInputDomain.afYAxis);
					%
					tGenerator.ffDomainMeasure(iXIndex, iYIndex) =	...
							afGaussianAlongX(iXIndex)				...
						*	afGaussianAlongY(iYIndex);
					%
				end;%
			end;%
		%
		%
		% ---------------------------------------------------------
		case 3
			%
			% storage allocation
			tGenerator.ffDomainMeasure =							...
				ones(	numel(tGenerator.tInputDomain.afXAxis),		...
						numel(tGenerator.tInputDomain.afYAxis),		...
						numel(tGenerator.tInputDomain.afZAxis)	);
			%
			afGaussianAlongX =										...
				tGenerator.GetMonodimensionalGaussian(				...
								tGenerator.tInputDomain.afXAxis,	...
								varargin{1});
			%
			afGaussianAlongY =										...
				tGenerator.GetMonodimensionalGaussian(				...
								tGenerator.tInputDomain.afXAxis,	...
								varargin{2});
			%
			afGaussianAlongZ =										...
				tGenerator.GetMonodimensionalGaussian(				...
								tGenerator.tInputDomain.afXAxis,	...
								varargin{3});
			%
			for iXIndex = 1:numel(tGenerator.tInputDomain.afXAxis);
				for iYIndex = 1:numel(tGenerator.tInputDomain.afYAxis);
					for iZIndex = 1:numel(tGenerator.tInputDomain.afZAxis);
						%
						tGenerator.ffDomainMeasure(iXIndex, iYIndex, iZIndex) =	...
								afGaussianAlongX(iXIndex)						...
							*	afGaussianAlongY(iYIndex)						...
							*	afGaussianAlongZ(iZIndex);
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
