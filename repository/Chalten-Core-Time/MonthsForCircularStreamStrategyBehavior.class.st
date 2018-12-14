"
A MonthsForCircularStreamStrategyBehavior is a strategy to advance months in a stream.

"
Class {
	#name : #MonthsForCircularStreamStrategyBehavior,
	#superclass : #Object,
	#category : #'Chalten-Core-Time'
}

{ #category : #querying }
MonthsForCircularStreamStrategyBehavior >> distanceFrom: aMonth to: anotherMonth [

	^self stream distanceFrom: aMonth to: anotherMonth
]

{ #category : #enumerating }
MonthsForCircularStreamStrategyBehavior >> next: aMeasure from: aMonth [

	self stream upTo: aMonth.
	^self stream next: aMeasure
]

{ #category : #'months days accessing' }
MonthsForCircularStreamStrategyBehavior >> numberOfDaysOf: aMonth [

	self subclassResponsibility
]

{ #category : #'accessing - private' }
MonthsForCircularStreamStrategyBehavior >> stream [

	self subclassResponsibility
]
