tParameters.strMatFilesPrefix = sprintf('%s/%dD.K%s.M%s', tParameters.strResultingMatFilesDirectory, tParameters.iInputDomainDimension, tParameters.strKernelKind, tParameters.strMeasureKind );
tParameters.strTxtFilesPrefix = sprintf('%s/%dD.K%s.M%s', tParameters.strResultingTxtFilesDirectory, tParameters.iInputDomainDimension, tParameters.strKernelKind, tParameters.strMeasureKind );
%
tParameters.strNystromMatFilesPrefix = sprintf('%s/%dD.N%s.M%s', tParameters.strResultingMatFilesDirectory, tParameters.iInputDomainDimension, tParameters.strKernelKind, tParameters.strMeasureKind );
tParameters.strNystromTxtFilesPrefix = sprintf('%s/%dD.N%s.M%s', tParameters.strResultingTxtFilesDirectory, tParameters.iInputDomainDimension, tParameters.strKernelKind, tParameters.strMeasureKind );

% generation of the string containing the current data
tParameters.strCurrentDate = GenerateCurrentDateString;

tParameters.strNystromComputerFileName = strcat( tParameters.strNystromMatFilesPrefix, '.mat' );

