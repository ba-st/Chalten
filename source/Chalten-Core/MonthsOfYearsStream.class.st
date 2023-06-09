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
	#name : #MonthsOfYearsStream,
	#superclass : #Object,
	#instVars : [
		'start',
		'current',
		'currentCircularStream'
	],
	#category : #'Chalten-Core-Time'
}

{ #category : #'instance creation' }
MonthsOfYearsStream class >> startingOn: aMonthOfYear [

	^self new initializeStartingOn: aMonthOfYear
]

{ #category : #initialization }
MonthsOfYearsStream >> calendar [

	^ start calendar
]

{ #category : #querying }
MonthsOfYearsStream >> distanceFrom: aMonthOfYear to: anotherMonthOfYear [
	| months |
	months := self calendar monthUnit with: 0.
	[ current = anotherMonthOfYear ]
		whileFalse: [ 
			currentCircularStream
				ifAtEndDo: [ 
					current := currentCircularStream next ofYear: current year next.
					self initializeCurrentCircularStream ]
				else: [ current := currentCircularStream next ofYear: current year ].
			months := months + ( self calendar monthUnit with: 1 )].
	^ months
]

{ #category : #initialization }
MonthsOfYearsStream >> initializeCurrentCircularStream [

	currentCircularStream := CircularReadStream on: current year arrayOfMonths moving: self calendar monthUnit startingCircleAt: current calendar firstMonth.
	currentCircularStream upTo: current month
]

{ #category : #initialization }
MonthsOfYearsStream >> initializeStartingOn: aMonthOfYear [

	start := aMonthOfYear.
	current := start.
	self initializeCurrentCircularStream
]

{ #category : #enumerating }
MonthsOfYearsStream >> next [
	^ self next: (self calendar monthUnit with: 1)
]

{ #category : #enumerating }
MonthsOfYearsStream >> next: aMeasure [
	| monthsToAdd distanceToTheEndOfYear |
	aMeasure negative
		ifTrue: [ ^ self previous: aMeasure negated ].
	aMeasure unit = self calendar yearUnit
		ifTrue: [ ^ self nextInNumberOfYears: aMeasure ].
	monthsToAdd := aMeasure convertTo: self calendar monthUnit.
	distanceToTheEndOfYear := currentCircularStream distanceFrom: current month to: currentCircularStream last.
	monthsToAdd <= distanceToTheEndOfYear
		ifTrue: [ self upTo: ((currentCircularStream next: monthsToAdd) ofYear: current year) ]
		ifFalse: [ 
			self upTo: (currentCircularStream upToBegin current ofYear: current year next).
			self initializeCurrentCircularStream.
			self next: monthsToAdd - distanceToTheEndOfYear - ( self calendar monthUnit with: 1 ) ].
	^ current
]

{ #category : #enumerating }
MonthsOfYearsStream >> nextInNumberOfYears: aNumberOfYears [

	^aNumberOfYears positive
		ifTrue: [self nextMonth: current month in: aNumberOfYears]
		ifFalse: [self previousMonth: current month in: aNumberOfYears negated]
]

{ #category : #enumerating }
MonthsOfYearsStream >> nextMonth: aMonth in: aNumberOfYears [

	aNumberOfYears negative ifTrue: [^self previousMonth: aMonth in: aNumberOfYears negated].
	aNumberOfYears amount timesRepeat: [
		self upTo: (currentCircularStream upToBegin current ofYear: current year next).
		self initializeCurrentCircularStream].
	self upTo: (current year monthNumbered: aMonth number).
	^current
]

{ #category : #enumerating }
MonthsOfYearsStream >> previous [
	^ self previous: (self calendar monthUnit with: 1)
]

{ #category : #enumerating }
MonthsOfYearsStream >> previous: aMeasure [
	| monthsToSubstract distanceToTheBeginOfYear |
	aMeasure negative
		ifTrue: [ ^ self next: aMeasure negated ].
	aMeasure unit = self calendar yearUnit
		ifTrue: [ ^ self previousInNumberOfYears: aMeasure ].
	monthsToSubstract := aMeasure convertTo: self calendar monthUnit.
	distanceToTheBeginOfYear := currentCircularStream distanceFrom: currentCircularStream first to: current month.
	monthsToSubstract <= distanceToTheBeginOfYear
		ifTrue: [ self upTo: ((currentCircularStream previous: monthsToSubstract) ofYear: current year) ]
		ifFalse: [ 
			self upTo: (currentCircularStream upToEnd current ofYear: current year previous).
			self initializeCurrentCircularStream.
			self previous: monthsToSubstract - distanceToTheBeginOfYear - (self calendar monthUnit with: 1) ].
	^ current
]

{ #category : #enumerating }
MonthsOfYearsStream >> previousInNumberOfYears: aNumberOfYears [

	^aNumberOfYears positive
		ifTrue: [self previousMonth: current month in: aNumberOfYears]
		ifFalse: [self nextMonth: current month in: aNumberOfYears negated]
]

{ #category : #enumerating }
MonthsOfYearsStream >> previousMonth: aMonth in: aNumberOfYears [

	aNumberOfYears negative ifTrue: [^self nextMonth: aMonth in: aNumberOfYears negated].
	aNumberOfYears amount timesRepeat: [
		self upTo: (currentCircularStream upToEnd current ofYear: current year previous).
		self initializeCurrentCircularStream].
	self upTo: (current year monthNumbered: aMonth number).
	^current
]

{ #category : #'positioning - private' }
MonthsOfYearsStream >> upTo: aMonthOfYear [

	current := aMonthOfYear
]
