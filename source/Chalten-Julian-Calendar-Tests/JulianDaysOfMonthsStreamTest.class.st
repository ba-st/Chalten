Class {
	#name : 'JulianDaysOfMonthsStreamTest',
	#superclass : 'TestCase',
	#instVars : [
		'julianCalendar'
	],
	#category : 'Chalten-Julian-Calendar-Tests',
	#package : 'Chalten-Julian-Calendar-Tests'
}

{ #category : 'accessing' }
JulianDaysOfMonthsStreamTest class >> classUnderTest [

	^DaysOfMonthsStream
]

{ #category : 'running' }
JulianDaysOfMonthsStreamTest >> setUp [ 
	julianCalendar := ChaltenEnvironment calendarNamed: #JulianCalendar
]

{ #category : 'test querying' }
JulianDaysOfMonthsStreamTest >> testDistanceTo [

	| stream |
	stream := DaysOfMonthsStream
		          startingOn: JulianFebruary fifteenth
		          monthsStrategy:
		          (MonthsOfNonleapYearsForCircularStreamStrategy of:
			           julianCalendar).
	self
		assert: (stream distanceTo: JulianFebruary twentyfirst)
		equals: 6 daysMeasure.
	self
		assert: (stream distanceTo: JulianDecember fifth)
		equals: 293 daysMeasure.
	self
		assert: (stream distanceTo: JulianApril twentyfirst)
		equals: 65 daysMeasure
]

{ #category : 'test enumerating' }
JulianDaysOfMonthsStreamTest >> testNext [

	| stream |
	stream := DaysOfMonthsStream
		          startingOn: JulianFebruary fifteenth
		          monthsStrategy:
		          (MonthsOfNonleapYearsForCircularStreamStrategy of:
			           julianCalendar).
	self assert: stream next equals: JulianFebruary sixteenth.
	self
		assert: (stream next: 12 daysMeasure)
		equals: JulianFebruary twentyeighth.
	self assert: (stream next: 2 daysMeasure) equals: JulianMarch second.
	self
		assert: (stream next: 25 daysMeasure)
		equals: JulianMarch twentyseventh.
	self
		assert: (stream next: -25 daysMeasure)
		equals: JulianMarch second.
	self
		assert: (stream next: -2 daysMeasure)
		equals: JulianFebruary twentyeighth.
	self
		assert: (stream next: -12 daysMeasure)
		equals: JulianFebruary sixteenth.
	self
		assert: (stream next: -1 dayMeasure)
		equals: JulianFebruary fifteenth.
	stream := DaysOfMonthsStream
		          startingOn: JulianFebruary first
		          monthsStrategy:
		          (MonthsOfNonleapYearsForCircularStreamStrategy of:
			           julianCalendar).
	self assert: (stream next: 28 daysMeasure) equals: JulianMarch first.
	stream := DaysOfMonthsStream
		          startingOn: JulianFebruary first
		          monthsStrategy:
		          (MonthsOfNonleapYearsForCircularStreamStrategy of:
			           julianCalendar).
	self assert: (stream next: 59 daysMeasure) equals: JulianApril first.
	stream := DaysOfMonthsStream
		          startingOn: JulianFebruary first
		          monthsStrategy:
		          (MonthsOfLeapYearsForCircularStreamStrategy of:
			           julianCalendar).
	self assert: (stream next: 60 daysMeasure) equals: JulianApril first
]

{ #category : 'test enumerating' }
JulianDaysOfMonthsStreamTest >> testPrevious [

	| stream |
	stream := DaysOfMonthsStream
		          startingOn: JulianFebruary fifteenth
		          monthsStrategy:
		          (MonthsOfNonleapYearsForCircularStreamStrategy of:
			           julianCalendar).
	self assert: stream previous equals: JulianFebruary fourteenth.
	self
		assert: (stream previous: 12 daysMeasure)
		equals: JulianFebruary second.
	self
		assert: (stream previous: 2 daysMeasure)
		equals: JulianJanuary thirtyfirst.
	self
		assert: (stream previous: 25 daysMeasure)
		equals: JulianJanuary sixth.
	self
		assert: (stream previous: -25 daysMeasure)
		equals: JulianJanuary thirtyfirst.
	self
		assert: (stream previous: -2 daysMeasure)
		equals: JulianFebruary second.
	self
		assert: (stream previous: -12 daysMeasure)
		equals: JulianFebruary fourteenth.
	self
		assert: (stream previous: -1 dayMeasure)
		equals: JulianFebruary fifteenth.
	stream := DaysOfMonthsStream
		          startingOn: JulianFebruary first
		          monthsStrategy:
		          (MonthsOfNonleapYearsForCircularStreamStrategy of:
			           julianCalendar).
	self
		assert: (stream previous: 28 daysMeasure)
		equals: JulianJanuary fourth.
	stream := DaysOfMonthsStream
		          startingOn: JulianFebruary first
		          monthsStrategy:
		          (MonthsOfNonleapYearsForCircularStreamStrategy of:
			           julianCalendar).
	self
		assert: (stream previous: 59 daysMeasure)
		equals: JulianDecember fourth.
	stream := DaysOfMonthsStream
		          startingOn: JulianFebruary first
		          monthsStrategy:
		          (MonthsOfLeapYearsForCircularStreamStrategy of:
			           julianCalendar).
	self
		assert: (stream previous: 60 daysMeasure)
		equals: JulianDecember third
]
