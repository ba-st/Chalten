"
A CorrectionForFixedFromDateWhenMonthNumberIsLowerOrEqualThanFebruaryTest is a test class for testing the behavior of CorrectionForFixedFromDateWhenMonthNumberIsLowerOrEqualThanFebruary
"
Class {
	#name : #CorrectionForFixedFromDateWhenMonthNumberIsLowerOrEqualThanFebruaryTest,
	#superclass : #TestCase,
	#category : #'Chalten-Tests-Roman'
}

{ #category : #'tests-evaluating' }
CorrectionForFixedFromDateWhenMonthNumberIsLowerOrEqualThanFebruaryTest >> testValue [

	self assert: CorrectionForFixedFromDateWhenMonthNumberIsLowerOrEqualThanFebruary new value = 0
]
