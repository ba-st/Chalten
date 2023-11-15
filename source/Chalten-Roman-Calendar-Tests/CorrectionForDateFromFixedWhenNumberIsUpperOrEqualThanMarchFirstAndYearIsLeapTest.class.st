"
A CorrectionForDateFromFixedWhenNumberIsUpperOrEqualThanMarchFirstAndYearIsLeapTest is a test class for testing the behavior of CorrectionForDateFromFixedWhenNumberIsUpperOrEqualThanMarchFirstAndYearIsLeap
"
Class {
	#name : 'CorrectionForDateFromFixedWhenNumberIsUpperOrEqualThanMarchFirstAndYearIsLeapTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Roman-Calendar-Tests',
	#package : 'Chalten-Roman-Calendar-Tests'
}

{ #category : 'tests-evaluating' }
CorrectionForDateFromFixedWhenNumberIsUpperOrEqualThanMarchFirstAndYearIsLeapTest >> testValue [

	self
		assert:
			CorrectionForDateFromFixedWhenNumberIsUpperOrEqualThanMarchFirstAndYearIsLeap
				new value
		equals: 1
]
