% convention:
% - aafEigenfunctions( iSampleIndex, iEigenfunctionIndex )
% - aaafEigenfunctions( iSampleAIndex, iSampleBIndex, iEigenfunctionIndex )
%
function Compute2DEigenfunctions(					...
				tComputer,							...
				aafEigenfunctionsA,					...
				aafEigenfunctionsB,					...
				aiOriginalIndexesInDimension1,		...
				aiOriginalIndexesInDimension2		)
	%
	%
	% for readability
	iNumberOfSamplesOfDomainA		= numel( aafEigenfunctionsA(:,1) );
	iNumberOfSamplesOfDomainB		= numel( aafEigenfunctionsB(:,1) );
	iNumberOfEigenfunctionsA		= numel( aafEigenfunctionsA(1,:) );
	iNumberOfEigenfunctionsB		= numel( aafEigenfunctionsB(1,:) );
	iTotalNumberOfEigenfunctions	= iNumberOfEigenfunctionsA * iNumberOfEigenfunctionsB;
	%
	%
	% storage allocation
	tComputer.ffEigenfunctions = zeros( iNumberOfSamplesOfDomainA,	...
										iNumberOfSamplesOfDomainB,	...
										iTotalNumberOfEigenfunctions	);
	%
	%
	% compute the eigenfunctions
	for iEigenfunction = 1:iTotalNumberOfEigenfunctions;
		%
		iEigenfunctionIndexInA = aiOriginalIndexesInDimension1( iEigenfunction );
		iEigenfunctionIndexInB = aiOriginalIndexesInDimension2( iEigenfunction );
		%
		for iSampleInA = 1:iNumberOfSamplesOfDomainA;
			%
			for iSampleInB = 1:iNumberOfSamplesOfDomainB;
				%
				tComputer.ffEigenfunctions( iSampleInA, iSampleInB, iEigenfunction ) =		...
								aafEigenfunctionsA( iSampleInA, iEigenfunctionIndexInA )	...
							*	aafEigenfunctionsB( iSampleInB, iEigenfunctionIndexInB );
				%
			end;%
			%
		end;%
		%
	end;%
	%
end %

