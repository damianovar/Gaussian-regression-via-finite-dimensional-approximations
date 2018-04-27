% ALGORITHM
%
% afEigenvaluesA = a1, a2, ..., aN
% afEigenvaluesB = b1, b2, ..., bM
%
% all the couples = a1 b1, a1 b2, ..., a1 bM, a2 b1, ..., aN bM
% 
% sort( all the couples ) = c1, c2, ..., cNM
%
% I = index of ci in "all the couples"
%
% index in "a" = ceil(I / M)
% index in "b" = I - ((index in "a" - 1) * N)
% 
%
function [afEigenvalues, aiOriginalFirstIndex, aiOriginalSecondIndex] = ...
			ComputeEigenvaluesOf2DEigenfunctions( tComputer, afEigenvaluesA, afEigenvaluesB )
	%
	% for readability
	iNumberOfEigenvaluesA		= numel(afEigenvaluesA);
	iNumberOfEigenvaluesB		= numel(afEigenvaluesB);
	iTotalNumberOfEigenvalues	= iNumberOfEigenvaluesA * iNumberOfEigenvaluesB;
	%
	% storage allocation
	aiOriginalFirstIndex	= zeros( iTotalNumberOfEigenvalues, 1 );
	aiOriginalSecondIndex	= zeros( iTotalNumberOfEigenvalues, 1 );
	afAllTheCouples			= zeros( iTotalNumberOfEigenvalues, 1 );
	%
	%
	% --------------------------------------------------------------------------
	% actual algorithm
	%
	for iEigenvalue = 1:( iTotalNumberOfEigenvalues );
		%
		iAIndex = ceil( iEigenvalue / iNumberOfEigenvaluesB );
		iBIndex = iEigenvalue - ( (iAIndex - 1) * iNumberOfEigenvaluesB );
		%
		afAllTheCouples( iEigenvalue ) =	...
				afEigenvaluesA( iAIndex )	...
			*	afEigenvaluesB( iBIndex );
		%
	end;%
	%
	[afEigenvalues, aiIndexes] = sort( afAllTheCouples, 'descend' );
	%
	for iEigenvalue = 1:( iTotalNumberOfEigenvalues );
		%
		aiOriginalFirstIndex(iEigenvalue)	= ceil( aiIndexes(iEigenvalue) / iNumberOfEigenvaluesB );
		aiOriginalSecondIndex(iEigenvalue)	= aiIndexes(iEigenvalue) - ( (aiOriginalFirstIndex(iEigenvalue) - 1) * iNumberOfEigenvaluesB );
		%
	end;%
	%
end %
