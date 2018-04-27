function ExportBoundsForTikZ( boundA, boundB, alpha, epsilonA, epsilonB, sigma2, M, k, kernel )
	%
	% auxiliary variables
	EE = (1:numel(boundA))';
	%
	% create the directory if it does not exist
	strSubFolder = sprintf( '../../Article/Data/Bounds.%s/', kernel );
	%
	if( ~exist( strSubFolder, 'dir' ) )
		%
		mkdir( strSubFolder );
		%
	end;%
	%
	% compute the names of the files
	strFilename = strcat( strSubFolder, sprintf( 'Bound.alpha%.3f.sigma2%.3f.M%d.k%.3f.txt', alpha, sigma2, M, k) );
	%
	aafSignals =					...
		[	EE,						...
	   		boundA',				...
	   		boundB',				...
	   		epsilonA'				...
	   		epsilonB'				];
	%
	astrHeader = [ {'E'}, {'boundA'}, {'boundB'}, {'epsilonA'}, {'epsilonB'} ];
	%
	MatlabToTikZ.ExportLineplot(	strFilename,	...
									aafSignals,		...
									astrHeader		);
	%
	figure(81216)
	plot(EE, boundA, 'r');
	hold on;
	plot(EE, boundB, 'b');
	legend('bound A', 'bound B');
	xlabel('E')
	ylabel('bound value')
	title(sprintf('alpha = %.3f, sigma2 = %.3f, M = %d, k = %.3f', alpha, sigma2, M, k));
	hold off;
	print('-depsc2', strcat(strFilename, '.bounds.eps'));
	%
	figure(81217)
	plot(EE, epsilonA, 'r');
	hold on;
	plot(EE, epsilonB, 'b');
	legend('epsilon A', 'epsilon B');
	xlabel('E')
	ylabel('epsilon value')
	title(sprintf('alpha = %.3f, sigma2 = %.3f, M = %d, k = %.3f', alpha, sigma2, M, k));
	hold off;
	print('-depsc2', strcat(strFilename, '.epsilons.eps'));
	%
end %

