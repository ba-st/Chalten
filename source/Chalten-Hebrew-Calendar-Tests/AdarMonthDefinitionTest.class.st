Class {
	#name : 'AdarMonthDefinitionTest',
	#superclass : 'TestCase',
	#instVars : [
		'adarDefinition',
		'adarIDefinition',
		'adarIIDefinition'
	],
	#category : 'Chalten-Hebrew-Calendar-Tests',
	#package : 'Chalten-Hebrew-Calendar-Tests'
}

{ #category : 'test support' }
AdarMonthDefinitionTest >> distanceTo: aMonthDefinition [

	^self ninetyDays
]

{ #category : 'test support' }
AdarMonthDefinitionTest >> firstDate [

	^self
]

{ #category : 'test support' }
AdarMonthDefinitionTest >> ninetyDays [
	^ 30 daysMeasure * 3
]

{ #category : 'test support' }
AdarMonthDefinitionTest >> numberOfDaysFor: aMonthDefinition [
	
	^aMonthDefinition numberOfDaysInLeapYear max: aMonthDefinition numberOfDaysInNonleapYear
]

{ #category : 'test support' }
AdarMonthDefinitionTest >> ofYear: aYear [

	^self
]

{ #category : 'initialization' }
AdarMonthDefinitionTest >> setUp [

	adarDefinition := AdarMonthDefinition adar.
	adarIDefinition := AdarMonthDefinition adarI.
	adarIIDefinition := AdarMonthDefinition adarII
]

{ #category : 'test' }
AdarMonthDefinitionTest >> testIsValidDayNumber [

	self assert: (adarDefinition isValidDayNumber: 29).
	self assert: (adarIDefinition isValidDayNumber: 30).
	self assert: (adarIIDefinition isValidDayNumber: 29).
	
	self deny: (adarDefinition isValidDayNumber: 0).
	self deny: (adarIDefinition isValidDayNumber: -1).
	self deny: (adarIIDefinition isValidDayNumber: 32)
]

{ #category : 'test' }
AdarMonthDefinitionTest >> testNumberOfDays [

	self assert: adarDefinition numberOfDays equals: self twentynineDays.
	self assert: adarIDefinition numberOfDays equals: self thirtyDays.
	self
		assert: adarIIDefinition numberOfDays
		equals: self twentynineDays
]

{ #category : 'test' }
AdarMonthDefinitionTest >> testNumberOfDaysFromBeginningOfYearIn [

	self
		assert:
		(adarDefinition numberOfDaysFromBeginningOfYearIn: self for: self)
		equals: self ninetyDays.
	self
		assert:
		(adarIDefinition numberOfDaysFromBeginningOfYearIn: self for: self)
		equals: self ninetyDays.
	self
		assert:
		(adarIIDefinition numberOfDaysFromBeginningOfYearIn: self for: self)
		equals: self ninetyDays
]

{ #category : 'test' }
AdarMonthDefinitionTest >> testNumberOfDaysIn [

	self
		assert: (adarDefinition numberOfDaysIn: self)
		equals: self twentynineDays.
	self
		assert: (adarIDefinition numberOfDaysIn: self)
		equals: self thirtyDays.
	self
		assert: (adarIIDefinition numberOfDaysIn: self)
		equals: self twentynineDays
]

{ #category : 'test' }
AdarMonthDefinitionTest >> testNumberOfDaysInLeapYear [

	self
		assert: adarDefinition numberOfDaysInLeapYear
		equals: 0 daysMeasure.
	self
		assert: adarIDefinition numberOfDaysInLeapYear
		equals: self thirtyDays.
	self
		assert: adarIIDefinition numberOfDaysInLeapYear
		equals: self twentynineDays
]

{ #category : 'test' }
AdarMonthDefinitionTest >> testNumberOfDaysInNonleapYear [

	self
		assert: adarDefinition numberOfDaysInNonleapYear
		equals: self twentynineDays.
	self
		assert: adarIDefinition numberOfDaysInNonleapYear
		equals: 0 daysMeasure.
	self
		assert: adarIIDefinition numberOfDaysInNonleapYear
		equals: 0 daysMeasure
]

{ #category : 'test support' }
AdarMonthDefinitionTest >> thirtyDays [
	^ 30 daysMeasure
]

{ #category : 'test support' }
AdarMonthDefinitionTest >> twentynineDays [
	^ 29 daysMeasure
]
