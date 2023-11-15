"
A PointInTimeIntervalStrategy is an strategy when have one point in time intervals.

"
Class {
	#name : 'PointInTimeIntervalStrategy',
	#superclass : 'PointInTimeIntervalStrategyBehavior',
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Chalten-Core-Time',
	#package : 'Chalten-Core',
	#tag : 'Time'
}

{ #category : 'initialization' }
PointInTimeIntervalStrategy class >> initialize [

	self initializeUniqueInstance
]

{ #category : 'initialization' }
PointInTimeIntervalStrategy class >> initializeUniqueInstance [

	uniqueInstance := super new
]

{ #category : 'instance creation' }
PointInTimeIntervalStrategy class >> new [

	^uniqueInstance
]

{ #category : 'enumerating' }
PointInTimeIntervalStrategy >> stepsFrom: fromPointInTime to: toPointInTime by: aDistance [

	| fromToDistance |

	fromToDistance := fromPointInTime distanceTo: toPointInTime.
	^fromToDistance isFixed
		ifTrue: [ fromToDistance / aDistance ]
		ifFalse: [ fromToDistance amount ]
]
