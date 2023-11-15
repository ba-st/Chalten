Class {
	#name : 'CorrectionForFixedFromGregorianDateWhenMonthNumberIsUpperThanFebruaryAndYearIsLeapTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Gregorian-Calendar-Tests',
	#package : 'Chalten-Gregorian-Calendar-Tests'
}

{ #category : 'test' }
CorrectionForFixedFromGregorianDateWhenMonthNumberIsUpperThanFebruaryAndYearIsLeapTest >> testValue [

	| correction |
	correction := CorrectionForFixedFromDateBehavior for:
		              March fifteenth , 2008.
	self assert: correction value equals: 1
]
