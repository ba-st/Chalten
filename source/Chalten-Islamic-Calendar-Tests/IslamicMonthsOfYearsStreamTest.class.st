Class {
	#name : 'IslamicMonthsOfYearsStreamTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Islamic-Calendar-Tests',
	#package : 'Chalten-Islamic-Calendar-Tests'
}

{ #category : 'accessing' }
IslamicMonthsOfYearsStreamTest class >> classUnderTest [

	^MonthsOfYearsStream
]

{ #category : 'test querying' }
IslamicMonthsOfYearsStreamTest >> testDistanceFromTo [

	| stream |
	stream := MonthsOfYearsStream startingOn: Safar , 1445.
	self
		assert: (stream distanceFrom: RabiI , 1445 to: Ramadan , 1445)
		equals: 7 monthsMeasure.
	self
		assert: (stream distanceFrom: DhuAlQada , 1444 to: Ramadan , 1445)
		equals: 0 monthsMeasure
]

{ #category : 'test enumerating' }
IslamicMonthsOfYearsStreamTest >> testNext [

	| stream |
	stream := MonthsOfYearsStream startingOn: Safar , 1445.
	self assert: stream next equals: RabiI , 1445.
	self assert: (stream next: 12 monthsMeasure) equals: RabiI , 1446.
	self assert: (stream next: 25 monthsMeasure) equals: RabiII , 1448.
	self assert: (stream next: -25 monthsMeasure) equals: RabiI , 1446.
	self assert: (stream next: -12 monthsMeasure) equals: RabiI , 1445.
	self assert: (stream next: -1 monthMeasure) equals: Safar , 1445
]

{ #category : 'test enumerating' }
IslamicMonthsOfYearsStreamTest >> testNextInNumberOfYears [

	| stream |
	stream := MonthsOfYearsStream startingOn: Safar , 1445.
	self
		assert: (stream nextInNumberOfYears: 3 yearsMeasure)
		equals: Safar , 1448.
	self
		assert: (stream nextInNumberOfYears: -3 yearsMeasure)
		equals: Safar , 1445
]

{ #category : 'test enumerating' }
IslamicMonthsOfYearsStreamTest >> testNextMonthIn [

	| stream |
	stream := MonthsOfYearsStream startingOn: Safar , 1445.
	self
		assert: (stream nextMonth: Ramadan in: 3 yearsMeasure)
		equals: Ramadan , 1448.
	self
		assert: (stream nextMonth: Ramadan in: -3 yearsMeasure)
		equals: Ramadan , 1445
]

{ #category : 'test enumerating' }
IslamicMonthsOfYearsStreamTest >> testPrevious [

	| stream |
	stream := MonthsOfYearsStream startingOn: Safar , 1445.
	self assert: stream previous equals: Muharram , 1445.
	self
		assert: (stream previous: 12 monthsMeasure)
		equals: Muharram , 1444.
	self
		assert: (stream previous: 25 monthsMeasure)
		equals: DhuAlHijja , 1441.
	self
		assert: (stream previous: -25 monthsMeasure)
		equals: Muharram , 1444.
	self
		assert: (stream previous: -12 monthsMeasure)
		equals: Muharram , 1445.
	self assert: (stream previous: -1 monthMeasure) equals: Safar , 1445
]

{ #category : 'test enumerating' }
IslamicMonthsOfYearsStreamTest >> testPreviousInNumberOfYears [

	| stream |
	stream := MonthsOfYearsStream startingOn: Safar , 1445.
	self
		assert: (stream previousInNumberOfYears: 3 yearsMeasure)
		equals: Safar , 1442.
	self
		assert: (stream previousInNumberOfYears: -3 yearsMeasure)
		equals: Safar , 1445
]

{ #category : 'test enumerating' }
IslamicMonthsOfYearsStreamTest >> testPreviousMonthIn [

	| stream |
	stream := MonthsOfYearsStream startingOn: Safar , 1445.
	self
		assert: (stream previousMonth: Ramadan in: 3 yearsMeasure)
		equals: Ramadan , 1442.
	self
		assert: (stream previousMonth: Ramadan in: -3 yearsMeasure)
		equals: Ramadan , 1445
]
