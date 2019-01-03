"
A CorrectionForDateFromFixedWhenOtherwise is a class for corrections made when number is other.
"
Class {
	#name : #CorrectionForDateFromFixedWhenOtherwise,
	#superclass : #CorrectionForDateFromFixedBehavior,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Chalten-Roman-Calendar'
}

{ #category : #testing }
CorrectionForDateFromFixedWhenOtherwise class >> canHandle: aYearNumber fixed: aNumber using: aCalendar [ 
	^ (aNumber < (aCalendar 
				numberOfDaysFromDate: (self firstOfMarchOf: aYearNumber in: aCalendar))) 
		not and: 
				[(aNumber >= (aCalendar 
							numberOfDaysFromDate: (self firstOfMarchOf: aYearNumber in: aCalendar)) 
					and: [aCalendar isYearNumberLeap: aYearNumber]) not]
]

{ #category : #initialization }
CorrectionForDateFromFixedWhenOtherwise class >> initialize [

	self initializeUniqueInstance
]

{ #category : #initialization }
CorrectionForDateFromFixedWhenOtherwise class >> initializeUniqueInstance [

	uniqueInstance := super new
]

{ #category : #'instance creation' }
CorrectionForDateFromFixedWhenOtherwise class >> new [

	^uniqueInstance
]

{ #category : #evaluating }
CorrectionForDateFromFixedWhenOtherwise >> value [

	^2
]
