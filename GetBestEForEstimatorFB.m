function E = GetBestEForEstimatorFB(alpha, M, Emax, k, sigma2, tKernelParameters)
	%
	for Eguess = 1:Emax;
		%
		% initialization
		boundBEps = [];
		%
		epsilonIndex = 0;
		for epsilon = 0.001:0.001:0.999;
			epsilonIndex = epsilonIndex + 1;
			%
			boundBEps(epsilonIndex) = ComputeErrorBoundB( alpha, epsilon, M, Eguess, k, sigma2, tKernelParameters );
			%
			% check if the bound is valid
			if( EpsilonAlphaRuleForEstimatorB( epsilon, alpha, M, Eguess, k ) < 0 )
				boundBEps(epsilonIndex) = 999999999;
			end;%
			%
		end;%
		%
		boundB(Eguess) = min( boundBEps(:) );
		%
	end;%
	%
	[bestBound, E] = min(boundB);
	%
end % function

