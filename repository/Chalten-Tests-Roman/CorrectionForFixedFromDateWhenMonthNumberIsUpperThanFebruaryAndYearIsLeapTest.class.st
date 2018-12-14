"
A CorrectionForFixedFromDateWhenMonthNumberIsUpperThanFebruaryAndYearIsLeapTest is a test class for testing the behavior of CorrectionForFixedFromDateWhenMonthNumberIsUpperThanFebruaryAndYearIsLeap
"
Class {
	#name : #CorrectionForFixedFromDateWhenMonthNumberIsUpperThanFebruaryAndYearIsLeapTest,
	#superclass : #TestCase,
	#category : #'Chalten-Tests-Roman'
}

{ #category : #'tests-evaluating' }
CorrectionForFixedFromDateWhenMonthNumberIsUpperThanFebruaryAndYearIsLeapTest >> testValue [

	self assert:
		CorrectionForFixedFromDateWhenMonthNumberIsUpperThanFebruaryAndYearIsLeap new value = 1
]
