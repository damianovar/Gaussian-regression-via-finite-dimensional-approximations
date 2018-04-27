function [ffXTraining, ffXTest, afYTraining, afYTest, aafNormalizationFactors] = LoadUCIDataset(strDataset, iMaxDatasetSize)
	%
	strFilename = strcat('../MatFiles/UCI/', strDataset, '.data.txt' );
	%
	switch( strDataset )
		%
		case '1D'
			[ffX, afY] = Generate1DDataset();
			iNumberOfDimensions = 1;
		%
		case 'CPUPerformance/machine'
			fileID = fopen(strFilename);
			tData = textscan(fileID, '%s %s %f %f %f %f %f %f %f %f', 'Delimiter', ',');
			ffX = [ tData{3:8} ];
			afY = [ tData{9} ];
			iNumberOfDimensions = 6;
			fclose(fileID);
		%
		case 'Adult/adult'
			fileID = fopen(strFilename);
			tData = textscan(fileID, '%f %s %f %s %f %s %s %s %s %s %f %f %f %s %f', 'Delimiter', ',');
			ffX = [ tData{1}, tData{3}, tData{5}, tData{11:13} ];
			afY = [ tData{15} ];
			iNumberOfDimensions = 6;
			fclose(fileID);
		%
		case 'ForestCover/covtype'
			fileID = fopen(strFilename);
			tData = textscan(fileID, '%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f', 'Delimiter', ',');
			ffX = [ tData{1:10} ];
			afY = [ tData{end} ];
			iNumberOfDimensions = 10;
			fclose(fileID);
		%
		case 'Concrete/concrete'
			fileID = fopen(strFilename);
			tData = textscan(fileID, '%f %f %f %f %f %f %f %f %f', 'Delimiter', ',');
			ffX = [ tData{1:(end-1)} ];
			afY = [ tData{1} ];
			iNumberOfDimensions = 8;
			fclose(fileID);
		%
		case 'CCPP/CCPP'
			fileID = fopen(strFilename);
			tData = textscan(fileID, '%f %f %f %f %f', 'Delimiter', ',');
			ffX = [ tData{1:(end-1)} ];
			afY = [ tData{1} ];
			iNumberOfDimensions = 4;
			fclose(fileID);
		%
		case 'Appliances/appliances'
			fileID = fopen(strFilename);
			tData = textscan(fileID, '%s %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f', 'Delimiter', ',');
			ffX = [ tData{3:27} ];
			afY = [ tData{2} ];
			iNumberOfDimensions = 24;
			fclose(fileID);
		%
		otherwise
			error('unsupported UCI dataset');
		%
	end;%
	%
	if( iMaxDatasetSize == -1 )
		iMaxDatasetSize = numel(ffX(:,1));
	else%
		iMaxDatasetSize = min(iMaxDatasetSize, numel(ffX(:,1)));
	end;%
	ffX = ffX(1:iMaxDatasetSize, :);
	afY = afY(1:iMaxDatasetSize);
	fprintf('dataset size = %d\n', iMaxDatasetSize);
	%
	% get the normalization factors
	for iFeature = 1:iNumberOfDimensions;
		%
		aafNormalizationFactors(iFeature, 1) = min(ffX(:,iFeature));
		aafNormalizationFactors(iFeature, 2) = max(ffX(:,iFeature));
		%
	end;%
	%
	% normalize the data
	for iFeature = 1:iNumberOfDimensions;
		%
		ffX(:,iFeature) =		(ffX(:,iFeature) - aafNormalizationFactors(iFeature, 1))	...
							/	(aafNormalizationFactors(iFeature, 2) - aafNormalizationFactors(iFeature, 1));
		%
	end;%
	%
	% --- deterministic division in training and test sets
	aiTrainingIndexes	= [1; 2];
	aiTestIndexes		= [3];
	for i = 1:floor((numel(afY)-3) / 3);
		aiTrainingIndexes	= [aiTrainingIndexes; 1 + i*3; 2 + i*3];
		aiTestIndexes		= [aiTestIndexes; 3 + i*3];
	end;%
	%
	ffXTraining	= ffX( aiTrainingIndexes, : );
	afYTraining	= afY( aiTrainingIndexes );
	%
	ffXTest	= ffX( aiTestIndexes, : );
	afYTest	= afY( aiTestIndexes );
	%
	% DEBUG
	fprintf( 'dataset %s loaded\n', strDataset );
	%
end % function

