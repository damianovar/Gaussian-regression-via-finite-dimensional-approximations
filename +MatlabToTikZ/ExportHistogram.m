function ExportHistogram( strFilename, afSignal, afBins )
	%
	afHistogram = hist( afSignal, afBins );
	%
	MatlabToTikZ.ExportLineplot(strFilename,				...
								[afBins', afHistogram' ],	...
								'bin histogram\n'			);
	%
end %
