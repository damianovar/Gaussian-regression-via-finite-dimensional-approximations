classdef KernelGenerationClass < handle
	%
	% ---------------------------------------------------------------------
	properties
		%
		bPrintDebugInformation;
		bPlotDebugInformation;
		strLabel;
		%
		bSomeErrorOccurred;
		%
		tInputDomain;
		ffKernel;
		%
	end %
	%
	%
	% ---------------------------------------------------------------------
	methods
		%
		% standard constructor
		function tKernel = KernelGenerationClass( tNewInputDomain, tParameters )
			%
			tKernel.strLabel			= 'standard kernel generator';
			tKernel.bSomeErrorOccurred	= false;
			%
			if( nargin > 0 )
				%
				tKernel.bPrintDebugInformation	= tParameters.bPrintDebugInformation;
				tKernel.bPlotDebugInformation	= tParameters.bPlotDebugInformation;
				tKernel.tInputDomain			= tNewInputDomain;
				tKernel.GenerateKernel( tParameters );
				%
				if( tKernel.bPrintDebugInformation )
					tKernel.Print();
				end;%
				if( tKernel.bPlotDebugInformation )
					tKernel.Plot();
				end;%
				%
			end;% % if( nargin > 0 )
			%
		end %
		%
		%
	end %
	%
end % classdef

