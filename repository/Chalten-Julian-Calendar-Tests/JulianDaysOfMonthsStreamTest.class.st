Class {
	#name : #JulianDaysOfMonthsStreamTest,
	#superclass : #TestCase,
	#category : #'Chalten-Julian-Calendar-Tests'
}

{ #category : #accessing }
JulianDaysOfMonthsStreamTest class >> classUnderTest [

	^DaysOfMonthsStream
]

{ #category : #'test querying' }
JulianDaysOfMonthsStreamTest >> testDistanceTo [

	| stream |
	stream := DaysOfMonthsStream
		startingOn: JulianFebruary fifteenth
		monthsStrategy: (MonthsOfNonleapYearsForCircularStreamStrategy of: JulianCalendar).
	self assert: (stream distanceTo: JulianFebruary twentyfirst) = 6 daysMeasure.
	self assert: (stream distanceTo: JulianDecember fifth) = 293 daysMeasure.
	self assert: (stream distanceTo: JulianApril twentyfirst) = 65 daysMeasure
]

{ #category : #'test enumerating' }
JulianDaysOfMonthsStreamTest >> testNext [
	| stream |
	stream := DaysOfMonthsStream
		startingOn: JulianFebruary fifteenth
		monthsStrategy: (MonthsOfNonleapYearsForCircularStreamStrategy of: JulianCalendar).
	self assert: stream next = JulianFebruary sixteenth.
	self assert: (stream next: 12 daysMeasure) = JulianFebruary twentyeighth.
	self assert: (stream next: 2 daysMeasure) = JulianMarch second.
	self assert: (stream next: 25 daysMeasure) = JulianMarch twentyseventh.
	self assert: (stream next: -25 daysMeasure) = JulianMarch second.
	self assert: (stream next: -2 daysMeasure) = JulianFebruary twentyeighth.
	self assert: (stream next: -12 daysMeasure) = JulianFebruary sixteenth.
	self assert: (stream next: -1 dayMeasure) = JulianFebruary fifteenth.
	stream := DaysOfMonthsStream
		startingOn: JulianFebruary first
		monthsStrategy: (MonthsOfNonleapYearsForCircularStreamStrategy of: JulianCalendar).
	self assert: (stream next: 28 daysMeasure) = JulianMarch first.
	stream := DaysOfMonthsStream
		startingOn: JulianFebruary first
		monthsStrategy: (MonthsOfNonleapYearsForCircularStreamStrategy of: JulianCalendar).
	self assert: (stream next: 59 daysMeasure) = JulianApril first.
	stream := DaysOfMonthsStream
		startingOn: JulianFebruary first
		monthsStrategy: (MonthsOfLeapYearsForCircularStreamStrategy of: JulianCalendar).
	self assert: (stream next: 60 daysMeasure) = JulianApril first
]

{ #category : #'test enumerating' }
JulianDaysOfMonthsStreamTest >> testPrevious [
	| stream |
	stream := DaysOfMonthsStream
		startingOn: JulianFebruary fifteenth
		monthsStrategy: (MonthsOfNonleapYearsForCircularStreamStrategy of: JulianCalendar).
	self assert: stream previous = JulianFebruary fourteenth.
	self assert: (stream previous: 12 daysMeasure) = JulianFebruary second.
	self assert: (stream previous: 2 daysMeasure) = JulianJanuary thirtyfirst.
	self assert: (stream previous: 25 daysMeasure) = JulianJanuary sixth.
	self assert: (stream previous: -25 daysMeasure) = JulianJanuary thirtyfirst.
	self assert: (stream previous: -2 daysMeasure) = JulianFebruary second.
	self assert: (stream previous: -12 daysMeasure) = JulianFebruary fourteenth.
	self assert: (stream previous: -1 dayMeasure) = JulianFebruary fifteenth.
	stream := DaysOfMonthsStream
		startingOn: JulianFebruary first
		monthsStrategy: (MonthsOfNonleapYearsForCircularStreamStrategy of: JulianCalendar).
	self assert: (stream previous: 28 daysMeasure) = JulianJanuary fourth.
	stream := DaysOfMonthsStream
		startingOn: JulianFebruary first
		monthsStrategy: (MonthsOfNonleapYearsForCircularStreamStrategy of: JulianCalendar).
	self assert: (stream previous: 59 daysMeasure) = JulianDecember fourth.
	stream := DaysOfMonthsStream
		startingOn: JulianFebruary first
		monthsStrategy: (MonthsOfLeapYearsForCircularStreamStrategy of: JulianCalendar).
	self assert: (stream previous: 60 daysMeasure) = JulianDecember third
]
