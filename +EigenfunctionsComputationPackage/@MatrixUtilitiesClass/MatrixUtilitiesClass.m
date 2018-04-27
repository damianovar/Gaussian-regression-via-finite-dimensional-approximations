classdef MatrixUtilitiesClass < handle
	%
	% ---------------------------------------------------------------------
	properties
		%
		%
	end %
	%
	%
	% ---------------------------------------------------------------------
	methods( Static = true )
		%
		aafPaddedMatrix = Pad( aafInputMatrix, iNumberOfRows, iNumberOfColumns );
		afVectorizedMatrix = VectorizeBidimensionalMatrix( aafBidimensionalMatrix );
		%
		[	aiRowsIndexes,				...
			aiColumnsIndexes,			...
			aafOutputMatrix	] =			...
			RemoveZerosFromMatrix( aafInputMatrix );
		%
		iNumberOfDimensions = GetNumberOfDimensionsOf( ffInput );
		%
	end %
	%
end %

