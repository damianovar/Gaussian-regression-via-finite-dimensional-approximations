function ExportEigenfunctionsIntoTxtFiles( tComputer, tParameters )
	%
	switch( tComputer.tInputDomain.iNumberOfDimensions )
		%
		case 1
			%
			tComputer.Export1DEigenfunctionsIntoTxtFiles( tParameters );
		%
		case 2
			%
			tComputer.Export2DEigenfunctionsIntoTxtFiles( tParameters );
		%
		otherwise
			%
			error('not managed input domain dimensionality');
		%
	end;%
	%
end %

