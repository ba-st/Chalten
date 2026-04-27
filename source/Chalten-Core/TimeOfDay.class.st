"
A `TimeOfDay` represents a specific point in a 24-hour cycle, tipically measured from
midnight to midnight. In some calendar systems, the start of day is at sunset instead of midnight.
Representations of local time of day as defined above make no provisions to prevent ambiguities in
expressions that result from discontinuities in the local time scale (e.g. daylight-saving time). 

"
Class {
	#name : 'TimeOfDay',
	#superclass : 'Magnitude',
	#instVars : [
		'timeFromStartOfDay'
	],
	#classInstVars : [
		'StartOfDay',
		'HalfOfDay'
	],
	#category : 'Chalten-Core',
	#package : 'Chalten-Core',
	#'gs_options' : [
		'instancesInvariant'
	]
}

{ #category : 'instance creation' }
TimeOfDay class >> halfOfDay [

  HalfOfDay ifNil: [ HalfOfDay := self hours: 12 ].
  ^ HalfOfDay
]

{ #category : 'accessing' }
TimeOfDay class >> hour [

  ^ self unit: #hour
]

{ #category : 'instance creation' }
TimeOfDay class >> hours: anInteger [

  ^ self hours: anInteger minutes: 0
]

{ #category : 'instance creation' }
TimeOfDay class >> hours: numberOfHours minutes: numberOfMinutes [

  ^ self hours: numberOfHours minutes: numberOfMinutes seconds: 0
]

{ #category : 'instance creation' }
TimeOfDay class >> hours: numberOfHours minutes: numberOfMinutes seconds: numberOfSeconds [

  ^ self
      hours: numberOfHours
      minutes: numberOfMinutes
      seconds: numberOfSeconds
      microseconds: 0
]

{ #category : 'instance creation' }
TimeOfDay class >> hours: numberOfHours minutes: numberOfMinutes seconds: numberOfSeconds microseconds: numberOfMicroseconds [

  AssertionCheckerBuilder new
    raising: InstanceCreationFailed;
    checking: [ :asserter |
        asserter
          enforce: [ numberOfHours between: 0 and: 23 ] because: 'Hours must be in the range 0-23';
          enforce: [ numberOfMinutes between: 0 and: 59 ]
          because: 'Minutes must be in the range 0-59';
          enforce: [ numberOfSeconds between: 0 and: 59 ]
          because: 'Seconds must be in the range 0-59';
          enforce: [ numberOfMicroseconds between: 0 and: 999999 ]
          because: 'Microseconds must be in the range 0-999999'
      ];
    buildAndCheck.

  ^ self offsetFromStartOfDay:
      self hour * numberOfHours + ( self minute * numberOfMinutes )
      + ( self second * numberOfSeconds ) + ( self microsecond * numberOfMicroseconds )
]

{ #category : 'accessing' }
TimeOfDay class >> microsecond [

  ^ self unit: #microsecond
]

{ #category : 'accessing' }
TimeOfDay class >> minute [

  ^ self unit: #minute
]

{ #category : 'private' }
TimeOfDay class >> offsetFromStartOfDay: timeQuantity [

  AssertionChecker
    enforce: [ timeQuantity positive and: [ timeQuantity < ( 24 * self hour ) ] ]
    because: [ 'A time of day must be between 0 and 24 hours' localized ]
    raising: InstanceCreationFailed.

  ^ self new initializeOffsetFromStartOfDay: timeQuantity
]

{ #category : 'accessing' }
TimeOfDay class >> second [

  ^ self unit: #second
]

{ #category : 'instance creation' }
TimeOfDay class >> startOfDay [

  StartOfDay ifNil: [ StartOfDay := self offsetFromStartOfDay: self microsecond * 0 ].
  ^ StartOfDay
]

{ #category : 'private' }
TimeOfDay class >> unit: symbol [

  ^ InternationalSystemOfUnits units at: symbol
]

{ #category : 'arithmetic' }
TimeOfDay >> + timeQuantity [

  ^ self class offsetFromStartOfDay: timeFromStartOfDay + timeQuantity
]

{ #category : 'arithmetic' }
TimeOfDay >> - timeQuantity [

  ^ self class offsetFromStartOfDay: timeFromStartOfDay - timeQuantity
]

{ #category : 'testing' }
TimeOfDay >> < aTimeOfDay [

  ^ timeFromStartOfDay < aTimeOfDay timeFromStartOfDay
]

{ #category : 'comparing' }
TimeOfDay >> = anObject [

  ^ self equalityChecker
      compare: #timeFromStartOfDay;
      checkAgainst: anObject
]

{ #category : 'comparing' }
TimeOfDay >> hash [

  ^ timeFromStartOfDay hash
]

{ #category : 'accessing' }
TimeOfDay >> hours [

  ^ ( timeFromStartOfDay convertTo: self class hour ) truncated
]

{ #category : 'initialization' }
TimeOfDay >> initializeOffsetFromStartOfDay: timeQuantity [

  timeFromStartOfDay := timeQuantity
]

{ #category : 'accessing' }
TimeOfDay >> microseconds [

  ^ timeFromStartOfDay - self hours - self minutes - self seconds convertTo: self class microsecond
]

{ #category : 'accessing' }
TimeOfDay >> minutes [

  ^ ( timeFromStartOfDay - self hours convertTo: self class minute ) truncated
]

{ #category : 'printing' }
TimeOfDay >> printOn: stream [

  stream
    nextPutAll: ( self hours numericalValue printStringLength: 2 padded: true );
    nextPut: $:;
    nextPutAll: ( self minutes numericalValue printStringLength: 2 padded: true );
    nextPut: $:;
    nextPutAll: ( self seconds numericalValue printStringLength: 2 padded: true );
    nextPut: $.;
    nextPutAll: ( self microseconds numericalValue printStringLength: 6 padded: true )
]

{ #category : 'accessing' }
TimeOfDay >> seconds [

  ^ ( timeFromStartOfDay - self hours - self minutes convertTo: self class second ) truncated
]

{ #category : 'accessing' }
TimeOfDay >> timeFromStartOfDay [

	^ timeFromStartOfDay
]
