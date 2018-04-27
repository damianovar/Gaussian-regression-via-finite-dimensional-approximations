function fInterpolatedValue = InterpolateSignalAt(			...
								fInterpolatedSampleIndex,	...
								afOriginalSignal)
	%
	%
	iFlooredSampleIndex	= floor(fInterpolatedSampleIndex);
	iCeiledSampleIndex	= ceil(fInterpolatedSampleIndex);
	%
	%
	% validity checks:
	if(		iFlooredSampleIndex < 1							...
		||	iCeiledSampleIndex > numel(afOriginalSignal)	)
		%
		fInterpolatedValue = 0;
		return;
		%
	end;%
	%
	%
	% we calculate the value of the Signal at the two integer input
	% locations
	fFlooredOutputLocation	= afOriginalSignal( iFlooredSampleIndex );
	fCeiledOutputLocation	= afOriginalSignal( iCeiledSampleIndex );
	%
	% linear interpolation
	%                                   f(x_ceil) - f(x_floor)
	% f(x_interpolated) = f(x_floor) + ------------------------ * (x_interpolated - x_floor)
	%                                      x_ceil - x_floor 
	%
	if(  iCeiledSampleIndex == iFlooredSampleIndex  )
		%
		fInterpolatedValue = fFlooredOutputLocation;
		%
	else%
		%
		fInterpolatedValue =											...
			fFlooredOutputLocation										...
			+															...
			(															...
				( fCeiledOutputLocation - fFlooredOutputLocation )		...
				/														...
				( iCeiledSampleIndex - iFlooredSampleIndex )			...
			)															...
			*															...
			( fInterpolatedSampleIndex - iFlooredSampleIndex );
		%
	end;%
	%
end	%
