function [ffXTraining, ffXTest, afYTraining, afYTest, aafNormalizationFactors] = LoadUCICPUPerformance(strFilename)
	%
	fileID = fopen(strFilename);
	tData = textscan(fileID, '%s %s %f %f %f %f %f %f %f %f', 'Delimiter', ',');
	fclose(fileID);
	%
	ffX = [ tData{3:8} ];
	afY = [ tData{9} ];
	%
	% get the normalization factors
	for iFeature = 1:6;
		%
		aafNormalizationFactors(iFeature, 1) = min(ffX(:,iFeature));
		aafNormalizationFactors(iFeature, 2) = max(ffX(:,iFeature));
		%
	end;%
	%
	% normalize the data
	for iFeature = 1:6;
		%
		ffX(:,iFeature) =		(ffX(:,iFeature) - aafNormalizationFactors(iFeature, 1))	...
							/	(aafNormalizationFactors(iFeature, 2) - aafNormalizationFactors(iFeature, 1));
		%
	end;%
	%
	% divide in training and test sets -- first permute the measurements
	aiPermutingIndexes	= randperm( numel(afY) );
	ffX					= ffX(aiPermutingIndexes, :);
	afY					= afY(aiPermutingIndexes);
	%
	ffXTraining	= ffX( 1:floor(numel(afY)*2/3), : );
	afYTraining	= afY( 1:floor(numel(afY)*2/3) );
	%
	ffXTest	= ffX( (floor(numel(afY)*2/3)+1):end, : );
	afYTest	= afY( (floor(numel(afY)*2/3)+1):end );
	%
end % function

