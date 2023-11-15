Class {
	#name : 'IslamicDaysOfMonthsStreamTest',
	#superclass : 'TestCase',
	#instVars : [
		'islamicCalendar'
	],
	#category : 'Chalten-Islamic-Calendar-Tests',
	#package : 'Chalten-Islamic-Calendar-Tests'
}

{ #category : 'accessing' }
IslamicDaysOfMonthsStreamTest class >> classUnderTest [

	^DaysOfMonthsStream
]

{ #category : 'running' }
IslamicDaysOfMonthsStreamTest >> setUp [

	islamicCalendar := ChaltenEnvironment calendarNamed: #IslamicCalendar
]

{ #category : 'test querying' }
IslamicDaysOfMonthsStreamTest >> testDistanceTo [

	| stream |
	stream := DaysOfMonthsStream
		          startingOn: Safar fifteenth
		          monthsStrategy:
		          (MonthsOfNonleapYearsForCircularStreamStrategy of:
			           islamicCalendar).
	self
		assert: (stream distanceTo: Safar twentyfirst)
		equals: 6 daysMeasure.
	self
		assert: (stream distanceTo: Ramadan fifth)
		equals: 196 daysMeasure.
	self
		assert: (stream distanceTo: Muharram twentyfirst)
		equals: 330 daysMeasure
]

{ #category : 'test enumerating' }
IslamicDaysOfMonthsStreamTest >> testNext [

	| stream |
	stream := DaysOfMonthsStream
		          startingOn: Safar fifteenth
		          monthsStrategy:
		          (MonthsOfNonleapYearsForCircularStreamStrategy of:
			           islamicCalendar).
	self assert: stream next equals: Safar sixteenth.
	self assert: (stream next: 12 daysMeasure) equals: Safar twentyeighth.
	self assert: (stream next: 2 daysMeasure) equals: RabiI first.
	self assert: (stream next: 25 daysMeasure) equals: RabiI twentysixth.
	self assert: (stream next: -25 daysMeasure) equals: RabiI first.
	self assert: (stream next: -2 daysMeasure) equals: Safar twentyeighth.
	self assert: (stream next: -12 daysMeasure) equals: Safar sixteenth.
	self assert: (stream next: -1 dayMeasure) equals: Safar fifteenth.
	stream := DaysOfMonthsStream
		          startingOn: Safar first
		          monthsStrategy:
		          (MonthsOfNonleapYearsForCircularStreamStrategy of:
			           islamicCalendar).
	self assert: (stream next: 28 daysMeasure) equals: Safar twentyninth.
	stream := DaysOfMonthsStream
		          startingOn: DhuAlQada first
		          monthsStrategy:
		          (MonthsOfNonleapYearsForCircularStreamStrategy of:
			           islamicCalendar).
	self assert: (stream next: 59 daysMeasure) equals: Muharram first.
	stream := DaysOfMonthsStream
		          startingOn: DhuAlQada first
		          monthsStrategy:
		          (MonthsOfLeapYearsForCircularStreamStrategy of:
			           islamicCalendar).
	self assert: (stream next: 60 daysMeasure) equals: Muharram first
]

{ #category : 'test enumerating' }
IslamicDaysOfMonthsStreamTest >> testPrevious [

	| stream |
	stream := DaysOfMonthsStream
		          startingOn: Safar fifteenth
		          monthsStrategy:
		          (MonthsOfNonleapYearsForCircularStreamStrategy of:
			           islamicCalendar).
	self assert: stream previous equals: Safar fourteenth.
	self assert: (stream previous: 12 daysMeasure) equals: Safar second.
	self
		assert: (stream previous: 2 daysMeasure)
		equals: Muharram thirtieth.
	self assert: (stream previous: 25 daysMeasure) equals: Muharram fifth.
	self
		assert: (stream previous: -25 daysMeasure)
		equals: Muharram thirtieth.
	self assert: (stream previous: -2 daysMeasure) equals: Safar second.
	self
		assert: (stream previous: -12 daysMeasure)
		equals: Safar fourteenth.
	self assert: (stream previous: -1 dayMeasure) equals: Safar fifteenth.
	stream := DaysOfMonthsStream
		          startingOn: Safar first
		          monthsStrategy:
		          (MonthsOfNonleapYearsForCircularStreamStrategy of:
			           islamicCalendar).
	self assert: (stream previous: 28 daysMeasure) equals: Muharram third.
	stream := DaysOfMonthsStream
		          startingOn: Muharram first
		          monthsStrategy:
		          (MonthsOfNonleapYearsForCircularStreamStrategy of:
			           islamicCalendar).
	self
		assert: (stream previous: 59 daysMeasure)
		equals: DhuAlQada first.
	stream := DaysOfMonthsStream
		          startingOn: Muharram first
		          monthsStrategy:
		          (MonthsOfLeapYearsForCircularStreamStrategy of:
			           islamicCalendar).
	self
		assert: (stream previous: 60 daysMeasure)
		equals: DhuAlQada first
]
