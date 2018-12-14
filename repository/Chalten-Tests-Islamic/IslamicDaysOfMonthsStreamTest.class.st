Class {
	#name : #IslamicDaysOfMonthsStreamTest,
	#superclass : #TestCase,
	#category : #'Chalten-Tests-Islamic'
}

{ #category : #accessing }
IslamicDaysOfMonthsStreamTest class >> classUnderTest [

	^DaysOfMonthsStream
]

{ #category : #'test querying' }
IslamicDaysOfMonthsStreamTest >> testDistanceTo [
	| stream |
	stream := DaysOfMonthsStream
		startingOn: Safar fifteenth
		monthsStrategy: (MonthsOfNonleapYearsForCircularStreamStrategy of: IslamicCalendar).
	self assert: (stream distanceTo: Safar twentyfirst) = 6 daysMeasure.
	self assert: (stream distanceTo: Ramadan fifth) = 196 daysMeasure.
	self assert: (stream distanceTo: Muharram twentyfirst) = 330 daysMeasure
]

{ #category : #'test enumerating' }
IslamicDaysOfMonthsStreamTest >> testNext [
	| stream |
	stream := DaysOfMonthsStream
		startingOn: Safar fifteenth
		monthsStrategy: (MonthsOfNonleapYearsForCircularStreamStrategy of: IslamicCalendar).
	self assert: stream next = Safar sixteenth.
	self assert: (stream next: 12 daysMeasure) = Safar twentyeighth.
	self assert: (stream next: 2 daysMeasure) = RabiI first.
	self assert: (stream next: 25 daysMeasure) = RabiI twentysixth.
	self assert: (stream next: -25 daysMeasure) = RabiI first.
	self assert: (stream next: -2 daysMeasure) = Safar twentyeighth.
	self assert: (stream next: -12 daysMeasure) = Safar sixteenth.
	self assert: (stream next: -1 dayMeasure) = Safar fifteenth.
	stream := DaysOfMonthsStream
		startingOn: Safar first
		monthsStrategy: (MonthsOfNonleapYearsForCircularStreamStrategy of: IslamicCalendar).
	self assert: (stream next: 28 daysMeasure) = Safar twentyninth.
	stream := DaysOfMonthsStream
		startingOn: DhuAlQada first
		monthsStrategy: (MonthsOfNonleapYearsForCircularStreamStrategy of: IslamicCalendar).
	self assert: (stream next: 59 daysMeasure) = Muharram first.
	stream := DaysOfMonthsStream
		startingOn: DhuAlQada first
		monthsStrategy: (MonthsOfLeapYearsForCircularStreamStrategy of: IslamicCalendar).
	self assert: (stream next: 60 daysMeasure) = Muharram first
]

{ #category : #'test enumerating' }
IslamicDaysOfMonthsStreamTest >> testPrevious [
	| stream |
	stream := DaysOfMonthsStream
		startingOn: Safar fifteenth
		monthsStrategy: (MonthsOfNonleapYearsForCircularStreamStrategy of: IslamicCalendar).
	self assert: stream previous = Safar fourteenth.
	self assert: (stream previous: 12 daysMeasure) = Safar second.
	self assert: (stream previous: 2 daysMeasure) = Muharram thirtieth.
	self assert: (stream previous: 25 daysMeasure) = Muharram fifth.
	self assert: (stream previous: -25 daysMeasure) = Muharram thirtieth.
	self assert: (stream previous: -2 daysMeasure) = Safar second.
	self assert: (stream previous: -12 daysMeasure) = Safar fourteenth.
	self assert: (stream previous: -1 dayMeasure) = Safar fifteenth.
	stream := DaysOfMonthsStream
		startingOn: Safar first
		monthsStrategy: (MonthsOfNonleapYearsForCircularStreamStrategy of: IslamicCalendar).
	self assert: (stream previous: 28 daysMeasure) = Muharram third.
	stream := DaysOfMonthsStream
		startingOn: Muharram first
		monthsStrategy: (MonthsOfNonleapYearsForCircularStreamStrategy of: IslamicCalendar).
	self assert: (stream previous: 59 daysMeasure) = DhuAlQada first.
	stream := DaysOfMonthsStream
		startingOn: Muharram first
		monthsStrategy: (MonthsOfLeapYearsForCircularStreamStrategy of: IslamicCalendar).
	self assert: (stream previous: 60 daysMeasure) = DhuAlQada first
]
