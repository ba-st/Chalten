Class {
	#name : 'CorrectionForFixedFromJulianDateWhenOtherwiseTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Julian-Calendar-Tests',
	#package : 'Chalten-Julian-Calendar-Tests'
}

{ #category : 'test' }
CorrectionForFixedFromJulianDateWhenOtherwiseTest >> testValue [

	| correction |
	correction := CorrectionForFixedFromDateBehavior for:
		              JulianMay fifteenth , 2005.
	self assert: correction value equals: 2
]
