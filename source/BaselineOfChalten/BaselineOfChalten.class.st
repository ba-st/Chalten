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
  spec for: #pharo do: [
      self
        setUpDependencies: spec;
        setUpDeploymentPackages: spec;
        setUpTestPackages: spec;
        setUpToolsPackages: spec.
      spec
        group: 'Development' with: #( 'Tests' 'Tools' );
        group: 'CI' with: 'Tests';
        group: 'default' with: 'Development'
    ]
]

{ #category : 'postload' }
BaselineOfChalten >> configureCore [

  CalendarMagnitude makeInstancesInvariant.
  CalendarDayOfMonth makeInstancesInvariant.
  CalendarDayOfWeek makeInstancesInvariant.
  CalendarMonth makeInstancesInvariant.
  TimeOfDay makeInstancesInvariant.
  TimeOffsetRuleset makeInstancesInvariant.
  NaturalLanguageTranslator current loadJSONTranslationFilesIn:
    ( ( self project repositoryDescription first withoutPrefix: 'gitlocal://' ) withoutPrefix:
        'tonel://' ) asFileReference parent / 'locales'
]

{ #category : 'accessing' }
BaselineOfChalten >> projectClass [

	^ MetacelloCypressBaselineProject
]

{ #category : 'baselines' }
BaselineOfChalten >> setUpCorePackages: spec [

  spec
    package: 'Chalten-Core' with: [
        spec postLoadDoIt: #configureCore.
        spec requires: 'Aconcagua-Deployment'
      ];
    group: 'Core' with: 'Chalten-Core';
    package: 'Chalten-Core-Aconcagua-Extensions' with: [ spec requires: 'Chalten-Core' ];
    group: 'Core' with: 'Chalten-Core-Aconcagua-Extensions';
    package: 'Chalten-Core-Extensions' with: [ spec requires: 'Chalten-Core' ];
    group: 'Core' with: 'Chalten-Core-Extensions';
    package: 'Chalten-Timezones' with: [ spec requires: 'Chalten-Core' ];
    group: 'Core' with: 'Chalten-Timezones'
]

{ #category : 'baselines' }
BaselineOfChalten >> setUpDependencies: spec [

  spec
    baseline: 'Buoy' with: [ spec repository: 'github://ba-st/Buoy:v8' ];
    project: 'Buoy-SUnit' copyFrom: 'Buoy' with: [ spec loads: 'Dependent-SUnit-Extensions' ].

  spec
    baseline: 'Aconcagua' with: [ spec repository: 'github://ba-st/Aconcagua:v11' ];
    project: 'Aconcagua-Deployment' copyFrom: 'Aconcagua' with: [ spec loads: 'Deployment' ];
    project: 'Aconcagua-Tools' copyFrom: 'Aconcagua' with: [ spec loads: 'Tools' ]
]

{ #category : 'baselines' }
BaselineOfChalten >> setUpDeploymentPackages: spec [

  self
    setUpCorePackages: spec;
    setUpHebrewPackages: spec;
    setUpIslamicPackages: spec.
  spec group: 'Deployment' with: 'Core'.
  spec group: 'Deployment' with: 'Hebrew'.
  spec group: 'Deployment' with: 'Islamic'
]

{ #category : 'baselines' }
BaselineOfChalten >> setUpHebrewPackages: spec [

  spec
    package: 'Chalten-Hebrew-Calendar' with: [ spec requires: 'Core' ];
    group: 'Hebrew' with: 'Chalten-Hebrew-Calendar';
    package: 'Chalten-Hebrew-Calendar-Extensions'
    with: [ spec requires: 'Chalten-Hebrew-Calendar' ];
    group: 'Hebrew' with: 'Chalten-Hebrew-Calendar-Extensions'
]

{ #category : 'baselines' }
BaselineOfChalten >> setUpIslamicPackages: spec [

  spec
    package: 'Chalten-Islamic-Calendar' with: [ spec requires: 'Core' ];
    group: 'Islamic' with: 'Chalten-Islamic-Calendar';
    package: 'Chalten-Islamic-Calendar-Extensions'
    with: [ spec requires: 'Chalten-Islamic-Calendar' ];
    group: 'Islamic' with: 'Chalten-Islamic-Calendar-Extensions'
]

{ #category : 'baselines' }
BaselineOfChalten >> setUpTestPackages: spec [

  spec
    package: 'Chalten-Core-Tests' with: [ spec requires: #( 'Core' 'Buoy-SUnit' ) ];
    group: 'Tests' with: 'Chalten-Core-Tests';
    package: 'Chalten-Timezones-Tests' with: [ spec requires: #( 'Core' 'Buoy-SUnit' ) ];
    group: 'Tests' with: 'Chalten-Timezones-Tests';
    package: 'Chalten-Hebrew-Calendar-Tests' with: [ spec requires: #( 'Hebrew' 'Buoy-SUnit' ) ];
    group: 'Tests' with: 'Chalten-Hebrew-Calendar-Tests';
    package: 'Chalten-Islamic-Calendar-Tests' with: [ spec requires: #( 'Islamic' 'Buoy-SUnit' ) ];
    group: 'Tests' with: 'Chalten-Islamic-Calendar-Tests'
]

{ #category : 'baselines' }
BaselineOfChalten >> setUpToolsPackages: spec [

  spec
    package: 'Chalten-Development-Tools' with: [ spec requires: #( 'Aconcagua-Tools' ) ];
    group: 'Tools' with: 'Chalten-Development-Tools'
]
