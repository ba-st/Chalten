"
A particular calendar day represented by its calendar year, its calendar month and its day of month in the Islamic calendar.
Since Islamic dates start at sunset (in this implementation 18:00hs on the Gregorian calendar) there's no direct overlap with
a gregorian date (parts of the day are in one gregorian date and other parts of the day into the next one). So, there's no way
to directly convert an islamic date to a gregorian date.
"
Class {
	#name : 'IslamicDate',
	#superclass : 'CalendarDate',
	#instVars : [
		'monthOfYear',
		'dayNumber'
	],
	#category : 'Chalten-Islamic-Calendar',
	#package : 'Chalten-Islamic-Calendar'
}

{ #category : 'instance creation' }
IslamicDate class >> monthOfYear: anIslamicMonthOfYear dayNumber: aDayNumber [

  self assert: aDayNumber isValidIn: anIslamicMonthOfYear.
  ^ self new initalizeMonthOfYear: anIslamicMonthOfYear dayNumber: aDayNumber
]

{ #category : 'testing' }
IslamicDate >> < anIslamicDate [

  ^ monthOfYear < anIslamicDate monthOfYear or: [
        monthOfYear = anIslamicDate monthOfYear and: [ dayNumber < anIslamicDate dayNumber ] ]
]

{ #category : 'comparing' }
IslamicDate >> = anObject [

  ^ self equalityChecker
      compareAll: #( dayNumber monthOfYear );
      checkAgainst: anObject
]

{ #category : 'accessing' }
IslamicDate >> at: timeOfDay [

  ^ IslamicDateTime on: self at: timeOfDay
]

{ #category : 'accessing' }
IslamicDate >> atMidnight [

  ^ self at: ( TimeOfDay hours: 6 )
]

{ #category : 'accessing' }
IslamicDate >> atNoon [

  ^ self at: ( TimeOfDay hours: 18 )
]

{ #category : 'accessing' }
IslamicDate >> dayNumber [

  ^ dayNumber
]

{ #category : 'querying' }
IslamicDate >> dayOfWeek [

  | fixedDayNumber zeroBasedIndex |
  fixedDayNumber := self dayNumber + ( 59 / 2 * ( self monthNumber - 1 ) ) ceiling
                    + ( self yearNumber - 1 * 354 ) + ( 3 + ( 11 * self yearNumber ) / 30 ) floor
                    + 227015.
  zeroBasedIndex := fixedDayNumber \\ 7.
  ^ IslamicDayOfWeek dayAt: ( zeroBasedIndex = 0 then: [ 7 ] otherwise: [ zeroBasedIndex ] )
]

{ #category : 'comparing' }
IslamicDate >> hash [

  ^ self equalityHashCombinator combineHashOf: dayNumber with: monthOfYear
]

{ #category : 'initialization' }
IslamicDate >> initalizeMonthOfYear: anIslamicMonthOfYear dayNumber: aDayNumber [

  monthOfYear := anIslamicMonthOfYear.
  dayNumber := aDayNumber
]

{ #category : 'accessing' }
IslamicDate >> monthNumber [

  ^ self month positionInYear
]

{ #category : 'accessing' }
IslamicDate >> monthOfYear [

  ^ monthOfYear
]

{ #category : 'printing' }
IslamicDate >> printOn: stream [

  stream
    print: self month;
    space;
    print: dayNumber;
    nextPut: $,;
    space;
    print: self year
]
