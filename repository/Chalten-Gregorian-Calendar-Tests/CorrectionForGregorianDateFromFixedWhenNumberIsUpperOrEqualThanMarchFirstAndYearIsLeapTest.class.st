Class {
	#name : #CorrectionForGregorianDateFromFixedWhenNumberIsUpperOrEqualThanMarchFirstAndYearIsLeapTest,
	#superclass : #TestCase,
	#category : #'Chalten-Gregorian-Calendar-Tests'
}

{ #category : #test }
CorrectionForGregorianDateFromFixedWhenNumberIsUpperOrEqualThanMarchFirstAndYearIsLeapTest >> testValue [

	| correction |

	correction := CorrectionForDateFromFixedBehavior for: 2008 fixed: 733110 using: GregorianCalendar.
	self assert: correction value = 1
]
