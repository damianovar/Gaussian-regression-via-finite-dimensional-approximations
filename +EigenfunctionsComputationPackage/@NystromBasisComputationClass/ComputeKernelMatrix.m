function ComputeKernelMatrix( tComputer, tParameters )
	%
	% DEBUG
	fprintf('starting computing the kernel matrix...\n');
	%
	% storage allocation
	tComputer.aafKernelMatrix = zeros( tComputer.iNumberOfInputLocations );
	%
	switch tComputer.tInputDomain.iNumberOfDimensions
		%
		case 1
			for i = 1:tComputer.iNumberOfInputLocations;
			for j = 1:tComputer.iNumberOfInputLocations;
				%
				iFirstInputLocationIndex	= tComputer.iiInputLocationsIndexes(i);
				iSecondInputLocationIndex	= tComputer.iiInputLocationsIndexes(j);
				%
				tComputer.aafKernelMatrix( i, j ) =	...
					tComputer.tKernel.ffKernel( iFirstInputLocationIndex, iSecondInputLocationIndex );
				%
			end;%
			end;%
		%
		case 2
			for i = 1:tComputer.iNumberOfInputLocations;
			for j = 1:tComputer.iNumberOfInputLocations;
				%
				iFirstInputLocationXIndex	= tComputer.iiInputLocationsIndexes(i,1);
				iFirstInputLocationYIndex	= tComputer.iiInputLocationsIndexes(i,2);
				iSecondInputLocationXIndex	= tComputer.iiInputLocationsIndexes(j,1);
				iSecondInputLocationYIndex	= tComputer.iiInputLocationsIndexes(j,2);
				%
				tComputer.aafKernelMatrix( i, j ) =	...
					tComputer.tKernel.ffKernel( iFirstInputLocationXIndex,	...
												iFirstInputLocationYIndex,	...
												iSecondInputLocationXIndex,	...
												iSecondInputLocationYIndex	);
				%
			end;%
			end;%
		%
		otherwise
			for i = 1:tComputer.iNumberOfInputLocations;
			for j = 1:tComputer.iNumberOfInputLocations;
				%
				tComputer.aafKernelMatrix( i, j ) =			...
					tComputer.tKernel.EvaluateAt(			...
						tParameters,						...
						tComputer.ffInputLocations(i, :),	...
						tComputer.ffInputLocations(j, :)	);
				%
			end;%
			end;%
		%
	end;% switch
	%
	% DEBUG
	fprintf('computation of the kernel matrix done!\n');
	%
end % function

