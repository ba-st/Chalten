"
An absolute point in time is a location-independent instant on a singular, continuous timeline.
It provides a universal reference that allows any two events to be compared and sequenced in a strict,
unambiguous order.
"
Class {
	#name : 'AbsolutePointInTime',
	#superclass : 'CalendarMagnitude',
	#category : 'Chalten-Core',
	#package : 'Chalten-Core'
}

{ #category : 'testing' }
AbsolutePointInTime class >> isAbstract [

  ^ self = AbsolutePointInTime
]

{ #category : 'testing' }
AbsolutePointInTime >> < anAbsolutePointInTime [

  ^ self microsecondsSinceEpoch < anAbsolutePointInTime microsecondsSinceEpoch
]

{ #category : 'comparing' }
AbsolutePointInTime >> = anObject [

  ^ self equalityChecker
      compare: #microsecondsSinceEpoch;
      checkAgainst: anObject
]

{ #category : 'converting' }
AbsolutePointInTime >> asInstant [

  ^ self subclassResponsibility
]

{ #category : 'comparing' }
AbsolutePointInTime >> equalityChecker [

  ^ PropertyBasedEqualityChecker
      on: self
      checkingTypeUsing: [ :base :target | target isAbsolutePointInTime ]
]

{ #category : 'comparing' }
AbsolutePointInTime >> hash [

  ^ self microsecondsSinceEpoch hash
]

{ #category : 'testing' }
AbsolutePointInTime >> isAbsolutePointInTime [

  ^ true
]

{ #category : 'private - accessing' }
AbsolutePointInTime >> julianDayNumber [

  ^ self subclassResponsibility
]

{ #category : 'accessing' }
AbsolutePointInTime >> microsecondsSinceEpoch [

  ^ self subclassResponsibility
]

{ #category : 'printing' }
AbsolutePointInTime >> printTimeOfDayOn: stream [

  stream nextPut: $T.
  self withTimeOfDayDo: [ :timeOfDay | stream print: timeOfDay ]
]

{ #category : 'printing' }
AbsolutePointInTime >> printYearMonthDateOn: stream [

  self withGregorianDayMonthYearDo: [ :dayNumber :monthNumber :yearNumber |
      stream
        print: yearNumber;
        nextPut: $-;
        nextPutAll: ( monthNumber printStringLength: 2 padded: true );
        nextPut: $-;
        nextPutAll: ( dayNumber printStringLength: 2 padded: true )
    ]
]

{ #category : 'private - converting' }
AbsolutePointInTime >> withGregorianDayMonthYearDo: aBlock [

  ^ aBlock valueWithArguments:
      ( EdwardGrahamRichardsAlgorithm new executeFor: self julianDayNumber )
]

{ #category : 'private - converting' }
AbsolutePointInTime >> withTimeOfDayDo: aBlock [

  self subclassResponsibility
]
