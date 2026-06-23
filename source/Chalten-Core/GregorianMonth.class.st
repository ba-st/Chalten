"
A calendar month. In the ISO calendar, a month amongst the sequence of gregorian calendar
months, namely, January, February, March, April, May, June, July, August, September, October,
November and December.
In the ISO standard, a month is a fixed-order unit within the year. It encapsulates the logic for
day counts in both common and leap years in collaboration with the year abstraction and supports
cyclic arithmetic: gregorian months can be advanced a number of months or years without further
context given the circularity of this calendar.
"
Class {
	#name : 'GregorianMonth',
	#superclass : 'CalendarMonth',
	#instVars : [
		'numberOfDaysInCommonYear',
		'numberOfDaysInLeapYear',
		'positionInYear'
	],
	#classVars : [
		'AllMonths'
	],
	#category : 'Chalten-Core',
	#package : 'Chalten-Core'
}

{ #category : 'accessing' }
GregorianMonth class >> all [

  ^ AllMonths
]

{ #category : 'accessing' }
GregorianMonth class >> april [

  ^ AllMonths at: 4
]

{ #category : 'accessing' }
GregorianMonth class >> august [

  ^ AllMonths at: 8
]

{ #category : 'accessing' }
GregorianMonth class >> december [ 

  ^ AllMonths at: 12
]

{ #category : 'accessing' }
GregorianMonth class >> february [

  ^ AllMonths at: 2
]

{ #category : 'class initialization' }
GregorianMonth class >> initialize [

  <ignoreForCoverage>
  | january february march april june may july august september october november december |
  january := self
               named: 'January'
               shortNamed: 'Jan'
               positionInYear: 1
               numberOfDaysInYear: 31.
  february := self
                named: 'February'
                shortNamed: 'Feb'
                positionInYear: 2
                numberOfDaysInLeapYear: 29
                andInCommonYear: 28.
  march := self
             named: 'March'
             shortNamed: 'Mar'
             positionInYear: 3
             numberOfDaysInYear: 31.
  april := self
             named: 'April'
             shortNamed: 'Apr'
             positionInYear: 4
             numberOfDaysInYear: 30.
  may := self
           named: 'May'
           shortNamed: 'ShortName::May'
           positionInYear: 5
           numberOfDaysInYear: 31.
  june := self
            named: 'June'
            shortNamed: 'Jun'
            positionInYear: 6
            numberOfDaysInYear: 30.
  july := self
            named: 'July'
            shortNamed: 'Jul'
            positionInYear: 7
            numberOfDaysInYear: 31.
  august := self
              named: 'August'
              shortNamed: 'Aug'
              positionInYear: 8
              numberOfDaysInYear: 31.
  september := self
                 named: 'September'
                 shortNamed: 'Sep'
                 positionInYear: 9
                 numberOfDaysInYear: 30.
  october := self
               named: 'October'
               shortNamed: 'Oct'
               positionInYear: 10
               numberOfDaysInYear: 31.
  november := self
                named: 'November'
                shortNamed: 'Nov'
                positionInYear: 11
                numberOfDaysInYear: 30.
  december := self
                named: 'December'
                shortNamed: 'Dec'
                positionInYear: 12
                numberOfDaysInYear: 31.
  AllMonths := { january . february . march . april . may . june . july . august . september .
                 october . november . december }.
  AllMonths
    with: #( January February March April May June July August September October November December )
    do: [ :month :symbol | LanguagePlatform current globalNamed: symbol ifAbsentPut: [ month ] ]
]

{ #category : 'accessing' }
GregorianMonth class >> january [

  ^ AllMonths first
]

{ #category : 'accessing' }
GregorianMonth class >> july [

  ^ AllMonths at: 7
]

{ #category : 'accessing' }
GregorianMonth class >> june [

  ^ AllMonths at: 6
]

{ #category : 'accessing' }
GregorianMonth class >> march [

  ^ AllMonths at: 3
]

{ #category : 'accessing' }
GregorianMonth class >> may [

  ^ AllMonths at: 5
]

{ #category : 'accessing' }
GregorianMonth class >> monthAt: index [

  ^ AllMonths at: index
]

{ #category : 'private - instance creation' }
GregorianMonth class >> named: aName shortNamed: aShortName positionInYear: index numberOfDaysInLeapYear: leapNumber andInCommonYear: commonNumber [

  <ignoreForCoverage>
  ^ self new
      initializeNamed: aName
      shortNamed: aShortName
      positionInYear: index
      numberOfDaysInLeapYear: leapNumber * self day
      andInCommonYear: commonNumber * self day
]

{ #category : 'private - instance creation' }
GregorianMonth class >> named: aName shortNamed: aShortName positionInYear: index numberOfDaysInYear: number [

  <ignoreForCoverage>
  ^ self
      named: aName
      shortNamed: aShortName
      positionInYear: index
      numberOfDaysInLeapYear: number
      andInCommonYear: number
]

{ #category : 'accessing' }
GregorianMonth class >> november [ 

  ^ AllMonths at: 11
]

{ #category : 'accessing' }
GregorianMonth class >> october [ 

  ^ AllMonths at: 10
]

{ #category : 'accessing' }
GregorianMonth class >> september [ 

  ^ AllMonths at: 9
]

{ #category : 'instance creation' }
GregorianMonth >> , yearNumber [

  ^ yearNumber asGregorianYear monthAt: positionInYear
]

{ #category : 'private' }
GregorianMonth >> dayOfMonthAt: dayNumber [

  ^ CalendarDayOfMonth gregorianMonth: self dayNumber: dayNumber
]

{ #category : 'initialization' }
GregorianMonth >> initializeNamed: aName shortNamed: aShortName positionInYear: index numberOfDaysInLeapYear: daysInLeapYear andInCommonYear: daysInCommonYear [

  <ignoreForCoverage>
  name := aName.
  shortName := aShortName.
  positionInYear := index.
  numberOfDaysInLeapYear := daysInLeapYear.
  numberOfDaysInCommonYear := daysInCommonYear
]

{ #category : 'private' }
GregorianMonth >> isGregorian [

  ^ true
]

{ #category : 'querying' }
GregorianMonth >> next [

  ^ self next: 1 * ( TimeUnits units >> #month )
]

{ #category : 'querying' }
GregorianMonth >> next: relativeTimeQuantity [

  | numberOfMonths nextMonthIndex |
  relativeTimeQuantity isZero then: [ ^ self ].
  relativeTimeQuantity negative then: [ ^ self previous: relativeTimeQuantity abs ].
  numberOfMonths := ( relativeTimeQuantity convertTo: TimeUnits units >> #month ) numericalValue.
  nextMonthIndex := ( positionInYear + numberOfMonths - 1 rem: 12 ) + 1.
  ^ self class monthAt: nextMonthIndex
]

{ #category : 'accessing' }
GregorianMonth >> numberOfDaysInCommonYear [

  ^ numberOfDaysInCommonYear
]

{ #category : 'accessing' }
GregorianMonth >> numberOfDaysInLeapYear [

  ^ numberOfDaysInLeapYear
]

{ #category : 'accessing' }
GregorianMonth >> positionInYear [

  ^ positionInYear
]

{ #category : 'querying' }
GregorianMonth >> previous: relativeTimeQuantity [

  | numberOfMonths nextMonthIndex |
  relativeTimeQuantity isZero then: [ ^ self ].
  relativeTimeQuantity negative then: [ ^ self next: relativeTimeQuantity abs ].
  numberOfMonths := ( relativeTimeQuantity convertTo: TimeUnits units >> #month ) numericalValue.
  nextMonthIndex := ( ( positionInYear - numberOfMonths - 1 rem: 12 ) + 12 rem: 12 ) + 1.
  ^ self class monthAt: nextMonthIndex
]

{ #category : 'printing' }
GregorianMonth >> printAsISO8601On: stream [

  stream nextPutAll: ( positionInYear printStringLength: 2 padded: true )
]

{ #category : 'accessing - days' }
GregorianMonth >> thirtieth [

  ^ self
      whenNumberOfDaysInLeapYearGreaterThan: 29
      do: [ self dayOfMonthAt: 30 ]
      otherwise: [ self doesNotUnderstand: #thirtieth ]
]

{ #category : 'accessing - days' }
GregorianMonth >> thirtyFirst [

  ^ self
      whenNumberOfDaysInLeapYearGreaterThan: 30
      do: [ self dayOfMonthAt: 31 ]
      otherwise: [ self doesNotUnderstand: #thirtyFirst ]
]

{ #category : 'private' }
GregorianMonth >> whenNumberOfDaysInLeapYearGreaterThan: number do: aBlock otherwise: failBlock [

  ^ numberOfDaysInLeapYear > ( number * self class day ) then: aBlock otherwise: failBlock
]
