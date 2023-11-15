Class {
	#name : 'HebrewDayTest',
	#superclass : 'TestCase',
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
	#category : 'Chalten-Hebrew-Calendar-Tests',
	#package : 'Chalten-Hebrew-Calendar-Tests'
}

{ #category : 'accessing' }
HebrewDayTest class >> classUnderTest [

	^Day
]

{ #category : 'initialization' }
HebrewDayTest >> setUp [
	calendar := ChaltenEnvironment calendarNamed: #HebrewCalendar.
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

{ #category : 'test comparing' }
HebrewDayTest >> testComparing [

	self assert: YomRishon < YomShabbat.
	self assert: YomShelishi < YomShishi.
	self deny: YomShabbat < YomRishon.

	self
		should: [ YomRishon > Tishri second ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: Tishri second class
						 with: Tishri second
						 with: YomRishon class
						 with: YomRishon) ].

	self
		should: [ YomShabbat < Tishri ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: YomShabbat class
						 with: YomShabbat
						 with: Tishri class
						 with: Tishri) ]
]

{ #category : 'test instance creation' }
HebrewDayTest >> testCreation [
	self shouldnt: 
			[Day 
				named: 'One Hebrew Day Name'
				positionInWeek: 1
				calendar: calendar]
		raise: Exception
]

{ #category : 'test creation' }
HebrewDayTest >> testDayCreation [

	| otherYomRishon otherYomSheni otherYomShelishi otherYomRevii otherYomHamishi otherYomShishi otherYomShabbat |
	otherYomRishon := calendar createYomRishon.
	otherYomSheni := calendar createYomSheni.
	otherYomShelishi := calendar createYomShelishi.
	otherYomRevii := calendar createYomRevii.
	otherYomHamishi := calendar createYomHamishi.
	otherYomShishi := calendar createYomShishi.
	otherYomShabbat := calendar createYomShabbat.
	self assert: otherYomRishon name equals: yomRishon name.
	self
		assert: otherYomRishon positionInWeek
		equals: yomRishon positionInWeek.
	self assert: otherYomSheni name equals: yomSheni name.
	self
		assert: otherYomSheni positionInWeek
		equals: yomSheni positionInWeek.
	self assert: otherYomShelishi name equals: yomShelishi name.
	self
		assert: otherYomShelishi positionInWeek
		equals: yomShelishi positionInWeek.
	self assert: otherYomRevii name equals: yomRevii name.
	self
		assert: otherYomRevii positionInWeek
		equals: yomRevii positionInWeek.
	self assert: otherYomHamishi name equals: yomHamishi name.
	self
		assert: otherYomHamishi positionInWeek
		equals: yomHamishi positionInWeek.
	self assert: otherYomShishi name equals: yomShishi name.
	self
		assert: otherYomShishi positionInWeek
		equals: yomShishi positionInWeek.
	self assert: otherYomShabbat name equals: yomShabbat name.
	self
		assert: otherYomShabbat positionInWeek
		equals: yomShabbat positionInWeek
]

{ #category : 'test accessing' }
HebrewDayTest >> testDayPositionedInWeek [

	| day |
	day := yomRishon.
	1 to: 7 do: [ :aNumber |
		self assert: (calendar dayPositionedInWeek: aNumber) equals: day.
		day := day next ].
	self
		should: [ calendar dayPositionedInWeek: 0 ]
		raise: InvalidDayNumberException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals: 'The number 0 is invalid as a day of a week' ].
	self
		should: [ calendar dayPositionedInWeek: 8 ]
		raise: InvalidDayNumberException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals: 'The number 8 is invalid as a day of a week' ]
]

{ #category : 'test queying' }
HebrewDayTest >> testDaysFrom [

	self assert: (yomSheni distanceFrom: yomSheni) equals: zeroDays.
	self
		assert: (yomSheni distanceFrom: yomShelishi)
		equals: 6 daysMeasure.
	self assert: (yomSheni distanceFrom: yomRevii) equals: 5 daysMeasure.
	self
		assert: (yomSheni distanceFrom: yomHamishi)
		equals: 4 daysMeasure.
	self assert: (yomSheni distanceFrom: yomShishi) equals: 3 daysMeasure.
	self assert: (yomSheni distanceFrom: yomShabbat) equals: twoDays.
	self assert: (yomSheni distanceFrom: yomRishon) equals: oneDay
]

{ #category : 'test queying' }
HebrewDayTest >> testDaysTo [

	self assert: (yomSheni distanceTo: yomSheni) equals: zeroDays.
	self assert: (yomSheni distanceTo: yomShelishi) equals: oneDay.
	self assert: (yomSheni distanceTo: yomRevii) equals: twoDays.
	self assert: (yomSheni distanceTo: yomHamishi) equals: 3 daysMeasure.
	self assert: (yomSheni distanceTo: yomShishi) equals: 4 daysMeasure.
	self assert: (yomSheni distanceTo: yomShabbat) equals: 5 daysMeasure.
	self assert: (yomSheni distanceTo: yomRishon) equals: 6 daysMeasure
]

{ #category : 'test comparing' }
HebrewDayTest >> testEqual [

	self assert: yomRishon equals: calendar yomRishon.
	self assert: yomSheni equals: calendar yomSheni.
	self assert: yomShelishi equals: calendar yomShelishi.
	self assert: yomRevii equals: calendar yomRevii.
	self assert: yomHamishi equals: calendar yomHamishi.
	self assert: yomShishi equals: calendar yomShishi.
	self assert: yomShabbat equals: calendar yomShabbat
]

{ #category : 'test comparing' }
HebrewDayTest >> testHash [

	self assert: yomRishon hash equals: calendar yomRishon hash.
	self assert: yomSheni hash equals: calendar yomSheni hash.
	self assert: yomShelishi hash equals: calendar yomShelishi hash.
	self assert: yomRevii hash equals: calendar yomRevii hash.
	self assert: yomHamishi hash equals: calendar yomHamishi hash.
	self assert: yomShishi hash equals: calendar yomShishi hash.
	self assert: yomShabbat hash equals: calendar yomShabbat hash
]

{ #category : 'test creation' }
HebrewDayTest >> testInvalidNameCreation [

	self
		should: [ calendar dayNamed: 'Pedro Duque, otro' ]
		raise: InvalidDayNameException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals: 'The name Pedro Duque, otro is invalid as a day of a week' ]
]

{ #category : 'test testing' }
HebrewDayTest >> testIs [

	self assert: (yomRishon is: YomRishon).
	self assert: (yomSheni is: YomSheni).
	self assert: (yomShelishi is: YomShelishi).
	self assert: (yomRevii is: YomRevii).
	self assert: (yomHamishi is: YomHamishi).
	self assert: (yomShishi is: YomShishi).
	self assert: (yomShabbat is: YomShabbat)
]

{ #category : 'test accessing' }
HebrewDayTest >> testName [

	self assert: yomRishon name equals: 'yom rishon'.
	self assert: yomSheni name equals: 'yom sheni'.
	self assert: yomShelishi name equals: 'yom shelishi'.
	self assert: yomRevii name equals: 'yom revi`i'.
	self assert: yomHamishi name equals: 'yom hamishi'.
	self assert: yomShishi name equals: 'yom shishi'.
	self assert: yomShabbat name equals: 'yom shabbat'
]

{ #category : 'test enumerating' }
HebrewDayTest >> testNext [

	self assert: yomRishon next equals: yomSheni.
	self assert: yomSheni next equals: yomShelishi.
	self assert: yomShelishi next equals: yomRevii.
	self assert: yomRevii next equals: yomHamishi.
	self assert: yomHamishi next equals: yomShishi.
	self assert: yomShishi next equals: yomShabbat.
	self assert: yomShabbat next equals: yomRishon
]

{ #category : 'test enumerating' }
HebrewDayTest >> testNextInANumberOfDays [

	self assert: (yomSheni next: oneDay) equals: yomShelishi.
	self assert: (yomSheni next: twoDays) equals: yomRevii.
	self assert: (yomSheni next: 6 daysMeasure) equals: yomRishon.
	self assert: (yomSheni next: sevenDays) equals: yomSheni.
	self assert: (yomSheni next: 14 daysMeasure) equals: yomSheni.
	self assert: (yomRishon next: 21 daysMeasure) equals: yomRishon
]

{ #category : 'test accessing' }
HebrewDayTest >> testNumberOfDaysSinceFirstDayOfWeek [

	| currentNumberOfDays |
	currentNumberOfDays := zeroDays.
	(yomRishon to: yomShabbat) do: [ :aDay |
		self
			assert: aDay numberOfDaysSinceFirstDayOfWeek
			equals: currentNumberOfDays.
		currentNumberOfDays := currentNumberOfDays + oneDay ]
]

{ #category : 'test enumerating' }
HebrewDayTest >> testPrevious [

	self assert: yomRishon previous equals: yomShabbat.
	self assert: yomSheni previous equals: yomRishon.
	self assert: yomShelishi previous equals: yomSheni.
	self assert: yomRevii previous equals: yomShelishi.
	self assert: yomHamishi previous equals: yomRevii.
	self assert: yomShishi previous equals: yomHamishi.
	self assert: yomShabbat previous equals: yomShishi
]

{ #category : 'test enumerating' }
HebrewDayTest >> testPreviousInANumberOfDays [

	self assert: (yomSheni previous: oneDay) equals: yomRishon.
	self assert: (yomSheni previous: twoDays) equals: yomShabbat.
	self assert: (yomSheni previous: 6 daysMeasure) equals: yomShelishi.
	self assert: (yomSheni previous: sevenDays) equals: yomSheni.
	self assert: (yomRishon previous: 6 daysMeasure) equals: yomSheni.
	self assert: (yomRishon previous: 7 daysMeasure) equals: yomRishon.
	self assert: (yomRishon previous: 14 daysMeasure) equals: yomRishon.
	self assert: (yomShabbat previous: 6 daysMeasure) equals: yomRishon.
	self assert: (yomShabbat previous: 7 daysMeasure) equals: yomShabbat.
	self assert: (yomShabbat previous: 14 daysMeasure) equals: yomShabbat
]

{ #category : 'test printing' }
HebrewDayTest >> testPrintString [

	self
		assert:
			(Day
				 named: 'One Hebrew Day Name'
				 positionInWeek: 1
				 calendar: calendar) printString
		equals: 'One Hebrew Day Name'
]

{ #category : 'test instance creation' }
HebrewDayTest >> testSinceYomRishon [

	| currentDay |
	currentDay := yomRishon.
	(zeroDays to: 6 daysMeasure) do: [ :aNumberOfDays |
		self
			assert: (calendar sinceYomRishon: aNumberOfDays)
			equals: currentDay.
		currentDay := currentDay next ]
]

{ #category : 'test interval protocol' }
HebrewDayTest >> testTo [

	| interval |
	interval := yomRishon to: yomShabbat.
	self assert: interval from equals: yomRishon.
	self assert: interval to equals: yomShabbat.
	self assert: interval by equals: oneDay.
	self assert: interval size equals: 7
]

{ #category : 'test interval protocol' }
HebrewDayTest >> testToBy [

	| interval |
	interval := yomRishon to: yomShishi by: twoDays.
	self assert: interval from equals: yomRishon.
	self assert: interval to equals: yomShishi.
	self assert: interval by equals: twoDays.
	self assert: interval last equals: yomHamishi.
	self assert: interval size equals: 3
]

{ #category : 'test interval protocol' }
HebrewDayTest >> testToDo [

	| interval currentDayNumber |
	currentDayNumber := 2.
	interval := yomSheni to: yomShabbat.
	interval do: [ :day |
		self assert: day positionInWeek equals: currentDayNumber.
		currentDayNumber := currentDayNumber + 1 ].
	self assert: currentDayNumber equals: 8
]

{ #category : 'test interval protocol' }
HebrewDayTest >> testToNegativeBy [

	| interval |
	interval := yomRishon to: yomSheni by: minusOneDay.
	self assert: interval from equals: yomRishon.
	self assert: interval to equals: yomSheni.
	self assert: interval by equals: minusOneDay.
	self assert: interval size equals: 7
]

{ #category : 'test interval protocol' }
HebrewDayTest >> testToNegativeByDo [

	| interval currentDayNumber |
	currentDayNumber := 7.
	interval := yomShabbat to: yomRishon by: minusOneDay.
	interval do: [ :day |
		self assert: day positionInWeek equals: currentDayNumber.
		currentDayNumber := currentDayNumber - 1 ].
	self assert: currentDayNumber equals: 0
]

{ #category : 'test creation' }
HebrewDayTest >> testValidNameCreation [

	self shouldnt: [calendar dayNamed: 'yom shishi'] raise: InvalidDayNameException
]
