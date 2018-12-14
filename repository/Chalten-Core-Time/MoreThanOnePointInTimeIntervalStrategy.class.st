"
A MoreThanOnePointInTimeIntervalStrategy is an strategy when have more than one point in time intervals.

"
Class {
	#name : #MoreThanOnePointInTimeIntervalStrategy,
	#superclass : #PointInTimeIntervalStrategyBehavior,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Chalten-Core-Time'
}

{ #category : #initialization }
MoreThanOnePointInTimeIntervalStrategy class >> initialize [

	self initializeUniqueInstance
]

{ #category : #initialization }
MoreThanOnePointInTimeIntervalStrategy class >> initializeUniqueInstance [

	uniqueInstance := super new
]

{ #category : #'instance creation' }
MoreThanOnePointInTimeIntervalStrategy class >> new [

	^uniqueInstance
]

{ #category : #testing }
MoreThanOnePointInTimeIntervalStrategy >> isValidIntervalFrom: aStart to: aStop by: aStep [

	^(self stepsFrom: aStart to: aStop by: aStep) > 0
]

{ #category : #enumerating }
MoreThanOnePointInTimeIntervalStrategy >> stepsFrom: fromPointInTime to: toPointInTime by: aDistance [
	
	^(fromPointInTime distanceTo: toPointInTime) / aDistance
]
