"
A MarheshvanMonthDefinition is the definition for hebrew calendar month named Marheshvan.

Instance Variables
	numberOfDays:		<Number>

numberOfDays
	- The number of days this month have.

"
Class {
	#name : #MarheshvanMonthDefinition,
	#superclass : #MonthDefinition,
	#instVars : [
		'numberOfDays'
	],
	#category : #'Chalten-Hebrew-Calendar'
}

{ #category : #'instance creation' }
MarheshvanMonthDefinition class >> numberOfDays: aNumberOfDays [
	
	^self new initializeNumberOfDays: aNumberOfDays
]

{ #category : #initialization }
MarheshvanMonthDefinition >> initializeNumberOfDays: aNumberOfDays [

	numberOfDays := aNumberOfDays
]

{ #category : #accessing }
MarheshvanMonthDefinition >> numberOfDays [
	
	^numberOfDays
]

{ #category : #accessing }
MarheshvanMonthDefinition >> numberOfDaysIn: aYear [

	^aYear
		ifLongMarheshvanDo: [ aYear numberOfDaysFor: self ]
		else: [ (aYear numberOfDaysFor: self) - 1 dayMeasure ]
]

{ #category : #accessing }
MarheshvanMonthDefinition >> numberOfDaysInLeapYear [
	
	^self numberOfDays
]

{ #category : #accessing }
MarheshvanMonthDefinition >> numberOfDaysInNonleapYear [
	
	^self numberOfDays
]
