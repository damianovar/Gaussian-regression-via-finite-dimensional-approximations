function tNode = LoadFromMatFile( strFileName ) 
	%
	tLoadedStructure = load( strFileName );
	%
	tNode = tLoadedStructure.tNode;
	%
end %
