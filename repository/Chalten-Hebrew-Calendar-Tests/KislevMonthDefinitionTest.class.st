Class {
	#name : #KislevMonthDefinitionTest,
	#superclass : #TestCase,
	#instVars : [
		'longDefinition',
		'shortDefinition',
		'current'
	],
	#category : #'Chalten-Hebrew-Calendar-Tests'
}

{ #category : #'test support' }
KislevMonthDefinitionTest >> distanceTo: aMonthDefinition [

	^self ninetyDays
]

{ #category : #'test support' }
KislevMonthDefinitionTest >> firstDate [

	^self
]

{ #category : #'test support' }
KislevMonthDefinitionTest >> ifShortKislevDo: aBlock else: anotherBlock [

	^(current = longDefinition)
		ifTrue: [ self thirtyDays ]
		ifFalse: [ self twentynineDays ]
]

{ #category : #'test support' }
KislevMonthDefinitionTest >> ninetyDays [
	^ 30 daysMeasure * 3
]

{ #category : #'test support' }
KislevMonthDefinitionTest >> ofYear: aYear [

	^self
]

{ #category : #initialization }
KislevMonthDefinitionTest >> setUp [

	longDefinition := KislevMonthDefinition numberOfDays: 30 daysMeasure.
	shortDefinition := KislevMonthDefinition numberOfDays: 29 daysMeasure
]

{ #category : #test }
KislevMonthDefinitionTest >> testIsValidDayNumber [

	self assert: (shortDefinition isValidDayNumber: 29).
	self assert: (longDefinition isValidDayNumber: 30).
	
	self deny: (shortDefinition isValidDayNumber: 0).
	self deny: (longDefinition isValidDayNumber: -1).
	self deny: (longDefinition isValidDayNumber: 31)
]

{ #category : #test }
KislevMonthDefinitionTest >> testNumberOfDays [

	self assert: shortDefinition numberOfDays = self twentynineDays.
	self assert: longDefinition numberOfDays = self thirtyDays
]

{ #category : #test }
KislevMonthDefinitionTest >> testNumberOfDaysFromBeginningOfYearIn [

	self assert: (shortDefinition numberOfDaysFromBeginningOfYearIn: self for: self) = self ninetyDays.
	self assert: (longDefinition numberOfDaysFromBeginningOfYearIn: self for: self) = self ninetyDays
]

{ #category : #test }
KislevMonthDefinitionTest >> testNumberOfDaysIn [

	current := shortDefinition.
	self assert: (shortDefinition numberOfDaysIn: self) = self twentynineDays.
	
	current := longDefinition.
	self assert: (longDefinition numberOfDaysIn: self) = self thirtyDays
]

{ #category : #test }
KislevMonthDefinitionTest >> testNumberOfDaysInLeapYear [

	self assert: longDefinition numberOfDaysInLeapYear = self thirtyDays.
	self assert: shortDefinition numberOfDaysInLeapYear = self twentynineDays
]

{ #category : #test }
KislevMonthDefinitionTest >> testNumberOfDaysInNonleapYear [

	self assert: longDefinition numberOfDaysInNonleapYear = self thirtyDays.
	self assert: shortDefinition numberOfDaysInNonleapYear = self twentynineDays
]

{ #category : #'test support' }
KislevMonthDefinitionTest >> thirtyDays [
	^ 30 daysMeasure
]

{ #category : #'test support' }
KislevMonthDefinitionTest >> twentynineDays [
	^ 29 daysMeasure
]
