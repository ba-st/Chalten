"
A KislevMonthDefinition is the definition for hebrew calendar month named Kislev.

Instance Variables
	numberOfDays:		<Number>

numberOfDays
	- The number of days this month have.

"
Class {
	#name : #KislevMonthDefinition,
	#superclass : #MonthDefinition,
	#instVars : [
		'numberOfDays'
	],
	#category : #'Chalten-Core-Hebrew'
}

{ #category : #'instance creation' }
KislevMonthDefinition class >> numberOfDays: aNumberOfDays [
	
	^self new initializeNumberOfDays: aNumberOfDays
]

{ #category : #initialization }
KislevMonthDefinition >> initializeNumberOfDays: aNumberOfDays [

	numberOfDays := aNumberOfDays
]

{ #category : #accessing }
KislevMonthDefinition >> numberOfDays [
	
	^numberOfDays
]

{ #category : #accessing }
KislevMonthDefinition >> numberOfDaysIn: aYear [

	^aYear
		ifShortKislevDo: [ (aYear numberOfDaysFor: self) - 1 dayMeasure ]
		else: [ aYear numberOfDaysFor: self ]
]

{ #category : #accessing }
KislevMonthDefinition >> numberOfDaysInLeapYear [
	
	^self numberOfDays
]

{ #category : #accessing }
KislevMonthDefinition >> numberOfDaysInNonleapYear [
	
	^self numberOfDays
]
