Class {
	#name : #JulianDayTest,
	#superclass : #TestCase,
	#instVars : [
		'calendar',
		'sunday',
		'monday',
		'tuesday',
		'wednesday',
		'thursday',
		'friday',
		'saturday',
		'twoDays',
		'minusOneDay',
		'zeroDays',
		'oneDay',
		'sevenDays'
	],
	#category : #'Chalten-Julian-Calendar-Tests'
}

{ #category : #accessing }
JulianDayTest class >> classUnderTest [

	^Day
]

{ #category : #initialization }
JulianDayTest >> setUp [

	calendar := JulianCalendar.
	sunday := calendar sunday.
	monday := calendar monday.
	tuesday := calendar tuesday.
	wednesday := calendar wednesday.
	thursday := calendar thursday.
	friday := calendar friday.
	saturday := calendar saturday.
	zeroDays := 0 daysMeasure.
	oneDay := 1 dayMeasure.
	twoDays := 2 daysMeasure.
	sevenDays := 7 daysMeasure.
	minusOneDay := -1 dayMeasure
]

{ #category : #'test comparing' }
JulianDayTest >> testComparing [

	self assert: JulianMonday < JulianSaturday.
	self assert: JulianWednesday < JulianFriday.
	self deny: JulianFriday < JulianThursday.
	
	self should: [ JulianMonday > JulianFebruary second ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: JulianFebruary second class
				with: JulianFebruary second
				with: JulianMonday class
				with: JulianMonday) ].
	
	self should: [ JulianFriday < JulianMarch ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: JulianFriday class
				with: JulianFriday
				with: JulianMarch class
				with: JulianMarch) ]
]

{ #category : #'test instance creation' }
JulianDayTest >> testCreation [
	self shouldnt: 
			[Day 
				named: 'One Christian Day Name'
				positionInWeek: 1
				calendar: calendar]
		raise: Exception
]

{ #category : #'test creation' }
JulianDayTest >> testDayCreation [

	| otherSunday otherMonday otherTuesday otherWednesday otherThursday otherFriday otherSaturday |

	otherSunday := calendar createSunday.
	otherMonday := calendar createMonday.
	otherTuesday := calendar createTuesday.
	otherWednesday := calendar createWednesday.
	otherThursday := calendar createThursday.
	otherFriday := calendar createFriday.
	otherSaturday := calendar createSaturday.

	self assert: otherSunday name = sunday name.
	self assert: otherSunday positionInWeek = sunday positionInWeek.
	self assert: otherMonday name = monday name.
	self assert: otherMonday positionInWeek = monday positionInWeek.
	self assert: otherThursday name = thursday name.
	self assert: otherThursday positionInWeek = thursday positionInWeek.
	self assert: otherWednesday name = wednesday name.
	self assert: otherWednesday positionInWeek = wednesday positionInWeek.
	self assert: otherTuesday name = tuesday name.
	self assert: otherTuesday positionInWeek = tuesday positionInWeek.
	self assert: otherFriday name = friday name.
	self assert: otherFriday positionInWeek = friday positionInWeek.
	self assert: otherSaturday name = saturday name.
	self assert: otherSaturday positionInWeek = saturday positionInWeek
]

{ #category : #'test accessing' }
JulianDayTest >> testDayPositionedInWeek [

	| day |
	
	day := sunday.
	1 to: 7 do: [:aNumber | 
		self assert: (calendar dayPositionedInWeek: aNumber) = day.
		day := day next].
	self 
		should: [calendar dayPositionedInWeek: 0]
		raise: InvalidDayNumberException
		withExceptionDo: [:anException | 
			self assert: anException description = 'The number 0 is invalid as a day of a week'].
	self 
		should: [calendar dayPositionedInWeek: 8]
		raise: InvalidDayNumberException
		withExceptionDo: [:anException | 
			self assert: anException description = 'The number 8 is invalid as a day of a week']
]

{ #category : #'test querying' }
JulianDayTest >> testDaysFrom [

	self assert: (monday distanceFrom: monday) = zeroDays.
	self assert: (monday distanceFrom: tuesday) = 6 daysMeasure.
	self assert: (monday distanceFrom: wednesday) = 5 daysMeasure.
	self assert: (monday distanceFrom: thursday) = 4 daysMeasure.
	self assert: (monday distanceFrom: friday) = 3 daysMeasure.
	self assert: (monday distanceFrom: saturday) = twoDays.
	self assert: (monday distanceFrom: sunday) = oneDay
]

{ #category : #'test querying' }
JulianDayTest >> testDaysTo [

	self assert: (monday distanceTo: monday) = zeroDays.
	self assert: (monday distanceTo: tuesday) = oneDay.
	self assert: (monday distanceTo: wednesday) = twoDays.
	self assert: (monday distanceTo: thursday) = 3 daysMeasure.
	self assert: (monday distanceTo: friday) = 4 daysMeasure.
	self assert: (monday distanceTo: saturday) = 5 daysMeasure.
	self assert: (monday distanceTo: sunday) = 6 daysMeasure
]

{ #category : #'test comparing' }
JulianDayTest >> testEqual [

	self assert: monday = JulianMonday.
	self assert: tuesday = JulianTuesday.
	self assert: wednesday = JulianWednesday.
	self assert: thursday = JulianThursday.
	self assert: friday = JulianFriday.
	self assert: saturday = JulianSaturday.
	self assert: sunday = JulianSunday
]

{ #category : #'test comparing' }
JulianDayTest >> testHash [

	self assert: monday hash = JulianMonday hash.
	self assert: tuesday hash = JulianTuesday hash.
	self assert: wednesday hash = JulianWednesday hash.
	self assert: thursday hash = JulianThursday hash.
	self assert: friday hash = JulianFriday hash.
	self assert: saturday hash = JulianSaturday hash.
	self assert: sunday hash = JulianSunday hash
]

{ #category : #'test creation' }
JulianDayTest >> testInvalidNameCreation [

	self 
		should: [calendar dayNamed: 'Pedro Duque, otro']
		raise: InvalidDayNameException
		withExceptionDo: [:exception | 
			self assert: exception description = 'The name Pedro Duque, otro is invalid as a day of a week']
]

{ #category : #'test testing' }
JulianDayTest >> testIs [

	self assert: (sunday is: JulianSunday).
	self assert: (monday is: JulianMonday).
	self assert: (tuesday is: JulianTuesday).
	self assert: (wednesday is: JulianWednesday).
	self assert: (thursday is: JulianThursday).
	self assert: (friday is: JulianFriday).
	self assert: (saturday is: JulianSaturday).
	
	self deny: (sunday is: JulianMonday).
	self deny: (monday is: JulianTuesday).
	self deny: (tuesday is: JulianWednesday).
	self deny: (wednesday is: JulianThursday).
	self deny: (thursday is: JulianFriday).
	self deny: (friday is: JulianSaturday).
	self deny: (saturday is: JulianSunday)
]

{ #category : #'test accessing' }
JulianDayTest >> testName [

	self assert: sunday name = 'Sunday'.
	self assert: monday name = 'Monday'.
	self assert: tuesday name = 'Tuesday'.
	self assert: wednesday name = 'Wednesday'.
	self assert: thursday name = 'Thursday'.
	self assert: friday name = 'Friday'.
	self assert: saturday name = 'Saturday'
]

{ #category : #'test enumerating' }
JulianDayTest >> testNext [

	self assert: monday next = tuesday.
	self assert: sunday next = monday.
	self assert: saturday next = sunday
]

{ #category : #'test enumerating' }
JulianDayTest >> testNextInANumberOfDays [

	self assert: (monday next: oneDay) = tuesday.
	self assert: (monday next: twoDays) = wednesday.
	self assert: (monday next: 6 daysMeasure) = sunday.
	self assert: (monday next: sevenDays) = monday.
	self assert: (monday next: 14 daysMeasure) = monday.
	self assert: (sunday next: 21 daysMeasure) = sunday
]

{ #category : #'test accessing' }
JulianDayTest >> testNumberOfDaysSinceFirstDayOfWeek [

	| currentNumberOfDays |

	currentNumberOfDays := zeroDays.
	(sunday to: saturday) do: [:aDay |
		self assert: aDay numberOfDaysSinceFirstDayOfWeek = currentNumberOfDays.
		currentNumberOfDays := currentNumberOfDays + oneDay]
]

{ #category : #'test enumerating' }
JulianDayTest >> testPrevious [

	self assert: monday previous = sunday.
	self assert: tuesday previous = monday
]

{ #category : #'test enumerating' }
JulianDayTest >> testPreviousInANumberOfDays [

	self assert: (monday previous: oneDay) = sunday.
	self assert: (monday previous: twoDays) = saturday.
	self assert: (monday previous: 6 daysMeasure) = tuesday.
	self assert: (monday previous: sevenDays) = monday.
	self assert: (sunday previous: 6 daysMeasure) = monday.
	self assert: (sunday previous: 7 daysMeasure) = sunday.
	self assert: (sunday previous: 14 daysMeasure) = sunday.
	self assert: (saturday previous: 6 daysMeasure) = sunday.
	self assert: (saturday previous: 7 daysMeasure) = saturday.
	self assert: (saturday previous: 14 daysMeasure) = saturday
]

{ #category : #'test printing' }
JulianDayTest >> testPrintString [
	self 
		assert: (Day 
				named: 'One Christian Day Name'
				positionInWeek: 1
				calendar: calendar) printString 
				= 'One Christian Day Name'
]

{ #category : #'test instance creation' }
JulianDayTest >> testSinceSunday [

	| currentDay |

	currentDay := sunday.
	(zeroDays to: 6 daysMeasure) do: [:numberOfDays |
		self assert: (calendar sinceSunday: numberOfDays) = currentDay.
		currentDay := currentDay next]
]

{ #category : #'test interval protocol' }
JulianDayTest >> testTo [

	| interval |

	interval := sunday to: saturday.
	self assert: interval from = sunday.
	self assert: interval to = saturday.
	self assert: interval by = oneDay.
	self assert: interval size = 7
]

{ #category : #'test interval protocol' }
JulianDayTest >> testToBy [

	| interval |

	interval := sunday to: friday by: twoDays.
	self assert: interval from = sunday.
	self assert: interval to = friday.
	self assert: interval by = twoDays.
	self assert: interval last = thursday.
	self assert: interval size = 3
]

{ #category : #'test interval protocol' }
JulianDayTest >> testToDo [

	| interval currentDayNumber |

	currentDayNumber := 2.
	interval := monday to: saturday.
	interval do: [:aDay |
		self assert: aDay positionInWeek = currentDayNumber.
		currentDayNumber := currentDayNumber + 1].

	self assert: currentDayNumber = 8
]

{ #category : #'test interval protocol' }
JulianDayTest >> testToNegativeBy [

	| interval |

	interval := sunday to: monday by: minusOneDay.
	self assert: interval from = sunday.
	self assert: interval to = monday.
	self assert: interval by = minusOneDay.
	self assert: interval size = 7
]

{ #category : #'test interval protocol' }
JulianDayTest >> testToNegativeByDo [

	| interval currentDayNumber |

	currentDayNumber := 7.
	interval := saturday to: sunday by: minusOneDay.
	interval do: [:aDay |
		self assert: aDay positionInWeek = currentDayNumber.
		currentDayNumber := currentDayNumber - 1].

	self assert: currentDayNumber = 0
]

{ #category : #'test creation' }
JulianDayTest >> testValidNameCreation [

	self shouldnt: [calendar dayNamed: 'Monday'] raise: InvalidDayNameException
]
