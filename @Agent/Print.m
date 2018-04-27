function Print( tAgent, tKernelParameters, bBeVerbose )
	%
	if( nargin == 2 )
		%
		bBeVerbose = false;
		%
	end;%
	%
	%
	if( bBeVerbose )
		%
		fprintf('agent %d:\n', tAgent.iLabel );
		%
		fprintf('\tmeasurements:\n');
		%
		for iMeasurement = 1:numel(tAgent.afMeasurements);
			%
			switch( tKernelParameters.iNumberOfDimensions )
				%
				case 1
					fprintf('x = %.3f\t', tAgent.ffInputLocations(iMeasurement) );
					fprintf('y = %.3f\t', tAgent.afMeasurements(iMeasurement) );
					fprintf('(i = %.3f)\n', tAgent.iiInputLocationsIndexes(iMeasurement) );
				%
				case 2
					fprintf('x = %.3f,%.3f\t', tAgent.ffInputLocations(iMeasurement, 1), tAgent.ffInputLocations(iMeasurement, 2) );
					fprintf('y = %.3f\t', tAgent.afMeasurements(iMeasurement) );
					fprintf('(i = %.3f,%.3f)\n', tAgent.iiInputLocationsIndexes(iMeasurement, 1), tAgent.iiInputLocationsIndexes(iMeasurement, 2) );
				%
				otherwise
					error('not supported input domain dimensionality')
				%
			end;%
			%
		end;%
		%
	else%
		%
		fprintf('a%d:\n', tAgent.iLabel );
		%
	end;%
	%
end %
