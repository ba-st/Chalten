Class {
	#name : 'CorrectionForFixedFromJulianDateWhenMonthNumberIsUpperThanFebruaryAndYearIsLeapTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Julian-Calendar-Tests',
	#package : 'Chalten-Julian-Calendar-Tests'
}

{ #category : 'test' }
CorrectionForFixedFromJulianDateWhenMonthNumberIsUpperThanFebruaryAndYearIsLeapTest >> testValue [

	| correction |
	correction := CorrectionForFixedFromDateBehavior for:
		              JulianMarch fifteenth , 2008.
	self assert: correction value equals: 1
]
