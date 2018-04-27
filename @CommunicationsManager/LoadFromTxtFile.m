% TODO
%
function ImportFromTxt( tCommunicationsManager, strFileName )
	%
	% open the file
	fid = fopen(strFileName, 'r');
	%
	disp(tCommunicationsManager);
	%
	% close the file
	fclose(fid);
	clear fid;
	%
	fprintf('%s imported\n', strFileName);
	%
end %
