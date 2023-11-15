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
	#name : 'ChaltenDateTime',
	#superclass : 'PointInTime',
	#instVars : [
		'date',
		'timeOfDay',
		'zone'
	],
	#category : 'Chalten-Core-Time',
	#package : 'Chalten-Core',
	#tag : 'Time'
}

{ #category : 'instance creation' }
ChaltenDateTime class >> date: aDate timeOfDay: aTimeOfDay [

	^self date: aDate timeOfDay: aTimeOfDay zone: TimeZones local
]

{ #category : 'instance creation' }
ChaltenDateTime class >> date: aDate timeOfDay: aTimeOfDay zone: aZone [

	^self new
		initializeDate: aDate
		timeOfDay: aTimeOfDay
		zone: aZone
]

{ #category : 'magnitude protocol' }
ChaltenDateTime >> < aDateTime [

	| dateTimeInSameZone |
	
	self assertIsSameKindAs: aDateTime.
	dateTimeInSameZone := aDateTime convertTo: zone.
	^date < dateTimeInSameZone date
		or: [ date = dateTimeInSameZone date and: [ timeOfDay < dateTimeInSameZone timeOfDay ]]
]

{ #category : 'comparing' }
ChaltenDateTime >> = anObject [

	^(anObject isKindOf: ChaltenDateTime) and: [
		self isTheSameInstantThan: anObject ]
]

{ #category : 'converting' }
ChaltenDateTime >> convertTo: aTimeZone [

	^zone applyOffsetTo: self from: aTimeZone
]

{ #category : 'accessing' }
ChaltenDateTime >> date [

	^date
]

{ #category : 'accessing' }
ChaltenDateTime >> dayNumber [

	^date dayNumber
]

{ #category : 'interval protocol - private' }
ChaltenDateTime >> defaultIntervalIncrement [
	^ 1 secondMeasure
]

{ #category : 'querying' }
ChaltenDateTime >> distanceTo: aDateTime [
	
	^ (self = aDateTime)
		ifTrue: [ aDateTime timeFromMidnight - self timeFromMidnight ]
		ifFalse: [ (date distanceTo: aDateTime date) -
			1 dayMeasure + self timeToEndOfDay + aDateTime timeFromMidnight ]
]

{ #category : 'enumerating' }
ChaltenDateTime >> firstTimeOfDay [

	^self class
		date: date
		timeOfDay: TimeOfDay firstTimeOfDay
		zone: zone
]

{ #category : 'comparing' }
ChaltenDateTime >> hash [

	| utcDateTime |
	
	utcDateTime := self convertTo: TimeZones universalTime.
	^utcDateTime date hash bitXor: utcDateTime timeOfDay hash
]

{ #category : 'initialization' }
ChaltenDateTime >> initializeDate: aDate timeOfDay: aTimeOfDay zone: aZone [

	date := aDate.
	timeOfDay := aTimeOfDay.
	zone := aZone
]

{ #category : 'interval protocol - private' }
ChaltenDateTime >> intervalStrategy [

	^PointInTimeIntervalStrategy new
]

{ #category : 'testing' }
ChaltenDateTime >> isTheSameInstantThan: aDateTime [

	| dateTimeInSameZone |
	dateTimeInSameZone := aDateTime convertTo: zone.
	^date = dateTimeInSameZone date and: [
		timeOfDay = dateTimeInSameZone timeOfDay ]
]

{ #category : 'enumerating' }
ChaltenDateTime >> lastTimeOfDay [

	^self class
		date: date
		timeOfDay: TimeOfDay lastTimeOfDay
		zone: zone
]

{ #category : 'accessing' }
ChaltenDateTime >> month [

	^date month
]

{ #category : 'accessing' }
ChaltenDateTime >> monthOfYear [

	^date monthOfYear
]

{ #category : 'enumerating' }
ChaltenDateTime >> next: aTimeMeasure [

	^self
		next: aTimeMeasure
		in: zone
]

{ #category : 'enumerating' }
ChaltenDateTime >> next: aTimeMeasure in: aTimeZone [

	| timeToAdd daysToAdd newTime |

	timeToAdd := timeOfDay timeFromMidnight + aTimeMeasure.
	daysToAdd := (timeToAdd // 1 dayMeasure) daysMeasure.
	newTime := timeToAdd \\ 1 dayMeasure.
	^self class
		date: (date next: daysToAdd)
		timeOfDay: (TimeOfDay timeFromMidnight: newTime)
		zone: aTimeZone
]

{ #category : 'enumerating' }
ChaltenDateTime >> nextIn: aTimeZone [

	^self
		next: aTimeZone offset - zone offset
		in: aTimeZone
]

{ #category : 'printing' }
ChaltenDateTime >> printOn: aStream [

	date printOn: aStream.
	aStream space.
	timeOfDay printOn: aStream.
	aStream space.
	aStream nextPut: ${.
	zone printOn: aStream.
	aStream nextPut: $}
]

{ #category : 'querying' }
ChaltenDateTime >> timeFromMidnight [

	^timeOfDay timeFromMidnight
]

{ #category : 'accessing' }
ChaltenDateTime >> timeOfDay [

	^timeOfDay
]

{ #category : 'querying' }
ChaltenDateTime >> timeToEndOfDay [

	^timeOfDay timeToEndOfDay
]

{ #category : 'accessing' }
ChaltenDateTime >> year [

	^date year
]

{ #category : 'accessing' }
ChaltenDateTime >> zone [

	^zone
]
