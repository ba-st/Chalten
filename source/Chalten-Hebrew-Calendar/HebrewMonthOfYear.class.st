"
A month on a specific year in the Hebrew calendar.
"
Class {
	#name : 'HebrewMonthOfYear',
	#superclass : 'CalendaMonthOfYear',
	#instVars : [
		'year',
		'month',
		'dates'
	],
	#category : 'Chalten-Hebrew-Calendar',
	#package : 'Chalten-Hebrew-Calendar'
}

{ #category : 'accessing - time units' }
HebrewMonthOfYear class >> month [

  ^ HebrewCalendar month
]

{ #category : 'accessing - time units' }
HebrewMonthOfYear class >> year [

  ^ HebrewCalendar year
]

{ #category : 'instance creation' }
HebrewMonthOfYear class >> year: aHebrewYear month: aHebrewMonth [

  ^ self new initializeYear: aHebrewYear month: aHebrewMonth
]

{ #category : 'testing' }
HebrewMonthOfYear >> < anHebrewYearOfMonth [

  ^ year < anHebrewYearOfMonth year or: [
        year = anHebrewYearOfMonth year and: [
            (month positionIn: year) < (anHebrewYearOfMonth month positionIn: year) ]
      ]
]

{ #category : 'comparing' }
HebrewMonthOfYear >> = anObject [

  ^ self equalityChecker
      compare: #year;
      compare: #month;
      checkAgainst: anObject
]

{ #category : 'accessing - dates' }
HebrewMonthOfYear >> dateAt: number [

  AssertionChecker
    enforce: [ number between: 1 and: dates size ]
    because: [ '{1} is an invalid day number in {2}' localizedWithAll: { number . self printString } ]
    raising: InstanceCreationFailed.

  ^ ( dates at: number )
      ifNil: [ dates at: number put: ( HebrewDate monthOfYear: self dayNumber: number ) ]
      ifNotNil: [ :date | date ]
]

{ #category : 'comparing' }
HebrewMonthOfYear >> hash [

  ^ self equalityHashCombinator combineHashOf: year with: month
]

{ #category : 'initialization' }
HebrewMonthOfYear >> initializeYear: aHebrewYear month: aHebrewMonth [

  year := aHebrewYear.
  month := aHebrewMonth.
  dates := Array new: self numberOfDays numericalValue
]

{ #category : 'accessing' }
HebrewMonthOfYear >> month [

  ^ month
]

{ #category : 'querying' }
HebrewMonthOfYear >> next: relativeTimeQuantity [

  | remainingMonthsInYear currentYear remainingOffset |
  relativeTimeQuantity isZero then: [ ^ self ].
  relativeTimeQuantity negative then: [ ^ self previous: relativeTimeQuantity abs ].
  remainingMonthsInYear := year numberOfMonths - ( ( month positionIn: year ) * self class month ).
  relativeTimeQuantity <= remainingMonthsInYear then: [ "Move inside same year"
      | newPosition |
      newPosition := ( relativeTimeQuantity convertTo: self class month ) numericalValue
                     + ( month positionIn: year ).
      ^ year monthAt: newPosition
    ].
  "Overflow to next year"
  currentYear := year next.
  remainingOffset := relativeTimeQuantity - remainingMonthsInYear.
  [ remainingOffset > currentYear numberOfMonths ] whileTrue: [ "Move whole years"
      remainingOffset := remainingOffset - currentYear numberOfMonths.
      currentYear := currentYear next
    ].

  ^ currentYear monthAt: ( remainingOffset convertTo: self class month ) numericalValue
]

{ #category : 'accessing' }
HebrewMonthOfYear >> numberOfDays [

  month isVariableLengthMonth then: [
      year isDeficientYear then: [ ^ month numberOfDaysInDeficientYear ].
      year isRegularYear then: [ ^ month numberOfDaysInRegularYear ].
      year isCompleteYear then: [ ^ month numberOfDaysInCompleteYear ]
    ].
  ^ month numberOfDaysInRegularYear
]

{ #category : 'querying' }
HebrewMonthOfYear >> previous: relativeTimeQuantity [

  | remainingMonthsInYear currentYear remainingOffset |
  relativeTimeQuantity isZero then: [ ^ self ].
  relativeTimeQuantity negative then: [ ^ self next: relativeTimeQuantity abs ].
  remainingMonthsInYear := ( month positionIn: year ) - 1 * self class month.
  relativeTimeQuantity <= remainingMonthsInYear then: [ "Move inside same year"
      | newPosition |
      newPosition := ( month positionIn: year )
                     - ( relativeTimeQuantity convertTo: self class month ) numericalValue.
      ^ year monthAt: newPosition
    ].
  "Overflow to previous year"
  currentYear := year previous.
  remainingOffset := relativeTimeQuantity - remainingMonthsInYear.
  [ remainingOffset > currentYear numberOfMonths ] whileTrue: [ "Move whole years"
      remainingOffset := remainingOffset - currentYear numberOfMonths.
      currentYear := currentYear previous
    ].

  ^ currentYear monthAt:
      ( currentYear numberOfMonths - remainingOffset convertTo: self class month ) numericalValue
      + 1
]

{ #category : 'printing' }
HebrewMonthOfYear >> printOn: stream [

  stream
    print: month;
    nextPut: $,;
    space;
    print: year
]

{ #category : 'accessing - dates' }
HebrewMonthOfYear >> twentyNinth [

  ^ self dateAt: 29
]

{ #category : 'accessing' }
HebrewMonthOfYear >> year [

  ^ year
]
