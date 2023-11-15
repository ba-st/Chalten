"
A MonthDefinition is an abstract class wich defines common protocol for defining months.

"
Class {
	#name : 'MonthDefinition',
	#superclass : 'Object',
	#category : 'Chalten-Core-Time',
	#package : 'Chalten-Core',
	#tag : 'Time'
}

{ #category : 'testing' }
MonthDefinition >> isValidDayNumber: aDayNumber [

	^(aDayNumber > 0 and: [
		aDayNumber <= self numberOfDays amount ])
]

{ #category : 'accessing' }
MonthDefinition >> numberOfDays [

	self subclassResponsibility
]

{ #category : 'accessing' }
MonthDefinition >> numberOfDaysFromBeginningOfYearIn: aYear for: aMonth [
	
	^aYear firstDate distanceTo: (aMonth ofYear: aYear) firstDate
]

{ #category : 'accessing' }
MonthDefinition >> numberOfDaysIn: aYear [

	self subclassResponsibility
]

{ #category : 'accessing' }
MonthDefinition >> numberOfDaysInLeapYear [

	self subclassResponsibility
]

{ #category : 'accessing' }
MonthDefinition >> numberOfDaysInNonleapYear [

	self subclassResponsibility
]
