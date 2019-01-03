Class {
	#name : #CorrectionForJulianDateFromFixedWhenNumberIsUpperOrEqualThanMarchFirstAndYearIsLeapTest,
	#superclass : #TestCase,
	#category : #'Chalten-Julian-Calendar-Tests'
}

{ #category : #test }
CorrectionForJulianDateFromFixedWhenNumberIsUpperOrEqualThanMarchFirstAndYearIsLeapTest >> testValue [

	| correction |

	correction := CorrectionForDateFromFixedBehavior for: 2008 fixed: 733120 using: JulianCalendar.
	self assert: correction value = 1
]
