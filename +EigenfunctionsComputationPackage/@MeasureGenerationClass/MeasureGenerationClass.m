classdef MeasureGenerationClass < handle
	%
	% ---------------------------------------------------------------------
	properties
		%
		bPrintDebugInformation;
		bPlotDebugInformation;
		strLabel;
		%
		tInputDomain;
		ffDomainMeasure;
		%
		bSomeErrorOccurred;
		%
	end %
	%
	%
	% ---------------------------------------------------------------------
	methods
		%
		% standard constructor
		function tMeasure = MeasureGenerationClass(	...
								tNewInputDomain, tParameters )
			%
			%
			tMeasure.bPrintDebugInformation	= tParameters.bPrintDebugInformation;
			tMeasure.bPlotDebugInformation	= tParameters.bPlotDebugInformation;
			tMeasure.strLabel				= 'standard measure generator';
			tMeasure.tInputDomain			= tNewInputDomain;
			tMeasure.bSomeErrorOccurred		= false;
			%
			%
			switch( tParameters.strMeasureKind )
				%
				case 'uniform'
					tMeasure.GenerateUniformMeasure();
				%
				case 'gaussian'
					tMeasure.GenerateGaussianMeasure( tParameters.cGaussianMeasureParameters );
				%
				case 'exponential'
					tMeasure.GenerateExponentialMeasure( tParameters.cExponentialMeasureParameters );
				%
				otherwise
					tMeasure.bSomeErrorOccurred = true;
					error( 'incorrect measure kind selection!' );
				%
			end;%
			%
			%
			if( tMeasure.bPrintDebugInformation )
				tMeasure.Print();
			end;%
			if( tMeasure.bPlotDebugInformation )
				tMeasure.Plot();
			end;%
			%
			%
		end %
		%
		%
	end %
	%
	%
end %
