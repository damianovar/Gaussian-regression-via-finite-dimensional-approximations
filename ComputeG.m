function G  = ComputeG( ffInputLocations, E, tNystromComputer )
	%
	% computation of the auxiliary variables
	M = numel( ffInputLocations(:, 1) );
	%
	% storage allocation
	G = zeros( M, E );
	%
	for m = 1:M;
	for e = 1:E;
			%
			G(m, e) = SampleBasisfunctionUsingNystrom( ffInputLocations(m, :), e, tNystromComputer );
			%
	end;% cycle on e
	end;% cycle on m
	%
end %

