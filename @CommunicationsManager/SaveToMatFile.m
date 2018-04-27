function SaveToMatFile( tCommunicationsManager, strFileName ) %#ok<INUSL>
	%
	save(	strFileName,				...
			'tCommunicationsManager',	...
			'-V6'); % saving format
	%
	fprintf( 'Communications protocol saved to file %s\n', strFileName );
	%
end %
