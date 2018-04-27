function t1DParameters = GetParametersOfDimension( iDimension, tParameters )
	%
	t1DParameters	= tParameters;
	%
	t1DParameters.iInputDomainDimension			= 1;
	%
	t1DParameters.cInputDomain					= tParameters.cInputDomain( iDimension );
	t1DParameters.cExponentialMeasureParameters	= tParameters.cExponentialMeasureParameters( iDimension );
	t1DParameters.cGaussianMeasureParameters	= tParameters.cGaussianMeasureParameters( iDimension );
	%
end %
