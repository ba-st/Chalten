Class {
	#name : 'ChaltenDateTimeTest',
	#superclass : 'TestCase',
	#instVars : [
		'december31Of2003',
		'december31Of2003On23Hours59Minutes59Seconds',
		'januaryFirstOf2004',
		'januaryFirstOf2004On00Hours00Minutes01Seconds',
		'januaryFirstOf2004On03Hours',
		'januaryFirstOf2004On23Hours59Minutes58Seconds',
		'januaryFirstOf2004On23Hours59Minutes59Seconds',
		'januarySecondOf2004',
		'januarySecondOf2004On00Hours00Minutes01Seconds',
		'januarySecondOf2004On23Hours',
		'januarySecondOf2004On23Hours59Minutes59Seconds',
		'januaryThirdOf2004',
		'calendar',
		'oneDay',
		'hourInBsAs',
		'hourInGreenwich'
	],
	#category : 'Chalten-Core-Tests-Time',
	#package : 'Chalten-Core-Tests',
	#tag : 'Time'
}

{ #category : 'initialization' }
ChaltenDateTimeTest >> setUp [
	oneDay := 1 dayMeasure.
	december31Of2003 := ChaltenDateTime date: December thirtyfirst , 2003 timeOfDay: (TimeOfDay hours: 00).
	december31Of2003On23Hours59Minutes59Seconds := ChaltenDateTime
		date: December thirtyfirst , 2003
		timeOfDay: (TimeOfDay hours: 23 minutes: 59 seconds: 59).
	januaryFirstOf2004 := ChaltenDateTime date: January first , 2004 timeOfDay: (TimeOfDay hours: 00).
	januaryFirstOf2004On00Hours00Minutes01Seconds := ChaltenDateTime
		date: January first , 2004
		timeOfDay: (TimeOfDay hours: 00 minutes: 00 seconds: 01).
	januaryFirstOf2004On03Hours := ChaltenDateTime date: January first , 2004 timeOfDay: (TimeOfDay hours: 03).
	januaryFirstOf2004On23Hours59Minutes58Seconds := ChaltenDateTime
		date: January first , 2004
		timeOfDay: (TimeOfDay hours: 23 minutes: 59 seconds: 58).
	januaryFirstOf2004On23Hours59Minutes59Seconds := ChaltenDateTime
		date: January first , 2004
		timeOfDay: (TimeOfDay hours: 23 minutes: 59 seconds: 59).
	januarySecondOf2004 := ChaltenDateTime date: January second , 2004 timeOfDay: (TimeOfDay hours: 00).
	januarySecondOf2004On00Hours00Minutes01Seconds := ChaltenDateTime
		date: January second , 2004
		timeOfDay: (TimeOfDay hours: 00 minutes: 00 seconds: 01).
	januarySecondOf2004On23Hours := ChaltenDateTime date: January second , 2004 timeOfDay: (TimeOfDay hours: 23).
	januarySecondOf2004On23Hours59Minutes59Seconds := ChaltenDateTime
		date: January second , 2004
		timeOfDay: (TimeOfDay hours: 23 minutes: 59 seconds: 59).
	januaryThirdOf2004 := ChaltenDateTime date: January third , 2004 timeOfDay: (TimeOfDay hours: 00).
	hourInGreenwich := ChaltenDateTime
		date: March eighth , 2008
		timeOfDay: (TimeOfDay hours: 20 minutes: 5)
		zone: TimeZones greenwich.
	hourInBsAs := ChaltenDateTime
		date: March eighth , 2008
		timeOfDay: (TimeOfDay hours: 17 minutes: 5)
		zone: TimeZones buenosAires
]

{ #category : 'test accessing' }
ChaltenDateTimeTest >> testAccessing [

	| januaryFirst2004 |
	januaryFirst2004 := January first , 2004.
	self
		assert:
		(ChaltenDateTime date: januaryFirst2004 timeOfDay: 0 hoursMeasure) date
		equals: januaryFirst2004.
	self
		assert:
		(ChaltenDateTime date: januaryFirst2004 timeOfDay: 0 hoursMeasure)
			dayNumber
		equals: 1.
	self
		assert:
		(ChaltenDateTime date: januaryFirst2004 timeOfDay: 0 hoursMeasure) month
		equals: January.
	self
		assert: (ChaltenDateTime date: januaryFirst2004 timeOfDay: 0 hoursMeasure)
				monthOfYear
		equals: January , 2004.
	self
		assert:
		(ChaltenDateTime date: januaryFirst2004 timeOfDay: 0 hoursMeasure) year
		equals: 2004 asGregorianYear.
	self
		assert:
		(ChaltenDateTime date: januaryFirst2004 timeOfDay: 0 hoursMeasure)
			dayNumber
		equals: 1.
	self
		assert:
		(ChaltenDateTime date: januaryFirst2004 timeOfDay: 0 hoursMeasure)
			timeOfDay
		equals: 0 hoursMeasure.
	self
		assert:
		(ChaltenDateTime date: januaryFirst2004 timeOfDay: 0 hoursMeasure) zone
		equals: TimeZones local
]

{ #category : 'test enumerating' }
ChaltenDateTimeTest >> testAdd [

	| oneHour |
	oneHour := 1 hourMeasure.
	self
		assert:
		(januaryFirstOf2004On23Hours59Minutes59Seconds next: 1 secondMeasure)
		equals: januarySecondOf2004.
	self
		assert:
		(januaryFirstOf2004On23Hours59Minutes59Seconds next:
			 2 secondsMeasure)
		equals: januarySecondOf2004On00Hours00Minutes01Seconds.
	self
		assert: (januaryFirstOf2004 next: 24 hoursMeasure)
		equals: januarySecondOf2004.
	self
		assert: (januaryFirstOf2004 next: -1 secondMeasure)
		equals: december31Of2003On23Hours59Minutes59Seconds.
	self
		assert: (januaryFirstOf2004On23Hours59Minutes59Seconds next:
				 24 hoursMeasure negated)
		equals: december31Of2003On23Hours59Minutes59Seconds.
	self
		assert: (hourInBsAs next: oneHour)
		equals: (hourInGreenwich next: oneHour).
	self
		assert: (hourInGreenwich next: 24 hoursMeasure)
		equals: (hourInBsAs next: 24 hoursMeasure)
]

{ #category : 'test comparing' }
ChaltenDateTimeTest >> testComparing [

	| januaryFirstOf2004Other |
	januaryFirstOf2004Other := ChaltenDateTime
		                           date: January first , 2004
		                           timeOfDay: (TimeOfDay hours: 00).
	self assert: januaryFirstOf2004 equals: januaryFirstOf2004Other.
	self deny: januaryFirstOf2004 = januarySecondOf2004.
	self deny:
		januarySecondOf2004 = januarySecondOf2004On00Hours00Minutes01Seconds
]

{ #category : 'test comparing' }
ChaltenDateTimeTest >> testEqual [

	| dateTime |
	dateTime := ChaltenDateTime
		            date: March eighth , 2008
		            timeOfDay: (TimeOfDay hours: 22 minutes: 5)
		            zone: TimeZones greenwich.
	self assert: hourInBsAs equals: hourInGreenwich.
	self deny: hourInBsAs = dateTime.
	self deny: hourInGreenwich = dateTime
]

{ #category : 'test enumerating' }
ChaltenDateTimeTest >> testFirstTimeOfDay [

	self
		assert: januaryFirstOf2004On23Hours59Minutes59Seconds firstTimeOfDay
		equals: januaryFirstOf2004.
	self
		assert: januaryFirstOf2004 firstTimeOfDay
		equals: januaryFirstOf2004.
	self
		assert: (hourInBsAs firstTimeOfDay previous: 3 hoursMeasure)
		equals: hourInGreenwich firstTimeOfDay.
	self
		assert: (hourInGreenwich firstTimeOfDay next: 3 hoursMeasure)
		equals: hourInBsAs firstTimeOfDay
]

{ #category : 'test comparing' }
ChaltenDateTimeTest >> testGreaterThan [

	| dateTime |
	dateTime := ChaltenDateTime
		            date: March eighth , 2008
		            timeOfDay: (TimeOfDay hours: 18 minutes: 5)
		            zone: TimeZones greenwich.

	self assert:
		januaryFirstOf2004On23Hours59Minutes59Seconds > januaryFirstOf2004.
	self assert:
		januarySecondOf2004 > januaryFirstOf2004On23Hours59Minutes59Seconds.
	self deny:
		januaryFirstOf2004 > januaryFirstOf2004On23Hours59Minutes59Seconds.
	self deny:
		januaryFirstOf2004On23Hours59Minutes59Seconds > januarySecondOf2004.

	self deny: hourInBsAs > hourInGreenwich.
	self deny: hourInGreenwich > hourInBsAs.
	self assert: hourInBsAs > dateTime.
	self assert: hourInGreenwich > dateTime.

	self
		should: [ hourInBsAs > Monday ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: Monday class
						 with: Monday
						 with: hourInBsAs class
						 with: hourInBsAs) ].

	self
		should: [ hourInBsAs >= March ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: hourInBsAs class
						 with: hourInBsAs
						 with: March class
						 with: March) ]
]

{ #category : 'test comparing' }
ChaltenDateTimeTest >> testHash [

	| dateTime |
	dateTime := ChaltenDateTime
		            date: March eighth , 2008
		            timeOfDay: (TimeOfDay hours: 22 minutes: 5)
		            zone: TimeZones greenwich.
	self
		assert: januaryFirstOf2004On23Hours59Minutes59Seconds hash
		equals: januaryFirstOf2004On23Hours59Minutes59Seconds hash.
	self assert: hourInBsAs hash equals: hourInGreenwich hash.
	self deny: hourInBsAs hash = dateTime hash.
	self deny: hourInGreenwich hash = dateTime hash
]

{ #category : 'test enumerating' }
ChaltenDateTimeTest >> testLastTimeOfDay [

	self
		assert:
		januaryFirstOf2004On23Hours59Minutes59Seconds lastTimeOfDay date
		equals: January first , 2004.
	self
		assert:
		januaryFirstOf2004On23Hours59Minutes59Seconds lastTimeOfDay
			timeOfDay
		equals: TimeOfDay lastTimeOfDay.
	self
		assert: (hourInBsAs lastTimeOfDay previous: 3 hoursMeasure)
		equals: hourInGreenwich lastTimeOfDay.
	self
		assert: (hourInGreenwich lastTimeOfDay next: 3 hoursMeasure)
		equals: hourInBsAs lastTimeOfDay
]

{ #category : 'test comparing' }
ChaltenDateTimeTest >> testLessThan [

	| dateTime |
	dateTime := ChaltenDateTime
		            date: August third , 2008
		            timeOfDay: (TimeOfDay hours: 23 minutes: 5)
		            zone: TimeZones greenwich.

	self assert: januaryFirstOf2004On23Hours59Minutes58Seconds
		< januaryFirstOf2004On23Hours59Minutes59Seconds.
	self assert: januaryFirstOf2004On00Hours00Minutes01Seconds
		< januaryFirstOf2004On23Hours59Minutes58Seconds.
	self deny: januaryFirstOf2004On23Hours59Minutes59Seconds
		< januaryFirstOf2004On23Hours59Minutes58Seconds.
	self deny: januaryFirstOf2004On23Hours59Minutes58Seconds
		< januaryFirstOf2004On00Hours00Minutes01Seconds.

	self deny: hourInBsAs < hourInGreenwich.
	self deny: hourInGreenwich < hourInBsAs.
	self assert: hourInBsAs < dateTime.
	self assert: hourInGreenwich < dateTime.

	self
		should: [ hourInBsAs <= Monday ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: Monday class
						 with: Monday
						 with: hourInBsAs class
						 with: hourInBsAs) ].

	self
		should: [ hourInBsAs < March ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: hourInBsAs class
						 with: hourInBsAs
						 with: March class
						 with: March) ]
]

{ #category : 'test printing' }
ChaltenDateTimeTest >> testPrintString [

	self
		assert: januaryFirstOf2004On23Hours59Minutes59Seconds printString
		equals: ('January 1, 2004 23:59:59 {<1p>}' expandMacrosWith: TimeZones local).
	self assert: hourInBsAs printString equals: ('March 8, 2008 17:05:00 {<1p>}' expandMacrosWith: TimeZones buenosAires).
	self assert: hourInGreenwich printString equals: ('March 8, 2008 20:05:00 {<1p>}' expandMacrosWith: TimeZones greenwich)
]

{ #category : 'test interval protocol' }
ChaltenDateTimeTest >> testReverse [

	| collection date hours |
	collection := (januaryFirstOf2004 to: januarySecondOf2004On23Hours
	               by: 2 hoursMeasure) reverse.
	date := January second , 2004.
	hours := 22.
	collection do: [ :dateTime |
		self assert: dateTime date equals: date.
		self assert: dateTime timeOfDay equals: (TimeOfDay hours: hours).
		hours := hours - 2.
		hours = -2 ifTrue: [
			date := date previous.
			hours := 22 ] ].
	self assert: date equals: December thirtyfirst , 2003.
	self assert: hours equals: 22
]

{ #category : 'test enumerating' }
ChaltenDateTimeTest >> testSubtract [

	| oneHour |
	oneHour := 1 hourMeasure.
	self
		assert: (januaryFirstOf2004On23Hours59Minutes59Seconds previous:
				 1 secondMeasure)
		equals: januaryFirstOf2004On23Hours59Minutes58Seconds.
	self
		assert: (januaryFirstOf2004On23Hours59Minutes59Seconds previous:
				 24 hoursMeasure)
		equals: december31Of2003On23Hours59Minutes59Seconds.
	self
		assert: (januaryFirstOf2004 previous: 24 hoursMeasure)
		equals: december31Of2003.
	self
		assert: (januaryFirstOf2004 previous: -1 secondMeasure)
		equals: januaryFirstOf2004On00Hours00Minutes01Seconds.
	self
		assert: (januaryFirstOf2004 previous: -1 dayMeasure)
		equals: januarySecondOf2004.
	self
		assert: (januaryFirstOf2004On23Hours59Minutes59Seconds previous:
				 24 hoursMeasure negated)
		equals: januarySecondOf2004On23Hours59Minutes59Seconds.
	self
		assert: (hourInBsAs previous: oneHour)
		equals: (hourInGreenwich previous: oneHour).
	self
		assert: (hourInGreenwich previous: 24 hoursMeasure)
		equals: (hourInBsAs previous: 24 hoursMeasure)
]

{ #category : 'test querying' }
ChaltenDateTimeTest >> testTimeFrom [

	self
		assert:
			(januaryFirstOf2004On00Hours00Minutes01Seconds distanceFrom:
				 januaryFirstOf2004)
		equals: 1 secondMeasure.
	self
		assert:
		(januarySecondOf2004On23Hours distanceFrom: januaryFirstOf2004)
		equals: 1 dayMeasure + 23 hoursMeasure.
	self
		assert: (januarySecondOf2004 distanceFrom: januaryFirstOf2004)
		equals: 1 dayMeasure.
	self
		assert: (januaryThirdOf2004 distanceFrom: januaryFirstOf2004)
		equals: 2 daysMeasure.
	self
		assert: (januaryFirstOf2004 distanceFrom:
				 januaryFirstOf2004On00Hours00Minutes01Seconds)
		equals: -1 secondMeasure.
	self
		assert: (januaryFirstOf2004 distanceFrom: januarySecondOf2004)
		equals: -1 dayMeasure.
	self
		assert: (januaryFirstOf2004 distanceFrom: januaryThirdOf2004)
		equals: -2 daysMeasure
]

{ #category : 'test querying' }
ChaltenDateTimeTest >> testTimeFromMidnight [

	self
		assert: januaryFirstOf2004On03Hours timeFromMidnight
		equals: (TimeOfDay hours: 03) timeFromMidnight.
	self
		assert: januaryFirstOf2004 timeFromMidnight
		equals: (TimeOfDay hours: 00) timeFromMidnight.
	self
		assert:
		januaryFirstOf2004On23Hours59Minutes59Seconds timeFromMidnight
		equals:
		(TimeOfDay hours: 23 minutes: 59 seconds: 59) timeFromMidnight
]

{ #category : 'test querying' }
ChaltenDateTimeTest >> testTimeTo [

	self
		assert: (januaryFirstOf2004 distanceTo:
				 januaryFirstOf2004On00Hours00Minutes01Seconds)
		equals: 1 secondMeasure.
	self
		assert:
		(januaryFirstOf2004 distanceTo: januarySecondOf2004On23Hours)
		equals: 1 dayMeasure + 23 hoursMeasure.
	self
		assert: (januaryFirstOf2004 distanceTo: januarySecondOf2004)
		equals: 1 dayMeasure.
	self
		assert: (januaryFirstOf2004 distanceTo: januaryThirdOf2004)
		equals: 2 daysMeasure.
	self
		assert: (januaryFirstOf2004On00Hours00Minutes01Seconds distanceTo:
				 januaryFirstOf2004)
		equals: -1 secondMeasure.
	self
		assert: (januarySecondOf2004 distanceTo: januaryFirstOf2004)
		equals: -1 dayMeasure.
	self
		assert: (januaryThirdOf2004 distanceTo: januaryFirstOf2004)
		equals: -2 daysMeasure
]

{ #category : 'test querying' }
ChaltenDateTimeTest >> testTimeToEndOfDay [

	self
		assert: januaryFirstOf2004On03Hours timeToEndOfDay
		equals: 21 hoursMeasure.
	self
		assert: januaryFirstOf2004 timeToEndOfDay
		equals: 24 hoursMeasure.
	self
		assert: januaryFirstOf2004On23Hours59Minutes59Seconds timeToEndOfDay
		equals: 1 secondMeasure
]

{ #category : 'test interval protocol' }
ChaltenDateTimeTest >> testTo [

	| interval |
	interval := januaryFirstOf2004 to: januarySecondOf2004.
	self assert: interval from equals: januaryFirstOf2004.
	self assert: interval to equals: januarySecondOf2004.
	self assert: interval by equals: 1 secondMeasure
]

{ #category : 'test interval protocol' }
ChaltenDateTimeTest >> testToBy [

	| interval |
	interval := januaryFirstOf2004 to: januarySecondOf2004 by:
	            1 hourMeasure.
	self assert: interval from equals: januaryFirstOf2004.
	self assert: interval to equals: januarySecondOf2004.
	self assert: interval by equals: 1 hourMeasure
]

{ #category : 'test interval protocol' }
ChaltenDateTimeTest >> testToByDo [

	| interval date hours |
	interval := januaryFirstOf2004 to:
	            januarySecondOf2004On23Hours59Minutes59Seconds by:
	            1 hourMeasure.
	date := January first , 2004.
	hours := 0.
	interval do: [ :dateTime |
		self assert: dateTime date equals: date.
		self assert: dateTime timeOfDay equals: (TimeOfDay hours: hours).
		hours := hours + 1.
		hours = 24 ifTrue: [
			date := date next.
			hours := 0 ] ].
	self assert: date equals: January third , 2004.
	self assert: hours equals: 0
]

{ #category : 'test interval protocol' }
ChaltenDateTimeTest >> testToByMinutesDo [

	| interval minutes |
	interval := januaryFirstOf2004 to: januaryThirdOf2004 by:
	            1 minuteMeasure.
	minutes := interval
		           inject: 0
		           into: [ :accumulatedMinutes :dateTime |
		           accumulatedMinutes + 1 ].
	self assert: (minutes - 1) minutesMeasure equals: 48 hoursMeasure
]

{ #category : 'test interval protocol' }
ChaltenDateTimeTest >> testToNegativeByDo [

	| interval date hours |
	interval := januarySecondOf2004On23Hours to:
	            januaryFirstOf2004On03Hours by: -2 hoursMeasure.
	date := January second , 2004.
	hours := 23.
	interval do: [ :dateTime |
		self assert: dateTime date equals: date.
		self assert: dateTime timeOfDay equals: (TimeOfDay hours: hours).
		hours := hours - 2.
		hours = -1 ifTrue: [
			date := date previous.
			hours := 23 ] ].
	self assert: date equals: January first , 2004.
	self assert: hours equals: 1
]
