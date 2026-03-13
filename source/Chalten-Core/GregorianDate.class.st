"
A particular calendar day represented by its calendar year, its calendar month and its day of month in the Gregorian calendar.
Gregorian dates spans from midnight to midnight.
"
Class {
	#name : 'GregorianDate',
	#superclass : 'CalendarDate',
	#instVars : [
		'monthOfYear',
		'dayNumber'
	],
	#category : 'Chalten-Core',
	#package : 'Chalten-Core'
}

{ #category : 'instance creation' }
GregorianDate class >> monthOfYear: aGregorianMonthOfYear dayNumber: aDayNumber [

  self assert: aDayNumber isValidIn: aGregorianMonthOfYear.
  ^ self new initalizeMonthOfYear: aGregorianMonthOfYear dayNumber: aDayNumber
]

{ #category : 'testing' }
GregorianDate >> < aGregorianDate [

  ^ monthOfYear < aGregorianDate monthOfYear or: [
        monthOfYear = aGregorianDate monthOfYear and: [ dayNumber < aGregorianDate dayNumber ] ]
]

{ #category : 'comparing' }
GregorianDate >> = anObject [

  ^ self equalityChecker
      compareAll: #( dayNumber monthOfYear );
      checkAgainst: anObject
]

{ #category : 'accessing' }
GregorianDate >> at: timeOfDay [

  ^ GregorianDateTime on: self at: timeOfDay
]

{ #category : 'accessing' }
GregorianDate >> atMidnight [

  ^ self atStartOfDay 
]

{ #category : 'accessing' }
GregorianDate >> atNoon [

  ^ self at: TimeOfDay halfOfDay 
]

{ #category : 'accessing' }
GregorianDate >> dayNumber [

  ^ dayNumber
]

{ #category : 'querying' }
GregorianDate >> dayOfWeek [

  ^ DayOfWeek dayAt: self atNoon julianDayNumber + 1 \\ 7
]

{ #category : 'comparing' }
GregorianDate >> hash [

  ^ self equalityHashCombinator combineHashOf: dayNumber with: monthOfYear
]

{ #category : 'initialization' }
GregorianDate >> initalizeMonthOfYear: aGregorianMonthOfYear dayNumber: aDayNumber [

  monthOfYear := aGregorianMonthOfYear.
  dayNumber := aDayNumber
]

{ #category : 'accessing' }
GregorianDate >> monthNumber [

  ^ self month positionInYear
]

{ #category : 'accessing' }
GregorianDate >> monthOfYear [

  ^ monthOfYear
]

{ #category : 'printing' }
GregorianDate >> printOn: stream [

  stream
    print: self month;
    space;
    print: dayNumber;
    nextPut: $,;
    space;
    print: self year
]
