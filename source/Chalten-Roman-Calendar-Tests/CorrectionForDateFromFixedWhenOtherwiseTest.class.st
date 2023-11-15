"
A CorrectionForDateFromFixedWhenOtherwiseTest is a test class for testing the behavior of CorrectionForDateFromFixedWhenOtherwise
"
Class {
	#name : 'CorrectionForDateFromFixedWhenOtherwiseTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Roman-Calendar-Tests',
	#package : 'Chalten-Roman-Calendar-Tests'
}

{ #category : 'tests-evaluating' }
CorrectionForDateFromFixedWhenOtherwiseTest >> testValue [

	self
		assert: CorrectionForDateFromFixedWhenOtherwise new value
		equals: 2
]
