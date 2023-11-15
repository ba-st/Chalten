"
A CorrectionForFixedFromDateWhenMonthNumberIsLowerOrEqualThanFebruaryTest is a test class for testing the behavior of CorrectionForFixedFromDateWhenMonthNumberIsLowerOrEqualThanFebruary
"
Class {
	#name : 'CorrectionForFixedFromDateWhenMonthNumberIsLowerOrEqualThanFebruaryTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Roman-Calendar-Tests',
	#package : 'Chalten-Roman-Calendar-Tests'
}

{ #category : 'tests-evaluating' }
CorrectionForFixedFromDateWhenMonthNumberIsLowerOrEqualThanFebruaryTest >> testValue [

	self
		assert:
			CorrectionForFixedFromDateWhenMonthNumberIsLowerOrEqualThanFebruary
				new value
		equals: 0
]
