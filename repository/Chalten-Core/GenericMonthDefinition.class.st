"
A GenericMonthDefinition is a definition of a generic month. The mayority of months are defined using this object.

Instance Variables
	numberOfDaysInLeapYear:			<Number>
	numberOfDaysInNonleapYear:		<Number>

numberOfDaysInLeapYear
	- The number of days of the month in leap years.

numberOfDaysInNonleapYear
	- The number of days of the month in nonleap years.

"
Class {
	#name : #GenericMonthDefinition,
	#superclass : #MonthDefinition,
	#instVars : [
		'numberOfDaysInNonleapYear',
		'numberOfDaysInLeapYear'
	],
	#category : #'Chalten-Core-Time'
}

{ #category : #'instance creation' }
GenericMonthDefinition class >> numberOfDays: aNumberOfDays [
	
	^self
		numberOfDaysInNonleapYear: aNumberOfDays
		numberOfDaysInLeapYear: aNumberOfDays
]

{ #category : #'instance creation' }
GenericMonthDefinition class >> numberOfDaysInNonleapYear: aNumberOfDaysInNonleapYears numberOfDaysInLeapYear: aNumberOfDaysInLeapYears [
	
	^self new
		initializeNumberOfDaysInNonleapYear: aNumberOfDaysInNonleapYears
		numberOfDaysInLeapYear: aNumberOfDaysInLeapYears
]

{ #category : #initialization }
GenericMonthDefinition >> initializeNumberOfDaysInNonleapYear: aNumberOfDaysInNonleapYears numberOfDaysInLeapYear: aNumberOfDaysInLeapYears [

	numberOfDaysInNonleapYear := aNumberOfDaysInNonleapYears.
	numberOfDaysInLeapYear := aNumberOfDaysInLeapYears
]

{ #category : #accessing }
GenericMonthDefinition >> numberOfDays [
	
	^self numberOfDaysInLeapYear
]

{ #category : #accessing }
GenericMonthDefinition >> numberOfDaysIn: aYear [
	
	^aYear numberOfDaysFor: self
]

{ #category : #accessing }
GenericMonthDefinition >> numberOfDaysInLeapYear [
	
	^numberOfDaysInLeapYear
]

{ #category : #accessing }
GenericMonthDefinition >> numberOfDaysInNonleapYear [
	
	^numberOfDaysInNonleapYear
]
