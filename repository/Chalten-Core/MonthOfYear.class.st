"
A MonthOfYear is the representation of certain month of certain year. For example, April of 2014.

Instance Variables
	month:		<Month>
	year:		<Year>

month
	- The month.

year
	- The year.

"
Class {
	#name : #MonthOfYear,
	#superclass : #PointInTime,
	#instVars : [
		'year',
		'month'
	],
	#category : #'Chalten-Core-Time'
}

{ #category : #'as yet unclassified' }
MonthOfYear class >> adarIIOf: aYear [

	^self year: aYear month: HebrewCalendar adarII
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> adarIOf: aYear [

	^self year: aYear month: HebrewCalendar adarI
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> adarOf: aYear [

	^self year: aYear month: HebrewCalendar adar
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> aprilOf: aYear [

	^self year: aYear month: aYear calendar april
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> augustOf: aYear [

	^self year: aYear month: aYear calendar august
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> avOf: aYear [

	^self year: aYear month: HebrewCalendar av
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> decemberOf: aYear [

	^self year: aYear month: aYear calendar december
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> dhuAlHijjaOf: aYear [

	^self year: aYear month: IslamicCalendar dhuAlHijja
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> dhuAlQadaOf: aYear [

	^self year: aYear month: IslamicCalendar dhuAlQada
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> elulOf: aYear [

	^self year: aYear month: HebrewCalendar elul
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> februaryOf: aYear [

	^self year: aYear month: aYear calendar february
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> iyyarOf: aYear [

	^self year: aYear month: HebrewCalendar iyyar
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> januaryOf: aYear [

	^self year: aYear month: aYear calendar january
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> julyOf: aYear [

	^self year: aYear month: aYear calendar july
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> jumadaIIOf: aYear [

	^self year: aYear month: IslamicCalendar jumadaII
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> jumadaIOf: aYear [

	^self year: aYear month: IslamicCalendar jumadaI
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> juneOf: aYear [

	^self year: aYear month: aYear calendar june
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> kislevOf: aYear [

	^self year: aYear month: HebrewCalendar kislev
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> marchOf: aYear [

	^self year: aYear month: aYear calendar march
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> marheshvanOf: aYear [

	^self year: aYear month: HebrewCalendar marheshvan
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> mayOf: aYear [

	^self year: aYear month: aYear calendar may
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> muharramOf: aYear [

	^self year: aYear month: IslamicCalendar muharram
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> nisanOf: aYear [

	^self year: aYear month: HebrewCalendar nisan
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> novemberOf: aYear [

	^self year: aYear month: aYear calendar november
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> octoberOf: aYear [

	^self year: aYear month: aYear calendar october
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> rabiIIOf: aYear [

	^self year: aYear month: IslamicCalendar rabiII
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> rabiIOf: aYear [

	^self year: aYear month: IslamicCalendar rabiI
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> rajabOf: aYear [

	^self year: aYear month: IslamicCalendar rajab
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> ramadanOf: aYear [

	^self year: aYear month: IslamicCalendar ramadan
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> safarOf: aYear [

	^self year: aYear month: IslamicCalendar safar
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> septemberOf: aYear [

	^self year: aYear month: aYear calendar september
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> shabanOf: aYear [

	^self year: aYear month: IslamicCalendar shaban
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> shawwalOf: aYear [

	^self year: aYear month: IslamicCalendar shawwal
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> shevatOf: aYear [

	^self year: aYear month: HebrewCalendar shevat
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> sivanOf: aYear [

	^self year: aYear month: HebrewCalendar sivan
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> tammuzOf: aYear [

	^self year: aYear month: HebrewCalendar tammuz
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> tevetOf: aYear [

	^self year: aYear month: HebrewCalendar tevet
]

{ #category : #'as yet unclassified' }
MonthOfYear class >> tishriOf: aYear [

	^self year: aYear month: HebrewCalendar tishri
]

{ #category : #'instance creation' }
MonthOfYear class >> year: aYear month: aMonth [

	aMonth assertIsValidIn: aYear.
	^self new initializeYear: aYear month: aMonth
]

{ #category : #'instance creation' }
MonthOfYear class >> year: aYear monthNumber: aMonthNumber [

	^self year: aYear monthNumber: aMonthNumber calendar: aYear calendar
]

{ #category : #'instance creation' }
MonthOfYear class >> year: aYear monthNumber: aMonthNumber calendar: aCalendar [

	^self year: aYear month: (aCalendar monthNumbered: aMonthNumber)
]

{ #category : #'instance creation' }
MonthOfYear class >> yearNumber: aYearNumber month: aMonth [

	^self yearNumber: aYearNumber month: aMonth calendar: aMonth calendar
]

{ #category : #'instance creation' }
MonthOfYear class >> yearNumber: aYearNumber month: aMonth calendar: aCalendar [

	^self year: (ChaltenYear number: aYearNumber calendar: aCalendar) month: aMonth
]

{ #category : #'instance creation' }
MonthOfYear class >> yearNumber: aYearNumber monthNumber: aMonthNumber calendar: aCalendar [

	^self 
		year: (ChaltenYear number: aYearNumber calendar: aCalendar)
		monthNumber: aMonthNumber
		calendar: aCalendar
]

{ #category : #'magnitude protocol' }
MonthOfYear >> < aMonthOfYear [

	self assertIsSameKindAs: aMonthOfYear.
	^year < aMonthOfYear year
		or: [ year = aMonthOfYear year and: [
			self month isPreviousTo: aMonthOfYear month in: year ]]
]

{ #category : #comparing }
MonthOfYear >> = anObject [

	^self class = anObject class 
		and: [month = anObject month 
		and: [year = anObject year]]
]

{ #category : #accessing }
MonthOfYear >> calendar [

	^month calendar
]

{ #category : #'accessing dates' }
MonthOfYear >> dates [

	^self firstDate to: self lastDate
]

{ #category : #'interval protocol - private' }
MonthOfYear >> defaultIntervalIncrement [
	^ 1 monthMeasure
]

{ #category : #querying }
MonthOfYear >> distanceTo: aMonthOfYear [

	| stream |

	aMonthOfYear < self ifTrue: [^(aMonthOfYear distanceTo: self) negated].
	stream := MonthsOfYearsStream startingOn: self.
	^stream distanceFrom: self to: aMonthOfYear
]

{ #category : #'accessing dates' }
MonthOfYear >> firstDate [

	^FixedDate monthOfYear: self dayNumber: 1
]

{ #category : #'accessing days' }
MonthOfYear >> firstDay [

	^self firstDate day
]

{ #category : #comparing }
MonthOfYear >> hash [

	^month hash bitXor: year hash
]

{ #category : #querying }
MonthOfYear >> includes: aPointInTime [

	^aPointInTime monthOfYear = self
]

{ #category : #initialization }
MonthOfYear >> initializeYear: aYear month: aMonth [

	year := aYear.
	month := aMonth
]

{ #category : #'interval protocol - private' }
MonthOfYear >> intervalStrategy [

	^PointInTimeIntervalStrategy new
]

{ #category : #testing }
MonthOfYear >> is: aMonth [

	^month is: aMonth
]

{ #category : #testing }
MonthOfYear >> isValidDayNumber: aDayNumber [

	^(month isValidDayNumber: aDayNumber) and: [
		aDayNumber <= self lastDayNumber ]
]

{ #category : #'accessing dates' }
MonthOfYear >> lastDate [

	^FixedDate monthOfYear: self dayNumber: self lastDayNumber
]

{ #category : #'accessing days' }
MonthOfYear >> lastDay [

	^self lastDate day
]

{ #category : #accessing }
MonthOfYear >> lastDayNumber [

	^month lastDayNumberIn: year
]

{ #category : #'accessing days' }
MonthOfYear >> lastDayOfMonth [

	^self lastDate dayOfMonth
]

{ #category : #accessing }
MonthOfYear >> month [

	^month
]

{ #category : #accessing }
MonthOfYear >> monthNumber [

	^month number
]

{ #category : #accessing }
MonthOfYear >> name [

	^month name
]

{ #category : #enumerating }
MonthOfYear >> next: aMeasure [

	aMeasure isNothing ifTrue: [^self].
	^(MonthsOfYearsStream startingOn: self) next: aMeasure
]

{ #category : #enumerating }
MonthOfYear >> nextMonth: aMonth [
	| yearsToMove |
	yearsToMove := (month >= aMonth
		ifTrue: [ 1 ]
		ifFalse: [ 0 ]) yearsMeasure.
	^ self nextMonth: aMonth in: yearsToMove
]

{ #category : #enumerating }
MonthOfYear >> nextMonth: aMonth in: aNumberOfYears [

	^(MonthsOfYearsStream startingOn: self) nextMonth: aMonth in: aNumberOfYears
]

{ #category : #accessing }
MonthOfYear >> numberOfDays [
	
	^month numberOfDaysIn: year
]

{ #category : #'accessing days' }
MonthOfYear >> numberOfDaysFromBeginningOfYear [

	^month numberOfDaysFromBeginningOfYearIn: year
]

{ #category : #'accessing days' }
MonthOfYear >> numberOfDaysFromEpoch [

	^(self calendar numberOfDaysFromEpochTo: year firstDate) + self numberOfDaysFromBeginningOfYear
]

{ #category : #'accessing dates' }
MonthOfYear >> onOrLast: aDayNumber [

	^(self isValidDayNumber: aDayNumber)
		ifTrue: [FixedDate monthOfYear: self dayNumber: aDayNumber]
		ifFalse: [self lastDate]
]

{ #category : #'accessing days' }
MonthOfYear >> ordinal: aNumber day: aDay [

	| dates |

	dates := self firstDate to: self lastDate everyDay: aDay.
	^dates at: aNumber
]

{ #category : #enumerating }
MonthOfYear >> previousMonth: aMonth [
	| yearsToMove |
	yearsToMove := (month <= aMonth
		ifTrue: [ 1 ]
		ifFalse: [ 0 ]) yearsMeasure.
	^ self previousMonth: aMonth in: yearsToMove
]

{ #category : #enumerating }
MonthOfYear >> previousMonth: aMonth in: aNumberOfYears [

	^self nextMonth: aMonth in: aNumberOfYears negated
]

{ #category : #printing }
MonthOfYear >> printOn: aStream [

	month printOn: aStream.
	aStream nextPutAll: ' of '.
	year printOn: aStream
]

{ #category : #accessing }
MonthOfYear >> year [

	^year
]
