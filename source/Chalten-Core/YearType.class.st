"
A YearType is an abstract class wich defines common protocol for a type year. A year could be leap or nonleap.

"
Class {
	#name : 'YearType',
	#superclass : 'Object',
	#category : 'Chalten-Core-Time',
	#package : 'Chalten-Core',
	#tag : 'Time'
}

{ #category : 'accessing months' }
YearType >> amountOfMonthsIn: aYear [

	self subclassResponsibility
]

{ #category : 'months stream accessing' }
YearType >> arrayOfMonthsOf: aYear [

	self subclassResponsibility
]

{ #category : 'testing' }
YearType >> isLeap [

	self subclassResponsibility
]

{ #category : 'accessing months' }
YearType >> monthNumbered: aNumber in: aCalendar [

	self subclassResponsibility
]

{ #category : 'accessing' }
YearType >> numberOfDaysFor: aMonthDefinition [

	self subclassResponsibility
]
