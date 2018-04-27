function [	ffTrainingInputLocations,			...
			iiTrainingInputLocationsIndexes,	...
			afTrainingMeasurements,				...
			ffTestInputLocations,				...
			iiTestInputLocationsIndexes,		...
			afTestMeasurements	] =				...
				GetColoradoRainData(			...
					strFilename,				...
					aiMonths,					...
					fTrainingVsTestSetsRatio,	...
					tKernelParameters,			...
					fSpaceFactor				)


% Map = matrix/mesh to plot (estimates, prediction, whatever)
% LatMin = minimum latitude you want to consider
% LatMax = maximum latitude you want to consider
% LonMin,LonMax similar to above
% NumLatPts = number of latitude points to plot
% NumLonPts = number of longitude points to plot

% load the raw data
load(strFilename);

% load some auxiliary variables
fLatMax = max(LATITUDE);
fLonMax = max(LONGITUDE);
fLatMin = min(LATITUDE);
fLonMin = min(LONGITUDE);
iNumLatPts = numel(LATITUDE);
iNumLonPts = numel(LONGITUDE);
dLat = fLatMax - fLatMin;
dLon = fLonMax - fLonMin;
afLatLim = [fLatMin, fLatMax];
afLonLim = [fLonMin, fLonMax];
afColoradosLatitudes = [36, 42];
afColoradosLongitudes = [-110, -100];

% get the various data in only one array
%
afPrecipitations 	= [];
afLatitudes 		= [];
afLongitudes 		= [];
%
for iMonthIndex = 1:numel(aiMonths)
	%
	afPrecipitations = [afPrecipitations ; PRECIPITATION(aiMonths(iMonthIndex),:)' ];
	afLatitudes = [afLatitudes ; LATITUDE];
	afLongitudes = [afLongitudes ; LONGITUDE];
	%
end;%

% remove the NaNs
aiNaNsIndexes = isnan(afPrecipitations);
afPrecipitations(aiNaNsIndexes) = [];
afLatitudes(aiNaNsIndexes) 		= [];
afLongitudes(aiNaNsIndexes) 	= [];

% % plot the raw data
% geocell = min(ceil(iNumLatPts/dLat),ceil(iNumLonPts/dLon));
% referencing_vector= [geocell,fLatMax,fLonMin];
% ax = worldmap(afColoradosLatitudes, afColoradosLongitudes);
% land = shaperead('landareas', 'UseGeoCoords', true);
% geoshow(ax, land, 'FaceColor', [0.9 0.9 0.9])
% % lakes = shaperead('worldlakes', 'UseGeoCoords', true);
% % geoshow(lakes, 'FaceColor', 'blue')
% % rivers = shaperead('worldrivers', 'UseGeoCoords', true);
% % geoshow(rivers, 'Color', 'blue')
% % cities = shaperead('worldcities', 'UseGeoCoords', true);
% % geoshow(cities, 'Marker', 'o', 'Color', 'red');
% % geoshow(cities, 'Marker', '*', 'Color', 'red');
% states = shaperead('usastatelo', 'UseGeoCoords', true);
% geoshow(states,'FaceColor',[1,1,1],'facealpha',.3);
% geoshow(afLatitudes, afLongitudes, 'DisplayType', 'Point', 'Marker', '.', 'MarkerEdgeColor', 'black');

% get the data in a useful format
afNormalizedLatitudes  = (afLatitudes  - min(afLatitudes))  / (max(afLatitudes)  - min(afLatitudes));
afNormalizedLongitudes = (afLongitudes - min(afLongitudes)) / (max(afLongitudes) - min(afLongitudes));
%
% compute the original indexes
afOriginalLatitudesLocationIndexes = afNormalizedLatitudes / tKernelParameters.afDomainXAxis(2) - tKernelParameters.afDomainXAxis(1);
afOriginalLongitudesLocationIndexes = afNormalizedLongitudes / tKernelParameters.afDomainYAxis(2) - tKernelParameters.afDomainYAxis(1);
%
% add a bit of "space" at the borders so to avoid borders effects
aiLatitudesLocationIndexes = round( afOriginalLatitudesLocationIndexes * fSpaceFactor + (numel(tKernelParameters.afDomainXAxis) * (1 - fSpaceFactor) / 2 ));
aiLongitudesLocationIndexes = round( afOriginalLongitudesLocationIndexes * fSpaceFactor + (numel(tKernelParameters.afDomainYAxis) * (1 - fSpaceFactor) / 2 ));
%
aiLatitudesLocationIndexes( aiLatitudesLocationIndexes == 0 ) = 1;
aiLongitudesLocationIndexes( aiLongitudesLocationIndexes == 0 ) = 1;

% divide the data in training and test sets
% [aiTrainingIndexes, aiValidationIndexes, aiTestIndexes] = dividerand( numel(afPrecipitations), 0.66, 0, 0.34 );
aiTrainingIndexes 	= 1:(round(numel(afPrecipitations)*fTrainingVsTestSetsRatio));
aiTestIndexes 		= ((round(numel(afPrecipitations)*fTrainingVsTestSetsRatio))+1):numel(afPrecipitations);
%
ffTrainingInputLocations		= [afNormalizedLatitudes(aiTrainingIndexes), afNormalizedLongitudes(aiTrainingIndexes)];
iiTrainingInputLocationsIndexes = [aiLatitudesLocationIndexes(aiTrainingIndexes), aiLongitudesLocationIndexes(aiTrainingIndexes)];
afTrainingMeasurements			= afPrecipitations(aiTrainingIndexes);
%
ffTestInputLocations		= [afNormalizedLatitudes(aiTestIndexes), afNormalizedLongitudes(aiTestIndexes)];
iiTestInputLocationsIndexes = [aiLatitudesLocationIndexes(aiTestIndexes), aiLongitudesLocationIndexes(aiTestIndexes)];
afTestMeasurements			= afPrecipitations(aiTestIndexes);

end % function

