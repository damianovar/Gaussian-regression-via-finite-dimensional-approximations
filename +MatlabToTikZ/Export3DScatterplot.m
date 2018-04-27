function Export3DScatterplot(	strFileName,		...
								ffInputLocations,	...
								afMeasurements		)
	%
	% open the file
	fid = fopen(strFileName, 'w');
	%
	aafDataMatrix = [  ffInputLocations(:, 2), afMeasurements ];	
	%
	% write all the data 
	for iSample = 1:numel(afMeasurements);
		%
		fprintf(	fid,							...
					'%.5f %.5f %.5f\n',				...
					ffInputLocations(iSample, 1),	...
					ffInputLocations(iSample, 2),	...
					afMeasurements(iSample)			);
		%
	end;%
	%
	% close the file
	fclose(fid);
	clear fid;
	%
	fprintf('%s exported\n', strFileName);
	%
end %
