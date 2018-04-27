% FA
[fCurrentTestRSSFAPlusOracle,	iBestGammaIndexAccordingToOracleForFAForRSS]	= min(afTestRSSsFA);
[fCurrentTestFitFAPlusOracle,	iBestGammaIndexAccordingToOracleForFAForFit]	= max(afTestFitsFA);
[fCurrentTestCEFAPlusOracle,	iBestGammaIndexAccordingToOracleForFAForCE]		= min(afTestCEsFA);

% FB
[fCurrentTestRSSFBPlusOracle,	iBestTempIndexAccordingToOracleForFBForRSS]		= min(aafTestRSSsFB(:));
[fCurrentTestFitFBPlusOracle,	iBestTempIndexAccordingToOracleForFBForFit]		= max(aafTestFitsFB(:));
[fCurrentTestCEFBPlusOracle,	iBestTempIndexAccordingToOracleForFBForCE]		= min(aafTestCEsFB(:));
%
[iBestGammaIndexAccordingToOracleForFBForRSS,	iBestEIndexAccordingToOracleForFBForRSS] =	...
	ind2sub(size(aafTestRSSsFB), iBestTempIndexAccordingToOracleForFBForRSS);
[iBestGammaIndexAccordingToOracleForFBForFit,	iBestEIndexAccordingToOracleForFBForFit] =	...
	ind2sub(size(aafTestFitsFB), iBestTempIndexAccordingToOracleForFBForFit);
[iBestGammaIndexAccordingToOracleForFBForCE,	iBestEIndexAccordingToOracleForFBForCE] =	...
	ind2sub(size(aafTestCEsFB), iBestTempIndexAccordingToOracleForFBForCE);

% SURE FA
[~, iBestGammaIndexAccordingToSUREForFA] = min(afSURERisksFA);
%
fCorrespondingTestFitFAPlusSURE	= afTestFitsFA(iBestGammaIndexAccordingToSUREForFA);
fCorrespondingTestCEFAPlusSURE	= afTestCEsFA (iBestGammaIndexAccordingToSUREForFA);

% SURE FB
[~, iBestTempIndexAccordingToSUREForFB] = min(aafSURERisksFB(:));
%
[iBestGammaIndexAccordingToSUREForFB,	iBestEIndexAccordingToSUREForFB] =	...
	ind2sub(size(aafSURERisksFB), iBestTempIndexAccordingToSUREForFB);


% save the current performance index if it is the best one for FA
if fBestTestRSSFAPlusOracle > fCurrentTestRSSFAPlusOracle;
	%
	fBestTestRSSFAPlusOracle		= fCurrentTestRSSFAPlusOracle;
	fCorrespondingTestRSSFAPlusSURE	= afTestRSSsFA(iBestGammaIndexAccordingToSUREForFA);
	%
	fBestGammaAccordingToOracleForFAForRSS	= afPotentialGammasFA(iBestGammaIndexAccordingToOracleForFAForRSS);
	fBestGammaAccordingToSUREForFAForRSS	= afPotentialGammasFA(iBestGammaIndexAccordingToSUREForFA);
	%
	iBestKernelTypeForTestRSSFAPlusOracle			= iKernelType;
	iBestKernelVarianceIndexForTestRSSFAPlusOracle	= iKernelVarianceIndex;
	%
end;%
%
if fBestTestFitFAPlusOracle < fCurrentTestFitFAPlusOracle;
	%
	fBestTestFitFAPlusOracle		= fCurrentTestFitFAPlusOracle;
	fCorrespondingTestFitFAPlusSURE	= afTestFitsFA(iBestGammaIndexAccordingToSUREForFA);
	%
	fBestGammaAccordingToOracleForFAForFit	= afPotentialGammasFA(iBestGammaIndexAccordingToOracleForFAForFit);
	fBestGammaAccordingToSUREForFAForFit	= afPotentialGammasFA(iBestGammaIndexAccordingToSUREForFA);
	%
	iBestKernelTypeForTestFitFAPlusOracle			= iKernelType;
	iBestKernelVarianceIndexForTestFitFAPlusOracle	= iKernelVarianceIndex;
	%
