"
A DaysOfMonthsStream is a stream of days of months.

Instance Variables
	current:	<DayOfMonth>
	start:		<DayOfMonth>
	strategy:	<MonthsOfLeapYearsForCircularStreamStrategy> | <MonthsOfNonleapYearsForCircularStreamStrategy>

current
	- The current day of month.

start
	- The staritng point in time.

strategy
	- How we advance through the stream.

"
Class {
	#name : 'DaysOfMonthsStream',
	#superclass : 'Object',
	#instVars : [
		'start',
		'current',
		'strategy'
	],
	#category : 'Chalten-Core-Time',
	#package : 'Chalten-Core',
	#tag : 'Time'
}

{ #category : 'instance creation' }
DaysOfMonthsStream class >> startingOn: aMonthOfYear monthsStrategy: aMonthsStrategy [

	^self new initializeStartingOn: aMonthOfYear monthsStrategy: aMonthsStrategy
]

{ #category : 'querying' }
DaysOfMonthsStream >> distanceTo: aDayOfMonth [

	| daysCount numberOfDays |
	
	daysCount := (current month to: aDayOfMonth month)
		inject: 0
		into: [ :sum :month | sum + (strategy numberOfDaysOf: month) ].
	numberOfDays := (daysCount amount - current dayNumber) + (aDayOfMonth dayNumber -
		(strategy numberOfDaysOf: aDayOfMonth month) amount).
	numberOfDays < 0
		ifTrue: [ numberOfDays := (strategy stream
			inject: 0
			into: [ :sum :month | sum + (strategy numberOfDaysOf: month) ]) amount + numberOfDays ].
	^numberOfDays daysMeasure
]

{ #category : 'initialization' }
DaysOfMonthsStream >> initializeStartingOn: aDayOfMonth monthsStrategy: aMonthsStrategy [

	start := aDayOfMonth.
	current := start.
	strategy := aMonthsStrategy
]

{ #category : 'enumerating' }
DaysOfMonthsStream >> next [
	^ self next: 1 dayMeasure
]

{ #category : 'enumerating' }
DaysOfMonthsStream >> next: aMeasure [

	| daysToAdd stream lastDayNumber |
	
	aMeasure negative ifTrue: [ ^self previous: aMeasure negated ].
	daysToAdd := current dayNumber + (aMeasure convertTo: TimeUnits day) amount.
	stream := strategy stream.
	stream upTo: current month.
	lastDayNumber := (strategy numberOfDaysOf: current month) amount.
	(daysToAdd > lastDayNumber)
		ifTrue: [
			current := stream next firstDayOfMonth.
			^self next: (daysToAdd - lastDayNumber - 1) daysMeasure ]
		ifFalse: [
			current := DayOfMonth month: current month dayNumber: daysToAdd ].
	^current
]

{ #category : 'enumerating' }
DaysOfMonthsStream >> previous [
	^ self previous: 1 dayMeasure
]

{ #category : 'enumerating' }
DaysOfMonthsStream >> previous: aMeasure [

	| daysToSubtract stream |
	
	aMeasure negative ifTrue: [ ^self next: aMeasure negated ].
	daysToSubtract := current dayNumber - (aMeasure convertTo: TimeUnits day) amount.
	stream := strategy stream.
	stream upTo: current month.
	(daysToSubtract < 1)
		ifTrue: [ | lastDayNumber |
			current := stream previous firstDayOfMonth.
			lastDayNumber := (strategy numberOfDaysOf: current month) amount.
			^self next: (lastDayNumber + daysToSubtract - 1) daysMeasure ]
		ifFalse: [
			current := DayOfMonth month: current month dayNumber: daysToSubtract ].
	^current
]
