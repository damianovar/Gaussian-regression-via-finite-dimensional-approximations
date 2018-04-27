function SaveToMatFile( tNode, strDirectory )
	%
	strFileName = tNode.GetIDString( strDirectory );
	%
	save(	strFileName,				...
			'tNode',					...
			'-V6'); % saving format
	%
	fprintf( 'Node %d saved to file %s\n', tNode.iLabel, strFileName );
	%
end %
