a = 0.0000000000001;
b = 0.0000000000001;

% initialization
E = [];
EBound = [];
MM = 1:1000;

% initial condition for computing the root of the equality
E0 = 100;
EBound0 = 100;

for M = MM;
	%
	if( M == 1 )
		%
		E(M) = 1;
		EBound(M) = 1;
		%
	else%
		%
		E(M) = fsolve( @(E) EMRuleForConsistencyOfEstimatorB( a, b, M, E, k ), E0, optimset( 'Display', 'off' ) );
		EBound(M) = fsolve( @(E) EMSpeedBoundForConsistencyOfEstimatorB( a, b, M, E, k ), EBound0, optimset( 'Display', 'off' ) );
		%
	end;%
	%
end;%


figure(123)
hold on
plot(MM, E, 'k');
plot(MM, EBound, 'r');
title(sprintf('a = %.3f   b = %.3f', a, b));
xlabel('M');
ylabel('E');


% export the plot
strFilename = sprintf('../../Article/Data/ConsistencyOfFB/a%.3f_b%.3f.txt', a, b);
MatlabToTikZ.ExportLineplot(			...
	strFilename,						...
	[	MM',							...
		E',								...
		EBound'		],					...
	[	{'M'},							...
		{'E'},							...
		{'EBound'}	],					...
	1,									... sampling rate
	10									);% precision


