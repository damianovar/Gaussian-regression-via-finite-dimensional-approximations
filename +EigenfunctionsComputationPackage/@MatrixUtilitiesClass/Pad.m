function aafPaddedMatrix = Pad( aafInputMatrix,	...
								iNumberOfRows,	...
								iNumberOfColumns )
	%
	%
	% for readability
	iNumberOfRowsOfInputMatrix		= size(aafInputMatrix, 1);
	iNumberOfColumnsOfInputMatrix	= size(aafInputMatrix, 2);
	%
	%
	% pad the rows
	if( iNumberOfRowsOfInputMatrix > iNumberOfRows )
		%
		fprintf('\nWARNING: requested an useless pad operation (rows).\n\n');
		aafPaddedMatrix = aafInputMatrix;
		iNumberOfRows	= iNumberOfRowsOfInputMatrix;
		%
	else%
		%
		aafPaddedMatrix =											...
			[	aafInputMatrix ;									...
				zeros(	iNumberOfRows - iNumberOfRowsOfInputMatrix,	...
						iNumberOfColumnsOfInputMatrix	)	];
		%
	end;%
	%
	%
	% pad the colmns
	if( iNumberOfColumnsOfInputMatrix > iNumberOfColumns )
		%
		fprintf('\nWARNING: requested an useless pad operation (columns).\n\n');
		%
	else%
		%
		aafPaddedMatrix =													...
			[	aafPaddedMatrix ,											...
				zeros(	iNumberOfRows,										...
						iNumberOfColumns - iNumberOfColumnsOfInputMatrix )];
		%
	end;%
	%
end %
