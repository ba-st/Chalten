"
A GregorianYearNumberFromFixed is an object used to create a gregorian year from a number. This object do the corrections implemented by the gregorian calendar.

"
Class {
	#name : #GregorianYearNumberFromFixed,
	#superclass : #YearNumberFromFixed,
	#instVars : [
		'daysInCyclesOf400Years',
		'daysInCyclesOf100Years',
		'daysInCyclesOf4Years',
		'daysInOneRegularYear',
		'leapYearCorrection',
		'numberOfDays',
		'calendar',
		'daysMinusEpoch',
		'cycleOf400Years',
		'daysInCyclesOf400YearsMod',
		'cycleOf100Years',
		'daysInCyclesOf100YearsMod',
		'cycleOf4Years',
		'daysInCyclesOf4YearsMod',
		'oneRegularYear'
	],
	#category : #'Chalten-Core-Gregorian'
}

{ #category : #testing }
GregorianYearNumberFromFixed class >> canHandle: aCalendar [

	^aCalendar = GregorianCalendar
]

{ #category : #'initialization - private' }
GregorianYearNumberFromFixed >> initializeDaysInCycles [

	cycleOf400Years := 146097.
	cycleOf100Years := 36524.
	cycleOf4Years := 1461.
	oneRegularYear := 365.
	daysMinusEpoch := numberOfDays - calendar epoch.
	self initializeDaysInCyclesOf400Years.
	self initializeDaysInCyclesOf100Years.
	self initializeDaysInCyclesOf4Years.
	self initializeDaysInOneRegularYear
]

{ #category : #'initialization - private' }
GregorianYearNumberFromFixed >> initializeDaysInCyclesOf100Years [

	daysInCyclesOf100Years := daysInCyclesOf400YearsMod // cycleOf100Years.
	daysInCyclesOf100YearsMod := daysInCyclesOf400YearsMod \\ cycleOf100Years
]

{ #category : #'initialization - private' }
GregorianYearNumberFromFixed >> initializeDaysInCyclesOf400Years [

	daysInCyclesOf400Years := daysMinusEpoch // cycleOf400Years.
	daysInCyclesOf400YearsMod := daysMinusEpoch \\ cycleOf400Years
]

{ #category : #'initialization - private' }
GregorianYearNumberFromFixed >> initializeDaysInCyclesOf4Years [

	daysInCyclesOf4Years := daysInCyclesOf100YearsMod // cycleOf4Years.
	daysInCyclesOf4YearsMod := daysInCyclesOf100YearsMod \\ cycleOf4Years
]

{ #category : #'initialization - private' }
GregorianYearNumberFromFixed >> initializeDaysInOneRegularYear [

	daysInOneRegularYear := daysInCyclesOf4YearsMod // oneRegularYear
]

{ #category : #initialization }
GregorianYearNumberFromFixed >> initializeFor: aNumberOfDays using: aCalendar [

	numberOfDays := aNumberOfDays.
	calendar := aCalendar.
	self initializeDaysInCycles.
	self initializeLeapYearCorrection
]

{ #category : #'initialization - private' }
GregorianYearNumberFromFixed >> initializeLeapYearCorrection [

	leapYearCorrection :=
		(daysInCyclesOf100Years = 4 or: [daysInOneRegularYear = 4]) ifTrue: [0] ifFalse: [1]
]

{ #category : #evaluating }
GregorianYearNumberFromFixed >> value [

	^(400 * daysInCyclesOf400Years) + (100 * daysInCyclesOf100Years) + (4 * daysInCyclesOf4Years) +
		daysInOneRegularYear + leapYearCorrection
]
