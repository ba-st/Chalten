baselines
setUpDependencies: aSpec

	aSpec
		baseline: 'Aconcagua'
		with: [ aSpec
				repository: 'github://ba-st/Aconcagua:master/repository';
				loads: #('Deployment') ]