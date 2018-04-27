function ExportYearlyMatrix(	strFileName,		...
								aafYearlyMatrix,	...
								iPrecision			) % optional, it not given then the signals are not to be converted
	%
	bPrecisionIsPresent = ( nargin > 2 );
	%
	% set the precision to 5 if not present
	if( ~bPrecisionIsPresent )
		%
		iPrecision = 5;
		%
	end;%
	%
	aiHoursInADay = (1:24)';
	%
	aafSignals = [ aiHoursInADay, aafYearlyMatrix ];
	%
	astrHeader = MatlabToTikZ.ConstructDefaultHeader( aafSignals );
	%
	MatlabToTikZ.ExportLineplot(strFileName,		...
								aafSignals,			...
								astrHeader,			...
								1,					...
								iPrecision			);
	%
end % function

