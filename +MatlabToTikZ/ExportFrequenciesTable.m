function ExportFrequenciesTable( strFilename, afSignal )
	%
	aafFrequenciesTable = tabulate( afSignal );
	%
	MatlabToTikZ.ExportLineplot(strFilename,					...
								aafFrequenciesTable(:,1:2),		...
								'value numberOfInstances\n'		);
	%
end %
