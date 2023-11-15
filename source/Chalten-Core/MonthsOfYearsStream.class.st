"
A MonthsOfYearsStream is stream of months.

Instance Variables
	current:					<Month>
	currentCircularStream:		<Stream>
	start:						<Month>

current
	- The current month.

currentCircularStream
	- The stream.

start
	- The start point.

"
Class {
	#name : 'MonthsOfYearsStream',
	#superclass : 'Object',
	#instVars : [
		'start',
		'current',
		'currentCircularStream'
	],
	#category : 'Chalten-Core-Time',
	#package : 'Chalten-Core',
	#tag : 'Time'
}

{ #category : 'instance creation' }
MonthsOfYearsStream class >> startingOn: aMonthOfYear [

	^self new initializeStartingOn: aMonthOfYear
]

{ #category : 'querying' }
MonthsOfYearsStream >> distanceFrom: aMonthOfYear to: anotherMonthOfYear [
	| months |
	months := 0 monthsMeasure.
	[ current = anotherMonthOfYear ]
		whileFalse: [ 
			currentCircularStream
				ifAtEndDo: [ 
					current := currentCircularStream next ofYear: current year next.
					self initializeCurrentCircularStream ]
				else: [ current := currentCircularStream next ofYear: current year ].
			months := months + 1 monthMeasure ].
	^ months
]

{ #category : 'initialization' }
MonthsOfYearsStream >> initializeCurrentCircularStream [

	currentCircularStream := CircularReadStream on: current year arrayOfMonths moving: TimeUnits month startingCircleAt: current calendar firstMonth.
	currentCircularStream upTo: current month
]

{ #category : 'initialization' }
MonthsOfYearsStream >> initializeStartingOn: aMonthOfYear [

	start := aMonthOfYear.
	current := start.
	self initializeCurrentCircularStream
]

{ #category : 'enumerating' }
MonthsOfYearsStream >> next [
	^ self next: 1 monthMeasure
]

{ #category : 'enumerating' }
MonthsOfYearsStream >> next: aMeasure [
	| monthsToAdd distanceToTheEndOfYear |
	aMeasure negative
		ifTrue: [ ^ self previous: aMeasure negated ].
	aMeasure unit = TimeUnits year
		ifTrue: [ ^ self nextInNumberOfYears: aMeasure ].
	monthsToAdd := aMeasure convertTo: TimeUnits month.
	distanceToTheEndOfYear := currentCircularStream distanceFrom: current month to: currentCircularStream last.
	monthsToAdd <= distanceToTheEndOfYear
		ifTrue: [ self upTo: ((currentCircularStream next: monthsToAdd) ofYear: current year) ]
		ifFalse: [ 
			self upTo: (currentCircularStream upToBegin current ofYear: current year next).
			self initializeCurrentCircularStream.
			self next: monthsToAdd - distanceToTheEndOfYear - 1 monthMeasure ].
	^ current
]

{ #category : 'enumerating' }
MonthsOfYearsStream >> nextInNumberOfYears: aNumberOfYears [

	^aNumberOfYears positive
		ifTrue: [self nextMonth: current month in: aNumberOfYears]
		ifFalse: [self previousMonth: current month in: aNumberOfYears negated]
]

{ #category : 'enumerating' }
MonthsOfYearsStream >> nextMonth: aMonth in: aNumberOfYears [

	aNumberOfYears negative ifTrue: [^self previousMonth: aMonth in: aNumberOfYears negated].
	aNumberOfYears amount timesRepeat: [
		self upTo: (currentCircularStream upToBegin current ofYear: current year next).
		self initializeCurrentCircularStream].
	self upTo: (current year monthNumbered: aMonth number).
	^current
]

{ #category : 'enumerating' }
MonthsOfYearsStream >> previous [
	^ self previous: 1 monthMeasure
]

{ #category : 'enumerating' }
MonthsOfYearsStream >> previous: aMeasure [
	| monthsToSubstract distanceToTheBeginOfYear |
	aMeasure negative
		ifTrue: [ ^ self next: aMeasure negated ].
	aMeasure unit = TimeUnits year
		ifTrue: [ ^ self previousInNumberOfYears: aMeasure ].
	monthsToSubstract := aMeasure convertTo: TimeUnits month.
	distanceToTheBeginOfYear := currentCircularStream distanceFrom: currentCircularStream first to: current month.
	monthsToSubstract <= distanceToTheBeginOfYear
		ifTrue: [ self upTo: ((currentCircularStream previous: monthsToSubstract) ofYear: current year) ]
		ifFalse: [ 
			self upTo: (currentCircularStream upToEnd current ofYear: current year previous).
			self initializeCurrentCircularStream.
			self previous: monthsToSubstract - distanceToTheBeginOfYear - 1 monthMeasure ].
	^ current
]

{ #category : 'enumerating' }
MonthsOfYearsStream >> previousInNumberOfYears: aNumberOfYears [

	^aNumberOfYears positive
		ifTrue: [self previousMonth: current month in: aNumberOfYears]
		ifFalse: [self nextMonth: current month in: aNumberOfYears negated]
]

{ #category : 'enumerating' }
MonthsOfYearsStream >> previousMonth: aMonth in: aNumberOfYears [

	aNumberOfYears negative ifTrue: [^self nextMonth: aMonth in: aNumberOfYears negated].
	aNumberOfYears amount timesRepeat: [
		self upTo: (currentCircularStream upToEnd current ofYear: current year previous).
		self initializeCurrentCircularStream].
	self upTo: (current year monthNumbered: aMonth number).
	^current
]

{ #category : 'positioning - private' }
MonthsOfYearsStream >> upTo: aMonthOfYear [

	current := aMonthOfYear
]
