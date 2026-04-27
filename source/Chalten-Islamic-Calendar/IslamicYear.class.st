"
A year in the Islamic Calendar.
The Islamic (Hijri) Calendar year is a purely lunar system. Unlike the Gregorian or Hebrew calendars,
it makes no attempt to synchronize with the sun or the agricultural seasons. As a result, the Islamic
year is approximately 11 days shorter than a solar year, causing Islamic months to ""cycle"" through the
Gregorian seasons every 32 to 33 years.
An Islamic year consists of 12 lunar months. Each month begins with the first sighting of the new crescent
moon (Hilal).  A lunar month is roughly 29.53 days. Months must be whole days, so they alternate between
29 and 30 days. Because 12 × 29.53 ≈ 354.367, and a standard Islamic year is 354 days, ""leap years"" are
required to account for the extra 0.367 days. In a leap year, a single day is added to the last month of the
year (Dhu al-Hijjah), increasing it from 29 to 30 days.
The Tabular Islamic Calendar is used in this implementation to provide a predictable mathematical structure.
This implementation don't allow islamic years before year 1.
"
Class {
	#name : 'IslamicYear',
	#superclass : 'CalendarYear',
	#instVars : [
		'number',
		'months'
	],
	#classInstVars : [
		'years'
	],
	#category : 'Chalten-Islamic-Calendar',
	#package : 'Chalten-Islamic-Calendar'
}

{ #category : 'private - asserting' }
IslamicYear class >> assertIsValid: anInteger [

  super assertIsValid: anInteger.
  AssertionChecker
    enforce: [ anInteger strictlyPositive ]
    because: 'Negative years are unsupported for the Islamic calendar' localized
    raising: InstanceCreationFailed
]

{ #category : 'private - accessing' }
IslamicYear class >> calendarName [

  ^ 'Islamic' localized
]

{ #category : 'class initialization' }
IslamicYear class >> initialize [

  <ignoreForCoverage>
  years := IdentityDictionary new
]

{ #category : 'accessing - time units' }
IslamicYear class >> month [

  ^ IslamicCalendar month
]

{ #category : 'instance creation' }
IslamicYear class >> number: anInteger [

  self assertIsValid: anInteger.
  ^ years at: anInteger ifAbsentPut: [ self new initializeNumber: anInteger ]
]

{ #category : 'accessing - time units' }
IslamicYear class >> year [

  ^ IslamicCalendar year
]

{ #category : 'comparing' }
IslamicYear >> = anObject [

  ^ self equalityChecker
      compare: #number;
      checkAgainst: anObject
]

{ #category : 'accessing - months' }
IslamicYear >> duAlHijjah [ 

  ^ self monthAt: 12
]

{ #category : 'accessing - months' }
IslamicYear >> duAlQiDah [ 

  ^ self monthAt: 11
]

{ #category : 'accessing' }
IslamicYear >> firstDate [

  ^ self muharram first
]

{ #category : 'comparing' }
IslamicYear >> hash [

  ^ number hash
]

{ #category : 'initialization' }
IslamicYear >> initializeNumber: anInteger [

  number := anInteger.
  months := Array new: 12
]

{ #category : 'testing' }
IslamicYear >> isLeapYear [

  ^ 14 + ( 11 * number ) \\ 30 < 11
]

{ #category : 'accessing - months' }
IslamicYear >> jumadaAlAwwal [

  ^ self monthAt: 5
]

{ #category : 'accessing - months' }
IslamicYear >> jumadaAlThani [

  ^ self monthAt: 6
]

{ #category : 'accessing' }
IslamicYear >> lastDate [

  ^ self duAlHijjah last
]

{ #category : 'accessing - months' }
IslamicYear >> monthAt: monthIndex [

  ^ ( months at: monthIndex )
      ifNil: [
          months
            at: monthIndex
            put: ( IslamicMonthOfYear year: self month: ( IslamicMonth monthAt: monthIndex ) )
        ]
      ifNotNil: [ :month | month ]
]

{ #category : 'accessing - months' }
IslamicYear >> muharram [

  ^ self monthAt: 1
]

{ #category : 'accessing' }
IslamicYear >> number [

  ^ number
]

{ #category : 'accessing' }
IslamicYear >> numberOfDays [

  ^ self class day * ( self isLeapYear then: [ 355 ] otherwise: [ 354 ] )
]

{ #category : 'accessing' }
IslamicYear >> numberOfMonths [

  ^ 12 * self class month
]

{ #category : 'printing' }
IslamicYear >> printOn: stream [

  stream
    print: number;
    space;
    nextPutAll: 'AH'
]

{ #category : 'accessing - months' }
IslamicYear >> rabiAlAwwal [

  ^ self monthAt: 3
]

{ #category : 'accessing - months' }
IslamicYear >> rabiAlThani [

  ^ self monthAt: 4
]

{ #category : 'accessing - months' }
IslamicYear >> rajab [

  ^ self monthAt: 7
]

{ #category : 'accessing - months' }
IslamicYear >> ramadan [

  ^ self monthAt: 9
]

{ #category : 'accessing - months' }
IslamicYear >> safar [

  ^ self monthAt: 2
]

{ #category : 'accessing - months' }
IslamicYear >> shaban [ 

  ^ self monthAt: 8
]

{ #category : 'accessing - months' }
IslamicYear >> shawwal [ 

  ^ self monthAt: 10
]
