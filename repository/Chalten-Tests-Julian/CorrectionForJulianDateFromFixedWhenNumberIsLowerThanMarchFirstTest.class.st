Class {
	#name : #CorrectionForJulianDateFromFixedWhenNumberIsLowerThanMarchFirstTest,
	#superclass : #TestCase,
	#category : #'Chalten-Tests-Julian'
}

{ #category : #test }
CorrectionForJulianDateFromFixedWhenNumberIsLowerThanMarchFirstTest >> testValue [

	| correction |

	correction := CorrectionForDateFromFixedBehavior for: 2007 fixed: 31 using: JulianCalendar.
	self assert: correction value = 0
]
