Class {
	#name : #IslamicMonthsOfYearsStreamTest,
	#superclass : #TestCase,
	#category : #'Chalten-Islamic-Calendar-Tests'
}

{ #category : #accessing }
IslamicMonthsOfYearsStreamTest class >> classUnderTest [

	^MonthsOfYearsStream
]

{ #category : #'test querying' }
IslamicMonthsOfYearsStreamTest >> testDistanceFromTo [

	| stream |
	stream := MonthsOfYearsStream startingOn: Safar, 1445.
	self assert: (stream distanceFrom: RabiI, 1445 to: Ramadan, 1445) = 7 islamicMonths.
	self assert: (stream distanceFrom: DhuAlQada, 1444 to: Ramadan, 1445) = 0 islamicMonths
]

{ #category : #'test enumerating' }
IslamicMonthsOfYearsStreamTest >> testNext [
	| stream |
	stream := MonthsOfYearsStream startingOn: Safar, 1445.
	self assert: stream next = (RabiI, 1445).
	self assert: (stream next: 12 islamicMonths) = (RabiI, 1446).
	self assert: (stream next: 25 islamicMonths) = (RabiII, 1448).
	self assert: (stream next: -25 islamicMonths) = (RabiI, 1446).
	self assert: (stream next: -12 islamicMonths) = (RabiI, 1445).
	self assert: (stream next: -1 islamicMonth) = (Safar, 1445)
]

{ #category : #'test enumerating' }
IslamicMonthsOfYearsStreamTest >> testNextInNumberOfYears [

	| stream |
	stream := MonthsOfYearsStream startingOn: Safar, 1445.
	self assert: (stream nextInNumberOfYears: 3 islamicYears) = (Safar, 1448).
	self assert: (stream nextInNumberOfYears: -3 islamicYears) = (Safar, 1445)
]

{ #category : #'test enumerating' }
IslamicMonthsOfYearsStreamTest >> testNextMonthIn [

	| stream |
	stream := MonthsOfYearsStream startingOn: Safar, 1445.
	self assert: (stream nextMonth: Ramadan in: 3 islamicYears) = (Ramadan, 1448).
	self assert: (stream nextMonth: Ramadan in: -3 islamicYears) = (Ramadan, 1445)
]

{ #category : #'test enumerating' }
IslamicMonthsOfYearsStreamTest >> testPrevious [
	| stream |
	stream := MonthsOfYearsStream startingOn: Safar, 1445.
	self assert: stream previous = (Muharram, 1445).
	self assert: (stream previous: 12 islamicMonths) = (Muharram, 1444).
	self assert: (stream previous: 25 islamicMonths) = (DhuAlHijja, 1441).
	self assert: (stream previous: -25 islamicMonths) = (Muharram, 1444).
	self assert: (stream previous: -12 islamicMonths) = (Muharram, 1445).
	self assert: (stream previous: -1 islamicMonth) = (Safar, 1445)
]

{ #category : #'test enumerating' }
IslamicMonthsOfYearsStreamTest >> testPreviousInNumberOfYears [

	| stream |
	stream := MonthsOfYearsStream startingOn: Safar, 1445.
	self assert: (stream previousInNumberOfYears: 3 islamicYears) = (Safar, 1442).
	self assert: (stream previousInNumberOfYears: -3 islamicYears) = (Safar, 1445)
]

{ #category : #'test enumerating' }
IslamicMonthsOfYearsStreamTest >> testPreviousMonthIn [

	| stream |
	stream := MonthsOfYearsStream startingOn: Safar, 1445.
	self assert: (stream previousMonth: Ramadan in: 3 islamicYears) = (Ramadan, 1442).
	self assert: (stream previousMonth: Ramadan in: -3 islamicYears) = (Ramadan, 1445)
]
