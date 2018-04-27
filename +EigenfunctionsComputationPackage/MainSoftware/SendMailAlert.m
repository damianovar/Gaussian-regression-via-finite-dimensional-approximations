% SendMailAlert.m


if( tParameters.bEnableMailAlert )
	%
	%
	setpref('Internet', 'SMTP_Server', tParameters.strSmtpServer);
	setpref('Internet', 'E_mail', tParameters.strEMailAddress);
	%
	%
	sendmail(															...
		tParameters.strEMailAddress,									...
		'Alert Message from Matlab: simulation concluded',				...
		sprintf('Simulation started on %s is just terminated', tParameters.strCurrentDate) );
	%
	%
	fprintf('\nAn alert has been sent to the following e-mail address:\n\t%s\n\n',	...
		tParameters.strEMailAddress);
	%
	%
	if( tParameters.bSendFiguresViaMail )
		%
		fprintf('\nStarting compressing the figures to be sent via e-mail\n');
		%
		strZippedFiguresFile = sprintf( '%s/ZippedFigures.zip', tParameters.strResultingFiguresDirectory );
		%
		zip( strZippedFiguresFile, 	...
			 {'*.jpg', '*.eps', '*.pdf'},		...
			 tParameters.strResultingFiguresDirectory	);
		%
		sendmail(																			...
			tParameters.strEMailAddress,													...
			'Zip file from Matlab: figures of the just concluded simulation',				...
			sprintf('The figures of the simulation started on %s have been attached as a .zip file', tParameters.strCurrentDate),	...
			strZippedFiguresFile	 );
		%
		fprintf('Figures compressed and sent!\n');
		%
		clear strZippedFiguresFile;
		%
	end;%
	%
	%
	if( tParameters.bSendMatFilesViaMail )
		%
		fprintf('\nStarting compressing the mat-files to be sent via e-mail\n');
		%
		strZippedMatFilesFile = sprintf( '%s/ZippedMatFiles.zip', tParameters.strResultingMatFilesDirectory );
		%
		zip( strZippedMatFilesFile,	...
			 '*.mat',		...
			 tParameters.strResultingMatFilesDirectory				);
		%
		sendmail(																			...
			tParameters.strEMailAddress,													...
			'Zip file from Matlab: mat-files of the just concluded simulation',				...
			sprintf('The mat-files of the simulation started on %s have been attached as a .zip file', tParameters.strCurrentDate),	...
			strZippedMatFilesFile );
		%
		fprintf('Mat-files compressed and sent!\n');
		%
		clear strZippedMatFilesFile;
		%
	end;%
	%
	%
end;%
