function ExportEigenvaluesIntoTxtFiles( tComputer, tParameters )
	%
	%
	% compute the filename
	strFileName = sprintf( '%s.Eigenvalues.txt', tParameters.strTxtFilesPrefix );
	%
	%
	% open the file
	fid = fopen(strFileName, 'w');
	%
	%
	% write the header
	fprintf(fid, 'x y\n');
	%
	%
	% write the data
	for iEigenvalue = 1:min(numel(tComputer.afEigenvalues), 100);
		%
		fprintf(fid,									...
				'%.10f %.10f\n',						...
				iEigenvalue,							...
				tComputer.afEigenvalues( iEigenvalue )	);
		%
	end;%
	%
	%
	% close the file
	fclose(fid);
	%
	%
end %
