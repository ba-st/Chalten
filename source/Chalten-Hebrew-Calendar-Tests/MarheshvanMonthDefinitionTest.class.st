Class {
	#name : 'MarheshvanMonthDefinitionTest',
	#superclass : 'TestCase',
	#instVars : [
		'longDefinition',
		'shortDefinition',
		'current'
	],
	#category : 'Chalten-Hebrew-Calendar-Tests',
	#package : 'Chalten-Hebrew-Calendar-Tests'
}

{ #category : 'test support' }
MarheshvanMonthDefinitionTest >> distanceTo: aMonthDefinition [

	^self ninetyDays
]

{ #category : 'test support' }
MarheshvanMonthDefinitionTest >> firstDate [

	^self
]

{ #category : 'test support' }
MarheshvanMonthDefinitionTest >> ifLongMarheshvanDo: aBlock else: anotherBlock [

	^(current = longDefinition)
		ifTrue: [ self thirtyDays ]
		ifFalse: [ self twentynineDays ]
]

{ #category : 'test support' }
MarheshvanMonthDefinitionTest >> ninetyDays [
	^ 30 daysMeasure * 3
]

{ #category : 'test support' }
MarheshvanMonthDefinitionTest >> ofYear: aYear [

	^self
]

{ #category : 'initialization' }
MarheshvanMonthDefinitionTest >> setUp [

	longDefinition := MarheshvanMonthDefinition numberOfDays: 30 daysMeasure.
	shortDefinition := MarheshvanMonthDefinition numberOfDays: 29 daysMeasure
]

{ #category : 'test' }
MarheshvanMonthDefinitionTest >> testIsValidDayNumber [

	self assert: (shortDefinition isValidDayNumber: 29).
	self assert: (longDefinition isValidDayNumber: 30).
	
	self deny: (shortDefinition isValidDayNumber: 0).
	self deny: (longDefinition isValidDayNumber: -1).
	self deny: (longDefinition isValidDayNumber: 31)
]

{ #category : 'test' }
MarheshvanMonthDefinitionTest >> testNumberOfDays [

	self assert: shortDefinition numberOfDays equals: self twentynineDays.
	self assert: longDefinition numberOfDays equals: self thirtyDays
]

{ #category : 'test' }
MarheshvanMonthDefinitionTest >> testNumberOfDaysFromBeginningOfYearIn [

	self
		assert:
		(shortDefinition numberOfDaysFromBeginningOfYearIn: self for: self)
		equals: self ninetyDays.
	self
		assert:
		(longDefinition numberOfDaysFromBeginningOfYearIn: self for: self)
		equals: self ninetyDays
]

{ #category : 'test' }
MarheshvanMonthDefinitionTest >> testNumberOfDaysIn [

	current := shortDefinition.
	self
		assert: (shortDefinition numberOfDaysIn: self)
		equals: self twentynineDays.

	current := longDefinition.
	self
		assert: (longDefinition numberOfDaysIn: self)
		equals: self thirtyDays
]

{ #category : 'test' }
MarheshvanMonthDefinitionTest >> testNumberOfDaysInLeapYear [

	self
		assert: longDefinition numberOfDaysInLeapYear
		equals: self thirtyDays.
	self
		assert: shortDefinition numberOfDaysInLeapYear
		equals: self twentynineDays
]

{ #category : 'test' }
MarheshvanMonthDefinitionTest >> testNumberOfDaysInNonleapYear [

	self
		assert: longDefinition numberOfDaysInNonleapYear
		equals: self thirtyDays.
	self
		assert: shortDefinition numberOfDaysInNonleapYear
		equals: self twentynineDays
]

{ #category : 'test support' }
MarheshvanMonthDefinitionTest >> thirtyDays [
	^ 30 daysMeasure
]

{ #category : 'test support' }
MarheshvanMonthDefinitionTest >> twentynineDays [
	^ 29 daysMeasure
]
