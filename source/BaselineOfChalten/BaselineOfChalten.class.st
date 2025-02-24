"
This class is used to load Chalten from github repository
"
Class {
	#name : 'BaselineOfChalten',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfChalten',
	#package : 'BaselineOfChalten'
}

{ #category : 'baselines' }
BaselineOfChalten >> baseline: spec [

	<baseline>
	spec
		for: #pharo
		do: [ self setUpDependencies: spec.
			spec
				package: 'Chalten-Core' with: [ spec requires: 'Aconcagua-Deployment' ];
				package: 'Chalten-Core-Aconcagua-Extensions' with: [ spec requires: 'Chalten-Core' ];
				package: 'Chalten-Core-Base-Extensions' with: [ spec requires: 'Chalten-Core' ];
				package: 'Chalten-Core-Pharo-Extensions' with: [
					spec requires:
						#( 'Chalten-Core' 'Buoy-Deployment' 'Chalten-Gregorian-Calendar'
						   'Chalten-Roman-Calendar' ) ];
				package: 'Chalten-Gregorian-Calendar' with: [ spec requires: 'Chalten-Roman-Calendar' ];
				package: 'Chalten-Hebrew-Calendar' with: [ spec requires: 'Chalten-Core' ];
				package: 'Chalten-Islamic-Calendar' with: [ spec requires: 'Chalten-Core' ];
				package: 'Chalten-Julian-Calendar' with: [ spec requires: 'Chalten-Roman-Calendar' ];
				package: 'Chalten-Roman-Calendar' with: [ spec requires: 'Chalten-Core' ].

			spec
				package: 'Chalten-Core-Tests' with: [ spec requires: #('Chalten-Core' 'Buoy-SUnit') ];
				package: 'Chalten-Hebrew-Calendar-Tests' with: [ spec requires: 'Chalten-Hebrew-Calendar' ];
				package: 'Chalten-Islamic-Calendar-Tests' with: [ spec requires: 'Chalten-Islamic-Calendar' ];
				package: 'Chalten-Roman-Calendar-Tests' with: [ spec requires: 'Chalten-Roman-Calendar' ];
				package: 'Chalten-Gregorian-Calendar-Tests'
					with: [ spec requires: 'Chalten-Gregorian-Calendar' ];
				package: 'Chalten-Julian-Calendar-Tests' with: [ spec requires: 'Chalten-Julian-Calendar' ].

			spec
				group: 'Chalten-Calendars'
					with:
					#('Chalten-Gregorian-Calendar' 'Chalten-Hebrew-Calendar' 'Chalten-Islamic-Calendar' 'Chalten-Julian-Calendar' 'Chalten-Roman-Calendar');
				group: 'Chalten-Calendars-Tests'
					with:
					#('Chalten-Gregorian-Calendar-Tests' 'Chalten-Hebrew-Calendar-Tests' 'Chalten-Islamic-Calendar-Tests' 'Chalten-Julian-Calendar-Tests' 'Chalten-Roman-Calendar-Tests').

			spec
				group: 'Deployment' with: #('Chalten-Core' 'Chalten-Core-Aconcagua-Extensions' 'Chalten-Core-Base-Extensions' 'Chalten-Core-Pharo-Extensions' 'Chalten-Calendars');
				group: 'Deployment-Gregorian' with: #('Chalten-Core' 'Chalten-Core-Aconcagua-Extensions' 'Chalten-Core-Base-Extensions' 'Chalten-Core-Pharo-Extensions' 'Chalten-Gregorian-Calendar');
				group: 'Tests' with: #('Deployment' 'Chalten-Core-Tests' 'Chalten-Calendars-Tests');
				group: 'CI' with: 'Tests';
				group: 'Development' with: #('Deployment' 'Tests').
			spec postLoadDoIt: #postLoadInitialization
			]
]

{ #category : 'post load' }
BaselineOfChalten >> postLoadInitialization [

	ChaltenEnvironmentBehavior initializeAfterLoad.
	TimeUnitsGlobals initializeAfterLoad.
	TimeOfDay initializeTimesOfDay.
	CalendarDefinition allSubclassesDo: [ :each |
		each subclasses ifEmpty: [ each initializeCalendar ] ].
	ChaltenEnvironment calendarsDo: [:calendar | calendar initializeGlobalVariables].
	TheBeginningOfTimeClass initializeAfterLoad.
	TheEndOfTimeClass initializeAfterLoad.
	TimeZonesGlobals initializeAfterLoad
]

{ #category : 'baselines' }
BaselineOfChalten >> projectClass [

	^ MetacelloCypressBaselineProject
]

{ #category : 'baselines' }
BaselineOfChalten >> setUpDependencies: spec [

	spec
		baseline: 'Buoy' with: [ spec repository: 'github://ba-st/Buoy:v8' ];
		project: 'Buoy-Deployment' copyFrom: 'Buoy' with: [ spec loads: 'Deployment' ];
		project: 'Buoy-SUnit' copyFrom: 'Buoy' with: [ spec loads: 'Dependent-SUnit-Extensions' ];
		project: 'Buoy-Tools' copyFrom: 'Buoy' with: [ spec loads: 'Tools' ].

	spec
		baseline: 'Aconcagua' with: [ spec repository: 'github://ba-st/Aconcagua:v10' ];
		project: 'Aconcagua-Deployment' copyFrom: 'Aconcagua' with: [ spec loads: #('Deployment') ]
]
