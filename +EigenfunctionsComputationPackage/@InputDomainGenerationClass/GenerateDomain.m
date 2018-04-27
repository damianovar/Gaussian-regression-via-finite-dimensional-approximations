% usage examples:
%
% - monodimensional domain:
% tDomain = GenerateDomain( linspace(0,1,10) );
%
% - bidimensional domain:
% tDomain = GenerateDomain( linspace(0,1,10), linspace(-1,3,100) );
%
% - tridimensional domain:
% tDomain = GenerateDomain( linspace(0,1,10), linspace(-1,3,100), linspace(2,2.3,20) );
%
%
function tDomain = GenerateDomain( tParameters )
	%
	tDomain = EigenfunctionsComputationPackage.InputDomainGenerationClass( tParameters );
	%
end %



