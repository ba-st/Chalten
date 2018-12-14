Class {
	#name : #CorrectionForFixedFromJulianDateWhenMonthNumberIsLowerOrEqualThanFebruaryTest,
	#superclass : #TestCase,
	#category : #'Chalten-Tests-Julian'
}

{ #category : #test }
CorrectionForFixedFromJulianDateWhenMonthNumberIsLowerOrEqualThanFebruaryTest >> testValue [

	| correction |

	correction := CorrectionForFixedFromDateBehavior for: JulianJanuary fifteenth, 2005.
	self assert: correction value = 0
]
