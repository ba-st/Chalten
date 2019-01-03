"
A TimeSpan is a timeline segments.

A segment begins on a specific point of the timeline and has certain duration and direction expressed as a measure. The starting point of a timespan can be a point at any of the timeline resolutions. The duration and direction is given by a time measure that should be convertible to the unit of the scale the starting point belongs to. If the measure is positive, the direction is towards the end of time, if the measure is negative, the direction is towards the beginning of time.

Timespans are useful to represent relative time entities where the beginning of such an entity is known, but the end is not exactly known or can change. Examples of such entities are“I'll see you in 10 working days from today”or it happened 7 months before January.

Instance Variables
	duration:	<Measure>
	from:		<PointInTime>

duration
	- A time measure.

from
	- The starting point in time.

"
Class {
	#name : #TimeSpan,
	#superclass : #Object,
	#instVars : [
		'from',
		'duration'
	],
	#category : #'Chalten-Core-Time'
}

{ #category : #'instance creation' }
TimeSpan class >> from: aDate duration: aTimeMeasure [

	^self new initializeFrom: aDate duration: aTimeMeasure
]

{ #category : #'instance creation' }
TimeSpan class >> fromInterval: anInterval [

	^self from: anInterval from duration: (anInterval from distanceTo: anInterval to)
]

{ #category : #comparing }
TimeSpan >> = anObject [

	^self class = anObject class
		and: [ from = anObject from 
		and: [ duration = anObject duration ]]
]

{ #category : #converting }
TimeSpan >> asInterval [

	^ArithmeticObjectInterval
		from: from
		to: self to
		by: (duration unit with: 1)
		intervalStrategy: PointInTimeIntervalStrategy new.
]

{ #category : #accessing }
TimeSpan >> duration [

	^duration
]

{ #category : #accessing }
TimeSpan >> from [

	^from
]

{ #category : #comparing }
TimeSpan >> hash [

	^from hash bitXor: duration hash
]

{ #category : #initialization }
TimeSpan >> initializeFrom: aDate duration: aTimeMeasure [

	from := aDate.
	duration := aTimeMeasure
]

{ #category : #printing }
TimeSpan >> printOn: aStream [

	duration printOn: aStream.
	aStream nextPutAll: ' from '.
	from printOn: aStream
]

{ #category : #accessing }
TimeSpan >> to [
	
	^from next: duration
]

{ #category : #evaluating }
TimeSpan >> value [

	^self class from: from value duration: duration
]
