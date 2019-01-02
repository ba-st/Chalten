Class {
	#name : #DateTimeTest,
	#superclass : #TestCase,
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
	#category : #'Chalten-Core-Tests-Time'
}

{ #category : #initialization }
DateTimeTest >> setUp [
	oneDay := 1 dayMeasure.
	december31Of2003 := DateTime date: December thirtyfirst , 2003 timeOfDay: (TimeOfDay hours: 00).
	december31Of2003On23Hours59Minutes59Seconds := DateTime
		date: December thirtyfirst , 2003
		timeOfDay: (TimeOfDay hours: 23 minutes: 59 seconds: 59).
	januaryFirstOf2004 := DateTime date: January first , 2004 timeOfDay: (TimeOfDay hours: 00).
	januaryFirstOf2004On00Hours00Minutes01Seconds := DateTime
		date: January first , 2004
		timeOfDay: (TimeOfDay hours: 00 minutes: 00 seconds: 01).
	januaryFirstOf2004On03Hours := DateTime date: January first , 2004 timeOfDay: (TimeOfDay hours: 03).
	januaryFirstOf2004On23Hours59Minutes58Seconds := DateTime
		date: January first , 2004
		timeOfDay: (TimeOfDay hours: 23 minutes: 59 seconds: 58).
	januaryFirstOf2004On23Hours59Minutes59Seconds := DateTime
		date: January first , 2004
		timeOfDay: (TimeOfDay hours: 23 minutes: 59 seconds: 59).
	januarySecondOf2004 := DateTime date: January second , 2004 timeOfDay: (TimeOfDay hours: 00).
	januarySecondOf2004On00Hours00Minutes01Seconds := DateTime
		date: January second , 2004
		timeOfDay: (TimeOfDay hours: 00 minutes: 00 seconds: 01).
	januarySecondOf2004On23Hours := DateTime date: January second , 2004 timeOfDay: (TimeOfDay hours: 23).
	januarySecondOf2004On23Hours59Minutes59Seconds := DateTime
		date: January second , 2004
		timeOfDay: (TimeOfDay hours: 23 minutes: 59 seconds: 59).
	januaryThirdOf2004 := DateTime date: January third , 2004 timeOfDay: (TimeOfDay hours: 00).
	hourInGreenwich := DateTime
		date: March eighth , 2008
		timeOfDay: (TimeOfDay hours: 20 minutes: 5)
		zone: TimeZones greenwich.
	hourInBsAs := DateTime
		date: March eighth , 2008
		timeOfDay: (TimeOfDay hours: 17 minutes: 5)
		zone: TimeZones buenosAires
]

{ #category : #'test accessing' }
DateTimeTest >> testAccessing [

	| januaryFirst2004 |

	januaryFirst2004 := January first, 2004.
	self assert: (DateTime date: januaryFirst2004 timeOfDay: 0 hoursMeasure) date = januaryFirst2004.
	self assert: (DateTime date: januaryFirst2004 timeOfDay: 0 hoursMeasure) dayNumber = 1.
	self assert: (DateTime date: januaryFirst2004 timeOfDay: 0 hoursMeasure) month = January.
	self assert: (DateTime date: januaryFirst2004 timeOfDay: 0 hoursMeasure) monthOfYear = (January, 2004).
	self assert: (DateTime date: januaryFirst2004 timeOfDay: 0 hoursMeasure) year = 2004 asGregorianYear.
	self assert: (DateTime date: januaryFirst2004 timeOfDay: 0 hoursMeasure) dayNumber = 1.
	self assert: (DateTime date: januaryFirst2004 timeOfDay: 0 hoursMeasure) timeOfDay = 0 hoursMeasure.
	self assert: (DateTime date: januaryFirst2004 timeOfDay: 0 hoursMeasure) zone = TimeZones local
]

{ #category : #'test enumerating' }
DateTimeTest >> testAdd [

	| oneHour |
	oneHour := 1 hourMeasure.
	
	self assert: (januaryFirstOf2004On23Hours59Minutes59Seconds next: 1 secondMeasure) = januarySecondOf2004.
	self assert: (januaryFirstOf2004On23Hours59Minutes59Seconds next: 2 secondsMeasure) = januarySecondOf2004On00Hours00Minutes01Seconds.
	self assert: (januaryFirstOf2004 next: 24 hoursMeasure) = januarySecondOf2004.
	self assert: (januaryFirstOf2004 next: -1 secondMeasure) = december31Of2003On23Hours59Minutes59Seconds.
	self assert: (januaryFirstOf2004On23Hours59Minutes59Seconds next: 24 hoursMeasure negated) = december31Of2003On23Hours59Minutes59Seconds.
	
	self assert: (hourInBsAs next: oneHour) = (hourInGreenwich next: oneHour).
	self assert: (hourInGreenwich next: 24 hoursMeasure) = (hourInBsAs next: 24 hoursMeasure)
]

{ #category : #'test comparing' }
DateTimeTest >> testComparing [

	| januaryFirstOf2004Other |
	januaryFirstOf2004Other := DateTime
		date: January first, 2004
		timeOfDay: (TimeOfDay hours: 00).
		
	self assert: januaryFirstOf2004 = januaryFirstOf2004Other.
	self deny: januaryFirstOf2004 = januarySecondOf2004.
	self deny: januarySecondOf2004 = januarySecondOf2004On00Hours00Minutes01Seconds
]

{ #category : #'test comparing' }
DateTimeTest >> testEqual [

	| dateTime |
	dateTime := DateTime
		date: March eighth , 2008
		timeOfDay: (TimeOfDay hours: 22 minutes: 5)
		zone: TimeZones greenwich.
		
	self assert: hourInBsAs = hourInGreenwich.
	self deny: hourInBsAs = dateTime.
	self deny: hourInGreenwich = dateTime
]

{ #category : #'test enumerating' }
DateTimeTest >> testFirstTimeOfDay [

	self assert: januaryFirstOf2004On23Hours59Minutes59Seconds firstTimeOfDay = januaryFirstOf2004.
	self assert: januaryFirstOf2004 firstTimeOfDay = januaryFirstOf2004.
	
	self assert: (hourInBsAs firstTimeOfDay previous: 3 hoursMeasure) = hourInGreenwich firstTimeOfDay.
	self assert: (hourInGreenwich firstTimeOfDay next: 3 hoursMeasure) = hourInBsAs firstTimeOfDay
]

{ #category : #'test comparing' }
DateTimeTest >> testGreaterThan [

	| dateTime |
	dateTime := DateTime
		date: March eighth, 2008
		timeOfDay: (TimeOfDay hours: 18 minutes: 5)
		zone: TimeZones greenwich.
		
	self assert: januaryFirstOf2004On23Hours59Minutes59Seconds > januaryFirstOf2004.
	self assert: januarySecondOf2004 > januaryFirstOf2004On23Hours59Minutes59Seconds.
	self deny: januaryFirstOf2004 > januaryFirstOf2004On23Hours59Minutes59Seconds.
	self deny: januaryFirstOf2004On23Hours59Minutes59Seconds > januarySecondOf2004.
		
	self deny: hourInBsAs > hourInGreenwich.
	self deny: hourInGreenwich > hourInBsAs.
	self assert: hourInBsAs > dateTime.
	self assert: hourInGreenwich > dateTime.
	
	self should: [ hourInBsAs > Monday ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: Monday class
				with: Monday
				with: hourInBsAs class
				with: hourInBsAs) ].
	
	self should: [ hourInBsAs >= March ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: hourInBsAs class
				with: hourInBsAs
				with: March class
				with: March) ]
]

{ #category : #'test comparing' }
DateTimeTest >> testHash [

	| dateTime |
	dateTime := DateTime
		date: March eighth , 2008
		timeOfDay: (TimeOfDay hours: 22 minutes: 5)
		zone: TimeZones greenwich.
	
	self assert: januaryFirstOf2004On23Hours59Minutes59Seconds hash = januaryFirstOf2004On23Hours59Minutes59Seconds hash.
		
	self assert: hourInBsAs hash = hourInGreenwich hash.
	self deny: hourInBsAs hash = dateTime hash.
	self deny: hourInGreenwich hash = dateTime hash
]

{ #category : #'test enumerating' }
DateTimeTest >> testLastTimeOfDay [

	self assert: januaryFirstOf2004On23Hours59Minutes59Seconds lastTimeOfDay date = (January first, 2004).
	self assert: januaryFirstOf2004On23Hours59Minutes59Seconds lastTimeOfDay timeOfDay = TimeOfDay lastTimeOfDay.
	
	self assert: (hourInBsAs lastTimeOfDay previous: 3 hoursMeasure)= hourInGreenwich lastTimeOfDay.
	self assert: (hourInGreenwich lastTimeOfDay next: 3 hoursMeasure) = hourInBsAs lastTimeOfDay
]

{ #category : #'test comparing' }
DateTimeTest >> testLessThan [

	| dateTime |
	dateTime := DateTime
		date: August third, 2008
		timeOfDay: (TimeOfDay hours: 23 minutes: 5)
		zone: TimeZones greenwich.

	self assert: januaryFirstOf2004On23Hours59Minutes58Seconds < januaryFirstOf2004On23Hours59Minutes59Seconds.
	self assert: januaryFirstOf2004On00Hours00Minutes01Seconds < januaryFirstOf2004On23Hours59Minutes58Seconds.
	self deny: januaryFirstOf2004On23Hours59Minutes59Seconds < januaryFirstOf2004On23Hours59Minutes58Seconds.
	self deny: januaryFirstOf2004On23Hours59Minutes58Seconds < januaryFirstOf2004On00Hours00Minutes01Seconds.
	
	self deny: hourInBsAs < hourInGreenwich.
	self deny: hourInGreenwich < hourInBsAs.
	self assert: hourInBsAs < dateTime.
	self assert: hourInGreenwich < dateTime.
	
	self should: [ hourInBsAs <= Monday ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: Monday class
				with: Monday
				with: hourInBsAs class
				with: hourInBsAs) ].
	
	self should: [ hourInBsAs < March ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: hourInBsAs class
				with: hourInBsAs
				with: March class
				with: March) ]
]

{ #category : #'test printing' }
DateTimeTest >> testPrintString [

	self
		assert: januaryFirstOf2004On23Hours59Minutes59Seconds printString
		equals: ('January 1, 2004 23:59:59 {<1p>}' expandMacrosWith: TimeZones local).
	self assert: hourInBsAs printString equals: ('March 8, 2008 17:05:00 {<1p>}' expandMacrosWith: TimeZones buenosAires).
	self assert: hourInGreenwich printString equals: ('March 8, 2008 20:05:00 {<1p>}' expandMacrosWith: TimeZones greenwich)
]

{ #category : #'test interval protocol' }
DateTimeTest >> testReverse [

	| collection date hours |

	collection := (januaryFirstOf2004 to: januarySecondOf2004On23Hours by: 2 hoursMeasure) reverse.
	date := January second, 2004.
	hours := 22.
	collection do: [:dateTime |
		self assert: dateTime date = date.
		self assert: dateTime timeOfDay = (TimeOfDay hours: hours).
		hours := hours - 2.
		hours = -2
			ifTrue: [
				date := date previous.
				hours := 22]].
	self assert: date = (December thirtyfirst, 2003).
	self assert: hours = 22
]

{ #category : #'test enumerating' }
DateTimeTest >> testSubtract [

	| oneHour |
	oneHour := 1 hourMeasure.

	self assert: (januaryFirstOf2004On23Hours59Minutes59Seconds previous: 1 secondMeasure) = januaryFirstOf2004On23Hours59Minutes58Seconds.
	self assert: (januaryFirstOf2004On23Hours59Minutes59Seconds previous: 24 hoursMeasure) = december31Of2003On23Hours59Minutes59Seconds.
	self assert: (januaryFirstOf2004 previous: 24 hoursMeasure) = december31Of2003.
	self assert: (januaryFirstOf2004 previous: -1 secondMeasure) = januaryFirstOf2004On00Hours00Minutes01Seconds.
	self assert: (januaryFirstOf2004 previous: -1 dayMeasure) = januarySecondOf2004.
	self assert: (januaryFirstOf2004On23Hours59Minutes59Seconds previous: 24 hoursMeasure negated)
		= januarySecondOf2004On23Hours59Minutes59Seconds.
	
	self assert: (hourInBsAs previous: oneHour) = (hourInGreenwich previous: oneHour).
	self assert: (hourInGreenwich previous: 24 hoursMeasure) = (hourInBsAs previous: 24 hoursMeasure)
]

{ #category : #'test querying' }
DateTimeTest >> testTimeFrom [

	self assert:
		(januaryFirstOf2004On00Hours00Minutes01Seconds distanceFrom: januaryFirstOf2004) = 1 secondMeasure.
	self assert:
		(januarySecondOf2004On23Hours distanceFrom: januaryFirstOf2004) = (1 dayMeasure + 23 hoursMeasure).
	self assert: (januarySecondOf2004 distanceFrom: januaryFirstOf2004) = 1 dayMeasure.
	self assert: (januaryThirdOf2004 distanceFrom: januaryFirstOf2004) = 2 daysMeasure.
	self assert:
		(januaryFirstOf2004 distanceFrom: januaryFirstOf2004On00Hours00Minutes01Seconds) = -1 secondMeasure.
	self assert: (januaryFirstOf2004 distanceFrom: januarySecondOf2004) = -1 dayMeasure.
	self assert: (januaryFirstOf2004 distanceFrom: januaryThirdOf2004) = -2 daysMeasure
]

{ #category : #'test querying' }
DateTimeTest >> testTimeFromMidnight [

	self
		assert: januaryFirstOf2004On03Hours timeFromMidnight = (TimeOfDay hours: 03) timeFromMidnight.
	self assert: januaryFirstOf2004 timeFromMidnight = (TimeOfDay hours: 00) timeFromMidnight.
	self assert:
		januaryFirstOf2004On23Hours59Minutes59Seconds timeFromMidnight =
			(TimeOfDay hours: 23 minutes: 59 seconds: 59) timeFromMidnight
]

{ #category : #'test querying' }
DateTimeTest >> testTimeTo [

	self assert:
		(januaryFirstOf2004 distanceTo: januaryFirstOf2004On00Hours00Minutes01Seconds) = 1 secondMeasure.
	self assert:
		(januaryFirstOf2004 distanceTo: januarySecondOf2004On23Hours) = (1 dayMeasure + 23 hoursMeasure).
	self assert: (januaryFirstOf2004 distanceTo: januarySecondOf2004) = 1 dayMeasure.
	self assert: (januaryFirstOf2004 distanceTo: januaryThirdOf2004) = 2 daysMeasure.
	self assert:
		(januaryFirstOf2004On00Hours00Minutes01Seconds distanceTo: januaryFirstOf2004) = -1 secondMeasure.
	self assert: (januarySecondOf2004 distanceTo: januaryFirstOf2004) = -1 dayMeasure.
	self assert: (januaryThirdOf2004 distanceTo: januaryFirstOf2004) = -2 daysMeasure
]

{ #category : #'test querying' }
DateTimeTest >> testTimeToEndOfDay [

	self assert: januaryFirstOf2004On03Hours timeToEndOfDay = 21 hoursMeasure.
	self assert: januaryFirstOf2004 timeToEndOfDay = 24 hoursMeasure.
	self assert: januaryFirstOf2004On23Hours59Minutes59Seconds timeToEndOfDay = 1 secondMeasure
]

{ #category : #'test interval protocol' }
DateTimeTest >> testTo [
	| interval |
	interval := januaryFirstOf2004 to: januarySecondOf2004.
	self assert: interval from = januaryFirstOf2004.
	self assert: interval to = januarySecondOf2004.
	self assert: interval by = 1 secondMeasure
]

{ #category : #'test interval protocol' }
DateTimeTest >> testToBy [

	| interval |

	interval := januaryFirstOf2004 to: januarySecondOf2004 by: 1 hourMeasure.
	self assert: interval from = januaryFirstOf2004.
	self assert: interval to = januarySecondOf2004.
	self assert: interval by = 1 hourMeasure
]

{ #category : #'test interval protocol' }
DateTimeTest >> testToByDo [

	| interval date hours |

	interval := januaryFirstOf2004
		to: januarySecondOf2004On23Hours59Minutes59Seconds
		by: 1 hourMeasure.
	date := January first, 2004.
	hours := 0.
	interval do: [ :dateTime |
		self assert: dateTime date = date.
		self assert: dateTime timeOfDay = (TimeOfDay hours: hours).
		hours := hours + 1.
		hours = 24
			ifTrue: [
				date := date next.
				hours := 0 ]].
	self assert: date = (January third, 2004).
	self assert: hours = 0
]

{ #category : #'test interval protocol' }
DateTimeTest >> testToByMinutesDo [

	| interval minutes |

	interval := januaryFirstOf2004 to: januaryThirdOf2004 by: 1 minuteMeasure.
	minutes := interval inject: 0 into: [ :accumulatedMinutes :dateTime | accumulatedMinutes + 1 ].

	self assert: (minutes - 1) minutesMeasure = 48 hoursMeasure
]

{ #category : #'test interval protocol' }
DateTimeTest >> testToNegativeByDo [

	| interval date hours |

	interval := januarySecondOf2004On23Hours to: januaryFirstOf2004On03Hours by: -2 hoursMeasure.
	date := January second, 2004.
	hours := 23.
	interval do: [ :dateTime |
		self assert: dateTime date = date.
		self assert: dateTime timeOfDay = (TimeOfDay hours: hours).
		hours := hours - 2.
		hours = -1
			ifTrue: [
				date := date previous.
				hours := 23 ]].
	self assert: date = (January first, 2004).
	self assert: hours = 1
]
