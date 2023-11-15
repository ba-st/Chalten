Class {
	#name : 'EndsOfTimelineTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Core-Tests-Time',
	#package : 'Chalten-Core-Tests',
	#tag : 'Time'
}

{ #category : 'test querying' }
EndsOfTimelineTest >> testDistanceTo [

	self
		assert: (TheBeginningOfTime distanceTo:
				 (TimeOfDay hours: 1 minutes: 0 seconds: 0))
		equals: ArithmeticObject infinity daysMeasure.
	self
		assert:
		(TheEndOfTime distanceTo: (TimeOfDay hours: 1 minutes: 0 seconds: 0))
		equals: ArithmeticObject infinity daysMeasure
]

{ #category : 'test magnitude protocol' }
EndsOfTimelineTest >> testGreaterThan [

	self assert: TheEndOfTime > TheBeginningOfTime.
	self assert: TheEndOfTime > (May fourth, 2014).
	
	self deny: TheBeginningOfTime > TheEndOfTime.
	self deny: TheBeginningOfTime > (May fourth, 2014)
]

{ #category : 'test magnitude protocol' }
EndsOfTimelineTest >> testLessThan [

	self assert: TheBeginningOfTime < TheEndOfTime.
	self assert: TheBeginningOfTime < (May fourth, 2014).
	
	self deny: TheEndOfTime < TheBeginningOfTime.
	self deny: TheEndOfTime < (May fourth, 2014)
]

{ #category : 'test enumerating' }
EndsOfTimelineTest >> testNext [

	self assert: TheBeginningOfTime next equals: TheBeginningOfTime.
	self assert: TheEndOfTime next equals: TheEndOfTime
]

{ #category : 'test accessing days' }
EndsOfTimelineTest >> testNumberOfDaysFromEpoch [

	self
		assert: TheBeginningOfTime numberOfDaysFromEpoch
		equals: ArithmeticObject minusInfinity daysMeasure.
	self
		assert: TheEndOfTime numberOfDaysFromEpoch
		equals: ArithmeticObject infinity daysMeasure
]

{ #category : 'test printing' }
EndsOfTimelineTest >> testPrintString [

	self
		assert: TheBeginningOfTime printString
		equals: 'The beginning of time'.
	self assert: TheEndOfTime printString equals: 'The end of time'
]

{ #category : 'test interval protocol' }
EndsOfTimelineTest >> testToByInfinity [

	| interval |
	interval := TheBeginningOfTime to: TheEndOfTime.
	self assert: interval from equals: TheBeginningOfTime.
	self assert: interval to equals: TheEndOfTime.
	self assert: interval by equals: 1 dayMeasure
]

{ #category : 'test interval protocol' }
EndsOfTimelineTest >> testToByToFixedDate [

	| interval |
	interval := TheBeginningOfTime to: TimeOfDay midnight by:
	            1 dayMeasure.
	self assert: interval from equals: TheBeginningOfTime.
	self assert: interval to equals: TimeOfDay midnight.
	self assert: interval by equals: 1 dayMeasure
]

{ #category : 'test interval protocol' }
EndsOfTimelineTest >> testToTheBeginningOfTime [

	| interval |
	interval := TimeOfDay midnight toTheBeginningOfTime.
	self assert: interval from equals: TimeOfDay midnight.
	self assert: interval to equals: TheBeginningOfTime.
	self assert: interval by equals: 1 secondMeasure
]

{ #category : 'test interval protocol' }
EndsOfTimelineTest >> testToTheBeginningOfTimeBy [

	| interval |
	interval := TimeOfDay midnight toTheBeginningOfTimeBy: 1 dayMeasure.
	self assert: interval from equals: TimeOfDay midnight.
	self assert: interval to equals: TheBeginningOfTime.
	self assert: interval by equals: 1 dayMeasure
]

{ #category : 'test interval protocol' }
EndsOfTimelineTest >> testToTheEndOfTime [

	| interval |
	interval := TimeOfDay midnight toTheEndOfTime.
	self assert: interval from equals: TimeOfDay midnight.
	self assert: interval to equals: TheEndOfTime.
	self assert: interval by equals: 1 secondMeasure
]

{ #category : 'test interval protocol' }
EndsOfTimelineTest >> testToTheEndOfTimeBy [

	| interval |
	interval := TimeOfDay midnight toTheEndOfTimeBy: 1 dayMeasure.
	self assert: interval from equals: TimeOfDay midnight.
	self assert: interval to equals: TheEndOfTime.
	self assert: interval by equals: 1 dayMeasure
]
