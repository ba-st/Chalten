"
A month on a specific year in the Islamic calendar.
"
Class {
	#name : 'IslamicMonthOfYear',
	#superclass : 'CalendaMonthOfYear',
	#instVars : [
		'year',
		'month',
		'dates'
	],
	#category : 'Chalten-Islamic-Calendar',
	#package : 'Chalten-Islamic-Calendar'
}

{ #category : 'accessing - time units' }
IslamicMonthOfYear class >> month [

  ^ IslamicCalendar month
]

{ #category : 'accessing - time units' }
IslamicMonthOfYear class >> year [

  ^ IslamicCalendar year
]

{ #category : 'instance creation' }
IslamicMonthOfYear class >> year: aGregorianYear month: aGregorianMonth [

  ^ self new initializeYear: aGregorianYear month: aGregorianMonth
]

{ #category : 'testing' }
IslamicMonthOfYear >> < anIslamicYearOfMonth [

  ^ year < anIslamicYearOfMonth year or: [
        year = anIslamicYearOfMonth year and: [
            month positionInYear < anIslamicYearOfMonth month positionInYear ]
      ]
]

{ #category : 'comparing' }
IslamicMonthOfYear >> = anObject [

  ^ self equalityChecker
      compare: #year;
      compare: #month;
      checkAgainst: anObject
]

{ #category : 'accessing - dates' }
IslamicMonthOfYear >> dateAt: number [

  AssertionChecker
    enforce: [ number between: 1 and: dates size ]
    because: [ '{1} is an invalid day number in {2}' localizedWithAll: { number . self printString } ]
    raising: InstanceCreationFailed.

  ^ ( dates at: number )
      ifNil: [ dates at: number put: ( IslamicDate monthOfYear: self dayNumber: number ) ]
      ifNotNil: [ :date | date ]
]

{ #category : 'comparing' }
IslamicMonthOfYear >> hash [

  ^ self equalityHashCombinator combineHashOf: year with: month
]

{ #category : 'initialization' }
IslamicMonthOfYear >> initializeYear: anIslamicYear month: anIslamicMonth [

  year := anIslamicYear.
  month := anIslamicMonth.
  dates := Array new: self numberOfDays numericalValue
]

{ #category : 'accessing' }
IslamicMonthOfYear >> month [

  ^ month
]

{ #category : 'querying' }
IslamicMonthOfYear >> next: relativeTimeQuantity [

  relativeTimeQuantity isZero then: [ ^ self ].
  relativeTimeQuantity negative then: [ ^ self previous: relativeTimeQuantity abs ].
  ^ self
      when: relativeTimeQuantity
      isWholeYearsDo: [ :quantityInYears |
        ( year next: quantityInYears ) monthAt: month positionInYear ]
      otherwise: [ :quantityInYears :quantityInMonths |
          | newMonth newYear |
          newMonth := month next: quantityInMonths.
          "The number of months is always less than a full year.
		   If the new month index is less than the current one, it means we've wrapped
		   around to the next year, so we add one to the years to skip."
          newYear := newMonth positionInYear < month positionInYear
                       then: [ year next: quantityInYears + ( 1 * self class year ) ]
                       otherwise: [ year next: quantityInYears ].
          newYear monthAt: newMonth positionInYear
        ]
]

{ #category : 'accessing' }
IslamicMonthOfYear >> numberOfDays [

  ^ year isLeapYear
      then: [ month numberOfDaysInLeapYear ]
      otherwise: [ month numberOfDaysInCommonYear ]
]

{ #category : 'querying' }
IslamicMonthOfYear >> previous: relativeTimeQuantity [

  relativeTimeQuantity isZero then: [ ^ self ].
  relativeTimeQuantity negative then: [ ^ self next: relativeTimeQuantity abs ].
  ^ self
      when: relativeTimeQuantity
      isWholeYearsDo: [ :quantityInYears |
        ( year previous: quantityInYears ) monthAt: month positionInYear ]
      otherwise: [ :quantityInYears :quantityInMonths |
          | newMonth newYear |
          newMonth := month previous: quantityInMonths.
          "The number of months is always less than a full year.
		   If the new month index is greater than the current one, it means we've wrapped
		   around to the previous year, so we add one to the years to skip."
          newYear := newMonth positionInYear > month positionInYear
                       then: [ year previous: quantityInYears + ( 1 * self class year ) ]
                       otherwise: [ year previous: quantityInYears ].
          newYear monthAt: newMonth positionInYear
        ]
]

{ #category : 'printing' }
IslamicMonthOfYear >> printOn: stream [

  stream
    print: month;
    nextPut: $,;
    space;
    print: year
]

{ #category : 'accessing - dates' }
IslamicMonthOfYear >> twentyNinth [

  ^ self dateAt: 29
]

{ #category : 'private' }
IslamicMonthOfYear >> when: relativeTimeQuantity isWholeYearsDo: wholeBlock otherwise: fractionalBlock [

  | years wholeYears remaining |
  years := relativeTimeQuantity convertTo: self class year.
  wholeYears := years truncated.
  remaining := years - wholeYears.
  ^ remaining isZero
      then: [ wholeBlock value: wholeYears ]
      otherwise: [
        fractionalBlock value: wholeYears value: ( remaining convertTo: self class month ) ]
]

{ #category : 'accessing' }
IslamicMonthOfYear >> year [

  ^ year
]
