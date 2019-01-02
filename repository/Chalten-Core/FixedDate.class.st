"
A FixedDate is a particular date. For example, the gregorian date April 21st, 2014.

Instance Variables
	calendar:			<CalenarDefinition>
	dayNumber:		<Number>
	monthOfYear:		<monthOfYear>

calendar
	- The calendar that this date belongs to.

dayNumber
	- The day number.

monthOfYear
	- The month of year.

"
Class {
	#name : #FixedDate,
	#superclass : #DateBehavior,
	#instVars : [
		'dayNumber',
		'monthOfYear',
		'calendar'
	],
	#category : #'Chalten-Core-Time'
}

{ #category : #'instance creation' }
FixedDate class >> monthOfYear: aMonthOfYear dayNumber: aDayNumber [

	^self monthOfYear: aMonthOfYear dayNumber: aDayNumber calendar: aMonthOfYear calendar
]

{ #category : #'instance creation' }
FixedDate class >> monthOfYear: aMonthOfYear dayNumber: aDayNumber calendar: aCalendar [

	(aMonthOfYear isValidDayNumber: aDayNumber) 
		ifFalse: [InvalidDateException signalMonthOfYear: aMonthOfYear dayNumber: aDayNumber].
	^ self new
		initializeMonthOfYear: aMonthOfYear
		dayNumber: aDayNumber
		calendar: aCalendar
]

{ #category : #'instance creation - private' }
FixedDate class >> monthOfYearWithYearNumber: aYearNumber monthNumber: aMonthNumber calendar: aCalendar [

	| year |
	year := ChaltenYear number: aYearNumber calendar: aCalendar.
	^year monthNumbered: aMonthNumber
]

{ #category : #'instance creation' }
FixedDate class >> year: aYear month: aMonth dayNumber: aNumber [

	^self
		monthOfYear: (MonthOfYear year: aYear month: aMonth)
		dayNumber: aNumber
		calendar: aMonth calendar
]

{ #category : #'instance creation' }
FixedDate class >> yearNumber: aYearNumber month: aMonth dayNumber: aDayNumber [

	^self
		monthOfYear: (MonthOfYear yearNumber: aYearNumber month: aMonth)
		dayNumber: aDayNumber
		calendar: aMonth calendar
]

{ #category : #'instance creation' }
FixedDate class >> yearNumber: aYearNumber monthNumber: aMonthNumber dayNumber: aDayNumber calendar: aCalendar [

	^self
		monthOfYear: (self monthOfYearWithYearNumber: aYearNumber monthNumber: aMonthNumber calendar: aCalendar)
		dayNumber: aDayNumber
		calendar: aCalendar
]

{ #category : #'magnitude protocol' }
FixedDate >> < aDate [

	self assertIsSameKindAs: aDate.
	^self monthOfYear < aDate monthOfYear
		or: [self monthOfYear = aDate monthOfYear and: [self dayNumber < aDate dayNumber]]
]

{ #category : #comparing }
FixedDate >> = aDate [

	^(aDate isKindOf: DateBehavior)
		and: [self numberOfDaysFromEpoch = aDate numberOfDaysFromEpoch]
]

{ #category : #'as yet unclassified' }
FixedDate >> asGregorian [

	^calendar convertToGregorianDate: self
]

{ #category : #'as yet unclassified' }
FixedDate >> asHebrew [

	^calendar convertToHebrewDate: self
]

{ #category : #'as yet unclassified' }
FixedDate >> asIslamic [

	^calendar convertToIslamicDate: self
]

{ #category : #'as yet unclassified' }
FixedDate >> asJulian [

	^calendar convertToJulianDate: self
]

{ #category : #converting }
FixedDate >> asSmalltalkDate [

	^calendar convertToSmalltalkDate: self
]

{ #category : #'accessing datetime' }
FixedDate >> at: aTimeOfDay [

	^self atTimeOfDay: aTimeOfDay
]

{ #category : #'accessing datetime' }
FixedDate >> atTimeOfDay: aTimeOfDay [

	^DateTime date: self timeOfDay: aTimeOfDay
]

{ #category : #accessing }
FixedDate >> calendar [

	^calendar
]

{ #category : #'accessing days' }
FixedDate >> day [

	^calendar dayOf: self
]

{ #category : #accessing }
FixedDate >> dayNumber [

	^dayNumber
]

{ #category : #'accessing days' }
FixedDate >> dayNumberFromEpoch [

	^calendar dayNumberFromEpochTo: self
]

{ #category : #accessing }
FixedDate >> dayOfMonth [

	^DayOfMonth month: self month dayNumber: self dayNumber
]

{ #category : #'accessing datetime' }
FixedDate >> firstTimeOfDay [

	^DateTime
		date: self
		timeOfDay: TimeOfDay firstTimeOfDay
]

{ #category : #comparing }
FixedDate >> hash [

	^self numberOfDaysFromEpoch hash
]

{ #category : #querying }
FixedDate >> includes: aPointInTime [

	^aPointInTime date = self
]

{ #category : #initialization }
FixedDate >> initializeMonthOfYear: aMonthOfYear dayNumber: aDayNumber calendar: aCalendar [

	monthOfYear := aMonthOfYear.
	dayNumber := aDayNumber.
	calendar := aCalendar
]

{ #category : #testing }
FixedDate >> isFirstDayOfMonth [

	^self dayNumber = 1
]

{ #category : #testing }
FixedDate >> isFirstDayOfYear [

	^self isFirstDayOfMonth and: [self isFirstMonthOfYear]
]

{ #category : #testing }
FixedDate >> isLastDayOfMonth [

	^self monthOfYear lastDayNumber = self dayNumber
]

{ #category : #testing }
FixedDate >> isLastDayOfYear [

	^self year lastDate = self
]

{ #category : #'accessing datetime' }
FixedDate >> lastTimeOfDay [

	^DateTime
		date: self
		timeOfDay: TimeOfDay lastTimeOfDay
]

{ #category : #accessing }
FixedDate >> monthOfYear [

	^monthOfYear
]

{ #category : #enumerating }
FixedDate >> next: aMeasure [

	^(TimeUnits day sameDomainAs: aMeasure unit)
		ifTrue: [calendar dateFromDays: (self dayNumberFromEpoch + aMeasure)]
		ifFalse: [self nextMonth: aMeasure]
]

{ #category : #enumerating }
FixedDate >> nextMonth: aMeasure [

	^(self monthOfYear next: aMeasure) onOrLast: self dayNumber
]

{ #category : #'accessing days' }
FixedDate >> numberOfDaysFromBeginningOfMonth [

	^(self dayNumber - 1) daysMeasure
]

{ #category : #'accessing days' }
FixedDate >> numberOfDaysFromBeginningOfYear [

	^self monthOfYear numberOfDaysFromBeginningOfYear + self numberOfDaysFromBeginningOfMonth
]

{ #category : #'accessing days' }
FixedDate >> numberOfDaysFromEpoch [

	^calendar numberOfDaysFromEpochTo: self
]

{ #category : #'accessing days' }
FixedDate >> numberOfDaysToEndOfMonth [

	^self monthOfYear numberOfDays - self dayNumber daysMeasure
]

{ #category : #'accessing days' }
FixedDate >> numberOfDaysToEndOfYear [

	^self distanceTo: self monthOfYear year lastDate
]

{ #category : #printing }
FixedDate >> printOn: aStream [

	self month printOn: aStream.
	aStream space.
	self dayNumber printOn: aStream.
	aStream nextPut: $,.
	aStream space.
	self year number printOn: aStream
]
