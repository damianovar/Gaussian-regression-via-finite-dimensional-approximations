function [epsilonA, epsilonB] = ComputeEpsilon( alpha, M, E, k )
	%
	% initial guess, much bigger than one so that we go towards the biggest root of the equation
	epsilon0 = 20;
	%
	% find the root
	epsilonA = fsolve( @(epsilonA) EpsilonAlphaRuleForEstimatorA( epsilonA, alpha, M, E, k ), epsilon0, optimset( 'Display', 'off' ) );
	%
	% check if the root is in the right interval
	if( epsilonA <= 0 )
		%
		fprintf('found an epsilonA that is smaller than 0: M = %d, E = %d, alpha = %.3f\n', M, E, alpha);
		%
	end;%
	%
	% initial guess for case B
	epsilonB = 20;
	%
	epsilonB = fsolve( @(epsilonB) EpsilonAlphaRuleForEstimatorB( epsilonB, alpha, M, E, k ), epsilon0, optimset( 'Display', 'off' ) );
	%
	% check if the root is in the right interval
	if( epsilonB <= 0 )
		%
		fprintf('found an epsilonB that is smaller than 0: M = %d, E = %d, alpha = %.3f\n', M, E, alpha);
		%
	end;%
	%
	% DEBUG
	% afEpsilons = [0.01:0.01:0.99];
	% figure(1)
	% plot( afEpsilons, EpsilonAlphaRuleForEstimatorA( afEpsilons, alpha, M, E, k ) );
	% xlabel('epsilon A')
	% ylabel('EpsilonAlphaRuleForEstimatorA')
	% grid on;
	% figure(2)
	% plot( afEpsilons, EpsilonAlphaRuleForEstimatorB( afEpsilons, alpha, M, E, k ) );
	% xlabel('epsilon B')
	% ylabel('EpsilonAlphaRuleForEstimatorB')
	% grid on;
	%
end % 

