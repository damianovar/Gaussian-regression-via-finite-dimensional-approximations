function OrthonormalizeEigenfunctions( tComputer )
	%
	switch( tComputer.tInputDomain.iNumberOfDimensions )
		%
		case 1
			%
			tComputer.Orthonormalize1DEigenfunctions();
		%
		case 2
			%
			tComputer.Orthonormalize2DEigenfunctions();
		%
		otherwise
			%
			error('too high input domain dimensionality');
		%
	end;%
	%
end %
