Class {
	#name : #MoreThanOnePointInTimeIntervalStrategyTest,
	#superclass : #TestCase,
	#category : #'Chalten-Tests-Time'
}

{ #category : #test }
MoreThanOnePointInTimeIntervalStrategyTest >> testIsValidIntervalFromToBy [

	| now |

	now := GregorianCalendar now.
	self deny: (
		MoreThanOnePointInTimeIntervalStrategy new
			isValidIntervalFrom: now
			to: now
			by: (Measure amount: 1 unit: TimeUnits second)).

	(Delay forSeconds: 1) wait.

	self assert: (
		MoreThanOnePointInTimeIntervalStrategy new
			isValidIntervalFrom: now
			to: GregorianCalendar now
			by: (Measure amount: 1 unit: TimeUnits second))
]
