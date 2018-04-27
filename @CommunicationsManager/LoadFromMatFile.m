function tCommunicationsManager = LoadFromMatFile( strFileName ) 
	%
	tLoadedStructure = load( strFileName );
	%
	tCommunicationsManager = tLoadedStructure.tCommunicationsManager;
	%
	tCommunicationsManager.bLoadFromFile = true;
	%
	fprintf('Network and communication protocol loaded from file\n');
	%
end %
