% aafValues = matrix of samples
%
% produces one box per column
%
% the code is written for readability, not for speed
%
function ExportBoxplot(		...
			strFilename,	...
			aafValues	)
	%
	% for readability
	iNumberOfBoxes = numel( aafValues( 1, : ) );
	%
	% sort the various columns
	for iBox = 1:iNumberOfBoxes;
		%
		aafValues( :, iBox ) = sort( aafValues( :, iBox ) );
		%
	end;%
	%
	afMedians		= quantile( aafValues, 0.5, 1 );
	afBoxesTops		= quantile( aafValues, 0.75, 1 );
	afBoxesBottoms	= quantile( aafValues, 0.25, 1 );
	%
	% parameter for computing outliers and whiskers
	w_parameter		= 1.5; % matlab's default value = 1.5
	%
	afUpperOutliersThresholds	= afBoxesTops + w_parameter * ( afBoxesTops - afBoxesBottoms );
	afLowerOutliersThresholds	= afBoxesBottoms - w_parameter * ( afBoxesTops - afBoxesBottoms );
	%
	atBoxes = [];
	%
	for iBox = 1:iNumberOfBoxes; % naive storage allocation optimization
		%
		aiCurrentUpperOutliersIndexes =									...
			 aafValues(:, iBox) > afUpperOutliersThresholds(iBox);
		%
		aiCurrentLowerOutliersIndexes =									...
			 aafValues(:, iBox) < afLowerOutliersThresholds(iBox);
		%
		atBoxes(iBox).afUpperOutliers = aafValues(aiCurrentUpperOutliersIndexes, iBox); %#ok<AGROW>
		atBoxes(iBox).afLowerOutliers = aafValues(aiCurrentLowerOutliersIndexes, iBox); %#ok<AGROW>
		%
		% compute the top whisker
		if( numel(atBoxes(iBox).afUpperOutliers) > 0 )
			%
			iCurrentTopWhiskerElementIndex =	...
				find( aafValues(:, iBox) < min(atBoxes(iBox).afUpperOutliers), 1, 'last' );
			%
			atBoxes(iBox).fTopWhisker = aafValues( iCurrentTopWhiskerElementIndex, iBox );
			%
		else%
			%
			atBoxes(iBox).fTopWhisker =	max( aafValues(:, iBox) );
			%
		end;%
		%
		% compute the bottom whisker
		if( numel(atBoxes(iBox).afLowerOutliers) > 0 )
			%
			iCurrentBottomWhiskerElementIndex =	...
				find( aafValues(:, iBox) > max(atBoxes(iBox).afLowerOutliers), 1, 'first' );
			%
			atBoxes(iBox).fBottomWhisker = aafValues( iCurrentBottomWhiskerElementIndex, iBox );
			%
		else%
			%
			atBoxes(iBox).fBottomWhisker = min( aafValues(:, iBox) );
			%
		end;%
		%
	end;%
	%
	%
	% main file
	fid = fopen(strFilename, 'w');
	%
	for iBox = 1:iNumberOfBoxes;
		%
		% box_id   median   box_top   box_bottom   whisker_top   whisker_bottom
		fprintf(fid,								...
				'%d %.4f %.4f %.4f %.4f %.4f\n',	...
				iBox,								...
				afMedians(iBox),					...
				afBoxesTops(iBox),					...
				afBoxesBottoms(iBox),				...
				atBoxes(iBox).fTopWhisker,			...
				atBoxes(iBox).fBottomWhisker		);
		%
	end;%
	%
	fclose( fid );
	%
	%
	% outliers files
	for iBox = 1:iNumberOfBoxes
		%
		strOutliersFileName = strcat( strFilename, sprintf('.outliers%d', iBox ) );
		%
		fid = fopen(strOutliersFileName, 'w');
		%
		for iOutlier = 1:numel( atBoxes(iBox).afUpperOutliers );
			%
			fprintf(fid, '%d %.4f\n', iBox, atBoxes(iBox).afUpperOutliers(iOutlier));
			%
		end;%
		for iOutlier = 1:numel( atBoxes(iBox).afLowerOutliers );
			%
			fprintf(fid, '%d %.4f\n', iBox, atBoxes(iBox).afLowerOutliers(iOutlier));
			%
		end;%
		%
		fclose( fid );
		%
	end;%
	%
	fprintf('%s exported\n', strFilename);
	%
end %

