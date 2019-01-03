Class {
	#name : #IslamicDayTest,
	#superclass : #TestCase,
	#instVars : [
		'yaumAlAhad',
		'zeroDays',
		'calendar',
		'yaumAlIthnayna',
		'yaumAthThalatha',
		'yaumAlArbaa',
		'yaumAlHamis',
		'yaumAlJuma',
		'yaumAsSabt',
		'oneDay',
		'twoDays',
		'sevenDays',
		'minusOneDay'
	],
	#category : #'Chalten-Islamic-Calendar-Tests'
}

{ #category : #accessing }
IslamicDayTest class >> classUnderTest [

	^Day
]

{ #category : #initialization }
IslamicDayTest >> setUp [
	calendar := IslamicCalendar.
	yaumAlAhad := calendar yaumAlAhad.
	yaumAlIthnayna := calendar yaumAlIthnayna.
	yaumAthThalatha := calendar yaumAthThalatha.
	yaumAlArbaa := calendar yaumAlArbaa.
	yaumAlHamis := calendar yaumAlHamis.
	yaumAlJuma := calendar yaumAlJuma.
	yaumAsSabt := calendar yaumAsSabt.
	zeroDays := 0 daysMeasure.
	oneDay := 1 dayMeasure.
	twoDays := 2 daysMeasure.
	sevenDays := 7 daysMeasure.
	minusOneDay := -1 dayMeasure
]

{ #category : #'test comparing' }
IslamicDayTest >> testComparing [

	self assert: YaumAlAhad < YaumAsSabt.
	self assert: YaumAthThalatha < YaumAlHamis.
	self deny: YaumAsSabt < YaumAlAhad.
	
	self should: [ YaumAlAhad > JumadaI second ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: JumadaI second class
				with: JumadaI second
				with: YaumAlAhad class
				with: YaumAlAhad) ].
	
	self should: [ YomShabbat < JumadaI ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: YomShabbat class
				with: YomShabbat
				with: JumadaI class
				with: JumadaI) ]
]

{ #category : #'test instance creation' }
IslamicDayTest >> testCreation [
	self shouldnt: 
			[Day 
				named: 'One Islamic Day Name'
				positionInWeek: 1
				calendar: calendar]
		raise: Exception
]

{ #category : #'test creation' }
IslamicDayTest >> testDayCreation [

	| otherYaumAlAhad otherYaumAlIthnayna otherYaumAthThalatha otherYaumAlArbaa otherYaumAlHamis otherYaumAlJuma otherYaumAsSabt |

	otherYaumAlAhad := IslamicCalendar createYaumAlAhad.
	otherYaumAlIthnayna := IslamicCalendar createYaumAlIthnayna.
	otherYaumAthThalatha:= IslamicCalendar createYaumAthThalatha.
	otherYaumAlArbaa := IslamicCalendar createYaumAlArbaa.
	otherYaumAlHamis := IslamicCalendar createYaumAlHamis.
	otherYaumAlJuma := IslamicCalendar createYaumAlJuma.
	otherYaumAsSabt := IslamicCalendar createYaumAsSabt.

	self assert: otherYaumAlAhad name = yaumAlAhad name.
	self assert: otherYaumAlAhad positionInWeek = yaumAlAhad positionInWeek.
	self assert: otherYaumAlIthnayna name = yaumAlIthnayna name.
	self assert: otherYaumAlIthnayna positionInWeek = yaumAlIthnayna positionInWeek.
	self assert: otherYaumAthThalatha name = yaumAthThalatha name.
	self assert: otherYaumAthThalatha positionInWeek = yaumAthThalatha positionInWeek.
	self assert: otherYaumAlArbaa name = yaumAlArbaa name.
	self assert: otherYaumAlArbaa positionInWeek = yaumAlArbaa positionInWeek.
	self assert: otherYaumAlHamis name = yaumAlHamis name.
	self assert: otherYaumAlHamis positionInWeek = yaumAlHamis positionInWeek.
	self assert: otherYaumAlJuma name = yaumAlJuma name.
	self assert: otherYaumAlJuma positionInWeek = yaumAlJuma positionInWeek.
	self assert: otherYaumAsSabt name = yaumAsSabt name.
	self assert: otherYaumAsSabt positionInWeek = yaumAsSabt positionInWeek
]

{ #category : #'test accessing' }
IslamicDayTest >> testDayPositionedInWeek [

	| day |

	day := yaumAlAhad.
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

{ #category : #'test queying' }
IslamicDayTest >> testDaysFrom [
	self assert: (yaumAlIthnayna distanceFrom: yaumAlIthnayna) = zeroDays.
	self assert: (yaumAlIthnayna distanceFrom: yaumAthThalatha) = 6 daysMeasure.
	self assert: (yaumAlIthnayna distanceFrom: yaumAlArbaa) = 5 daysMeasure.
	self assert: (yaumAlIthnayna distanceFrom: yaumAlHamis) = 4 daysMeasure.
	self assert: (yaumAlIthnayna distanceFrom: yaumAlJuma) = 3 daysMeasure.
	self assert: (yaumAlIthnayna distanceFrom: yaumAsSabt) = twoDays.
	self assert: (yaumAlIthnayna distanceFrom: yaumAlAhad) = oneDay
]

{ #category : #'test queying' }
IslamicDayTest >> testDaysTo [
	self assert: (yaumAlIthnayna distanceTo: yaumAlIthnayna) = zeroDays.
	self assert: (yaumAlIthnayna distanceTo: yaumAthThalatha) = oneDay.
	self assert: (yaumAlIthnayna distanceTo: yaumAlArbaa) = twoDays.
	self assert: (yaumAlIthnayna distanceTo: yaumAlHamis) = 3 daysMeasure.
	self assert: (yaumAlIthnayna distanceTo: yaumAlJuma) = 4 daysMeasure.
	self assert: (yaumAlIthnayna distanceTo: yaumAsSabt) = 5 daysMeasure.
	self assert: (yaumAlIthnayna distanceTo: yaumAlAhad) = 6 daysMeasure
]

{ #category : #'test comparing' }
IslamicDayTest >> testEqual [

	self assert: yaumAlAhad = calendar yaumAlAhad.
	self assert: yaumAlIthnayna = calendar yaumAlIthnayna.
	self assert: yaumAthThalatha = calendar yaumAthThalatha.
	self assert: yaumAlArbaa = calendar yaumAlArbaa.
	self assert: yaumAlHamis = calendar yaumAlHamis.
	self assert: yaumAlJuma = calendar yaumAlJuma.
	self assert: yaumAsSabt = calendar yaumAsSabt
]

{ #category : #'test comparing' }
IslamicDayTest >> testHash [

	self assert: yaumAlAhad hash = calendar yaumAlAhad hash.
	self assert: yaumAlIthnayna hash = calendar yaumAlIthnayna hash.
	self assert: yaumAthThalatha hash = calendar yaumAthThalatha hash.
	self assert: yaumAlArbaa hash = calendar yaumAlArbaa hash.
	self assert: yaumAlHamis hash = calendar yaumAlHamis hash.
	self assert: yaumAlJuma hash = calendar yaumAlJuma hash.
	self assert: yaumAsSabt hash = calendar yaumAsSabt hash 
]

{ #category : #'test creation' }
IslamicDayTest >> testInvalidNameCreation [

	self 
		should: [calendar dayNamed: 'Pedro Duque, otro']
		raise: InvalidDayNameException
		withExceptionDo: [:exception | 
			self assert: exception description = 'The name Pedro Duque, otro is invalid as a day of a week']
]

{ #category : #'test testing' }
IslamicDayTest >> testIs [
	
	self assert: (yaumAlAhad is: YaumAlAhad).
	self assert: (yaumAlIthnayna is: YaumAlIthnayna).
	self assert: (yaumAthThalatha is: YaumAthThalatha).
	self assert: (yaumAlArbaa is: YaumAlArbaa).
	self assert: (yaumAlHamis is: YaumAlHamis).
	self assert: (yaumAlJuma is: YaumAlJuma).
	self assert: (yaumAsSabt is: YaumAsSabt)
]

{ #category : #'test accessing' }
IslamicDayTest >> testName [

	self assert: yaumAlAhad name = 'yaum al-ahad'.
	self assert: yaumAlIthnayna name = 'yaum al-ithnayna'.
	self assert: yaumAthThalatha name = 'yaum ath-thalatha'.
	self assert: yaumAlArbaa name = 'yaum al-arba`a`'.
	self assert: yaumAlHamis name = 'yaum al-hamis'.
	self assert: yaumAlJuma name = 'yaum al-jum`a'.
	self assert: yaumAsSabt name = 'yaum as-sabt'
]

{ #category : #'test enumerating' }
IslamicDayTest >> testNext [

	self assert: yaumAlAhad next = yaumAlIthnayna.
	self assert: yaumAlIthnayna next = yaumAthThalatha.
	self assert: yaumAthThalatha next = yaumAlArbaa.
	self assert: yaumAlArbaa next = yaumAlHamis.
	self assert: yaumAlHamis next = yaumAlJuma.
	self assert: yaumAlJuma next = yaumAsSabt.
	self assert: yaumAsSabt next = yaumAlAhad
]

{ #category : #'test enumerating' }
IslamicDayTest >> testNextInANumberOfDays [
	self assert: (yaumAlIthnayna next: oneDay) = yaumAthThalatha.
	self assert: (yaumAlIthnayna next: twoDays) = yaumAlArbaa.
	self assert: (yaumAlIthnayna next: 6 daysMeasure) = yaumAlAhad.
	self assert: (yaumAlIthnayna next: sevenDays) = yaumAlIthnayna.
	self assert: (yaumAlIthnayna next: 14 daysMeasure) = yaumAlIthnayna.
	self assert: (yaumAlAhad next: 21 daysMeasure) = yaumAlAhad
]

{ #category : #'test accessing' }
IslamicDayTest >> testNumberOfDaysSinceFirstDayOfWeek [

	| currentNumberOfDays |

	currentNumberOfDays := zeroDays.
	(yaumAlAhad to: yaumAsSabt) do: [:aDay |
		self assert: aDay numberOfDaysSinceFirstDayOfWeek = currentNumberOfDays.
		currentNumberOfDays := currentNumberOfDays + oneDay]
]

{ #category : #'test enumerating' }
IslamicDayTest >> testPrevious [

	self assert: yaumAlAhad previous = yaumAsSabt.
	self assert: yaumAlIthnayna previous = yaumAlAhad.
	self assert: yaumAthThalatha previous = yaumAlIthnayna.
	self assert: yaumAlArbaa previous = yaumAthThalatha.
	self assert: yaumAlHamis previous = yaumAlArbaa.
	self assert: yaumAlJuma previous = yaumAlHamis.
	self assert: yaumAsSabt previous = yaumAlJuma
]

{ #category : #'test enumerating' }
IslamicDayTest >> testPreviousInANumberOfDays [
	self assert: (yaumAlIthnayna previous: oneDay) = yaumAlAhad.
	self assert: (yaumAlIthnayna previous: twoDays) = yaumAsSabt.
	self assert: (yaumAlIthnayna previous: 6 daysMeasure) = yaumAthThalatha.
	self assert: (yaumAlIthnayna previous: sevenDays) = yaumAlIthnayna.
	self assert: (yaumAlAhad previous: 6 daysMeasure) = yaumAlIthnayna.
	self assert: (yaumAlAhad previous: 7 daysMeasure) = yaumAlAhad.
	self assert: (yaumAlAhad previous: 14 daysMeasure) = yaumAlAhad.
	self assert: (yaumAsSabt previous: 6 daysMeasure) = yaumAlAhad.
	self assert: (yaumAsSabt previous: 7 daysMeasure) = yaumAsSabt.
	self assert: (yaumAsSabt previous: 14 daysMeasure) = yaumAsSabt
]

{ #category : #'test printing' }
IslamicDayTest >> testPrintString [
	self 
		assert: (Day 
				named: 'One Christian Day Name'
				positionInWeek: 1
				calendar: calendar) printString 
				= 'One Christian Day Name'
]

{ #category : #'test instance creation' }
IslamicDayTest >> testSinceYaumAlAhad [
	| currentDay |
	currentDay := yaumAlAhad.
	(zeroDays to: 6 daysMeasure)
		do: [ :aNumberOfDays | 
			self assert: (calendar sinceYaumAlAhad: aNumberOfDays) = currentDay.
			currentDay := currentDay next ]
]

{ #category : #'test interval protocol' }
IslamicDayTest >> testTo [

	| interval |

	interval := yaumAlAhad to: yaumAsSabt.
	self assert: interval from = yaumAlAhad.
	self assert: interval to = yaumAsSabt.
	self assert: interval by = oneDay.
	self assert: interval size = 7
]

{ #category : #'test interval protocol' }
IslamicDayTest >> testToBy [

	| interval |

	interval := yaumAlAhad to: yaumAlJuma by: twoDays.
	self assert: interval from = yaumAlAhad.
	self assert: interval to = yaumAlJuma.
	self assert: interval by = twoDays.
	self assert: interval last = yaumAlHamis.
	self assert: interval size = 3
]

{ #category : #'test interval protocol' }
IslamicDayTest >> testToDo [

	| interval currentDayNumber |

	currentDayNumber := 2.
	interval := yaumAlIthnayna to: yaumAsSabt.
	interval do: [:aDay |
		self assert: aDay positionInWeek = currentDayNumber.
		currentDayNumber := currentDayNumber + 1].

	self assert: currentDayNumber = 8
]

{ #category : #'test interval protocol' }
IslamicDayTest >> testToNegativeBy [

	| interval |

	interval := yaumAlAhad to: yaumAlIthnayna by: minusOneDay.
	self assert: interval from = yaumAlAhad.
	self assert: interval to = yaumAlIthnayna.
	self assert: interval by = minusOneDay.
	self assert: interval size = 7
]

{ #category : #'test interval protocol' }
IslamicDayTest >> testToNegativeByDo [

	| interval currentDayNumber |

	currentDayNumber := 7.
	interval := yaumAsSabt to: yaumAlAhad by: minusOneDay.
	interval do: [:aDay |
		self assert: aDay positionInWeek = currentDayNumber.
		currentDayNumber := currentDayNumber - 1].

	self assert: currentDayNumber = 0
]

{ #category : #'test creation' }
IslamicDayTest >> testValidNameCreation [

	self shouldnt: [calendar dayNamed: 'yaum al-ithnayna'] raise: InvalidDayNameException
]
