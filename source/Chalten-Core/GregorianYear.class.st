"
A year in the Gregorian Calendar.
The gregorian calendar is a solar calendar designed to keep the calendar year in sync with the Earth's orbit around the sun.
Due to differences between the common year and the time it takes the Earth to perform one orbit of the sun, not every year
has the same number of days. On common years , the gregorian year has 365 days; and in leap years 366 days. This extra day
is added to the month of February.
This implementation of the Gregorian calendar is proleptic extending the Gregorian calendar backward to dates before its 1582
 introduction, creating a consistent dating system across history.
"
Class {
	#name : 'GregorianYear',
	#superclass : 'CalendarYear',
	#instVars : [
		'number',
		'months'
	],
	#classInstVars : [
		'years'
	],
	#category : 'Chalten-Core',
	#package : 'Chalten-Core'
}

{ #category : 'private - accessing' }
GregorianYear class >> calendarName [

  ^ 'Gregorian' localized
]

{ #category : 'class initialization' }
GregorianYear class >> initialize [

  <ignoreForCoverage>
  years := IdentityDictionary new
]

{ #category : 'instance creation' }
GregorianYear class >> number: anInteger [

  self assertIsValid: anInteger.
  ^ years at: anInteger ifAbsentPut: [ self new initializeNumber: anInteger ]
]

{ #category : 'arithmetic' }
GregorianYear >> + aQuantity [

  ^ self next: aQuantity
]

{ #category : 'arithmetic' }
GregorianYear >> - aGregorianYear [

  ^ number - aGregorianYear number * self class year
]

{ #category : 'comparing' }
GregorianYear >> = anObject [

  ^ self equalityChecker
      compare: #number;
      checkAgainst: anObject
]

{ #category : 'accessing - months' }
GregorianYear >> april [

  ^ self monthAt: 4
]

{ #category : 'accessing - months' }
GregorianYear >> august [

  ^ self monthAt: 8
]

{ #category : 'accessing - months' }
GregorianYear >> december [

  ^ self monthAt: 12
]

{ #category : 'accessing - months' }
GregorianYear >> february [

  ^ self monthAt: 2
]

{ #category : 'accessing' }
GregorianYear >> firstDate [

  ^ self january first
]

{ #category : 'comparing' }
GregorianYear >> hash [

  ^ number hash
]

{ #category : 'initialization' }
GregorianYear >> initializeNumber: anInteger [

  number := anInteger.
  months := Array new: 12
]

{ #category : 'testing' }
GregorianYear >> isCentennialYear [

  ^ number \\ 100 = 0
]

{ #category : 'testing' }
GregorianYear >> isComparableTo: aQuantity [

  ^ aQuantity unit isCommensurableWith: self class year
]

{ #category : 'testing' }
GregorianYear >> isLeapYear [
  " A leap year in the Gregorian Calendar is a calendar year that has 366 calendar days.
	A leap year is a calendar year whose year number is divisible by four and is not a
	centennial year, or a centennial year whose year number is divisible by four hundred."

  ^ ( self isYearNumberDivisibleByFour and: [ self isCentennialYear not ] ) or: [
        self isCentennialYear and: [ self isYearNumberDivisibleByFourHundred ] ]
]

{ #category : 'private - testing' }
GregorianYear >> isYearNumberDivisibleByFour [

  ^ number \\ 4 = 0
]

{ #category : 'private - testing' }
GregorianYear >> isYearNumberDivisibleByFourHundred [

  ^ number \\ 400 = 0
]

{ #category : 'accessing - months' }
GregorianYear >> january [

  ^ self monthAt: 1
]

{ #category : 'accessing - months' }
GregorianYear >> july [

  ^ self monthAt: 7
]

{ #category : 'accessing - months' }
GregorianYear >> june [

  ^ self monthAt: 6
]

{ #category : 'accessing' }
GregorianYear >> lastDate [

  ^ self december last
]

{ #category : 'accessing - months' }
GregorianYear >> march [

  ^ self monthAt: 3
]

{ #category : 'accessing - months' }
GregorianYear >> may [

  ^ self monthAt: 5
]

{ #category : 'accessing - months' }
GregorianYear >> monthAt: monthIndex [

  ^ ( months at: monthIndex )
      ifNil: [
          months
            at: monthIndex
            put: ( GregorianMonthOfYear year: self month: ( GregorianMonth monthAt: monthIndex ) )
        ]
      ifNotNil: [ :month | month ]
]

{ #category : 'accessing - months' }
GregorianYear >> november [

  ^ self monthAt: 11
]

{ #category : 'accessing' }
GregorianYear >> number [

  ^ number
]

{ #category : 'accessing' }
GregorianYear >> numberOfDays [

  ^ self class day * ( self isLeapYear then: [ 366 ] otherwise: [ 365 ] )
]

{ #category : 'accessing' }
GregorianYear >> numberOfMonths [

  ^ 12 * self class month
]

{ #category : 'accessing - months' }
GregorianYear >> october [

  ^ self monthAt: 10
]

{ #category : 'printing' }
GregorianYear >> printAsISO8601On: stream [

  | minimumLength |
  number positive
    then: [ number > 9999 then: [ stream nextPut: $+ ] ]
    otherwise: [ stream nextPut: $- ].
  minimumLength := number abs > 9999 then: [ 6 ] otherwise: [ 4 ].
  stream nextPutAll: ( number abs printStringLength: minimumLength padded: true )
]

{ #category : 'printing' }
GregorianYear >> printOn: stream [

	stream print: number 
]

{ #category : 'accessing - months' }
GregorianYear >> september [

  ^ self monthAt: 9
]

{ #category : 'instance creation' }
GregorianYear >> to: aGregorianYear [

  ^ self to: aGregorianYear by: 1 * self class year
]

{ #category : 'interval creation' }
GregorianYear >> to: aGregorianYear by: step [

  ^ DiscreteInterval from: self to: aGregorianYear by: step
]
