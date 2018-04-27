function [ EmaxForFA, EmaxForFB ] = ComputeE( alpha, epsilon, M, k )
	%
	% initial guess, much bigger than one so that we go towards the biggest root of the equation
	EmaxForFA0 = 1000;
	%
	% find the root
	EmaxForFA = fsolve( @(EmaxForFA) EpsilonAlphaRuleForEstimatorA( epsilon, alpha, M, EmaxForFA, k ), EmaxForFA0, optimset( 'Display', 'off' ) );
	%
	% check if the root is in the right interval
	if( EmaxForFA < 1 )
		%
		fprintf('found an EmaxForFA that is smaller than 1: M = %d, epsilon = %d, alpha = %.3f\n', M, epsilon, alpha);
		%
	end;%
	%
	%
	% initial guess, much bigger than one so that we go towards the biggest root of the equation
	EmaxForFB0 = 1000;
	%
	% find the root
	EmaxForFB = fsolve( @(EmaxForFB) EpsilonAlphaRuleForEstimatorB( epsilon, alpha, M, EmaxForFB, k ), EmaxForFB0, optimset( 'Display', 'off' ) );
	%
	% check if the root is in the right interval
	if( EmaxForFB < 1 )
		%
		fprintf('found an EmaxForFB that is smaller than 1: M = %d, epsilon = %d, alpha = %.3f\n', M, epsilon, alpha);
		%
	end;%
	%
	%
	% DEBUG
	% EE = [1:1:100];
	% figure(1)
	% plot( EE, EpsilonAlphaRuleForEstimatorA( epsilon, alpha, M, EE, k ) );
	% xlabel('epsilon')
	% ylabel('EpsilonAlphaRuleForEstimatorA')
	% grid on;
	% figure(2)
	% plot( EE, EpsilonAlphaRuleForEstimatorB( epsilon, alpha, M, EE, k ) );
	% xlabel('epsilon')
	% ylabel('EpsilonAlphaRuleForEstimatorB')
	% grid on;
	%
end % 

