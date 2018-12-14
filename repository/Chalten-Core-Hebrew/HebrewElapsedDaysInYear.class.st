"
A HebrewElapsedDaysInYear is the elapsed days in a particular hebrew year.

Instance Variables
	year:		<Year>

year
	- The hebrew year.

"
Class {
	#name : #HebrewElapsedDaysInYear,
	#superclass : #Object,
	#instVars : [
		'year'
	],
	#category : #'Chalten-Core-Hebrew'
}

{ #category : #'instance creation' }
HebrewElapsedDaysInYear class >> for: aYear [

	^self new initializeFor: aYear
]

{ #category : #'evaluating - private' }
HebrewElapsedDaysInYear >> elapsedMonthsIn: aYearNumber [

	^(235 * aYearNumber - 234) // 19
]

{ #category : #'evaluating - private' }
HebrewElapsedDaysInYear >> elapsedPartsIn: aYearNumber [

	^12084 + (13753 * (self elapsedMonthsIn: aYearNumber))
]

{ #category : #initialization }
HebrewElapsedDaysInYear >> initializeFor: aYear [

	year := aYear
]

{ #category : #evaluating }
HebrewElapsedDaysInYear >> value [
	| yearNumber amountOfDays correction |
	yearNumber := year number.
	amountOfDays := 29 * (self elapsedMonthsIn: yearNumber) + ((self elapsedPartsIn: yearNumber) // 25920).
	correction := (HebrewElapsedDaysInYearCorrectionBehavior for: amountOfDays) value.
	^ (amountOfDays + correction) daysMeasure
]
