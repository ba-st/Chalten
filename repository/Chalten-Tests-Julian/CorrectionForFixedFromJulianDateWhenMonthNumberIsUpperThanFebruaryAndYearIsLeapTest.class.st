Class {
	#name : #CorrectionForFixedFromJulianDateWhenMonthNumberIsUpperThanFebruaryAndYearIsLeapTest,
	#superclass : #TestCase,
	#category : #'Chalten-Tests-Julian'
}

{ #category : #test }
CorrectionForFixedFromJulianDateWhenMonthNumberIsUpperThanFebruaryAndYearIsLeapTest >> testValue [

	| correction |

	correction := CorrectionForFixedFromDateBehavior for: JulianMarch fifteenth, 2008.
	self assert: correction value = 1
]
