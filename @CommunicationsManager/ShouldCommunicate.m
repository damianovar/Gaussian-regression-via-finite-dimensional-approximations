% returns true or false
%
% criterion: 
% IF
%     blablabla
% THEN
%     you should not communicate anymore
%
function bShouldCommunicate = ShouldCommunicate( tCommunicationsManager )
	%
	%
 	if(	tCommunicationsManager.iCurrentTime > 10 )
		%
		bShouldCommunicate = false;
		%
	else%
		%
		bShouldCommunicate = true;
		%
	end;%
	%
	%
end %
