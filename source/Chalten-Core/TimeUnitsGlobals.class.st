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
		'millisecond',
		'week',
		'month',
		'year',
		'decade',
		'century',
		'millennium'
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
TimeUnitsGlobals >> allUnits [
	
	^OrderedCollection new
		add: day;
		add: hour;
		add: minute;
		add: second;
		add: millisecond;
		add: week;
		add: month;
		add: year;
		yourself
]

{ #category : #'accessing - units' }
TimeUnitsGlobals >> century [

	^century
]

{ #category : #'accessing - units' }
TimeUnitsGlobals >> day [
	
	^day
]

{ #category : #'accessing - units' }
TimeUnitsGlobals >> decade [

	^decade
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
TimeUnitsGlobals >> initializeCentury [

	century := ProportionalDerivedUnit 
		baseUnit: year
		conversionFactor:  100
		named: 'century'
]

{ #category : #'initialize - private' }
TimeUnitsGlobals >> initializeDay [

	day := BaseUnit named: 'day'
]

{ #category : #'initialize - private' }
TimeUnitsGlobals >> initializeDecade [

	decade := ProportionalDerivedUnit 
		baseUnit: year
		conversionFactor:  10
		named: 'decade'
]

{ #category : #'initialize - private' }
TimeUnitsGlobals >> initializeHour [

	hour := ProportionalDerivedUnit 
		baseUnit: day 
		conversionFactor: 1/24
		named: 'hour'
]

{ #category : #'initialize - private' }
TimeUnitsGlobals >> initializeMillennium [

	millennium := ProportionalDerivedUnit 
		baseUnit: year
		conversionFactor:  1000
		named: 'millennium'
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
TimeUnitsGlobals >> initializeMonth [

	month := BaseUnit nameForOne: 'month' nameForMany: 'months'
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
	self initializeWeek.
	self initializeMonth.
	self initializeYear.
	self initializeDecade.
	self initializeCentury.
	self initializeMillennium
]

{ #category : #'initialize - private' }
TimeUnitsGlobals >> initializeWeek [

	week := ProportionalDerivedUnit 
		baseUnit: day 
		conversionFactor: 7
		named: 'week'
]

{ #category : #'initialize - private' }
TimeUnitsGlobals >> initializeYear [

	year := ProportionalDerivedUnit baseUnit: month
		        conversionFactor: GregorianCalendar amountOfMonthsPerYear
		        named: 'year'
]

{ #category : #'accessing - units' }
TimeUnitsGlobals >> millennium [

	^millennium
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
TimeUnitsGlobals >> month [
	
	^month
]

{ #category : #'accessing - units' }
TimeUnitsGlobals >> second [

	^second
]

{ #category : #'accessing - units' }
TimeUnitsGlobals >> week [

	^week
]

{ #category : #'accessing - units' }
TimeUnitsGlobals >> year [

	^year
]
