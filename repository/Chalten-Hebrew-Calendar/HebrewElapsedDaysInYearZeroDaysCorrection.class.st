"
A HebrewElapsedDaysInYearZeroDaysCorrection is a zero days correction.

"
Class {
	#name : #HebrewElapsedDaysInYearZeroDaysCorrection,
	#superclass : #HebrewElapsedDaysInYearCorrectionBehavior,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Chalten-Hebrew-Calendar'
}

{ #category : #testing }
HebrewElapsedDaysInYearZeroDaysCorrection class >> canHandle: anAmountOfDays [

	^(self basicCanHandle: anAmountOfDays) not
]

{ #category : #initialization }
HebrewElapsedDaysInYearZeroDaysCorrection class >> initialize [

	self initializeUniqueInstance
]

{ #category : #initialization }
HebrewElapsedDaysInYearZeroDaysCorrection class >> initializeUniqueInstance [

	uniqueInstance := super new
]

{ #category : #'instance creation' }
HebrewElapsedDaysInYearZeroDaysCorrection class >> new [

	^uniqueInstance
]

{ #category : #evaluating }
HebrewElapsedDaysInYearZeroDaysCorrection >> value [

	^0
]
