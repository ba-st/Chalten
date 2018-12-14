"
A CorrectionForDateFromFixedWhenNumberIsLowerThanMarchFirstTest is a test class for testing the behavior of CorrectionForDateFromFixedWhenNumberIsLowerThanMarchFirst
"
Class {
	#name : #CorrectionForDateFromFixedWhenNumberIsLowerThanMarchFirstTest,
	#superclass : #TestCase,
	#category : #'Chalten-Tests-Roman'
}

{ #category : #'tests-evaluating' }
CorrectionForDateFromFixedWhenNumberIsLowerThanMarchFirstTest >> testValue [

	self assert: CorrectionForDateFromFixedWhenNumberIsLowerThanMarchFirst new value = 0
]
