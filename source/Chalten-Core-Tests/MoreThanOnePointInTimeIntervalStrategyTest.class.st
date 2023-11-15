Class {
	#name : 'MoreThanOnePointInTimeIntervalStrategyTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Core-Tests-Time',
	#package : 'Chalten-Core-Tests',
	#tag : 'Time'
}

{ #category : 'test' }
MoreThanOnePointInTimeIntervalStrategyTest >> testIsValidIntervalFromToBy [

	| now |

	now := (ChaltenEnvironment calendarNamed: #GregorianCalendar) now.
	self deny: (
		MoreThanOnePointInTimeIntervalStrategy new
			isValidIntervalFrom: now
			to: now
			by: (Measure amount: 1 unit: TimeUnits second)).

	(Delay forSeconds: 1) wait.

	self assert: (
		MoreThanOnePointInTimeIntervalStrategy new
			isValidIntervalFrom: now
			to: (ChaltenEnvironment calendarNamed: #GregorianCalendar) now
			by: (Measure amount: 1 unit: TimeUnits second))
]
