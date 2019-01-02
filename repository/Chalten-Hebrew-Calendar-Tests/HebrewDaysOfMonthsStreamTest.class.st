Class {
	#name : #HebrewDaysOfMonthsStreamTest,
	#superclass : #TestCase,
	#category : #'Chalten-Hebrew-Calendar-Tests'
}

{ #category : #accessing }
HebrewDaysOfMonthsStreamTest class >> classUnderTest [

	^DaysOfMonthsStream
]

{ #category : #'test querying' }
HebrewDaysOfMonthsStreamTest >> testDistanceTo [
	| stream |
	stream := DaysOfMonthsStream
		startingOn: Tishri fifteenth
		monthsStrategy: (MonthsOfNonleapYearsForCircularStreamStrategy of: HebrewCalendar).
	self assert: (stream distanceTo: Tishri twentyfirst) = 6 daysMeasure.
	self assert: (stream distanceTo: Elul fifth) = 316 daysMeasure.
	self assert: (stream distanceTo: Nisan twentyfirst) = 184 daysMeasure
]

{ #category : #'test enumerating' }
HebrewDaysOfMonthsStreamTest >> testNext [
	| stream |
	stream := DaysOfMonthsStream
		startingOn: Tishri fifteenth
		monthsStrategy: (MonthsOfNonleapYearsForCircularStreamStrategy of: HebrewCalendar).
	self assert: stream next = Tishri sixteenth.
	self assert: (stream next: 12 daysMeasure) = Tishri twentyeighth.
	self assert: (stream next: 2 daysMeasure) = Tishri thirtieth.
	self assert: (stream next: 25 daysMeasure) = Marheshvan twentyfifth.
	self assert: (stream next: -25 daysMeasure) = Tishri thirtieth.
	self assert: (stream next: -2 daysMeasure) = Tishri twentyeighth.
	self assert: (stream next: -12 daysMeasure) = Tishri sixteenth.
	self assert: (stream next: -1 dayMeasure) = Tishri fifteenth.
	stream := DaysOfMonthsStream
		startingOn: Tishri first
		monthsStrategy: (MonthsOfNonleapYearsForCircularStreamStrategy of: HebrewCalendar).
	self assert: (stream next: 28 daysMeasure) = Tishri twentyninth.
	stream := DaysOfMonthsStream
		startingOn: Tishri first
		monthsStrategy: (MonthsOfNonleapYearsForCircularStreamStrategy of: HebrewCalendar).
	self assert: (stream next: 59 daysMeasure) = Marheshvan thirtieth.
	stream := DaysOfMonthsStream
		startingOn: Tishri first
		monthsStrategy: (MonthsOfLeapYearsForCircularStreamStrategy of: HebrewCalendar).
	self assert: (stream next: 60 daysMeasure) = Kislev first
]

{ #category : #'test enumerating' }
HebrewDaysOfMonthsStreamTest >> testPrevious [
	| stream |
	stream := DaysOfMonthsStream
		startingOn: Tishri fifteenth
		monthsStrategy: (MonthsOfNonleapYearsForCircularStreamStrategy of: HebrewCalendar).
	self assert: stream previous = Tishri fourteenth.
	self assert: (stream previous: 12 daysMeasure) = Tishri second.
	self assert: (stream previous: 2 daysMeasure) = Elul twentyninth.
	self assert: (stream previous: 25 daysMeasure) = Elul fourth.
	self assert: (stream previous: -25 daysMeasure) = Elul twentyninth.
	self assert: (stream previous: -2 daysMeasure) = Tishri second.
	self assert: (stream previous: -12 daysMeasure) = Tishri fourteenth.
	self assert: (stream previous: -1 dayMeasure) = Tishri fifteenth.
	stream := DaysOfMonthsStream
		startingOn: Tishri first
		monthsStrategy: (MonthsOfNonleapYearsForCircularStreamStrategy of: HebrewCalendar).
	self assert: (stream previous: 28 daysMeasure) = Elul second.
	stream := DaysOfMonthsStream
		startingOn: Tishri first
		monthsStrategy: (MonthsOfNonleapYearsForCircularStreamStrategy of: HebrewCalendar).
	self assert: (stream previous: 59 daysMeasure) = Av first.
	stream := DaysOfMonthsStream
		startingOn: Tishri first
		monthsStrategy: (MonthsOfLeapYearsForCircularStreamStrategy of: HebrewCalendar).
	self assert: (stream previous: 60 daysMeasure) = Tammuz twentyninth
]
