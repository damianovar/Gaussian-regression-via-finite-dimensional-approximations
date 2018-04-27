function afVectorizedMatrix = VectorizeBidimensionalMatrix( aafBidimensionalMatrix )
	%
	% for readability
	iNumberOfRows		= size( aafBidimensionalMatrix, 1 );
	iNumberOfColumns	= size( aafBidimensionalMatrix, 2 );
	%
	% storage allocation
	afVectorizedMatrix = zeros( iNumberOfRows * iNumberOfColumns, 1 );
	%
	for iColumn = 1:iNumberOfColumns;
		%
		iInitialElement		= (iColumn - 1) * iNumberOfRows + 1;
		iFinalElement		=  iColumn      * iNumberOfRows;
		%
		afVectorizedMatrix( iInitialElement:iFinalElement ) = ...
			aafBidimensionalMatrix( :, iColumn );
		%
	end;%
	%
	% DEBUG
% 	aafBidimensionalMatrix
% 	afVectorizedMatrix
	%
end % function
