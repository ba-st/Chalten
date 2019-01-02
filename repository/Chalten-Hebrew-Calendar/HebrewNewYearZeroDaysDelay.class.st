"
A HebrewNewYearZeroDaysDelay is a zero days delay.

"
Class {
	#name : #HebrewNewYearZeroDaysDelay,
	#superclass : #HebrewNewYearDelay,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Chalten-Hebrew-Calendar'
}

{ #category : #testing }
HebrewNewYearZeroDaysDelay class >> canHandle: aYear [

	| amountOfDaysInYearNumber amountOfDaysInPreviousYearNumber amountOfDaysInNextYearNumber |
	
	amountOfDaysInYearNumber := (HebrewElapsedDaysInYear for: aYear) value.
	amountOfDaysInPreviousYearNumber := (HebrewElapsedDaysInYear for: aYear previous) value.
	amountOfDaysInNextYearNumber := (HebrewElapsedDaysInYear for: aYear next) value.
	^((amountOfDaysInYearNumber - amountOfDaysInPreviousYearNumber) amount = 382) not
		and: [((amountOfDaysInNextYearNumber - amountOfDaysInYearNumber) amount = 356) not]
]

{ #category : #'instance creation' }
HebrewNewYearZeroDaysDelay class >> initialize [

	super initialize.
	self initializeUniqueInstance
]

{ #category : #'instance creation' }
HebrewNewYearZeroDaysDelay class >> initializeUniqueInstance [

	uniqueInstance := super new
]

{ #category : #'instance creation' }
HebrewNewYearZeroDaysDelay class >> new [

	^uniqueInstance
]

{ #category : #evaluating }
HebrewNewYearZeroDaysDelay >> value [

	^0
]
