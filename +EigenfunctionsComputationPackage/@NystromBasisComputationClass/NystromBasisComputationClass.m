classdef NystromBasisComputationClass < handle
	%
	% ---------------------------------------------------------------------
	properties
		%
		%
		bPrintDebugInformation;
		bPlotDebugInformation;
		strLabel;
		%
		tInputDomain;
		tMeasure;
		tKernel;
		%
		ffInputLocations;
		iiInputLocationsIndexes;
		%
		aafKernelMatrix;
		iNumberOfBasisFunctions;
		iNumberOfInputLocations;
		ffBasisFunctions;
		afEigenvalues;
		aafEigenvectors;
		%
		%
	end %
	%
	%
	% ---------------------------------------------------------------------
	methods
		%
		% standard constructor
		function tComputer = NystromBasisComputationClass(			...
								tNewInputDomain,					...
								tNewMeasure,						...
								tNewKernel,							...
								tParameters )
			%
			%
			if( nargin == 4 )
				%
				%
				% initialization
				tComputer.bPrintDebugInformation	= tParameters.bPrintDebugInformation;
				tComputer.bPlotDebugInformation		= tParameters.bPlotDebugInformation;
				tComputer.strLabel					= 'Nystrom basis functions computer';
				%
				tComputer.tInputDomain				= tNewInputDomain;
				tComputer.tMeasure					= tNewMeasure;
				tComputer.tKernel					= tNewKernel;
				%
				tComputer.iNumberOfInputLocations 	= tParameters.iNumberOfNystromInputLocations;
				tComputer.GenerateInputLocations();
				tComputer.ComputeKernelMatrix( tParameters );
				%
				tComputer.iNumberOfBasisFunctions	= min(	tParameters.iNumberOfNystromInputLocations,			...
															tParameters.iMinimalNumberOfEigenfunctionsToBeSaved	);
				%
				tComputer.ComputeBasisFunctions();
				%
				if( tComputer.bPrintDebugInformation )
					tComputer.Print();
				end;%
				if( tComputer.bPlotDebugInformation )
					tComputer.Plot();
				end;%
				%
			end %
			%
			%
		end;% if( nargin == 4 )
		%
		%
	end %
	%
	%
	% ---------------------------------------------------------------------
	methods( Static = true )
		%
		tComputer = Load( strFileName );
		%
	end %
	%
end % classdef

