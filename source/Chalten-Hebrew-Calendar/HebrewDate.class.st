"
A particular calendar day represented by its calendar year, its calendar month and its day of month in the Hebrew calendar.
Since hebrew dates start at sunset (in this implementation 18:00hs on the Gregorian calendar) there's no direct overlap with
a gregorian date (parts of the day are in one gregorian date and other parts of the day into the next one). So, there's no way
to directly convert a hebrew date to a gregorian date.
"
Class {
	#name : 'HebrewDate',
	#superclass : 'CalendarDate',
	#instVars : [
		'monthOfYear',
		'dayNumber'
	],
	#category : 'Chalten-Hebrew-Calendar',
	#package : 'Chalten-Hebrew-Calendar'
}

{ #category : 'instance creation' }
HebrewDate class >> monthOfYear: aHebrewMonthOfYear dayNumber: aDayNumber [

  self assert: aDayNumber isValidIn: aHebrewMonthOfYear.
  ^ self new initalizeMonthOfYear: aHebrewMonthOfYear dayNumber: aDayNumber
]

{ #category : 'comparing' }
HebrewDate >> < aHebrewDate [

  ^ monthOfYear < aHebrewDate monthOfYear or: [
        monthOfYear = aHebrewDate monthOfYear and: [ dayNumber < aHebrewDate dayNumber ] ]
]

{ #category : 'comparing' }
HebrewDate >> = anObject [

  ^ self equalityChecker
      compareAll: #( dayNumber monthOfYear );
      checkAgainst: anObject
]

{ #category : 'accessing' }
HebrewDate >> at: aTimeOfDay [

  ^ HebrewDateTime on: self at: aTimeOfDay
]

{ #category : 'accessing' }
HebrewDate >> atMidnight [

  ^ self at: ( TimeOfDay hours: 6 )
]

{ #category : 'accessing' }
HebrewDate >> atNoon [

  ^ self at: ( TimeOfDay hours: 18 )
]

{ #category : 'accessing' }
HebrewDate >> dayNumber [

  ^ dayNumber
]

{ #category : 'querying' }
HebrewDate >> dayOfWeek [

  | absoluteDayNumber zeroBasedDayWeekIndex |
  absoluteDayNumber := self year roshHashanahDayNumber
                       + ( self - self year firstDate ) numericalValue.
  zeroBasedDayWeekIndex := absoluteDayNumber \\ 7.
  ^ ( DayOfWeek dayAt: ( zeroBasedDayWeekIndex - 7 rem: 7 ) + 7 ) asHebrewDayOfWeek
]

{ #category : 'comparing' }
HebrewDate >> hash [

  ^ self equalityHashCombinator combineHashOf: dayNumber with: monthOfYear
]

{ #category : 'initialization' }
HebrewDate >> initalizeMonthOfYear: aHebrewMonthOfYear dayNumber: aDayNumber [

  monthOfYear := aHebrewMonthOfYear.
  dayNumber := aDayNumber
]

{ #category : 'accessing' }
HebrewDate >> monthNumber [

  ^ self month positionIn: monthOfYear year
]

{ #category : 'accessing' }
HebrewDate >> monthOfYear [

  ^ monthOfYear
]

{ #category : 'printing' }
HebrewDate >> printOn: stream [

  stream
    print: self month;
    space;
    print: dayNumber;
    nextPut: $,;
    space;
    print: self year
]
