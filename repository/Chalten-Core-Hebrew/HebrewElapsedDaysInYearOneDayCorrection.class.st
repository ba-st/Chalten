"
A HebrewElapsedDaysInYearOneDayCorrection is a one day correction.

"
Class {
	#name : #HebrewElapsedDaysInYearOneDayCorrection,
	#superclass : #HebrewElapsedDaysInYearCorrectionBehavior,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Chalten-Core-Hebrew'
}

{ #category : #testing }
HebrewElapsedDaysInYearOneDayCorrection class >> canHandle: anAmountOfDays [

	^self basicCanHandle: anAmountOfDays
]

{ #category : #initialization }
HebrewElapsedDaysInYearOneDayCorrection class >> initialize [

	self initializeUniqueInstance
]

{ #category : #initialization }
HebrewElapsedDaysInYearOneDayCorrection class >> initializeUniqueInstance [

	uniqueInstance := super new
]

{ #category : #'instance creation' }
HebrewElapsedDaysInYearOneDayCorrection class >> new [

	^uniqueInstance
]

{ #category : #evaluating }
HebrewElapsedDaysInYearOneDayCorrection >> value [

	^1
]
