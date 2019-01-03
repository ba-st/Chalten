"
A ChaltenYear is a year representation.

Instance Variables
	calendar:		<CalendarDefinition>
	number:		<Number>
	type:			<YearType>

calendar
	- The calendar that the year belongs to.

number
	- The year number.

type
	- The type, leap or nonleap.

"
Class {
	#name : #ChaltenYear,
	#superclass : #PointInTime,
	#instVars : [
		'number',
		'type',
		'calendar'
	],
	#classInstVars : [
		'leapType',
		'nonleapType'
	],
	#category : #'Chalten-Core-Time'
}

{ #category : #'instance creation - private' }
ChaltenYear class >> createYear: aNumber calendar: aCalendar [

	^self new initializeNumber: aNumber type: (self typeFor: aNumber calendar: aCalendar) calendar: aCalendar
]

{ #category : #initialization }
ChaltenYear class >> initialize [

	super initialize.
	YearType subclasses do: [:class | class initializeUniqueInstance].
	self initializeLeapType.
	self initializeNonleapType
]

{ #category : #initialization }
ChaltenYear class >> initializeLeapType [

	leapType := LeapYearType new
]

{ #category : #initialization }
ChaltenYear class >> initializeNonleapType [

	nonleapType := NonleapYearType new
]

{ #category : #testing }
ChaltenYear class >> isYearNumberLeap: aNumber calendar: aCalendar [

	^aCalendar isYearNumberLeap: aNumber
]

{ #category : #'accessing - private' }
ChaltenYear class >> leapType [

	^leapType
]

{ #category : #'accessing - private' }
ChaltenYear class >> nonleapType [

	^nonleapType
]

{ #category : #'instance creation' }
ChaltenYear class >> number: aNumber calendar: aCalendar [

	aCalendar assertYearNumber: aNumber.
	^self createYear: aNumber calendar: aCalendar
]

{ #category : #querying }
ChaltenYear class >> typeFor: aNumber calendar: aCalendar [

	^(self isYearNumberLeap: aNumber calendar: aCalendar)
		ifTrue: [self leapType]
		ifFalse: [self nonleapType]
]

{ #category : #'magnitude protocol' }
ChaltenYear >> < aYear [

	self assertIsSameKindAs: aYear.
	^self number < aYear number
]

{ #category : #comparing }
ChaltenYear >> = anObject [

	^self == anObject 
		or: [ (anObject isKindOf: ChaltenYear) 
		and: [ self number = anObject number ]]
]

{ #category : #'as yet unclassified' }
ChaltenYear >> adar [

	^MonthOfYear year: self month: calendar adar
]

{ #category : #'as yet unclassified' }
ChaltenYear >> adarI [

	^MonthOfYear year: self month: calendar adarI
]

{ #category : #'as yet unclassified' }
ChaltenYear >> adarII [

	^MonthOfYear year: self month: calendar adarII
]

{ #category : #'accessing months' }
ChaltenYear >> amountOfMonths [

	^type amountOfMonthsIn: self
]

{ #category : #'accessing months' }
ChaltenYear >> amountOfMonthsInLeapYears [

	^calendar amountOfMonthsInLeapYears
]

{ #category : #'accessing months' }
ChaltenYear >> amountOfMonthsInNonleapYears [

	^calendar amountOfMonthsInNonleapYears
]

{ #category : #'as yet unclassified' }
ChaltenYear >> april [

	^MonthOfYear year: self month: calendar april
]

{ #category : #'months stream accessing' }
ChaltenYear >> arrayOfMonths [

	^type arrayOfMonthsOf: self
]

{ #category : #'months stream accessing' }
ChaltenYear >> arrayOfMonthsInLeapYears [

	^calendar monthsForLeapYears
]

{ #category : #'months stream accessing' }
ChaltenYear >> arrayOfMonthsInNonleapYears [

	^calendar monthsForNonleapYears
]

{ #category : #'as yet unclassified' }
ChaltenYear >> august [

	^MonthOfYear year: self month: calendar august
]

{ #category : #'as yet unclassified' }
ChaltenYear >> av [

	^MonthOfYear year: self month: calendar av
]

{ #category : #accessing }
ChaltenYear >> calendar [

	^calendar
]

{ #category : #'accessing dates' }
ChaltenYear >> dates [
	
	^self firstDate to: self lastDate
]

{ #category : #'as yet unclassified' }
ChaltenYear >> december [

	^MonthOfYear year: self month: calendar december
]

{ #category : #'interval protocol - private' }
ChaltenYear >> defaultIntervalIncrement [
	^ 1 yearMeasure
]

{ #category : #'as yet unclassified' }
ChaltenYear >> dhuAlHijja [

	^MonthOfYear year: self month: calendar dhuAlHijja
]

{ #category : #'as yet unclassified' }
ChaltenYear >> dhuAlQada [

	^MonthOfYear year: self month: calendar dhuAlQada
]

{ #category : #querying }
ChaltenYear >> distanceTo: aYear [

	^calendar distanceInYearsFrom: self to: aYear
]

{ #category : #'as yet unclassified' }
ChaltenYear >> elul [

	^MonthOfYear year: self month: calendar elul
]

{ #category : #'as yet unclassified' }
ChaltenYear >> february [

	^MonthOfYear year: self month: calendar february
]

{ #category : #'accessing dates' }
ChaltenYear >> firstDate [

	^FixedDate monthOfYear: self firstMonth dayNumber: 1
]

{ #category : #'accessing days' }
ChaltenYear >> firstDay [
	
	^self firstDate day
]

{ #category : #'accessing months' }
ChaltenYear >> firstMonth [

	^calendar firstMonthOf: self
]

{ #category : #comparing }
ChaltenYear >> hash [

	^self number hash
]

{ #category : #'as yet unclassified' }
ChaltenYear >> ifLongMarheshvanDo: aBlock else: anotherBlock [

	^calendar
		ifLongMarheshvanIn: self
		do: aBlock
		else: anotherBlock
]

{ #category : #'as yet unclassified' }
ChaltenYear >> ifShortKislevDo: aBlock else: anotherBlock [

	^calendar
		ifShortKislevIn: self
		do: aBlock
		else: anotherBlock
]

{ #category : #querying }
ChaltenYear >> includes: aPointInTime [

	^aPointInTime year = self
]

{ #category : #initialization }
ChaltenYear >> initializeNumber: aNumber type: aType calendar: aCalendar [

	number := aNumber.
	type := aType.
	calendar := aCalendar
]

{ #category : #'interval protocol - private' }
ChaltenYear >> intervalStrategy [

	^PointInTimeIntervalStrategy new
]

{ #category : #testing }
ChaltenYear >> isLeap [

	^type isLeap
]

{ #category : #'as yet unclassified' }
ChaltenYear >> iyyar [

	^MonthOfYear year: self month: calendar iyyar
]

{ #category : #'as yet unclassified' }
ChaltenYear >> january [

	^MonthOfYear year: self month: calendar january
]

{ #category : #'as yet unclassified' }
ChaltenYear >> july [

	^MonthOfYear year: self month: calendar july
]

{ #category : #'as yet unclassified' }
ChaltenYear >> jumadaI [

	^MonthOfYear year: self month: calendar jumadaI
]

{ #category : #'as yet unclassified' }
ChaltenYear >> jumadaII [

	^MonthOfYear year: self month: calendar jumadaII
]

{ #category : #'as yet unclassified' }
ChaltenYear >> june [

	^MonthOfYear year: self month: calendar june
]

{ #category : #'as yet unclassified' }
ChaltenYear >> kislev [

	^MonthOfYear year: self month: calendar kislev
]

{ #category : #'accessing dates' }
ChaltenYear >> lastDate [

	| lastMonth |

	lastMonth := self lastMonth.
	^FixedDate monthOfYear: lastMonth dayNumber: lastMonth lastDayNumber
]

{ #category : #'accessing days' }
ChaltenYear >> lastDay [
	
	^self lastDate day
]

{ #category : #'accessing days' }
ChaltenYear >> lastDayOfMonth [

	^self lastDate dayOfMonth
]

{ #category : #'accessing months' }
ChaltenYear >> lastMonth [
	
	^calendar lastMonthOf: self
]

{ #category : #'as yet unclassified' }
ChaltenYear >> march [

	^MonthOfYear year: self month: calendar march
]

{ #category : #'as yet unclassified' }
ChaltenYear >> marheshvan [

	^MonthOfYear year: self month: calendar marheshvan
]

{ #category : #'as yet unclassified' }
ChaltenYear >> may [

	^MonthOfYear year: self month: calendar may
]

{ #category : #'month of year creation' }
ChaltenYear >> month: aMonth [

	^MonthOfYear year: self month: aMonth
]

{ #category : #'accessing months' }
ChaltenYear >> monthNumbered: aNumber [

	| month |
	month := type monthNumbered: aNumber in: calendar.
	^month ofYear: self
]

{ #category : #'accessing months' }
ChaltenYear >> months [

	^self firstMonth to: self lastMonth
]

{ #category : #'as yet unclassified' }
ChaltenYear >> muharram [

	^MonthOfYear year: self month: calendar muharram
]

{ #category : #enumerating }
ChaltenYear >> newNumberFrom: aNumberOfYears [

	^calendar newYearNumberFrom: self adding: aNumberOfYears
]

{ #category : #enumerating }
ChaltenYear >> next: aMeasure [

	^self nextNumberOfYears: (aMeasure convertTo: TimeUnits year) amount
]

{ #category : #enumerating }
ChaltenYear >> nextLeapYear [

	| newYear |

	newYear := self next.
	[newYear isLeap] whileFalse: [newYear := newYear next].

	^newYear
]

{ #category : #enumerating }
ChaltenYear >> nextNumberOfYears: numberOfYears [

	| newNumber |
	newNumber := self newNumberFrom: numberOfYears.
	^self class number: newNumber calendar: calendar
]

{ #category : #'as yet unclassified' }
ChaltenYear >> nisan [

	^MonthOfYear year: self month: calendar nisan
]

{ #category : #'as yet unclassified' }
ChaltenYear >> november [

	^MonthOfYear year: self month: calendar november
]

{ #category : #accessing }
ChaltenYear >> number [

	^number
]

{ #category : #'accessing days' }
ChaltenYear >> numberOfDays [

	^calendar numberOfDaysIn: self
]

{ #category : #'accessing days' }
ChaltenYear >> numberOfDaysFor: aMonthDefinition [
	
	^type numberOfDaysFor: aMonthDefinition
]

{ #category : #'accessing months' }
ChaltenYear >> numberOfMonths [

	^self amountOfMonths monthsMeasure
]

{ #category : #'as yet unclassified' }
ChaltenYear >> october [

	^MonthOfYear year: self month: calendar october
]

{ #category : #enumerating }
ChaltenYear >> previousLeapYear [

	| newYear |

	newYear := self previous.
	[newYear isLeap] whileFalse: [newYear := newYear previous].

	^newYear
]

{ #category : #printing }
ChaltenYear >> printOn: aStream [

	aStream nextPutAll: 'Year '.
	self number printOn: aStream
]

{ #category : #'as yet unclassified' }
ChaltenYear >> rabiI [

	^MonthOfYear year: self month: calendar rabiI
]

{ #category : #'as yet unclassified' }
ChaltenYear >> rabiII [

	^MonthOfYear year: self month: calendar rabiII
]

{ #category : #'as yet unclassified' }
ChaltenYear >> rajab [

	^MonthOfYear year: self month: calendar rajab
]

{ #category : #'as yet unclassified' }
ChaltenYear >> ramadan [

	^MonthOfYear year: self month: calendar ramadan
]

{ #category : #'as yet unclassified' }
ChaltenYear >> safar [

	^MonthOfYear year: self month: calendar safar
]

{ #category : #'as yet unclassified' }
ChaltenYear >> september [

	^MonthOfYear year: self month: calendar september
]

{ #category : #'as yet unclassified' }
ChaltenYear >> shaban [

	^MonthOfYear year: self month: calendar shaban
]

{ #category : #'as yet unclassified' }
ChaltenYear >> shawwal [

	^MonthOfYear year: self month: calendar shawwal
]

{ #category : #'as yet unclassified' }
ChaltenYear >> shevat [

	^MonthOfYear year: self month: calendar shevat
]

{ #category : #'as yet unclassified' }
ChaltenYear >> sivan [

	^MonthOfYear year: self month: calendar sivan
]

{ #category : #'as yet unclassified' }
ChaltenYear >> tammuz [

	^MonthOfYear year: self month: calendar tammuz
]

{ #category : #'as yet unclassified' }
ChaltenYear >> tevet [

	^MonthOfYear year: self month: calendar tevet
]

{ #category : #'as yet unclassified' }
ChaltenYear >> tishri [

	^MonthOfYear year: self month: calendar tishri
]
