Class {
	#name : #HebrewDayTest,
	#superclass : #TestCase,
	#instVars : [
		'calendar',
		'yomRishon',
		'yomSheni',
		'yomShelishi',
		'yomRevii',
		'yomHamishi',
		'yomShishi',
		'yomShabbat',
		'zeroDays',
		'oneDay',
		'twoDays',
		'sevenDays',
		'minusOneDay'
	],
	#category : #'Chalten-Hebrew-Calendar-Tests'
}

{ #category : #accessing }
HebrewDayTest class >> classUnderTest [

	^Day
]

{ #category : #initialization }
HebrewDayTest >> setUp [
	calendar := HebrewCalendar.
	yomRishon := calendar yomRishon.
	yomSheni := calendar yomSheni.
	yomShelishi := calendar yomShelishi.
	yomRevii := calendar yomRevii.
	yomHamishi := calendar yomHamishi.
	yomShishi := calendar yomShishi.
	yomShabbat := calendar yomShabbat.
	zeroDays := 0 daysMeasure.
	oneDay := 1 dayMeasure.
	twoDays := 2 daysMeasure.
	sevenDays := 7 daysMeasure.
	minusOneDay := -1 dayMeasure
]

{ #category : #'test comparing' }
HebrewDayTest >> testComparing [

	self assert: YomRishon < YomShabbat.
	self assert: YomShelishi < YomShishi.
	self deny: YomShabbat < YomRishon.
	
	self should: [ YomRishon > Tishri second ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: Tishri second class
				with: Tishri second
				with: YomRishon class
				with: YomRishon) ].
	
	self should: [ YomShabbat < Tishri ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: YomShabbat class
				with: YomShabbat
				with: Tishri class
				with: Tishri) ]
]

{ #category : #'test instance creation' }
HebrewDayTest >> testCreation [
	self shouldnt: 
			[Day 
				named: 'One Hebrew Day Name'
				positionInWeek: 1
				calendar: calendar]
		raise: Exception
]

{ #category : #'test creation' }
HebrewDayTest >> testDayCreation [

	| otherYomRishon otherYomSheni otherYomShelishi otherYomRevii otherYomHamishi otherYomShishi otherYomShabbat |

	otherYomRishon := calendar createYomRishon.
	otherYomSheni := calendar createYomSheni.
	otherYomShelishi := calendar createYomShelishi.
	otherYomRevii := calendar createYomRevii.
	otherYomHamishi := calendar createYomHamishi.
	otherYomShishi := calendar createYomShishi.
	otherYomShabbat := calendar createYomShabbat.

	self assert: otherYomRishon name = yomRishon name.
	self assert: otherYomRishon positionInWeek = yomRishon positionInWeek.
	self assert: otherYomSheni name = yomSheni name.
	self assert: otherYomSheni positionInWeek = yomSheni positionInWeek.
	self assert: otherYomShelishi name = yomShelishi name.
	self assert: otherYomShelishi positionInWeek = yomShelishi positionInWeek.
	self assert: otherYomRevii name = yomRevii name.
	self assert: otherYomRevii positionInWeek = yomRevii positionInWeek.
	self assert: otherYomHamishi name = yomHamishi name.
	self assert: otherYomHamishi positionInWeek = yomHamishi positionInWeek.
	self assert: otherYomShishi name = yomShishi name.
	self assert: otherYomShishi positionInWeek = yomShishi positionInWeek.
	self assert: otherYomShabbat name = yomShabbat name.
	self assert: otherYomShabbat positionInWeek = yomShabbat positionInWeek
]

{ #category : #'test accessing' }
HebrewDayTest >> testDayPositionedInWeek [

	| day |

	day := yomRishon.
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
HebrewDayTest >> testDaysFrom [
	self assert: (yomSheni distanceFrom: yomSheni) = zeroDays.
	self assert: (yomSheni distanceFrom: yomShelishi) = 6 daysMeasure.
	self assert: (yomSheni distanceFrom: yomRevii) = 5 daysMeasure.
	self assert: (yomSheni distanceFrom: yomHamishi) = 4 daysMeasure.
	self assert: (yomSheni distanceFrom: yomShishi) = 3 daysMeasure.
	self assert: (yomSheni distanceFrom: yomShabbat) = twoDays.
	self assert: (yomSheni distanceFrom: yomRishon) = oneDay
]

{ #category : #'test queying' }
HebrewDayTest >> testDaysTo [
	self assert: (yomSheni distanceTo: yomSheni) = zeroDays.
	self assert: (yomSheni distanceTo: yomShelishi) = oneDay.
	self assert: (yomSheni distanceTo: yomRevii) = twoDays.
	self assert: (yomSheni distanceTo: yomHamishi) = 3 daysMeasure.
	self assert: (yomSheni distanceTo: yomShishi) = 4 daysMeasure.
	self assert: (yomSheni distanceTo: yomShabbat) = 5 daysMeasure.
	self assert: (yomSheni distanceTo: yomRishon) = 6 daysMeasure
]

{ #category : #'test comparing' }
HebrewDayTest >> testEqual [

	self assert: yomRishon = calendar yomRishon.
	self assert: yomSheni = calendar yomSheni.
	self assert: yomShelishi = calendar yomShelishi.
	self assert: yomRevii = calendar yomRevii.
	self assert: yomHamishi = calendar yomHamishi.
	self assert: yomShishi = calendar yomShishi.
	self assert: yomShabbat = calendar yomShabbat
]

{ #category : #'test comparing' }
HebrewDayTest >> testHash [

	self assert: yomRishon hash = calendar yomRishon hash.
	self assert: yomSheni hash = calendar yomSheni hash.
	self assert: yomShelishi hash = calendar yomShelishi hash.
	self assert: yomRevii hash = calendar yomRevii hash.
	self assert: yomHamishi hash = calendar yomHamishi hash.
	self assert: yomShishi hash = calendar yomShishi hash.
	self assert: yomShabbat hash = calendar yomShabbat hash
]

{ #category : #'test creation' }
HebrewDayTest >> testInvalidNameCreation [

	self 
		should: [calendar dayNamed: 'Pedro Duque, otro']
		raise: InvalidDayNameException
		withExceptionDo: [:exception | 
			self assert: exception description = 'The name Pedro Duque, otro is invalid as a day of a week']
]

{ #category : #'test testing' }
HebrewDayTest >> testIs [

	self assert: (yomRishon is: YomRishon).
	self assert: (yomSheni is: YomSheni).
	self assert: (yomShelishi is: YomShelishi).
	self assert: (yomRevii is: YomRevii).
	self assert: (yomHamishi is: YomHamishi).
	self assert: (yomShishi is: YomShishi).
	self assert: (yomShabbat is: YomShabbat)
]

{ #category : #'test accessing' }
HebrewDayTest >> testName [

	self assert: yomRishon name = 'yom rishon'.
	self assert: yomSheni name = 'yom sheni'.
	self assert: yomShelishi name = 'yom shelishi'.
	self assert: yomRevii name = 'yom revi`i'.
	self assert: yomHamishi name = 'yom hamishi'.
	self assert: yomShishi name = 'yom shishi'.
	self assert: yomShabbat name = 'yom shabbat'
]

{ #category : #'test enumerating' }
HebrewDayTest >> testNext [

	self assert: yomRishon next = yomSheni.
	self assert: yomSheni next = yomShelishi.
	self assert: yomShelishi next = yomRevii.
	self assert: yomRevii next = yomHamishi.
	self assert: yomHamishi next = yomShishi.
	self assert: yomShishi next = yomShabbat.
	self assert: yomShabbat next = yomRishon
]

{ #category : #'test enumerating' }
HebrewDayTest >> testNextInANumberOfDays [
	self assert: (yomSheni next: oneDay) = yomShelishi.
	self assert: (yomSheni next: twoDays) = yomRevii.
	self assert: (yomSheni next: 6 daysMeasure) = yomRishon.
	self assert: (yomSheni next: sevenDays) = yomSheni.
	self assert: (yomSheni next: 14 daysMeasure) = yomSheni.
	self assert: (yomRishon next: 21 daysMeasure) = yomRishon
]

{ #category : #'test accessing' }
HebrewDayTest >> testNumberOfDaysSinceFirstDayOfWeek [

	| currentNumberOfDays |

	currentNumberOfDays := zeroDays.
	(yomRishon to: yomShabbat) do: [:aDay |
		self assert: aDay numberOfDaysSinceFirstDayOfWeek = currentNumberOfDays.
		currentNumberOfDays := currentNumberOfDays + oneDay]
]

{ #category : #'test enumerating' }
HebrewDayTest >> testPrevious [

	self assert: yomRishon previous = yomShabbat.
	self assert: yomSheni previous = yomRishon.
	self assert: yomShelishi previous = yomSheni.
	self assert: yomRevii previous = yomShelishi.
	self assert: yomHamishi previous = yomRevii.
	self assert: yomShishi previous = yomHamishi.
	self assert: yomShabbat previous = yomShishi
]

{ #category : #'test enumerating' }
HebrewDayTest >> testPreviousInANumberOfDays [
	self assert: (yomSheni previous: oneDay) = yomRishon.
	self assert: (yomSheni previous: twoDays) = yomShabbat.
	self assert: (yomSheni previous: 6 daysMeasure) = yomShelishi.
	self assert: (yomSheni previous: sevenDays) = yomSheni.
	self assert: (yomRishon previous: 6 daysMeasure) = yomSheni.
	self assert: (yomRishon previous: 7 daysMeasure) = yomRishon.
	self assert: (yomRishon previous: 14 daysMeasure) = yomRishon.
	self assert: (yomShabbat previous: 6 daysMeasure) = yomRishon.
	self assert: (yomShabbat previous: 7 daysMeasure) = yomShabbat.
	self assert: (yomShabbat previous: 14 daysMeasure) = yomShabbat
]

{ #category : #'test printing' }
HebrewDayTest >> testPrintString [
	self 
		assert: (Day 
				named: 'One Hebrew Day Name'
				positionInWeek: 1
				calendar: calendar) printString 
				= 'One Hebrew Day Name'
]

{ #category : #'test instance creation' }
HebrewDayTest >> testSinceYomRishon [
	| currentDay |
	currentDay := yomRishon.
	(zeroDays to: 6 daysMeasure)
		do: [ :aNumberOfDays | 
			self assert: (calendar sinceYomRishon: aNumberOfDays) = currentDay.
			currentDay := currentDay next ]
]

{ #category : #'test interval protocol' }
HebrewDayTest >> testTo [

	| interval |

	interval := yomRishon to: yomShabbat.
	self assert: interval from = yomRishon.
	self assert: interval to = yomShabbat.
	self assert: interval by = oneDay.
	self assert: interval size = 7
]

{ #category : #'test interval protocol' }
HebrewDayTest >> testToBy [

	| interval |

	interval := yomRishon to: yomShishi by: twoDays.
	self assert: interval from = yomRishon.
	self assert: interval to = yomShishi.
	self assert: interval by = twoDays.
	self assert: interval last = yomHamishi.
	self assert: interval size = 3
]

{ #category : #'test interval protocol' }
HebrewDayTest >> testToDo [

	| interval currentDayNumber |

	currentDayNumber := 2.
	interval := yomSheni to: yomShabbat.
	interval do: [:day |
		self assert: day positionInWeek = currentDayNumber.
		currentDayNumber := currentDayNumber + 1].

	self assert: currentDayNumber = 8
]

{ #category : #'test interval protocol' }
HebrewDayTest >> testToNegativeBy [

	| interval |

	interval := yomRishon to: yomSheni by: minusOneDay.
	self assert: interval from = yomRishon.
	self assert: interval to = yomSheni.
	self assert: interval by = minusOneDay.
	self assert: interval size = 7
]

{ #category : #'test interval protocol' }
HebrewDayTest >> testToNegativeByDo [

	| interval currentDayNumber |

	currentDayNumber := 7.
	interval := yomShabbat to: yomRishon by: minusOneDay.
	interval do: [:day |
		self assert: day positionInWeek = currentDayNumber.
		currentDayNumber := currentDayNumber - 1].

	self assert: currentDayNumber = 0
]

{ #category : #'test creation' }
HebrewDayTest >> testValidNameCreation [

	self shouldnt: [calendar dayNamed: 'yom shishi'] raise: InvalidDayNameException
]
