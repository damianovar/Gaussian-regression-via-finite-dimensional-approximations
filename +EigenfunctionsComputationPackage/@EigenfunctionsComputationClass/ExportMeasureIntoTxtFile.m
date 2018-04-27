function ExportMeasureIntoTxtFile( tComputer, tParameters )
	%
	switch( tComputer.tInputDomain.iNumberOfDimensions )
		%
		case 1
			%
			tComputer.Export1DMeasureIntoTxtFiles( tParameters );
		%
		case 2
			%
			tComputer.Export2DMeasureIntoTxtFiles( tParameters );
		%
		otherwise
			%
			error('not managed input domain dimensionality');
		%
	end;%
	%
end %
