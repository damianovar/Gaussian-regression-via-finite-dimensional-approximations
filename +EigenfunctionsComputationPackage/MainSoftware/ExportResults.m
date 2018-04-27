
CreateResultsDirectories;

tComputer.ExportEigenfunctionsIntoTxtFiles( tParameters );
tComputer.ExportEigenvaluesIntoTxtFiles( tParameters );
tComputer.ExportMeasureIntoTxtFile( tParameters );

fprintf('\nTxt files have been exported.\n\n');

SaveResultingMatFiles;
