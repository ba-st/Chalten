"
A CorrectionForDateFromFixedWhenNumberIsLowerThanMarchFirst is a class for corrections made when date is lower than March first.

"
Class {
	#name : 'CorrectionForDateFromFixedWhenNumberIsLowerThanMarchFirst',
	#superclass : 'CorrectionForDateFromFixedBehavior',
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Chalten-Roman-Calendar',
	#package : 'Chalten-Roman-Calendar'
}

{ #category : 'testing' }
CorrectionForDateFromFixedWhenNumberIsLowerThanMarchFirst class >> canHandle: aYearNumber fixed: aNumber using: aCalendar [ 
	^ aNumber < (aCalendar 
				numberOfDaysFromDate: (self firstOfMarchOf: aYearNumber in: aCalendar))
]

{ #category : 'initialization' }
CorrectionForDateFromFixedWhenNumberIsLowerThanMarchFirst class >> initialize [

	self initializeUniqueInstance
]

{ #category : 'initialization' }
CorrectionForDateFromFixedWhenNumberIsLowerThanMarchFirst class >> initializeUniqueInstance [

	uniqueInstance := super new
]

{ #category : 'instance creation' }
CorrectionForDateFromFixedWhenNumberIsLowerThanMarchFirst class >> new [

	^uniqueInstance
]

{ #category : 'evaluating' }
CorrectionForDateFromFixedWhenNumberIsLowerThanMarchFirst >> value [

	^0
]
