% original signal input domain:
%     a -----C------------------ b
%
% stretched signal input domain:
%             x --Z--------- y
%
%
% a, b, x, y: boundaries of the input domains
% Z, C: points inside the input domains
%
% relationship:
%
%  a - C     x - Z                        x - Z
% ------- = -------    = C = a - (a - B)*-------
%  a - B     x - y                        x - y
%
%
function afStretchedSignal = StretchSignal(	afOriginalSignal,		...
											afOriginalSignalDomain,	...
											afStretchedSignalDomain	)
	%
	%
	% for readability (see the explaination above)
	fA = afOriginalSignalDomain(1);
	fB = afOriginalSignalDomain( numel(afOriginalSignalDomain) );
	fX = afStretchedSignalDomain(1);
	fY = afStretchedSignalDomain( numel(afStretchedSignalDomain) );
	%
	%
	% storage allocation
	afStretchedSignal = zeros( size(afStretchedSignalDomain) );
	%
	%
	for iStretchedSignalInputLocationIndex = 1:numel( afStretchedSignalDomain );
		%
		%
		fZ = afStretchedSignalDomain( iStretchedSignalInputLocationIndex );
		%
		fC = fA - ( fA - fB ) * (  (fX - fZ) / (fX - fY)  );
		%
		afStretchedSignal(iStretchedSignalInputLocationIndex) = ...
			SampleSignalAt( afOriginalSignal, afOriginalSignalDomain, fC );
		%
		%
	end;%
	%
	%
end %
