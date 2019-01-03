"
A TimeOfDay is the representation of certain time of a day.

Instance Variables
	timeFromMidnight:		<Measure>

timeFromMidnight
	- The measure of milliseconds from midnight, the hour 00:00:00.

"
Class {
	#name : #TimeOfDay,
	#superclass : #PointInTime,
	#instVars : [
		'timeFromMidnight'
	],
	#classInstVars : [
		'firstTimeOfDay',
		'lastTimeOfDay',
		'noon'
	],
	#category : #'Chalten-Core-Time'
}

{ #category : #accessing }
TimeOfDay class >> firstTimeOfDay [

	^firstTimeOfDay
	
]

{ #category : #'instance creation' }
TimeOfDay class >> hours: anHour [
	^ self timeFromMidnight: anHour hoursMeasure
]

{ #category : #'instance creation' }
TimeOfDay class >> hours: anHour minutes: aMinute [
	^ self timeFromMidnight: anHour hoursMeasure + aMinute minutesMeasure
]

{ #category : #'instance creation' }
TimeOfDay class >> hours: anHour minutes: aMinute seconds: aSecond [
	^ self timeFromMidnight: anHour hoursMeasure + aMinute minutesMeasure + aSecond secondsMeasure
]

{ #category : #'instance creation' }
TimeOfDay class >> hours: anHours minutes: aMinutes seconds: aSeconds milliseconds: aMilliseconds [
	^ self
		timeFromMidnight:
			anHours hoursMeasure + aMinutes minutesMeasure + aSeconds secondsMeasure + aMilliseconds millisecondsMeasure
]

{ #category : #initialization }
TimeOfDay class >> initializeAfterLoad [

	self initializeTimesOfDay
]

{ #category : #initialization }
TimeOfDay class >> initializeFirstTimeOfDay [

	firstTimeOfDay := self timeFromMidnight: 0 hoursMeasure
]

{ #category : #initialization }
TimeOfDay class >> initializeLastTimeOfDay [

	lastTimeOfDay := self timeFromMidnight: (24 hoursMeasure - 1 millisecondMeasure)
]

{ #category : #initialization }
TimeOfDay class >> initializeNoon [

	noon := self hours: 12
]

{ #category : #initialization }
TimeOfDay class >> initializeTimesOfDay [

	self initializeFirstTimeOfDay.
	self initializeLastTimeOfDay.
	self initializeNoon
]

{ #category : #accessing }
TimeOfDay class >> lastTimeOfDay [

	^lastTimeOfDay
	
]

{ #category : #accessing }
TimeOfDay class >> midnight [
	
	^self firstTimeOfDay
]

{ #category : #accessing }
TimeOfDay class >> noon [
	
	^noon
]

{ #category : #'instance creation' }
TimeOfDay class >> timeFromMidnight: aTimeMeasure [ 

	(aTimeMeasure < 0 hoursMeasure or: [ aTimeMeasure >= 24 hoursMeasure ]) 
		ifTrue: [ InvalidTimeOfDayException signalTime: aTimeMeasure ].
	
	^self new initializeTimeFromMidnight: aTimeMeasure
]

{ #category : #'magnitude protocol' }
TimeOfDay >> < aTime [

	self assertIsSameKindAs: aTime.
	^timeFromMidnight < aTime timeFromMidnight
]

{ #category : #comparing }
TimeOfDay >> = aTime [

	^self class = aTime class and: [ timeFromMidnight = aTime timeFromMidnight ]
]

{ #category : #'interval protocol - private' }
TimeOfDay >> defaultIntervalIncrement [
	^ 1 secondMeasure
]

{ #category : #querying }
TimeOfDay >> distanceTo: aTimeOfDay [ 

	^self <= aTimeOfDay
		ifTrue: [ aTimeOfDay timeFromMidnight - timeFromMidnight ]
		ifFalse: [ self timeToEndOfDay + aTimeOfDay timeFromMidnight ]
]

{ #category : #accessing }
TimeOfDay >> hash [

	^timeFromMidnight hash
]

{ #category : #accessing }
TimeOfDay >> hours [
	
	^(timeFromMidnight convertTo: TimeUnits hour) truncated
]

{ #category : #initialization }
TimeOfDay >> initializeTimeFromMidnight: aTimeMeasure [ 

	timeFromMidnight := aTimeMeasure
]

{ #category : #'interval protocol - private' }
TimeOfDay >> intervalStrategy [

	^RoundedTimelineIntervalStrategy new
]

{ #category : #accessing }
TimeOfDay >> milliseconds [
	
	| seconds |
	
	seconds := timeFromMidnight convertTo: TimeUnits second.
	^(seconds - seconds truncated) convertTo: TimeUnits millisecond
]

{ #category : #accessing }
TimeOfDay >> minutes [
	
	^((timeFromMidnight - self hours) convertTo: TimeUnits minute) truncated
]

{ #category : #enumerating }
TimeOfDay >> next: aTimeMeasure [ 

	^self class timeFromMidnight: timeFromMidnight + aTimeMeasure
]

{ #category : #printing }
TimeOfDay >> printOn: aStream [

	aStream
		nextPutAll: (self toString: self hours);
		nextPut: $:;
		nextPutAll: (self toString: self minutes);
		nextPut: $:;
		nextPutAll: (self toString: self seconds)
]

{ #category : #accessing }
TimeOfDay >> seconds [
	
	^((timeFromMidnight - self hours - self minutes) convertTo: TimeUnits second) truncated
]

{ #category : #querying }
TimeOfDay >> timeFromMidnight [
	
	^timeFromMidnight
]

{ #category : #querying }
TimeOfDay >> timeToEndOfDay [

	^24 hoursMeasure - timeFromMidnight
]

{ #category : #'printing - private' }
TimeOfDay >> toString: aMeasure [

	| string |
	string := aMeasure amount asString.
	^string size = 1
		ifTrue: ['0', string]
		ifFalse: [string]
]
