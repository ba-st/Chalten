"
A HebrewNewYearOneDayDelay is a one day delay.

"
Class {
	#name : #HebrewNewYearOneDayDelay,
	#superclass : #HebrewNewYearDelay,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Chalten-Hebrew-Calendar'
}

{ #category : #testing }
HebrewNewYearOneDayDelay class >> canHandle: aYear [

	| amountOfDaysInYearNumber amountOfDaysInPreviousYearNumber |
	
	amountOfDaysInYearNumber := (HebrewElapsedDaysInYear for: aYear) value.
	amountOfDaysInPreviousYearNumber := (HebrewElapsedDaysInYear for: aYear previous) value.
	^(amountOfDaysInYearNumber - amountOfDaysInPreviousYearNumber) amount = 382
]

{ #category : #'instance creation' }
HebrewNewYearOneDayDelay class >> initialize [

	super initialize.
	self initializeUniqueInstance
]

{ #category : #'instance creation' }
HebrewNewYearOneDayDelay class >> initializeUniqueInstance [

	uniqueInstance := super new
]

{ #category : #'instance creation' }
HebrewNewYearOneDayDelay class >> new [

	^uniqueInstance
]

{ #category : #evaluating }
HebrewNewYearOneDayDelay >> value [

	^1
]
