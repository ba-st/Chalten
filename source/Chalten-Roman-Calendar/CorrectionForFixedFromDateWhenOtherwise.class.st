"
A CorrectionForFixedFromDateWhenOtherwise is a class for corrections made when month number is other.

"
Class {
	#name : 'CorrectionForFixedFromDateWhenOtherwise',
	#superclass : 'CorrectionForFixedFromDateBehavior',
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Chalten-Roman-Calendar',
	#package : 'Chalten-Roman-Calendar'
}

{ #category : 'testing' }
CorrectionForFixedFromDateWhenOtherwise class >> canHandle: aChristianDate [

	^(aChristianDate month <= February) not
		and: [(aChristianDate month > February and: [aChristianDate year isLeap]) not]
]

{ #category : 'initialization' }
CorrectionForFixedFromDateWhenOtherwise class >> initialize [

	self initializeUniqueInstance
]

{ #category : 'initialization' }
CorrectionForFixedFromDateWhenOtherwise class >> initializeUniqueInstance [

	uniqueInstance := super new
]

{ #category : 'instance creation' }
CorrectionForFixedFromDateWhenOtherwise class >> new [

	^uniqueInstance
]

{ #category : 'evaluating' }
CorrectionForFixedFromDateWhenOtherwise >> value [

	^2
]
