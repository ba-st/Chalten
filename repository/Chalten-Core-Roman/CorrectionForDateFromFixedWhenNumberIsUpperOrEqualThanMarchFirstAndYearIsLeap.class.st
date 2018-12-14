"
A CorrectionForDateFromFixedWhenNumberIsUpperOrEqualThanMarchFirstAndYearIsLeap is a class for corrections made when number is upper or equal than March first and year is leap.

"
Class {
	#name : #CorrectionForDateFromFixedWhenNumberIsUpperOrEqualThanMarchFirstAndYearIsLeap,
	#superclass : #CorrectionForDateFromFixedBehavior,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Chalten-Core-Roman'
}

{ #category : #testing }
CorrectionForDateFromFixedWhenNumberIsUpperOrEqualThanMarchFirstAndYearIsLeap class >> canHandle: aYearNumber fixed: aNumber using: aCalendar [ 
	^ aNumber >= (aCalendar 
				numberOfDaysFromDate: (self firstOfMarchOf: aYearNumber in: aCalendar)) 
		and: [aCalendar isYearNumberLeap: aYearNumber]
]

{ #category : #initialization }
CorrectionForDateFromFixedWhenNumberIsUpperOrEqualThanMarchFirstAndYearIsLeap class >> initialize [

	self initializeUniqueInstance
]

{ #category : #initialization }
CorrectionForDateFromFixedWhenNumberIsUpperOrEqualThanMarchFirstAndYearIsLeap class >> initializeUniqueInstance [

	uniqueInstance := super new
]

{ #category : #'instance creation' }
CorrectionForDateFromFixedWhenNumberIsUpperOrEqualThanMarchFirstAndYearIsLeap class >> new [

	^uniqueInstance
]

{ #category : #evaluating }
CorrectionForDateFromFixedWhenNumberIsUpperOrEqualThanMarchFirstAndYearIsLeap >> value [

	^1
]
