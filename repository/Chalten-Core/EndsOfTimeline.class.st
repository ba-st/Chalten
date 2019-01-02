"
An EndsOfTimeline is an abstract class wich defines common protocol for the beginning and the end of time.

The timeline does not have a known end or beginning, but the mere fact that we, as human, can think on them means that they have to be reified. Two objects are provided to represent these entities. They are“TheEndOfTime”and TheBeginningOfTime. These objects are useful to create open intervals towards infinite and minus infinite. They allow programmers to create intervals and filters on the whole timeline and to create streams with no end.

When using these objects, the programmer has to have special care because iterating over an interval with no end and/or beginning will never stop.
"
Class {
	#name : #EndsOfTimeline,
	#superclass : #PointInTime,
	#category : #'Chalten-Core-Time'
}

{ #category : #'accessing days - private' }
EndsOfTimeline >> amountOfDaysFromEpoch [

	self subclassResponsibility
]

{ #category : #'interval protocol - private' }
EndsOfTimeline >> defaultIntervalIncrement [
	^ 1 dayMeasure
]

{ #category : #querying }
EndsOfTimeline >> distanceTo: aTimelinePoint [

	^Infinity daysMeasure
]

{ #category : #'interval protocol - private' }
EndsOfTimeline >> intervalStrategy [

	^InfinityIntervalStrategy new
]

{ #category : #enumerating }
EndsOfTimeline >> next: aMeasure [

	^self
]

{ #category : #'accessing days' }
EndsOfTimeline >> numberOfDaysFromEpoch [

	^self amountOfDaysFromEpoch daysMeasure
]
