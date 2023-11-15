"
An OnlyOnLeapYearsAvailableMonthDefinition is a definition for months only valids in leap years.

Instance Variables
	numberOfDays:		<Number>

numberOfDays
	- The number of days this month have.

"
Class {
	#name : 'AdarMonthDefinition',
	#superclass : 'MonthDefinition',
	#instVars : [
		'numberOfDaysInNonleapYear',
		'numberOfDaysInLeapYear'
	],
	#category : 'Chalten-Hebrew-Calendar',
	#package : 'Chalten-Hebrew-Calendar'
}

{ #category : 'instance creation' }
AdarMonthDefinition class >> adar [

	^self
		numberOfDaysInNonleapYear: 29 daysMeasure
		numberOfDaysInLeapYear: 0 daysMeasure
]

{ #category : 'instance creation' }
AdarMonthDefinition class >> adarI [

	^self
		numberOfDaysInNonleapYear: 0 daysMeasure
		numberOfDaysInLeapYear: 30 daysMeasure
]

{ #category : 'instance creation' }
AdarMonthDefinition class >> adarII [

	^self
		numberOfDaysInNonleapYear: 0 daysMeasure
		numberOfDaysInLeapYear: 29 daysMeasure
]

{ #category : 'instance creation' }
AdarMonthDefinition class >> numberOfDaysInNonleapYear: aNumberOfDaysInNonleapYears numberOfDaysInLeapYear: aNumberOfDaysInLeapYears [
	
	^self new
		initializeNumberOfDaysInNonleapYear: aNumberOfDaysInNonleapYears
		numberOfDaysInLeapYear: aNumberOfDaysInLeapYears
]

{ #category : 'initialization' }
AdarMonthDefinition >> initializeNumberOfDaysInNonleapYear: aNumberOfDaysInNonleapYears numberOfDaysInLeapYear: aNumberOfDaysInLeapYears [

	numberOfDaysInNonleapYear := aNumberOfDaysInNonleapYears.
	numberOfDaysInLeapYear := aNumberOfDaysInLeapYears
]

{ #category : 'accessing' }
AdarMonthDefinition >> numberOfDays [
	
	^self numberOfDaysInLeapYear max: self numberOfDaysInNonleapYear
]

{ #category : 'accessing' }
AdarMonthDefinition >> numberOfDaysIn: aYear [
	
	^aYear numberOfDaysFor: self
]

{ #category : 'accessing' }
AdarMonthDefinition >> numberOfDaysInLeapYear [

	^numberOfDaysInLeapYear
]

{ #category : 'accessing' }
AdarMonthDefinition >> numberOfDaysInNonleapYear [

	^numberOfDaysInNonleapYear
]
