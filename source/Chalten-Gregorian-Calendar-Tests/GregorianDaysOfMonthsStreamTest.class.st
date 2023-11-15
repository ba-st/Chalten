Class {
	#name : 'GregorianDaysOfMonthsStreamTest',
	#superclass : 'TestCase',
	#instVars : [
		'gregorianCalendar'
	],
	#category : 'Chalten-Gregorian-Calendar-Tests',
	#package : 'Chalten-Gregorian-Calendar-Tests'
}

{ #category : 'accessing' }
GregorianDaysOfMonthsStreamTest class >> classUnderTest [

	^DaysOfMonthsStream
]

{ #category : 'running' }
GregorianDaysOfMonthsStreamTest >> setUp [
	gregorianCalendar := ChaltenEnvironment calendarNamed: #GregorianCalendar
]

{ #category : 'test querying' }
GregorianDaysOfMonthsStreamTest >> testDistanceTo [

	| stream |
	stream := DaysOfMonthsStream
		          startingOn: February fifteenth
		          monthsStrategy:
		          (MonthsOfNonleapYearsForCircularStreamStrategy of:
			           gregorianCalendar).
	self
		assert: (stream distanceTo: February twentyfirst)
		equals: 6 daysMeasure.
	self
		assert: (stream distanceTo: December fifth)
		equals: 293 daysMeasure.
	self
		assert: (stream distanceTo: April twentyfirst)
		equals: 65 daysMeasure
]

{ #category : 'test enumerating' }
GregorianDaysOfMonthsStreamTest >> testNext [

	| stream |
	stream := DaysOfMonthsStream
		          startingOn: February fifteenth
		          monthsStrategy:
		          (MonthsOfNonleapYearsForCircularStreamStrategy of:
			           gregorianCalendar).
	self assert: stream next equals: February sixteenth.
	self
		assert: (stream next: 12 daysMeasure)
		equals: February twentyeighth.
	self assert: (stream next: 2 daysMeasure) equals: March second.
	self
		assert: (stream next: 25 daysMeasure)
		equals: March twentyseventh.
	self assert: (stream next: -25 daysMeasure) equals: March second.
	self
		assert: (stream next: -2 daysMeasure)
		equals: February twentyeighth.
	self
		assert: (stream next: -12 daysMeasure)
		equals: February sixteenth.
	self assert: (stream next: -1 dayMeasure) equals: February fifteenth.
	stream := DaysOfMonthsStream
		          startingOn: February first
		          monthsStrategy:
		          (MonthsOfNonleapYearsForCircularStreamStrategy of:
			           gregorianCalendar).
	self assert: (stream next: 28 daysMeasure) equals: March first.
	stream := DaysOfMonthsStream
		          startingOn: February first
		          monthsStrategy:
		          (MonthsOfNonleapYearsForCircularStreamStrategy of:
			           gregorianCalendar).
	self assert: (stream next: 59 daysMeasure) equals: April first.
	stream := DaysOfMonthsStream
		          startingOn: February first
		          monthsStrategy:
		          (MonthsOfLeapYearsForCircularStreamStrategy of:
			           gregorianCalendar).
	self assert: (stream next: 60 daysMeasure) equals: April first
]

{ #category : 'test enumerating' }
GregorianDaysOfMonthsStreamTest >> testPrevious [

	| stream |
	stream := DaysOfMonthsStream
		          startingOn: February fifteenth
		          monthsStrategy:
		          (MonthsOfNonleapYearsForCircularStreamStrategy of:
			           gregorianCalendar).
	self assert: stream previous equals: February fourteenth.
	self
		assert: (stream previous: 12 daysMeasure)
		equals: February second.
	self
		assert: (stream previous: 2 daysMeasure)
		equals: January thirtyfirst.
	self assert: (stream previous: 25 daysMeasure) equals: January sixth.
	self
		assert: (stream previous: -25 daysMeasure)
		equals: January thirtyfirst.
	self
		assert: (stream previous: -2 daysMeasure)
		equals: February second.
	self
		assert: (stream previous: -12 daysMeasure)
		equals: February fourteenth.
	self
		assert: (stream previous: -1 dayMeasure)
		equals: February fifteenth.
	stream := DaysOfMonthsStream
		          startingOn: February first
		          monthsStrategy:
		          (MonthsOfNonleapYearsForCircularStreamStrategy of:
			           gregorianCalendar).
	self assert: (stream previous: 28 daysMeasure) equals: January fourth.
	stream := DaysOfMonthsStream
		          startingOn: February first
		          monthsStrategy:
		          (MonthsOfNonleapYearsForCircularStreamStrategy of:
			           gregorianCalendar).
	self
		assert: (stream previous: 59 daysMeasure)
		equals: December fourth.
	stream := DaysOfMonthsStream
		          startingOn: February first
		          monthsStrategy:
		          (MonthsOfLeapYearsForCircularStreamStrategy of:
			           gregorianCalendar).
	self assert: (stream previous: 60 daysMeasure) equals: December third
]
