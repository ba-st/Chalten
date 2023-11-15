Class {
	#name : 'CorrectionForJulianDateFromFixedWhenOtherwiseTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Julian-Calendar-Tests',
	#package : 'Chalten-Julian-Calendar-Tests'
}

{ #category : 'test' }
CorrectionForJulianDateFromFixedWhenOtherwiseTest >> testValue [

	| correction |
	correction := CorrectionForDateFromFixedBehavior
		              for: 2007
		              fixed: 733110
		              using:
		              (ChaltenEnvironment calendarNamed: #JulianCalendar).
	self assert: correction value equals: 2
]
