"
A CorrectionForFixedFromDateWhenMonthNumberIsLowerOrEqualThanFebruary is a class for corrections made when month number is lower or equal than February.

"
Class {
	#name : 'CorrectionForFixedFromDateWhenMonthNumberIsLowerOrEqualThanFebruary',
	#superclass : 'CorrectionForFixedFromDateBehavior',
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Chalten-Roman-Calendar',
	#package : 'Chalten-Roman-Calendar'
}

{ #category : 'testing' }
CorrectionForFixedFromDateWhenMonthNumberIsLowerOrEqualThanFebruary class >> canHandle: aChristianDate [

	^aChristianDate month <= February
]

{ #category : 'initialization' }
CorrectionForFixedFromDateWhenMonthNumberIsLowerOrEqualThanFebruary class >> initialize [

	self initializeUniqueInstance
]

{ #category : 'initialization' }
CorrectionForFixedFromDateWhenMonthNumberIsLowerOrEqualThanFebruary class >> initializeUniqueInstance [

	uniqueInstance := super new
]

{ #category : 'instance creation' }
CorrectionForFixedFromDateWhenMonthNumberIsLowerOrEqualThanFebruary class >> new [

	^uniqueInstance
]

{ #category : 'evaluating' }
CorrectionForFixedFromDateWhenMonthNumberIsLowerOrEqualThanFebruary >> value [

	^0
]
