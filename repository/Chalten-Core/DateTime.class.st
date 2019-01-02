"
A DateTime is date with a time object in a certain time zone. If no time zone are provided when a DateTime is about to be created, its asume the local one.

Instance Variables
	date:			<ChaltenDate>
	timeOfDay:		<TimeOfDay>
	zone:			<ChaltenTimeZone>

date
	- The date.

timeOfDay
	- The time of day.

zone
	- The time zone.

"
Class {
	#name : #DateTime,
	#superclass : #PointInTime,
	#instVars : [
		'date',
		'timeOfDay',
		'zone'
	],
	#category : #'Chalten-Core-Time'
}

{ #category : #'instance creation' }
DateTime class >> date: aDate timeOfDay: aTimeOfDay [

	^self date: aDate timeOfDay: aTimeOfDay zone: TimeZones local
]

{ #category : #'instance creation' }
DateTime class >> date: aDate timeOfDay: aTimeOfDay zone: aZone [

	^self new
		initializeDate: aDate
		timeOfDay: aTimeOfDay
		zone: aZone
]

{ #category : #'magnitude protocol' }
DateTime >> < aDateTime [

	| dateTimeInSameZone |
	
	self assertIsSameKindAs: aDateTime.
	dateTimeInSameZone := aDateTime convertTo: zone.
	^date < dateTimeInSameZone date
		or: [ date = dateTimeInSameZone date and: [ timeOfDay < dateTimeInSameZone timeOfDay ]]
]

{ #category : #comparing }
DateTime >> = anObject [

	^(anObject isKindOf: DateTime) and: [
		self isTheSameInstantThan: anObject ]
]

{ #category : #converting }
DateTime >> convertTo: aTimeZone [

	^zone applyOffsetTo: self from: aTimeZone
]

{ #category : #accessing }
DateTime >> date [

	^date
]

{ #category : #accessing }
DateTime >> dayNumber [

	^date dayNumber
]

{ #category : #'interval protocol - private' }
DateTime >> defaultIntervalIncrement [
	^ 1 secondMeasure
]

{ #category : #querying }
DateTime >> distanceTo: aDateTime [
	
	^ (self = aDateTime)
		ifTrue: [ aDateTime timeFromMidnight - self timeFromMidnight ]
		ifFalse: [ (date distanceTo: aDateTime date) -
			1 dayMeasure + self timeToEndOfDay + aDateTime timeFromMidnight ]
]

{ #category : #enumerating }
DateTime >> firstTimeOfDay [

	^self class
		date: date
		timeOfDay: TimeOfDay firstTimeOfDay
		zone: zone
]

{ #category : #comparing }
DateTime >> hash [

	| utcDateTime |
	
	utcDateTime := self convertTo: TimeZones universalTime.
	^utcDateTime date hash bitXor: utcDateTime timeOfDay hash
]

{ #category : #initialization }
DateTime >> initializeDate: aDate timeOfDay: aTimeOfDay zone: aZone [

	date := aDate.
	timeOfDay := aTimeOfDay.
	zone := aZone
]

{ #category : #'interval protocol - private' }
DateTime >> intervalStrategy [

	^PointInTimeIntervalStrategy new
]

{ #category : #testing }
DateTime >> isTheSameInstantThan: aDateTime [

	| dateTimeInSameZone |
	dateTimeInSameZone := aDateTime convertTo: zone.
	^date = dateTimeInSameZone date and: [
		timeOfDay = dateTimeInSameZone timeOfDay ]
]

{ #category : #enumerating }
DateTime >> lastTimeOfDay [

	^self class
		date: date
		timeOfDay: TimeOfDay lastTimeOfDay
		zone: zone
]

{ #category : #accessing }
DateTime >> month [

	^date month
]

{ #category : #accessing }
DateTime >> monthOfYear [

	^date monthOfYear
]

{ #category : #enumerating }
DateTime >> next: aTimeMeasure [

	^self
		next: aTimeMeasure
		in: zone
]

{ #category : #enumerating }
DateTime >> next: aTimeMeasure in: aTimeZone [

	| timeToAdd daysToAdd newTime |

	timeToAdd := timeOfDay timeFromMidnight + aTimeMeasure.
	daysToAdd := (timeToAdd // 1 dayMeasure) daysMeasure.
	newTime := timeToAdd \\ 1 dayMeasure.
	^self class
		date: (date next: daysToAdd)
		timeOfDay: (TimeOfDay timeFromMidnight: newTime)
		zone: aTimeZone
]

{ #category : #enumerating }
DateTime >> nextIn: aTimeZone [

	^self
		next: aTimeZone offset - zone offset
		in: aTimeZone
]

{ #category : #printing }
DateTime >> printOn: aStream [

	date printOn: aStream.
	aStream space.
	timeOfDay printOn: aStream.
	aStream space.
	aStream nextPut: ${.
	zone printOn: aStream.
	aStream nextPut: $}
]

{ #category : #querying }
DateTime >> timeFromMidnight [

	^timeOfDay timeFromMidnight
]

{ #category : #accessing }
DateTime >> timeOfDay [

	^timeOfDay
]

{ #category : #querying }
DateTime >> timeToEndOfDay [

	^timeOfDay timeToEndOfDay
]

{ #category : #accessing }
DateTime >> year [

	^date year
]

{ #category : #accessing }
DateTime >> zone [

	^zone
]
