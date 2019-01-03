"
A DayOfMonth is the representation of certain day in a month. For example, April 21st.

Instance Variables
	dayNumber:	<Number>
	month:			<Month>

dayNumber
	- The day number.

month
	- The month.

"
Class {
	#name : #DayOfMonth,
	#superclass : #PointInTime,
	#instVars : [
		'month',
		'dayNumber'
	],
	#category : #'Chalten-Core-Time'
}

{ #category : #'instance creation' }
DayOfMonth class >> month: aMonth dayNumber: aDayNumber [

	(aMonth isValidDayNumber: aDayNumber)
		ifFalse: [InvalidDayOfMonthException signalMonth: aMonth dayNumber: aDayNumber].

	^self new initializeMonth: aMonth dayNumber: aDayNumber
]

{ #category : #'instance creation' }
DayOfMonth class >> monthNumber: aMonthNumber dayNumber: aDayNumber calendar: aCalendar [

	^self month: (aCalendar monthNumbered: aMonthNumber) dayNumber: aDayNumber
]

{ #category : #'accessing dates' }
DayOfMonth >> , aYearNumber [

	^self ofYear: (ChaltenYear number: aYearNumber calendar: self calendar)
]

{ #category : #'magnitude protocol' }
DayOfMonth >> < aDayOfMonth [

	self assertIsSameKindAs: aDayOfMonth.
	^month < aDayOfMonth month
		or: [month = aDayOfMonth month and: [dayNumber < aDayOfMonth dayNumber]]
]

{ #category : #comparing }
DayOfMonth >> = anObject [

	^self class = anObject class and: [
		month = anObject month and: [dayNumber = anObject dayNumber]]
]

{ #category : #'accessing - private' }
DayOfMonth >> calendar [

	^month calendar
]

{ #category : #accessing }
DayOfMonth >> dayNumber [

	^dayNumber
]

{ #category : #'interval protocol - private' }
DayOfMonth >> defaultIntervalIncrement [
	^ 1 dayMeasure
]

{ #category : #accessing }
DayOfMonth >> defaultMonthsForCircularStreamStrategy [

	^MonthsOfNonleapYearsForCircularStreamStrategy of: self calendar
]

{ #category : #querying }
DayOfMonth >> distanceTo: aDayOfMonth [

	^self distanceTo: aDayOfMonth strategy: self defaultMonthsForCircularStreamStrategy
]

{ #category : #'querying - private' }
DayOfMonth >> distanceTo: aDayOfMonth strategy: aMonthsForCircularStreamStrategy [

	^(DaysOfMonthsStream startingOn: self monthsStrategy: aMonthsForCircularStreamStrategy) distanceTo: aDayOfMonth
]

{ #category : #comparing }
DayOfMonth >> hash [

	^month hash bitXor: dayNumber hash
]

{ #category : #initialization }
DayOfMonth >> initializeMonth: aMonth dayNumber: aDayNumber [

	month := aMonth.
	dayNumber := aDayNumber
]

{ #category : #'interval protocol - private' }
DayOfMonth >> intervalStrategy [

	^RoundedTimelineIntervalStrategy new
]

{ #category : #testing }
DayOfMonth >> isFirstDayOfMonth [

	^dayNumber = 1
]

{ #category : #testing }
DayOfMonth >> isFirstDayOfYear [

	^self isFirstDayOfMonth and: [month = self calendar firstMonth]
]

{ #category : #testing }
DayOfMonth >> isLastDayOfMonth [

	^month lastDayNumber = dayNumber
]

{ #category : #querying }
DayOfMonth >> isLastDayOfMonthIn: aYear [

	^self = (month ofYear: aYear) lastDayOfMonth
]

{ #category : #testing }
DayOfMonth >> isLastDayOfYear [

	^self isLastDayOfMonth and: [month = self calendar lastMonth]
]

{ #category : #querying }
DayOfMonth >> isLastDayOfYearIn: aYear [

	^self = aYear lastDayOfMonth
]

{ #category : #'querying - private' }
DayOfMonth >> maximumNumberOfDaysInOneYear [

	^self calendar maximumNumberOfDaysInOneYear
]

{ #category : #accessing }
DayOfMonth >> month [

	^month
]

{ #category : #enumerating }
DayOfMonth >> next: aMeasure [

	^self next: aMeasure strategy: self defaultMonthsForCircularStreamStrategy
]

{ #category : #'enumerating - private' }
DayOfMonth >> next: aMeasure strategy: aMonthsForCircularStreamStrategy [

	^(DaysOfMonthsStream startingOn: self monthsStrategy: aMonthsForCircularStreamStrategy) next: aMeasure
]

{ #category : #'accessing days' }
DayOfMonth >> numberOfDaysFromBeginningOfMonth [

	^(dayNumber - 1) daysMeasure
]

{ #category : #'accessing days' }
DayOfMonth >> numberOfDaysToEndOfMonth [

	^month numberOfDays - dayNumber daysMeasure
]

{ #category : #'accessing days' }
DayOfMonth >> numberOfDaysToEndOfYear [

	^self distanceTo: self calendar lastMonth lastDayOfMonth
]

{ #category : #'accessing dates' }
DayOfMonth >> ofYear: aYear [

	^FixedDate year: aYear month: month dayNumber: dayNumber
]

{ #category : #printing }
DayOfMonth >> printOn: aStream [

	month printOn: aStream.
	aStream space.
	dayNumber printOn: aStream
]

{ #category : #'interval protocol' }
DayOfMonth >> to: aDayOfMonth everyDayNumber: aDayNumber [

	^self to: aDayOfMonth everyDayNumbers: (Array with: aDayNumber)
]

{ #category : #'interval protocol' }
DayOfMonth >> to: aDayOfMonth everyDayNumbers: aCollectionOfDayNumbers [

	^(self to: aDayOfMonth) select: [:dayOfMonth | aCollectionOfDayNumbers includes: dayOfMonth dayNumber]
]
