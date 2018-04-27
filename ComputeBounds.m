function [boundA, boundB] = ComputeBounds(alpha, M, E, k, sigma2, tKernelParameters)
	%
	% initialization
	boundAEps = [];
	boundBEps = [];
	%
	epsilonIndex = 0;
	for epsilon = 0.001:0.001:0.999;
		epsilonIndex = epsilonIndex + 1;
		%
		boundAEps(epsilonIndex) = ComputeErrorBoundA( alpha, epsilon, M, E, k, sigma2, tKernelParameters );
		boundBEps(epsilonIndex) = ComputeErrorBoundB( alpha, epsilon, M, E, k, sigma2, tKernelParameters );
		%
		% check if the bound is valid
		if( EpsilonAlphaRuleForEstimatorA( epsilon, alpha, M, E, k ) < 0 )
			boundAEps(epsilonIndex) = Inf;
		end;%
		if( EpsilonAlphaRuleForEstimatorB( epsilon, alpha, M, E, k ) < 0 )
			boundBEps(epsilonIndex) = Inf;
		end;%
		%
	end;%
	%
	boundA = min( boundAEps(:) );
	boundB = min( boundBEps(:) );
	%
	% DEBUG
% 	figure(M + E)
% 	hold on;
% 	plot(1:Emax, boundA / sum(tKernelParameters.afEigenvalues), 'r');
% 	plot(1:Emax, boundB / sum(tKernelParameters.afEigenvalues), 'b');
% 	legend('bound A', 'bound B');
% 	xlabel('E')
% 	ylabel('bound')
% 	title(sprintf('M%d alpha%.3f epsilon%.3f sigma2%.3f', M, alpha, epsilon, sigma2));
% 	hold off;
	%
% 	% export the bounds
% 	if( bExportResults )
% 		strFilename = sprintf('../../ArticleJournal/Data/Bounds/normalized_bounds_M%d_alpha%.3f_sigma2%.3f.txt', M, alpha, sigma2);
% 		MatlabToTikZ.ExportLineplot(			...
% 			strFilename,						...
% 			[	(1:Emax)',						...
% 				boundA' / sum(tKernelParameters.afEigenvalues),					...
% 				boundB' / sum(tKernelParameters.afEigenvalues)			],		...
% 			[	{'EigenvalueIndex'},			...
% 				{'BoundA'},						...
% 				{'BoundB'}	],					...
% 			1,									... sampling rate
% 			10									);% precision
% 	end;% if export results
	%
end % function

% % DEBUG
% EE = [1:10:100];
% M = 10;
% epsilon = 0.001
% figure(1)
% plot( EE, EpsilonAlphaRuleForEstimatorA( epsilon, alpha, M, EE, k ) );
% xlabel('E')
% ylabel('EpsilonAlphaRuleForEstimatorA')
% grid on;
% figure(2)
% plot( EE, EpsilonAlphaRuleForEstimatorB( epsilon, alpha, M, EE, k ) );
% xlabel('E')
% ylabel('EpsilonAlphaRuleForEstimatorB')
% grid on;

