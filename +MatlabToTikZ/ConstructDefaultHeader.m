function astrHeader = 					...
			ConstructDefaultHeader(		...
				aafSignals				)
	%
	% for readability
	iNumberOfSignals 	= size( aafSignals, 2 );
	%
	% if the number of signals is 1, then add the "fake" x
	if( iNumberOfSignals == 1 )
		%
		iNumberOfSignals = 2;
		%
	end;%
	%
	astrHeader{1} = 'x';
	%
	% add yn, in case
	for iSignal = 2:iNumberOfSignals;
		%
		astrHeader{iSignal} = sprintf('y%d', iSignal - 1);
		%
	end;%
	%
end % function

