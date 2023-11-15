Class {
	#name : 'HebrewDaysOfMonthsStreamTest',
	#superclass : 'TestCase',
	#instVars : [
		'hebrewCalendar'
	],
	#category : 'Chalten-Hebrew-Calendar-Tests',
	#package : 'Chalten-Hebrew-Calendar-Tests'
}

{ #category : 'accessing' }
HebrewDaysOfMonthsStreamTest class >> classUnderTest [

	^DaysOfMonthsStream
]

{ #category : 'running' }
HebrewDaysOfMonthsStreamTest >> setUp [

	hebrewCalendar := ChaltenEnvironment calendarNamed: #HebrewCalendar
]

{ #category : 'test querying' }
HebrewDaysOfMonthsStreamTest >> testDistanceTo [

	| stream |
	stream := DaysOfMonthsStream
		          startingOn: Tishri fifteenth
		          monthsStrategy:
		          (MonthsOfNonleapYearsForCircularStreamStrategy of:
			           hebrewCalendar).
	self
		assert: (stream distanceTo: Tishri twentyfirst)
		equals: 6 daysMeasure.
	self assert: (stream distanceTo: Elul fifth) equals: 316 daysMeasure.
	self
		assert: (stream distanceTo: Nisan twentyfirst)
		equals: 184 daysMeasure
]

{ #category : 'test enumerating' }
HebrewDaysOfMonthsStreamTest >> testNext [

	| stream |
	stream := DaysOfMonthsStream
		          startingOn: Tishri fifteenth
		          monthsStrategy:
		          (MonthsOfNonleapYearsForCircularStreamStrategy of:
			           hebrewCalendar).
	self assert: stream next equals: Tishri sixteenth.
	self
		assert: (stream next: 12 daysMeasure)
		equals: Tishri twentyeighth.
	self assert: (stream next: 2 daysMeasure) equals: Tishri thirtieth.
	self
		assert: (stream next: 25 daysMeasure)
		equals: Marheshvan twentyfifth.
	self assert: (stream next: -25 daysMeasure) equals: Tishri thirtieth.
	self
		assert: (stream next: -2 daysMeasure)
		equals: Tishri twentyeighth.
	self assert: (stream next: -12 daysMeasure) equals: Tishri sixteenth.
	self assert: (stream next: -1 dayMeasure) equals: Tishri fifteenth.
	stream := DaysOfMonthsStream
		          startingOn: Tishri first
		          monthsStrategy:
		          (MonthsOfNonleapYearsForCircularStreamStrategy of:
			           hebrewCalendar).
	self assert: (stream next: 28 daysMeasure) equals: Tishri twentyninth.
	stream := DaysOfMonthsStream
		          startingOn: Tishri first
		          monthsStrategy:
		          (MonthsOfNonleapYearsForCircularStreamStrategy of:
			           hebrewCalendar).
	self
		assert: (stream next: 59 daysMeasure)
		equals: Marheshvan thirtieth.
	stream := DaysOfMonthsStream
		          startingOn: Tishri first
		          monthsStrategy:
		          (MonthsOfLeapYearsForCircularStreamStrategy of:
			           hebrewCalendar).
	self assert: (stream next: 60 daysMeasure) equals: Kislev first
]

{ #category : 'test enumerating' }
HebrewDaysOfMonthsStreamTest >> testPrevious [

	| stream |
	stream := DaysOfMonthsStream
		          startingOn: Tishri fifteenth
		          monthsStrategy:
		          (MonthsOfNonleapYearsForCircularStreamStrategy of:
			           hebrewCalendar).
	self assert: stream previous equals: Tishri fourteenth.
	self assert: (stream previous: 12 daysMeasure) equals: Tishri second.
	self
		assert: (stream previous: 2 daysMeasure)
		equals: Elul twentyninth.
	self assert: (stream previous: 25 daysMeasure) equals: Elul fourth.
	self
		assert: (stream previous: -25 daysMeasure)
		equals: Elul twentyninth.
	self assert: (stream previous: -2 daysMeasure) equals: Tishri second.
	self
		assert: (stream previous: -12 daysMeasure)
		equals: Tishri fourteenth.
	self
		assert: (stream previous: -1 dayMeasure)
		equals: Tishri fifteenth.
	stream := DaysOfMonthsStream
		          startingOn: Tishri first
		          monthsStrategy:
		          (MonthsOfNonleapYearsForCircularStreamStrategy of:
			           hebrewCalendar).
	self assert: (stream previous: 28 daysMeasure) equals: Elul second.
	stream := DaysOfMonthsStream
		          startingOn: Tishri first
		          monthsStrategy:
		          (MonthsOfNonleapYearsForCircularStreamStrategy of:
			           hebrewCalendar).
	self assert: (stream previous: 59 daysMeasure) equals: Av first.
	stream := DaysOfMonthsStream
		          startingOn: Tishri first
		          monthsStrategy:
		          (MonthsOfLeapYearsForCircularStreamStrategy of:
			           hebrewCalendar).
	self
		assert: (stream previous: 60 daysMeasure)
		equals: Tammuz twentyninth
]
