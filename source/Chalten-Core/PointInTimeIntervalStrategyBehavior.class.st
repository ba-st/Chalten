"
A PointInTimeIntervalStrategyBehavior is an abstract class which defines common protocol for interval strategies. Subclasses must implement the method #stepsFrom:to:by:.

"
Class {
	#name : 'PointInTimeIntervalStrategyBehavior',
	#superclass : 'IntervalStrategy',
	#category : 'Chalten-Core-Time',
	#package : 'Chalten-Core',
	#tag : 'Time'
}

{ #category : 'enumerating' }
PointInTimeIntervalStrategyBehavior >> advanceFrom: from by: by [

	^from next: by
]

{ #category : 'enumerating' }
PointInTimeIntervalStrategyBehavior >> advanceFrom: from steps: steps by: by [

	^from next: (steps * by)
]
