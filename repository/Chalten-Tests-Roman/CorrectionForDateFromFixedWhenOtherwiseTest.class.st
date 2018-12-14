"
A CorrectionForDateFromFixedWhenOtherwiseTest is a test class for testing the behavior of CorrectionForDateFromFixedWhenOtherwise
"
Class {
	#name : #CorrectionForDateFromFixedWhenOtherwiseTest,
	#superclass : #TestCase,
	#category : #'Chalten-Tests-Roman'
}

{ #category : #'tests-evaluating' }
CorrectionForDateFromFixedWhenOtherwiseTest >> testValue [

	self assert: CorrectionForDateFromFixedWhenOtherwise new value = 2
]
