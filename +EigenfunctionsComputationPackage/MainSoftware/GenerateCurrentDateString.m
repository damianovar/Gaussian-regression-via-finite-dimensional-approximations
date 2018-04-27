%
% function strCurrentDate = GenerateCurrentDateString()
%
%
% returns a formatted string containing the current date. Example:
% '2009_02_17__21_21_32'
%
function strCurrentDate = GenerateCurrentDateString()
	%
	aiCurrentDate = fix(clock);
	%
	iYear	= aiCurrentDate(1);
	iMonth	= aiCurrentDate(2);
	iDay	= aiCurrentDate(3);
	iHour	= aiCurrentDate(4);
	iMinute	= aiCurrentDate(5);
	iSecond	= aiCurrentDate(6);
	%
	if( iMonth < 10 )
		%
		strMonth = sprintf('0%d', iMonth);
		%
	else%
		%
		strMonth = sprintf('%d', iMonth);
		%
	end;%
	%
	if( iDay < 10 )
		%
		strDay = sprintf('0%d', iDay);
		%
	else%
		%
		strDay = sprintf('%d', iDay);
		%
	end;%
	%
	if( iHour < 10 )
		%
		strHour = sprintf('0%d', iHour);
		%
	else%
		%
		strHour = sprintf('%d', iHour);
		%
	end;%
	%
	if( iMinute < 10 )
		%
		strMinute = sprintf('0%d', iMinute);
		%
	else%
		%
		strMinute = sprintf('%d', iMinute);
		%
	end;%
	%
	if( iSecond < 10 )
		%
		strSecond = sprintf('0%d', iSecond);
		%
	else%
		%
		strSecond = sprintf('%d', iSecond);
		%
	end;%
	%
	strCurrentDate =					...
		sprintf('%d_%s_%s__%s_%s_%s',	...
			iYear,						...
			strMonth,					...
			strDay,						...
			strHour,					...
			strMinute,					...
			strSecond	);
	%
end	%
