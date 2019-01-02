"
This class is used to load Chalten from github repository
"
Class {
	#name : #BaselineOfChalten,
	#superclass : #BaselineOf,
	#category : 'BaselineOfChalten'
}

{ #category : #baselines }
BaselineOfChalten >> baseline: spec [

	<baseline>
	spec
		for: #common
		do: [ self setUpDependencies: spec.
			spec
				package: 'Chalten-Core-Time' with: [ spec requires: 'Aconcagua' ];
				package: 'Chalten-Core-Filter' with: [ spec requires: 'Chalten-Core-Time' ];
				package: 'Chalten-Core-Hebrew' with: [ spec requires: 'Chalten-Core-Time' ];
				package: 'Chalten-Core-Islamic' with: [ spec requires: 'Chalten-Core-Time' ];
				package: 'Chalten-Core-Roman' with: [ spec requires: 'Chalten-Core-Time' ];
				package: 'Chalten-Core-Gregorian' with: [ spec requires: 'Chalten-Core-Roman' ];
				package: 'Chalten-Core-Julian' with: [ spec requires: 'Chalten-Core-Roman' ].
			spec
				package: 'Chalten-Tests-Time' with: [ spec requires: 'Chalten-Core-Time' ];
				package: 'Chalten-Tests-Filter' with: [ spec requires: 'Chalten-Core-Filter' ];
				package: 'Chalten-Tests-Hebrew' with: [ spec requires: 'Chalten-Core-Hebrew' ];
				package: 'Chalten-Tests-Islamic' with: [ spec requires: 'Chalten-Core-Islamic' ];
				package: 'Chalten-Tests-Roman' with: [ spec requires: 'Chalten-Core-Roman' ];
				package: 'Chalten-Tests-Gregorian' with: [ spec requires: 'Chalten-Core-Gregorian' ];
				package: 'Chalten-Tests-Julian' with: [ spec requires: 'Chalten-Core-Julian' ].

			spec
				group: 'Chalten-Core' with: #('Chalten-Core-Time' 'Chalten-Core-Filter');
				group: 'Chalten-Calendars'
					with: #('Chalten-Core-Gregorian' 'Chalten-Core-Hebrew' 'Chalten-Core-Islamic' 'Chalten-Core-Roman' 'Chalten-Core-Julian');
				group: 'Chalten-Tests' with: #('Chalten-Tests-Time' 'Chalten-Tests-Filter');
				group: 'Chalten-Calendars-Tests'
					with: #('Chalten-Tests-Gregorian' 'Chalten-Tests-Hebrew' 'Chalten-Tests-Islamic' 'Chalten-Tests-Roman' 'Chalten-Tests-Julian').

			spec
				group: 'Development' with: #('Chalten-Tests' 'Chalten-Calendars-Tests');
				group: 'default' with: #('Development').
			spec postLoadDoIt: #postLoadInitialization ]
]

{ #category : #'post load' }
BaselineOfChalten >> postLoadInitialization [

	ChaltenEnvironmentBehavior initializeAfterLoad.
	TimeUnitsGlobals initializeAfterLoad.
	CalendarDefinition allSubclassesDo: [ :each | each subclasses ifEmpty: [ each initializeAfterLoad ] ].
	TimeOfDay initializeAfterLoad.
	TimeZonesGlobals initializeAfterLoad
]

{ #category : #baselines }
BaselineOfChalten >> setUpDependencies: aSpec [

	aSpec
		baseline: 'Aconcagua'
		with: [ aSpec
				repository: 'github://ba-st/Aconcagua:v7/repository';
				loads: #('Deployment') ]
]
