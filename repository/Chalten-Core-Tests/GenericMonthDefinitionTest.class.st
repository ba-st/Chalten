Class {
	#name : #GenericMonthDefinitionTest,
	#superclass : #TestCase,
	#instVars : [
		'monthDefinition',
		'otherDefinition'
	],
	#category : #'Chalten-Core-Tests-Time'
}

{ #category : #'test support' }
GenericMonthDefinitionTest >> distanceTo: aMonthDefinition [

	^self ninetyDays
]

{ #category : #'test support' }
GenericMonthDefinitionTest >> firstDate [

	^self
]

{ #category : #'test support' }
GenericMonthDefinitionTest >> ninetyDays [
	^ 30 daysMeasure * 3
]

{ #category : #'test support' }
GenericMonthDefinitionTest >> numberOfDaysFor: aMonthDefinition [
	
	^aMonthDefinition numberOfDaysInLeapYear
]

{ #category : #'test support' }
GenericMonthDefinitionTest >> ofYear: aYear [

	^self
]

{ #category : #initialization }
GenericMonthDefinitionTest >> setUp [

	monthDefinition := GenericMonthDefinition 
		numberOfDaysInNonleapYear: self twentynineDays
		numberOfDaysInLeapYear: self thirtyDays.
	otherDefinition := GenericMonthDefinition numberOfDays: self thirtyDays
]

{ #category : #test }
GenericMonthDefinitionTest >> testIsValidDayNumber [

	self assert: (monthDefinition isValidDayNumber: 29).
	self assert: (monthDefinition isValidDayNumber: 30).
	self assert: (otherDefinition isValidDayNumber: 29).
	self assert: (otherDefinition isValidDayNumber: 30).
	
	self deny: (monthDefinition isValidDayNumber: 0).
	self deny: (monthDefinition isValidDayNumber: -1).
	self deny: (otherDefinition isValidDayNumber: 32).
	self deny: (otherDefinition isValidDayNumber: -2)

]

{ #category : #test }
GenericMonthDefinitionTest >> testNumberOfDays [

	self assert: monthDefinition numberOfDays = self thirtyDays.
	self assert: otherDefinition numberOfDays = self thirtyDays
]

{ #category : #test }
GenericMonthDefinitionTest >> testNumberOfDaysFromBeginningOfYearIn [

	self assert: (monthDefinition numberOfDaysFromBeginningOfYearIn: self for: self) = self ninetyDays
]

{ #category : #test }
GenericMonthDefinitionTest >> testNumberOfDaysIn [

	self assert: (monthDefinition numberOfDaysIn: self) = self thirtyDays.
	self assert: (otherDefinition numberOfDaysIn: self) = self thirtyDays
]

{ #category : #test }
GenericMonthDefinitionTest >> testNumberOfDaysInLeapYear [

	self assert: monthDefinition numberOfDaysInLeapYear = self thirtyDays.
	self assert: otherDefinition numberOfDaysInLeapYear = self thirtyDays
]

{ #category : #test }
GenericMonthDefinitionTest >> testNumberOfDaysInNonleapYear [

	self assert: monthDefinition numberOfDaysInNonleapYear = self twentynineDays.
	self assert: otherDefinition numberOfDaysInNonleapYear = self thirtyDays
]

{ #category : #'test support' }
GenericMonthDefinitionTest >> thirtyDays [
	^ 30 daysMeasure
]

{ #category : #'test support' }
GenericMonthDefinitionTest >> twentynineDays [
	^ 29 daysMeasure
]
