"
A month on a specific year in the Gregorian calendar.
"
Class {
	#name : 'GregorianMonthOfYear',
	#superclass : 'CalendarMonthOfYear',
	#instVars : [
		'year',
		'month',
		'dates'
	],
	#category : 'Chalten-Core',
	#package : 'Chalten-Core'
}

{ #category : 'instance creation' }
GregorianMonthOfYear class >> year: aGregorianYear month: aGregorianMonth [

  ^ self new initializeYear: aGregorianYear month: aGregorianMonth
]

{ #category : 'testing' }
GregorianMonthOfYear >> < aGregorianYearOfMonth [

  ^ year < aGregorianYearOfMonth year or: [
        year = aGregorianYearOfMonth year and: [
            month positionInYear < aGregorianYearOfMonth month positionInYear ]
      ]
]

{ #category : 'comparing' }
GregorianMonthOfYear >> = anObject [

  ^ self equalityChecker
      compare: #year;
      compare: #month;
      checkAgainst: anObject
]

{ #category : 'accessing - dates' }
GregorianMonthOfYear >> dateAt: number [

  AssertionChecker
    enforce: [ number between: 1 and: dates size ]
    because: [ '{1} is an invalid day number in {2}' localizedWithAll: { number . self printString } ]
    raising: InstanceCreationFailed.

  ^ ( dates at: number )
      ifNil: [ dates at: number put: ( GregorianDate monthOfYear: self dayNumber: number ) ]
      ifNotNil: [ :date | date ]
]

{ #category : 'comparing' }
GregorianMonthOfYear >> hash [

  ^ self equalityHashCombinator combineHashOf: year with: month
]

{ #category : 'initialization' }
GregorianMonthOfYear >> initializeYear: aGregorianYear month: aGregorianMonth [

  year := aGregorianYear.
  month := aGregorianMonth.
  dates := Array new: self numberOfDays numericalValue
]

{ #category : 'accessing' }
GregorianMonthOfYear >> month [

  ^ month
]

{ #category : 'querying' }
GregorianMonthOfYear >> next: relativeTimeQuantity [

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
GregorianMonthOfYear >> numberOfDays [

  ^ year isLeapYear
      then: [ month numberOfDaysInLeapYear ]
      otherwise: [ month numberOfDaysInCommonYear ]
]

{ #category : 'querying' }
GregorianMonthOfYear >> previous: relativeTimeQuantity [

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
GregorianMonthOfYear >> printOn: stream [

  stream
    print: month;
    nextPut: $,;
    space;
    print: year
]

{ #category : 'accessing - dates' }
GregorianMonthOfYear >> thirtyFirst [

  ^ self numberOfDays > ( 30 * self class day )
      then: [ self dateAt: 31 ]
      otherwise: [ super thirtyFirst ]
]

{ #category : 'accessing - dates' }
GregorianMonthOfYear >> twentyNinth [

  ^ self numberOfDays > ( 28 * self class day )
      then: [ self dateAt: 29 ]
      otherwise: [ super twentyNinth ]
]

{ #category : 'private' }
GregorianMonthOfYear >> when: relativeTimeQuantity isWholeYearsDo: wholeBlock otherwise: fractionalBlock [

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
GregorianMonthOfYear >> year [

  ^ year
]
