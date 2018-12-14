Class {
	#name : #TimeOfDayTest,
	#superclass : #TestCase,
	#category : #'Chalten-Tests-Time'
}

{ #category : #'test querying' }
TimeOfDayTest >> testAbsoluteDistanceTo [

	self assert:
		((TimeOfDay midnight absoluteDistanceTo: (TimeOfDay hours: 0 minutes: 30 seconds: 0))
			convertTo: TimeUnits minute) = 30 minutesMeasure
]

{ #category : #'test enumerating' }
TimeOfDayTest >> testAdd [
	| time |
	time := TimeOfDay firstTimeOfDay.
	self assert: (time next: 1 hourMeasure) timeFromMidnight = 1 hourMeasure.
	self assert: (time next: 1 minuteMeasure) timeFromMidnight = 1 minuteMeasure.
	self assert: (time next: 1 secondMeasure) timeFromMidnight = 1 secondMeasure.
	self assert: (time next: 1 millisecondMeasure) timeFromMidnight = 1 millisecondMeasure
]

{ #category : #'test comparing' }
TimeOfDayTest >> testComparing [

	self assert: (TimeOfDay hours: 0) = (TimeOfDay hours: 0)
]

{ #category : #'test instance creation' }
TimeOfDayTest >> testCreation [

	| time |
	
	time := TimeOfDay timeFromMidnight: 0 hoursMeasure.
	
	self assert: time hours = 0 hoursMeasure.
	self assert: time minutes = 0 minutesMeasure.
	self assert: time seconds = 0 secondsMeasure.
	self assert: time milliseconds = 0 millisecondMeasure

]

{ #category : #'test instance creation' }
TimeOfDayTest >> testCreationHour [

	| time |
	
	time := TimeOfDay hours: 1.
	
	self assert: time hours = 1 hourMeasure.
	self assert: time minutes = 0 minutesMeasure.
	self assert: time seconds = 0 secondsMeasure.
	self assert: time milliseconds = 0 millisecondsMeasure
]

{ #category : #'test instance creation' }
TimeOfDayTest >> testCreationMilliseconds [

	| time |
	
	time := TimeOfDay hours: 1 minutes: 1 seconds: 1 milliseconds: 1.
	
	self assert: time hours = 1 hourMeasure.
	self assert: time minutes = 1 minuteMeasure.
	self assert: time seconds = 1 secondMeasure.
	self assert: time milliseconds = 1 millisecondMeasure

]

{ #category : #'test instance creation' }
TimeOfDayTest >> testCreationMinute [

	| time |
	
	time := TimeOfDay hours: 1 minutes: 1.
	
	self assert: time hours = 1 hourMeasure.
	self assert: time minutes = 1 minuteMeasure.
	self assert: time seconds = 0 secondsMeasure.
	self assert: time milliseconds = 0 millisecondsMeasure

]

{ #category : #'test instance creation' }
TimeOfDayTest >> testCreationSecond [

	| time |
	
	time := TimeOfDay hours: 1 minutes: 1 seconds: 1.
	
	self assert: time hours = 1 hourMeasure.
	self assert: time minutes = 1 minuteMeasure.
	self assert: time seconds = 1 secondMeasure.
	self assert: time milliseconds = 0 millisecondsMeasure

]

{ #category : #'test accessing' }
TimeOfDayTest >> testFirstTimeOfDay [

	self assert: TimeOfDay firstTimeOfDay = (TimeOfDay hours: 0)
]

{ #category : #'test comparing' }
TimeOfDayTest >> testGreaterThan [

	| firstTime lastTime |
	firstTime := TimeOfDay firstTimeOfDay.
	lastTime := TimeOfDay lastTimeOfDay.
	
	self assert: lastTime > firstTime.
	self deny: lastTime > lastTime.
	
	self should: [ lastTime <= Monday ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: Monday class
				with: Monday
				with: lastTime class
				with: lastTime) ].
	
	self should: [ firstTime < March ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: firstTime class
				with: firstTime
				with: March class
				with: March) ]
]

{ #category : #'test comparing' }
TimeOfDayTest >> testHash [

	self assert: (TimeOfDay hours: 0) hash = 0 hoursMeasure hash
]

{ #category : #'test instance creation' }
TimeOfDayTest >> testInvalidCreation [

	self 
		should: [ TimeOfDay timeFromMidnight: 24 hoursMeasure ] 
		raise: InvalidTimeOfDayException
		withExceptionDo: [:anException |
			self assert: anException description = 'The time 24 hours is invalid for one day' ].
		
	self 
		should: [ TimeOfDay timeFromMidnight: -1 millisecondMeasure ] 
		raise: InvalidTimeOfDayException
		withExceptionDo: [:anException |
			self assert: anException description = 'The time -1 millisecond is invalid for one day' ]
]

{ #category : #'test accessing' }
TimeOfDayTest >> testLastTimeOfDay [
	self
		assert:
			TimeOfDay lastTimeOfDay
				= (TimeOfDay timeFromMidnight: 23 hoursMeasure + 59 minutesMeasure + 59 secondsMeasure + 999 millisecondsMeasure)
]

{ #category : #'test comparing' }
TimeOfDayTest >> testLessThan [
	self assert: (TimeOfDay hours: 0) < (TimeOfDay timeFromMidnight: 1 millisecondMeasure).
	self deny: (TimeOfDay timeFromMidnight: 1 millisecondMeasure) < (TimeOfDay hours: 0)
]

{ #category : #'test accessing' }
TimeOfDayTest >> testMidnight [

	self assert: TimeOfDay midnight = (TimeOfDay hours: 0 minutes: 0 seconds: 0)
]

{ #category : #'test enumerating' }
TimeOfDayTest >> testNext [

	self assert: TimeOfDay midnight next = (TimeOfDay hours: 0 minutes: 0 seconds: 1)
]

{ #category : #'test accessing' }
TimeOfDayTest >> testNoon [

	self assert: TimeOfDay noon = (TimeOfDay hours: 12 minutes: 0 seconds: 0)
]

{ #category : #'test enumerating' }
TimeOfDayTest >> testPrevious [

	self assert: (TimeOfDay hours: 0 minutes: 0 seconds: 1) previous = TimeOfDay midnight
]

{ #category : #'test printing' }
TimeOfDayTest >> testPrintString [

	| time |
	
	time := TimeOfDay hours: 10 minutes: 11 seconds: 12.
	self assert: time printString = '10:11:12'.
	
	time := TimeOfDay hours: 07 minutes: 09 seconds: 05.
	self assert: time printString = '07:09:05'
]

{ #category : #'test interval protocol' }
TimeOfDayTest >> testReverse [
	| collection hour |
	collection := (TimeOfDay firstTimeOfDay to: TimeOfDay lastTimeOfDay by: 2 hoursMeasure) reverse.
	hour := 22.
	collection
		do: [ :aTimeOfDay | 
			self assert: aTimeOfDay = (TimeOfDay hours: hour).
			hour := hour - 2 ].
	self assert: hour = -2
]

{ #category : #'test enumerating' }
TimeOfDayTest >> testSubtract [
	| time |
	time := TimeOfDay hours: 1.
	self assert: (time previous: 1 hourMeasure) timeFromMidnight = 0 hoursMeasure.
	self assert: (time previous: 1 minuteMeasure) timeFromMidnight = 59 minutesMeasure.
	self assert: (time previous: 1 secondMeasure) timeFromMidnight = (59 * 60 + 59) secondsMeasure.
	self assert: (time previous: 1 millisecondMeasure) timeFromMidnight = (59 * 60000 + 59999) millisecondsMeasure
]

{ #category : #'test querying' }
TimeOfDayTest >> testTimeFrom [

	self assert: (TimeOfDay firstTimeOfDay distanceFrom: TimeOfDay lastTimeOfDay) = 1 millisecondMeasure.
	self assert: (TimeOfDay lastTimeOfDay distanceFrom: TimeOfDay firstTimeOfDay) = (24 hoursMeasure - 1 millisecondMeasure)
]

{ #category : #'test querying' }
TimeOfDayTest >> testTimeFromMidnight [

	self assert: TimeOfDay firstTimeOfDay timeFromMidnight = 0 hoursMeasure.
	self assert: TimeOfDay lastTimeOfDay timeFromMidnight = (24 hoursMeasure - 1 millisecondMeasure)
]

{ #category : #'test querying' }
TimeOfDayTest >> testTimeTo [

	self assert: (TimeOfDay firstTimeOfDay distanceTo: TimeOfDay lastTimeOfDay) = (24 hoursMeasure - 1 millisecondMeasure).
	self assert: (TimeOfDay lastTimeOfDay distanceTo: TimeOfDay firstTimeOfDay) = 1 millisecondMeasure
]

{ #category : #'test querying' }
TimeOfDayTest >> testTimeToEndOfDay [

	self assert: TimeOfDay firstTimeOfDay timeToEndOfDay = 24 hoursMeasure.
	self assert: TimeOfDay lastTimeOfDay timeToEndOfDay = 1 millisecondMeasure
]

{ #category : #'test interval protocol' }
TimeOfDayTest >> testTo [
	| interval |
	interval := TimeOfDay firstTimeOfDay to: TimeOfDay lastTimeOfDay.
	self assert: interval from = TimeOfDay firstTimeOfDay.
	self assert: interval to = TimeOfDay lastTimeOfDay.
	self assert: interval by = 1 secondMeasure
]

{ #category : #'test interval protocol' }
TimeOfDayTest >> testToBy [
	| interval |
	interval := TimeOfDay firstTimeOfDay to: TimeOfDay lastTimeOfDay by: 1 hourMeasure.
	self assert: interval from = TimeOfDay firstTimeOfDay.
	self assert: interval to = TimeOfDay lastTimeOfDay.
	self assert: interval by = 1 hourMeasure
]

{ #category : #'test interval protocol' }
TimeOfDayTest >> testToByDo [
	| interval hour |
	interval := TimeOfDay firstTimeOfDay to: TimeOfDay lastTimeOfDay by: 1 hourMeasure.
	hour := 0.
	interval
		do: [ :aTimeOfDay | 
			self assert: aTimeOfDay = (TimeOfDay hours: hour).
			hour := hour + 1 ].
	self assert: hour = 24
]

{ #category : #'test interval protocol' }
TimeOfDayTest >> testToNegativeByDo [
	| interval time |
	interval := (TimeOfDay hours: 23 minutes: 30) to: TimeOfDay firstTimeOfDay by: -30 minutesMeasure.
	time := 23 hoursMeasure + 30 minutesMeasure.
	interval
		do: [ :aTimeOfDay | 
			self assert: aTimeOfDay = (TimeOfDay timeFromMidnight: time).
			time := time - 30 minutesMeasure ].
	self assert: time = -30 minutesMeasure
]
