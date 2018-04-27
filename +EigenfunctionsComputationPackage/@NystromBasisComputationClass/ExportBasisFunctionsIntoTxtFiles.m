function ExportBasisFunctionsIntoTxtFiles( tComputer, tParameters )
	%
	switch( tComputer.tInputDomain.iNumberOfDimensions )
		%
		case 1
			tComputer.Export1DBasisFunctionsIntoTxtFiles( tParameters );
		%
		case 2
			tComputer.Export2DBasisFunctionsIntoTxtFiles( tParameters );
		%
		otherwise
			warning('the basis functions have not been exported because of the too high input domain dimensionality');
		%
	end;%
	%
end % function