end;%
%
if fBestTestCEFAPlusOracle > fCurrentTestCEFAPlusOracle;
	%
	fBestTestCEFAPlusOracle			= fCurrentTestCEFAPlusOracle;
	fCorrespondingTestCEFAPlusSURE	= afTestCEsFA(iBestGammaIndexAccordingToSUREForFA);
	%
	fBestGammaAccordingToOracleForFAForCE	= afPotentialGammasFA(iBestGammaIndexAccordingToOracleForFAForCE);
	fBestGammaAccordingToSUREForFAForCE		= afPotentialGammasFA(iBestGammaIndexAccordingToSUREForFA);
	%
	iBestKernelTypeForTestCEFAPlusOracle			= iKernelType;
	iBestKernelVarianceIndexForTestCEFAPlusOracle	= iKernelVarianceIndex;
	%
end;%


% save the current performance index if it is the best one for FB
if fBestTestRSSFBPlusOracle > fCurrentTestRSSFBPlusOracle;
	%
	fBestTestRSSFBPlusOracle		= fCurrentTestRSSFBPlusOracle;
	fCorrespondingTestRSSFBPlusSURE	= aafTestRSSsFB(iBestGammaIndexAccordingToSUREForFB,	...
													iBestEIndexAccordingToSUREForFB			);
	%
	fBestGammaAccordingToOracleForFBForRSS	= afPotentialGammasFB(iBestGammaIndexAccordingToOracleForFBForRSS);
	fBestGammaAccordingToSUREForFBForRSS	= afPotentialGammasFB(iBestGammaIndexAccordingToSUREForFB);
	%
	iBestEAccordingToOracleForFBForRSS	= aiPotentialEs(iBestEIndexAccordingToOracleForFBForRSS);
	iBestEAccordingToSUREForFBForRSS	= aiPotentialEs(iBestEIndexAccordingToSUREForFB);
	%
	iBestKernelTypeForTestRSSFBPlusOracle			= iKernelType;
	iBestKernelVarianceIndexForTestRSSFBPlusOracle	= iKernelVarianceIndex;
	%
end;%
%
if fBestTestFitFBPlusOracle < fCurrentTestFitFBPlusOracle;
	%
	fBestTestFitFBPlusOracle		= fCurrentTestFitFBPlusOracle;
	fCorrespondingTestFitFBPlusSURE	= aafTestFitsFB(iBestGammaIndexAccordingToSUREForFB,	...
													iBestEIndexAccordingToSUREForFB			);
	%
	fBestGammaAccordingToOracleForFBForFit	= afPotentialGammasFB(iBestGammaIndexAccordingToOracleForFBForFit);
	fBestGammaAccordingToSUREForFBForFit	= afPotentialGammasFB(iBestGammaIndexAccordingToSUREForFB);
	%
	iBestEAccordingToOracleForFBForFit	= aiPotentialEs(iBestEIndexAccordingToOracleForFBForFit);
	iBestEAccordingToSUREForFBForFit	= aiPotentialEs(iBestEIndexAccordingToSUREForFB);
	%
	iBestKernelTypeForTestFitFBPlusOracle			= iKernelType;
	iBestKernelVarianceIndexForTestFitFBPlusOracle	= iKernelVarianceIndex;
	%
end;%
%
if fBestTestCEFBPlusOracle > fCurrentTestCEFBPlusOracle;
	%
	fBestTestCEFBPlusOracle			= fCurrentTestCEFBPlusOracle;
	fCorrespondingTestCEFBPlusSURE	= aafTestCEsFB(iBestGammaIndexAccordingToSUREForFB,		...
													iBestEIndexAccordingToSUREForFB			);
	%
	fBestGammaAccordingToOracleForFBForCE	= afPotentialGammasFB(iBestGammaIndexAccordingToOracleForFBForCE);
	fBestGammaAccordingToSUREForFBForCE		= afPotentialGammasFB(iBestGammaIndexAccordingToSUREForFB);
	%
	iBestEAccordingToOracleForFBForCE	= aiPotentialEs(iBestEIndexAccordingToOracleForFBForCE);
	iBestEAccordingToSUREForFBForCE		= aiPotentialEs(iBestEIndexAccordingToSUREForFB);
	%
	iBestKernelTypeForTestCEFBPlusOracle			= iKernelType;
	iBestKernelVarianceIndexForTestCEFBPlusOracle	= iKernelVarianceIndex;
	%
end;%

