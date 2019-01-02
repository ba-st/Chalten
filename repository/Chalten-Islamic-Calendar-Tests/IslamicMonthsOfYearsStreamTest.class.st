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
	self assert: (stream distanceFrom: RabiI, 1445 to: Ramadan, 1445) = 7 monthsMeasure.
	self assert: (stream distanceFrom: DhuAlQada, 1444 to: Ramadan, 1445) = 0 monthsMeasure
]

{ #category : #'test enumerating' }
IslamicMonthsOfYearsStreamTest >> testNext [
	| stream |
	stream := MonthsOfYearsStream startingOn: Safar, 1445.
	self assert: stream next = (RabiI, 1445).
	self assert: (stream next: 12 monthsMeasure) = (RabiI, 1446).
	self assert: (stream next: 25 monthsMeasure) = (RabiII, 1448).
	self assert: (stream next: -25 monthsMeasure) = (RabiI, 1446).
	self assert: (stream next: -12 monthsMeasure) = (RabiI, 1445).
	self assert: (stream next: -1 monthMeasure) = (Safar, 1445)
]

{ #category : #'test enumerating' }
IslamicMonthsOfYearsStreamTest >> testNextInNumberOfYears [

	| stream |
	stream := MonthsOfYearsStream startingOn: Safar, 1445.
	self assert: (stream nextInNumberOfYears: 3 yearsMeasure) = (Safar, 1448).
	self assert: (stream nextInNumberOfYears: -3 yearsMeasure) = (Safar, 1445)
]

{ #category : #'test enumerating' }
IslamicMonthsOfYearsStreamTest >> testNextMonthIn [

	| stream |
	stream := MonthsOfYearsStream startingOn: Safar, 1445.
	self assert: (stream nextMonth: Ramadan in: 3 yearsMeasure) = (Ramadan, 1448).
	self assert: (stream nextMonth: Ramadan in: -3 yearsMeasure) = (Ramadan, 1445)
]

{ #category : #'test enumerating' }
IslamicMonthsOfYearsStreamTest >> testPrevious [
	| stream |
	stream := MonthsOfYearsStream startingOn: Safar, 1445.
	self assert: stream previous = (Muharram, 1445).
	self assert: (stream previous: 12 monthsMeasure) = (Muharram, 1444).
	self assert: (stream previous: 25 monthsMeasure) = (DhuAlHijja, 1441).
	self assert: (stream previous: -25 monthsMeasure) = (Muharram, 1444).
	self assert: (stream previous: -12 monthsMeasure) = (Muharram, 1445).
	self assert: (stream previous: -1 monthMeasure) = (Safar, 1445)
]

{ #category : #'test enumerating' }
IslamicMonthsOfYearsStreamTest >> testPreviousInNumberOfYears [

	| stream |
	stream := MonthsOfYearsStream startingOn: Safar, 1445.
	self assert: (stream previousInNumberOfYears: 3 yearsMeasure) = (Safar, 1442).
	self assert: (stream previousInNumberOfYears: -3 yearsMeasure) = (Safar, 1445)
]

{ #category : #'test enumerating' }
IslamicMonthsOfYearsStreamTest >> testPreviousMonthIn [

	| stream |
	stream := MonthsOfYearsStream startingOn: Safar, 1445.
	self assert: (stream previousMonth: Ramadan in: 3 yearsMeasure) = (Ramadan, 1442).
	self assert: (stream previousMonth: Ramadan in: -3 yearsMeasure) = (Ramadan, 1445)
]
