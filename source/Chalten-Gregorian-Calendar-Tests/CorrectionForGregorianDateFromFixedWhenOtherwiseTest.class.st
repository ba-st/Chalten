Class {
	#name : 'CorrectionForGregorianDateFromFixedWhenOtherwiseTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Gregorian-Calendar-Tests',
	#package : 'Chalten-Gregorian-Calendar-Tests'
}

{ #category : 'test' }
CorrectionForGregorianDateFromFixedWhenOtherwiseTest >> testValue [

	| correction |
	correction := CorrectionForDateFromFixedBehavior
		              for: 2007
		              fixed: 733110
		              using:
		              (ChaltenEnvironment calendarNamed: #GregorianCalendar).
	self assert: correction value equals: 2
]
