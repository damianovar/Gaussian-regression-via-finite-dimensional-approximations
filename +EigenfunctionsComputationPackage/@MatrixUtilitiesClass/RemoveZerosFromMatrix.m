% WARNING:
%
% it works only for "complete" matrices
%
function [	aiRowsIndexes,				...
			aiColumnsIndexes,			...
			aafOutputMatrix	] =			...
			RemoveZerosFromMatrix( aafInputMatrix )
	%
	% for readability
	[iNumberOfInputRows, iNumberOfInputColumns] = size( aafInputMatrix );
	%
	%
	% storage allocation
	aiRowsIndexes		= [];
	aiColumnsIndexes	= [];
	aafOutputMatrix		= [];
	%
	%
	for iInputRow = 1:iNumberOfInputRows;
		%
		% if there exists non-null elements in this row, then
		if( sum( aafInputMatrix(iInputRow, :) > 0 ) > 0 )
			%
			aiRowsIndexes = [ aiRowsIndexes ; iInputRow ]; %#ok<*AGROW>
			%
		end;%
		%
	end;%
	%
	%
	if( numel(aiRowsIndexes) > 0 )
		%
		aiColumnsIndexes = find( aafInputMatrix(aiRowsIndexes(1), :) )';
		%
		aafOutputMatrix = aafInputMatrix( aiRowsIndexes, aiColumnsIndexes );
		%
	end;%
	%
end %
