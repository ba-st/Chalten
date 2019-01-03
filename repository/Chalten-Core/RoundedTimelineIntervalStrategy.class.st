"
A RoundedTimelineIntervalStrategy is an strategy when have to round point in time intervals.

"
Class {
	#name : #RoundedTimelineIntervalStrategy,
	#superclass : #PointInTimeIntervalStrategyBehavior,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Chalten-Core-Time'
}

{ #category : #initialization }
RoundedTimelineIntervalStrategy class >> initialize [

	self initializeUniqueInstance
]

{ #category : #initialization }
RoundedTimelineIntervalStrategy class >> initializeUniqueInstance [

	uniqueInstance := super new
]

{ #category : #'instance creation' }
RoundedTimelineIntervalStrategy class >> new [

	^uniqueInstance
]

{ #category : #enumerating }
RoundedTimelineIntervalStrategy >> stepsFrom: from to: to by: by [

	^by > 0
		ifTrue: [ (from distanceTo: to) / by ]
		ifFalse: [ (from distanceFrom: to) / by negated ]
]
