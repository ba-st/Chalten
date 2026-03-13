"
A calendar day of week
"
Class {
	#name : 'CalendarDayOfWeek',
	#superclass : 'Object',
	#instVars : [
		'shortName',
		'name',
		'positionInWeek'
	],
	#category : 'Chalten-Core',
	#package : 'Chalten-Core',
	#'gs_options' : [
		'instancesInvariant'
	]
}

{ #category : 'accessing' }
CalendarDayOfWeek class >> dayAt: positionInWeek [

  ^ self subclassResponsibility
]

{ #category : 'testing' }
CalendarDayOfWeek class >> isAbstract [

  ^ self = CalendarDayOfWeek
]

{ #category : 'instance creation' }
CalendarDayOfWeek class >> named: aName shortNamed: aShortName positionInWeeek: anInteger [

  AssertionCheckerBuilder new
    raising: InstanceCreationFailed;
    checking: [ :asserter |
        asserter
          enforce: [ aName notEmpty ] because: [ 'A day of week name cannot be empty' localized ];
          enforce: [ aShortName notEmpty ]
          because: [ 'A day of week short name cannot be empty' localized ];
          enforce: [ anInteger between: 1 and: 7 ]
          because: [ 'A day of week position must be between 1 and 7' localized ]
      ];
    buildAndCheck.

  ^ self new initializeNamed: aName shortNamed: aShortName positionInWeeek: anInteger
]

{ #category : 'converting' }
CalendarDayOfWeek >> asISODayOfWeek [

  ^ self subclassResponsibility
]

{ #category : 'initialization' }
CalendarDayOfWeek >> initializeNamed: aName shortNamed: aShortName positionInWeeek: anInteger [

  name := aName.
  shortName := aShortName.
  positionInWeek := anInteger
]

{ #category : 'accessing' }
CalendarDayOfWeek >> name [

  ^ name localized
]

{ #category : 'accessing' }
CalendarDayOfWeek >> next [

  ^ self class dayAt: ( positionInWeek rem: 7 ) + 1
]

{ #category : 'accessing' }
CalendarDayOfWeek >> positionInWeek [

  ^ positionInWeek
]

{ #category : 'accessing' }
CalendarDayOfWeek >> previous [

  ^ self class dayAt: ( positionInWeek - 8 rem: 7 ) + 7
]

{ #category : 'printing' }
CalendarDayOfWeek >> printOn: stream [

  stream nextPutAll: name
]

{ #category : 'accessing' }
CalendarDayOfWeek >> shortName [

  ^ shortName localized
]
