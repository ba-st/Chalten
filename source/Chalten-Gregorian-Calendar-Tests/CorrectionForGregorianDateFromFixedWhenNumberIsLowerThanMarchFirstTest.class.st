Class {
	#name : 'CorrectionForGregorianDateFromFixedWhenNumberIsLowerThanMarchFirstTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Gregorian-Calendar-Tests',
	#package : 'Chalten-Gregorian-Calendar-Tests'
}

{ #category : 'test' }
CorrectionForGregorianDateFromFixedWhenNumberIsLowerThanMarchFirstTest >> testValue [

	| correction |
	correction := CorrectionForDateFromFixedBehavior
		              for: 2007
		              fixed: 31
		              using:
		              (ChaltenEnvironment calendarNamed: #GregorianCalendar).
	self assert: correction value equals: 0
]
