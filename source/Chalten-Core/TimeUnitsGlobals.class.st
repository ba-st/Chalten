"
A TimeUnitsGlobals is a helper object with common time units. Use it calling to TimeUnits, for example TimeUnits month.

"
Class {
	#name : #TimeUnitsGlobals,
	#superclass : #Object,
	#instVars : [
		'day',
		'hour',
		'minute',
		'second',
		'millisecond'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Chalten-Core-Time'
}

{ #category : #initialization }
TimeUnitsGlobals class >> initializeAfterLoad [

	self initializeTimeUnits
]

{ #category : #initialization }
TimeUnitsGlobals class >> initializeTimeUnits [

	self initializeUniqueInstance.
	Smalltalk at: #TimeUnits put: uniqueInstance
]

{ #category : #initialization }
TimeUnitsGlobals class >> initializeUniqueInstance [

	uniqueInstance := self basicNew initialize
]

{ #category : #'instance creation' }
TimeUnitsGlobals class >> new [

	^uniqueInstance
]

{ #category : #'accessing - units' }
TimeUnitsGlobals >> day [
	
	^day
]

{ #category : #'accessing - units' }
TimeUnitsGlobals >> hour [
	
	^hour
]

{ #category : #'initialize - release' }
TimeUnitsGlobals >> initialize [

	self initializeTimeUnits
]

{ #category : #'initialize - private' }
TimeUnitsGlobals >> initializeDay [

	day := BaseUnit named: 'day'
]

{ #category : #'initialize - private' }
TimeUnitsGlobals >> initializeHour [

	hour := ProportionalDerivedUnit 
		baseUnit: day 
		conversionFactor: 1/24
		named: 'hour'
]

{ #category : #'initialize - private' }
TimeUnitsGlobals >> initializeMillisecond [

	millisecond := ProportionalDerivedUnit 
		baseUnit: day 
		conversionFactor: 1/(1000*60*60*24)
		named: 'millisecond'
]

{ #category : #'initialize - private' }
TimeUnitsGlobals >> initializeMinute [

	minute := ProportionalDerivedUnit 
		baseUnit: day 
		conversionFactor: 1/(24*60)
		named: 'minute'
]

{ #category : #'initialize - private' }
TimeUnitsGlobals >> initializeSecond [

	second := ProportionalDerivedUnit 
		baseUnit: day 
		conversionFactor: 1/(24*60*60)
		named: 'second'
]

{ #category : #'initialize - private' }
TimeUnitsGlobals >> initializeTimeUnits [

	self initializeDay.
	self initializeMillisecond.
	self initializeSecond.
	self initializeMinute.
	self initializeHour.
]

{ #category : #'accessing - units' }
TimeUnitsGlobals >> millisecond [
	
	^millisecond
]

{ #category : #'accessing - units' }
TimeUnitsGlobals >> minute [

	^minute
]

{ #category : #'accessing - units' }
TimeUnitsGlobals >> second [

	^second
]
