"
A HebrewNewYearTwoDaysDelay is a two days delay.

"
Class {
	#name : #HebrewNewYearTwoDaysDelay,
	#superclass : #HebrewNewYearDelay,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Chalten-Core-Hebrew'
}

{ #category : #testing }
HebrewNewYearTwoDaysDelay class >> canHandle: aYear [

	| numberOfDaysInYearNumber numberOfDaysInNextYearNumber |
	
	numberOfDaysInYearNumber := (HebrewElapsedDaysInYear for: aYear) value.
	numberOfDaysInNextYearNumber := (HebrewElapsedDaysInYear for: aYear next) value.
	^(numberOfDaysInNextYearNumber - numberOfDaysInYearNumber) amount = 356
]

{ #category : #'instance creation' }
HebrewNewYearTwoDaysDelay class >> initialize [

	super initialize.
	self initializeUniqueInstance
]

{ #category : #'instance creation' }
HebrewNewYearTwoDaysDelay class >> initializeUniqueInstance [

	uniqueInstance := super new
]

{ #category : #'instance creation' }
HebrewNewYearTwoDaysDelay class >> new [

	^uniqueInstance
]

{ #category : #evaluating }
HebrewNewYearTwoDaysDelay >> value [

	^2
]
