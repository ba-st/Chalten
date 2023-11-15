Class {
	#name : 'CorrectionForJulianDateFromFixedWhenNumberIsLowerThanMarchFirstTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Julian-Calendar-Tests',
	#package : 'Chalten-Julian-Calendar-Tests'
}

{ #category : 'test' }
CorrectionForJulianDateFromFixedWhenNumberIsLowerThanMarchFirstTest >> testValue [

	| correction |
	correction := CorrectionForDateFromFixedBehavior
		              for: 2007
		              fixed: 31
		              using:
		              (ChaltenEnvironment calendarNamed: #JulianCalendar).
	self assert: correction value equals: 0
]
