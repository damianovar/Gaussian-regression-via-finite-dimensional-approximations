function ExportAlphaForTikZ( afAlphas, afEpsilons, M, E, k, kernel )
	%
	% create the directory if it does not exist
	strSubFolder = sprintf( '../../Article/Data/Alpha.%s/', kernel );
	%
	if( ~exist( strSubFolder, 'dir' ) )
		%
		mkdir( strSubFolder );
		%
	end;%
	%
	% compute the names of the files
	strFilename = strcat( strSubFolder, sprintf( 'Alphas.M%d.E%d.k%.3f.txt', M, E, k) );
	%
	aafSignals =					...
		[	afAlphas',				...
	   		afEpsilons'				];
	%
	astrHeader = [ {'alphas'}, {'epsilons'} ];
	%
	MatlabToTikZ.ExportLineplot(	strFilename,	...
									aafSignals,		...
									astrHeader		);
	%
	figure(89836)
	plot(afEpsilons, afAlphas, 'r');
	xlabel('epsilon')
	ylabel('alpha')
	title(sprintf('M = %d, E = %d, k = %.3f', M, E, k));
	hold off;
	print('-depsc2', strcat(strFilename, '.eps'));
	%
end %

