Class {
	#name : 'JulianMonthsOfYearsStreamTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Julian-Calendar-Tests',
	#package : 'Chalten-Julian-Calendar-Tests'
}

{ #category : 'accessing' }
JulianMonthsOfYearsStreamTest class >> classUnderTest [

	^MonthsOfYearsStream
]

{ #category : 'test querying' }
JulianMonthsOfYearsStreamTest >> testDistanceFromTo [

	| stream |
	stream := MonthsOfYearsStream startingOn: JulianJanuary , 2014.
	self
		assert:
		(stream
			 distanceFrom: JulianFebruary , 2014
			 to: JulianSeptember , 2014)
		equals: 8 monthsMeasure.
	self
		assert:
		(stream
			 distanceFrom: JulianDecember , 2013
			 to: JulianSeptember , 2014)
		equals: 0 monthsMeasure
]

{ #category : 'test enumerating' }
JulianMonthsOfYearsStreamTest >> testNext [

	| stream |
	stream := MonthsOfYearsStream startingOn: JulianJanuary , 2014.
	self assert: stream next equals: JulianFebruary , 2014.
	self
		assert: (stream next: 12 monthsMeasure)
		equals: JulianFebruary , 2015.
	self
		assert: (stream next: 25 monthsMeasure)
		equals: JulianMarch , 2017.
	self
		assert: (stream next: -25 monthsMeasure)
		equals: JulianFebruary , 2015.
	self
		assert: (stream next: -12 monthsMeasure)
		equals: JulianFebruary , 2014.
	self
		assert: (stream next: -1 monthMeasure)
		equals: JulianJanuary , 2014
]

{ #category : 'test enumerating' }
JulianMonthsOfYearsStreamTest >> testNextInNumberOfYears [

	| stream |
	stream := MonthsOfYearsStream startingOn: JulianJanuary , 2014.
	self
		assert: (stream nextInNumberOfYears: 3 yearsMeasure)
		equals: JulianJanuary , 2017.
	self
		assert: (stream nextInNumberOfYears: -3 yearsMeasure)
		equals: JulianJanuary , 2014
]

{ #category : 'test enumerating' }
JulianMonthsOfYearsStreamTest >> testNextMonthIn [

	| stream |
	stream := MonthsOfYearsStream startingOn: JulianJanuary , 2014.
	self
		assert: (stream nextMonth: May in: 3 yearsMeasure)
		equals: JulianMay , 2017.
	self
		assert: (stream nextMonth: May in: -3 yearsMeasure)
		equals: JulianMay , 2014
]

{ #category : 'test enumerating' }
JulianMonthsOfYearsStreamTest >> testPrevious [

	| stream |
	stream := MonthsOfYearsStream startingOn: JulianJanuary , 2014.
	self assert: stream previous equals: JulianDecember , 2013.
	self
		assert: (stream previous: 12 monthsMeasure)
		equals: JulianDecember , 2012.
	self
		assert: (stream previous: 25 monthsMeasure)
		equals: JulianNovember , 2010.
	self
		assert: (stream previous: -25 monthsMeasure)
		equals: JulianDecember , 2012.
	self
		assert: (stream previous: -12 monthsMeasure)
		equals: JulianDecember , 2013.
	self
		assert: (stream previous: -1 monthMeasure)
		equals: JulianJanuary , 2014
]

{ #category : 'test enumerating' }
JulianMonthsOfYearsStreamTest >> testPreviousInNumberOfYears [

	| stream |
	stream := MonthsOfYearsStream startingOn: JulianJanuary , 2014.
	self
		assert: (stream previousInNumberOfYears: 3 yearsMeasure)
		equals: JulianJanuary , 2011.
	self
		assert: (stream previousInNumberOfYears: -3 yearsMeasure)
		equals: JulianJanuary , 2014
]

{ #category : 'test enumerating' }
JulianMonthsOfYearsStreamTest >> testPreviousMonthIn [

	| stream |
	stream := MonthsOfYearsStream startingOn: JulianJanuary , 2014.
	self
		assert: (stream previousMonth: May in: 3 yearsMeasure)
		equals: JulianMay , 2011.
	self
		assert: (stream previousMonth: May in: -3 yearsMeasure)
		equals: JulianMay , 2014
]
