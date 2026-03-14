"
An ordinal number of a calendar day within a calendar month
"
Class {
	#name : 'CalendarDayOfMonth',
	#superclass : 'Object',
	#instVars : [
		'dayNumber',
		'month'
	],
	#classInstVars : [
		'Instances'
	],
	#category : 'Chalten-Core',
	#package : 'Chalten-Core',
	#'gs_options' : [
		'instancesInvariant'
	]
}

{ #category : 'instance creation' }
CalendarDayOfMonth class >> gregorianMonth: aGregorianMonth dayNumber: aDayNumber [

  | daysForMonth |
  AssertionChecker
    enforce: [ aGregorianMonth isGregorian ]
    because: 'Cannot use non-gregorian months for days of gregorian months' localized.
  daysForMonth := ( self instanceRegistryFor: #Gregorian )
                    at: aGregorianMonth positionInYear
                    ifAbsentPut: [ IdentityDictionary new ].
  ^ daysForMonth
      at: aDayNumber
      ifAbsentPut: [ self new initalizeMonth: aGregorianMonth dayNumber: aDayNumber ]
]

{ #category : 'class initialization' }
CalendarDayOfMonth class >> initialize [

  <ignoreForCoverage>
  Instances := IdentityDictionary new
]

{ #category : 'private' }
CalendarDayOfMonth class >> instanceRegistryFor: calendarSymbol [

  ^ Instances at: calendarSymbol ifAbsentPut: [ IdentityDictionary new ]
]

{ #category : 'instance creation' }
CalendarDayOfMonth >> , yearNumber [

  ^ month , yearNumber dateAt: dayNumber
]

{ #category : 'comparing' }
CalendarDayOfMonth >> = anObject [

  ^ self equalityChecker
      compareAll: #( month dayNumber );
      checkAgainst: anObject
]

{ #category : 'accessing' }
CalendarDayOfMonth >> dayNumber [

  ^ dayNumber
]

{ #category : 'comparing' }
CalendarDayOfMonth >> hash [

  ^ self equalityHashCombinator combineHashOf: month with: dayNumber
]

{ #category : 'initialization' }
CalendarDayOfMonth >> initalizeMonth: aCalendarMonth dayNumber: aDayNumber [

  month := aCalendarMonth.
  dayNumber := aDayNumber
]

{ #category : 'accessing' }
CalendarDayOfMonth >> month [

  ^ month
]

{ #category : 'printing' }
CalendarDayOfMonth >> printOn: stream [

  stream
    print: month;
    space;
    print: dayNumber
]
