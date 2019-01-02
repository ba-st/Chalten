Class {
	#name : #GregorianDaysOfMonthsStreamTest,
	#superclass : #TestCase,
	#category : #'Chalten-Gregorian-Calendar-Tests'
}

{ #category : #accessing }
GregorianDaysOfMonthsStreamTest class >> classUnderTest [

	^DaysOfMonthsStream
]

{ #category : #'test querying' }
GregorianDaysOfMonthsStreamTest >> testDistanceTo [

	| stream |
	stream := DaysOfMonthsStream
		startingOn: February fifteenth
		monthsStrategy: (MonthsOfNonleapYearsForCircularStreamStrategy of: GregorianCalendar).
	self assert: (stream distanceTo: February twentyfirst) = 6 daysMeasure.
	self assert: (stream distanceTo: December fifth) = 293 daysMeasure.
	self assert: (stream distanceTo: April twentyfirst) = 65 daysMeasure
]

{ #category : #'test enumerating' }
GregorianDaysOfMonthsStreamTest >> testNext [
	| stream |
	stream := DaysOfMonthsStream
		startingOn: February fifteenth
		monthsStrategy: (MonthsOfNonleapYearsForCircularStreamStrategy of: GregorianCalendar).
	self assert: stream next = February sixteenth.
	self assert: (stream next: 12 daysMeasure) = February twentyeighth.
	self assert: (stream next: 2 daysMeasure) = March second.
	self assert: (stream next: 25 daysMeasure) = March twentyseventh.
	self assert: (stream next: -25 daysMeasure) = March second.
	self assert: (stream next: -2 daysMeasure) = February twentyeighth.
	self assert: (stream next: -12 daysMeasure) = February sixteenth.
	self assert: (stream next: -1 dayMeasure) = February fifteenth.
	stream := DaysOfMonthsStream
		startingOn: February first
		monthsStrategy: (MonthsOfNonleapYearsForCircularStreamStrategy of: GregorianCalendar).
	self assert: (stream next: 28 daysMeasure) = March first.
	stream := DaysOfMonthsStream
		startingOn: February first
		monthsStrategy: (MonthsOfNonleapYearsForCircularStreamStrategy of: GregorianCalendar).
	self assert: (stream next: 59 daysMeasure) = April first.
	stream := DaysOfMonthsStream
		startingOn: February first
		monthsStrategy: (MonthsOfLeapYearsForCircularStreamStrategy of: GregorianCalendar).
	self assert: (stream next: 60 daysMeasure) = April first
]

{ #category : #'test enumerating' }
GregorianDaysOfMonthsStreamTest >> testPrevious [
	| stream |
	stream := DaysOfMonthsStream
		startingOn: February fifteenth
		monthsStrategy: (MonthsOfNonleapYearsForCircularStreamStrategy of: GregorianCalendar).
	self assert: stream previous = February fourteenth.
	self assert: (stream previous: 12 daysMeasure) = February second.
	self assert: (stream previous: 2 daysMeasure) = January thirtyfirst.
	self assert: (stream previous: 25 daysMeasure) = January sixth.
	self assert: (stream previous: -25 daysMeasure) = January thirtyfirst.
	self assert: (stream previous: -2 daysMeasure) = February second.
	self assert: (stream previous: -12 daysMeasure) = February fourteenth.
	self assert: (stream previous: -1 dayMeasure) = February fifteenth.
	stream := DaysOfMonthsStream
		startingOn: February first
		monthsStrategy: (MonthsOfNonleapYearsForCircularStreamStrategy of: GregorianCalendar).
	self assert: (stream previous: 28 daysMeasure) = January fourth.
	stream := DaysOfMonthsStream
		startingOn: February first
		monthsStrategy: (MonthsOfNonleapYearsForCircularStreamStrategy of: GregorianCalendar).
	self assert: (stream previous: 59 daysMeasure) = December fourth.
	stream := DaysOfMonthsStream
		startingOn: February first
		monthsStrategy: (MonthsOfLeapYearsForCircularStreamStrategy of: GregorianCalendar).
	self assert: (stream previous: 60 daysMeasure) = December third
]
