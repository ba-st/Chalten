Class {
	#name : #CorrectionForFixedFromGregorianDateWhenMonthNumberIsUpperThanFebruaryAndYearIsLeapTest,
	#superclass : #TestCase,
	#category : #'Chalten-Tests-Gregorian'
}

{ #category : #test }
CorrectionForFixedFromGregorianDateWhenMonthNumberIsUpperThanFebruaryAndYearIsLeapTest >> testValue [

	| correction |

	correction := CorrectionForFixedFromDateBehavior for: March fifteenth, 2008.
	self assert: correction value = 1
]
