function [	afXDomain,				...
			afYDomain,				...
			aafMatrix ]				...
			=						...
			ImportInformationFromPgfplots_3DPlots( strFileName )
	%
	% open the file
	fid = fopen(strFileName, 'r');
	%
	% load the raw data
	C = cell2mat( textscan(fid,'%f%f%f') );
	%
	% compute the domains
	afXDomain = sort( unique( C(:, 1) ) );
	afYDomain = sort( unique( C(:, 2) ) );
	%
	% allocate the matrix
	aafMatrix = zeros( numel(afXDomain), numel(afYDomain) );
	%
	% compute the data
	iNumberOfRowsInC = numel( C(:, 3) );
	%
	for iRow = 1:iNumberOfRowsInC;
		%
		iXIndex = find( C(iRow, 1) == afXDomain, 1 );
		iYIndex = find( C(iRow, 2) == afYDomain, 1 );
		%
		aafMatrix( iXIndex, iYIndex ) = C(iRow, 3);
		%
		% DEBUG
%		fprintf('row %d -> x%d y%d\n', iRow, iXIndex, iYIndex);
		%
	end;%
	%
	% close the file
	fclose(fid);
	clear fid;
	%
	fprintf('%s imported\n', strFileName);
	%
end %
