Class {
	#name : 'CorrectionForFixedFromJulianDateWhenMonthNumberIsLowerOrEqualThanFebruaryTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Julian-Calendar-Tests',
	#package : 'Chalten-Julian-Calendar-Tests'
}

{ #category : 'test' }
CorrectionForFixedFromJulianDateWhenMonthNumberIsLowerOrEqualThanFebruaryTest >> testValue [

	| correction |
	correction := CorrectionForFixedFromDateBehavior for:
		              JulianJanuary fifteenth , 2005.
	self assert: correction value equals: 0
]
