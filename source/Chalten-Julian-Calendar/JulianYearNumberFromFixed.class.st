"
A JulianYearNumberFromFixed is an object used to create a julian year from a number.
"
Class {
	#name : 'JulianYearNumberFromFixed',
	#superclass : 'YearNumberFromFixed',
	#instVars : [
		'yearNumber',
		'calendar',
		'approximation'
	],
	#category : 'Chalten-Julian-Calendar',
	#package : 'Chalten-Julian-Calendar'
}

{ #category : 'testing' }
JulianYearNumberFromFixed class >> canHandle: aCalendar [

	^ aCalendar = (ChaltenEnvironment calendarNamed: #JulianCalendar)
]

{ #category : 'initialization' }
JulianYearNumberFromFixed >> initializeApproximation [

	approximation := ((4 * (yearNumber - calendar epoch)) + 1464) // 1461
]

{ #category : 'initialization' }
JulianYearNumberFromFixed >> initializeFor: aNumberOfDays using: aCalendar [

	yearNumber := aNumberOfDays.
	calendar := aCalendar.
	self initializeApproximation
]

{ #category : 'evaluating' }
JulianYearNumberFromFixed >> value [

	^approximation <= 0 ifTrue: [approximation - 1] ifFalse: [approximation]
]
