classdef EigenfunctionsComputationClass < handle
	%
	% ---------------------------------------------------------------------
	properties
		%
		%
		bPrintDebugInformation;
		strLabel;
		%
		tInputDomain;
		tMeasure;
		tKernel;
		%
		aafSystemMatrix;
		ffEigenfunctions;
		afEigenvalues;
		iNumberOfEigenfunctions;
		%
		%
	end %
	%
	%
	% ---------------------------------------------------------------------
	methods
		%
		% standard constructor
		function tComputer = EigenfunctionsComputationClass(		...
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
				tComputer.strLabel					= 'standard eigenfunctions computator';
				%
				tComputer.tInputDomain				= tNewInputDomain;
				tComputer.tMeasure					= tNewMeasure;
				tComputer.tKernel					= tNewKernel;
				%
				%
				tComputer.ComputeSystemMatrix();
				%
				%
				% -------------------------------------------------------------
				% compute the eigenfunctions and the eigenvalues
				[ffAllEigenfunctions, aafAllEigenvalues] = ...
					eig( tComputer.aafSystemMatrix );
				%
				% prevent numerical problems that sometimes make the eigenvalues
				% close to zero to become negative (something that makes the
				% realizations have imaginary components 
				aafAllEigenvalues = abs( aafAllEigenvalues );
				%
				% note: eigenfunctions are the columns of the matrix
				[afSortedEigenvalues, aiSortingIndexes] = sort( diag(aafAllEigenvalues), 'descend' );
				%
				% storage allocation
				ffSortedEigenfunctions = zeros( size(ffAllEigenfunctions) );
				%
				for iEigenfunction = 1:numel(aiSortingIndexes)
					%
					ffSortedEigenfunctions(:, iEigenfunction) = ...
						ffAllEigenfunctions(:, aiSortingIndexes(iEigenfunction));
					%
				end;%
				%
				% save the results
				tComputer.afEigenvalues = afSortedEigenvalues;
				tComputer.ffEigenfunctions = ffSortedEigenfunctions;
				%
				% remove the irrelevant ones
				tComputer.RemoveIrrelevantEigenfunctions( tParameters );
				%
				% and orthonormalize the remaining
				tComputer.OrthonormalizeEigenfunctions();
				%
				%
				if( tComputer.bPrintDebugInformation )
					%
					tComputer.Print();
					tComputer.Plot();
					%
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
end %

