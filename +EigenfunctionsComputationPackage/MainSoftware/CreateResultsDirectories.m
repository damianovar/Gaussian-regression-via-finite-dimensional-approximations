% CreateResultsDirectory.m



if( tParameters.bSaveResultingFiles )
	%
	% creation of the directory for storing the mat files
	[bDirectorySuccesfullyCreated, strMessage, strMessageID] =		...
		mkdir( tParameters.strResultingMatFilesDirectory );
	%
	%
	if( bDirectorySuccesfullyCreated == false )
		%
		error( sprintf('!! Error creating directory for storing mat files !!\n\nmessage: %s\n\nmessage ID: %s', ...
				strMessage, strMessageID) );
		%
	end;%
	%
	%
	fprintf('The following directory has just been created:\n\t%s\n',	...
			tParameters.strResultingMatFilesDirectory);
	%
	%
	%
	%
	% creation of the directory for storing the txt files
	[bDirectorySuccesfullyCreated, strMessage, strMessageID] =		...
		mkdir( tParameters.strResultingTxtFilesDirectory );
	%
	%
	if( bDirectorySuccesfullyCreated == false )
		%
		error( sprintf('!! Error creating directory for storing txt files !!\n\nmessage: %s\n\nmessage ID: %s', ...
				strMessage, strMessageID) );
		%
	end;%
	%
	%
	fprintf('The following directory has just been created:\n\t%s\n', ...
			tParameters.strResultingTxtFilesDirectory );
	%
end;%



% cleaning
clear bDirectorySuccesfullyCreated;
clear strMessage;
clear strMessageID;

