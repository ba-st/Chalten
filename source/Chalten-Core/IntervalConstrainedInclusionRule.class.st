"
An IntervalConstrainedInclusionRule is an inclusion rule for an interval. For example, includes all dates between July 2nd and July 10th.

Instance Variables
	decoratedRule:		<InclusionRule>
	interval:			<Interval>

decoratedRule
	- A decorated rule.

interval
	- The interval where apply the rule.

"
Class {
	#name : 'IntervalConstrainedInclusionRule',
	#superclass : 'InclusionRule',
	#instVars : [
		'interval',
		'decoratedRule'
	],
	#category : 'Chalten-Core-Filter',
	#package : 'Chalten-Core',
	#tag : 'Filter'
}

{ #category : 'instance creation' }
IntervalConstrainedInclusionRule class >> from: aMagnitude to: anotherMagnitude  apply: anInclusionRule [

	^self on: (aMagnitude to: anotherMagnitude) apply: anInclusionRule
]

{ #category : 'instance creation' }
IntervalConstrainedInclusionRule class >> on: anInterval apply: anInclusionRule [ 

	^self new initializeOn: anInterval apply: anInclusionRule
]

{ #category : 'accessing' }
IntervalConstrainedInclusionRule >> decoratedRule [

	^decoratedRule
]

{ #category : 'accessing' }
IntervalConstrainedInclusionRule >> from [

	^interval from
]

{ #category : 'querying' }
IntervalConstrainedInclusionRule >> includes: anObject [

	^(self shouldHandle: anObject) and: [ decoratedRule includes: anObject ]
]

{ #category : 'initialization' }
IntervalConstrainedInclusionRule >> initializeOn: anInterval apply: anInclusionRule [ 

	interval := anInterval.
	decoratedRule := anInclusionRule
]

{ #category : 'accessing' }
IntervalConstrainedInclusionRule >> interval [

	^interval
]

{ #category : 'accessing' }
IntervalConstrainedInclusionRule >> object [

	^decoratedRule object
]

{ #category : 'printing' }
IntervalConstrainedInclusionRule >> printOn: aStream [

	aStream nextPutAll: 'From: '.
	self from printOn: aStream.
	aStream nextPutAll: ' to: '.
	self to printOn: aStream.
	aStream nextPutAll: ' -> '.
	decoratedRule printOn: aStream
]

{ #category : 'querying - private' }
IntervalConstrainedInclusionRule >> shouldHandle: aMagnitude [

	^interval includes: aMagnitude
]

{ #category : 'accessing' }
IntervalConstrainedInclusionRule >> to [

	^interval to
]
