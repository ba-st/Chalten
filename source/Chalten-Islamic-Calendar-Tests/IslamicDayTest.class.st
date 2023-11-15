Class {
	#name : 'IslamicDayTest',
	#superclass : 'TestCase',
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
	#category : 'Chalten-Islamic-Calendar-Tests',
	#package : 'Chalten-Islamic-Calendar-Tests'
}

{ #category : 'accessing' }
IslamicDayTest class >> classUnderTest [

	^Day
]

{ #category : 'initialization' }
IslamicDayTest >> setUp [
	calendar := ChaltenEnvironment calendarNamed: #IslamicCalendar.
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

{ #category : 'test comparing' }
IslamicDayTest >> testComparing [

	self assert: YaumAlAhad < YaumAsSabt.
	self assert: YaumAthThalatha < YaumAlHamis.
	self deny: YaumAsSabt < YaumAlAhad.

	self
		should: [ YaumAlAhad > JumadaI second ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: JumadaI second class
						 with: JumadaI second
						 with: YaumAlAhad class
						 with: YaumAlAhad) ].

	self
		should: [ YomShabbat < JumadaI ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: YomShabbat class
						 with: YomShabbat
						 with: JumadaI class
						 with: JumadaI) ]
]

{ #category : 'test instance creation' }
IslamicDayTest >> testCreation [
	self shouldnt: 
			[Day 
				named: 'One Islamic Day Name'
				positionInWeek: 1
				calendar: calendar]
		raise: Exception
]

{ #category : 'test creation' }
IslamicDayTest >> testDayCreation [

	| islamicCalendar otherYaumAlAhad otherYaumAlIthnayna otherYaumAthThalatha otherYaumAlArbaa otherYaumAlHamis otherYaumAlJuma otherYaumAsSabt |
	islamicCalendar := ChaltenEnvironment calendarNamed: #IslamicCalendar.

	otherYaumAlAhad := islamicCalendar createYaumAlAhad.
	otherYaumAlIthnayna := islamicCalendar createYaumAlIthnayna.
	otherYaumAthThalatha := islamicCalendar createYaumAthThalatha.
	otherYaumAlArbaa := islamicCalendar createYaumAlArbaa.
	otherYaumAlHamis := islamicCalendar createYaumAlHamis.
	otherYaumAlJuma := islamicCalendar createYaumAlJuma.
	otherYaumAsSabt := islamicCalendar createYaumAsSabt.
	self assert: otherYaumAlAhad name equals: yaumAlAhad name.
	self
		assert: otherYaumAlAhad positionInWeek
		equals: yaumAlAhad positionInWeek.
	self assert: otherYaumAlIthnayna name equals: yaumAlIthnayna name.
	self
		assert: otherYaumAlIthnayna positionInWeek
		equals: yaumAlIthnayna positionInWeek.
	self assert: otherYaumAthThalatha name equals: yaumAthThalatha name.
	self
		assert: otherYaumAthThalatha positionInWeek
		equals: yaumAthThalatha positionInWeek.
	self assert: otherYaumAlArbaa name equals: yaumAlArbaa name.
	self
		assert: otherYaumAlArbaa positionInWeek
		equals: yaumAlArbaa positionInWeek.
	self assert: otherYaumAlHamis name equals: yaumAlHamis name.
	self
		assert: otherYaumAlHamis positionInWeek
		equals: yaumAlHamis positionInWeek.
	self assert: otherYaumAlJuma name equals: yaumAlJuma name.
	self
		assert: otherYaumAlJuma positionInWeek
		equals: yaumAlJuma positionInWeek.
	self assert: otherYaumAsSabt name equals: yaumAsSabt name.
	self
		assert: otherYaumAsSabt positionInWeek
		equals: yaumAsSabt positionInWeek
]

{ #category : 'test accessing' }
IslamicDayTest >> testDayPositionedInWeek [

	| day |
	day := yaumAlAhad.
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
IslamicDayTest >> testDaysFrom [

	self
		assert: (yaumAlIthnayna distanceFrom: yaumAlIthnayna)
		equals: zeroDays.
	self
		assert: (yaumAlIthnayna distanceFrom: yaumAthThalatha)
		equals: 6 daysMeasure.
	self
		assert: (yaumAlIthnayna distanceFrom: yaumAlArbaa)
		equals: 5 daysMeasure.
	self
		assert: (yaumAlIthnayna distanceFrom: yaumAlHamis)
		equals: 4 daysMeasure.
	self
		assert: (yaumAlIthnayna distanceFrom: yaumAlJuma)
		equals: 3 daysMeasure.
	self
		assert: (yaumAlIthnayna distanceFrom: yaumAsSabt)
		equals: twoDays.
	self assert: (yaumAlIthnayna distanceFrom: yaumAlAhad) equals: oneDay
]

{ #category : 'test queying' }
IslamicDayTest >> testDaysTo [

	self
		assert: (yaumAlIthnayna distanceTo: yaumAlIthnayna)
		equals: zeroDays.
	self
		assert: (yaumAlIthnayna distanceTo: yaumAthThalatha)
		equals: oneDay.
	self assert: (yaumAlIthnayna distanceTo: yaumAlArbaa) equals: twoDays.
	self
		assert: (yaumAlIthnayna distanceTo: yaumAlHamis)
		equals: 3 daysMeasure.
	self
		assert: (yaumAlIthnayna distanceTo: yaumAlJuma)
		equals: 4 daysMeasure.
	self
		assert: (yaumAlIthnayna distanceTo: yaumAsSabt)
		equals: 5 daysMeasure.
	self
		assert: (yaumAlIthnayna distanceTo: yaumAlAhad)
		equals: 6 daysMeasure
]

{ #category : 'test comparing' }
IslamicDayTest >> testEqual [

	self assert: yaumAlAhad equals: calendar yaumAlAhad.
	self assert: yaumAlIthnayna equals: calendar yaumAlIthnayna.
	self assert: yaumAthThalatha equals: calendar yaumAthThalatha.
	self assert: yaumAlArbaa equals: calendar yaumAlArbaa.
	self assert: yaumAlHamis equals: calendar yaumAlHamis.
	self assert: yaumAlJuma equals: calendar yaumAlJuma.
	self assert: yaumAsSabt equals: calendar yaumAsSabt
]

{ #category : 'test comparing' }
IslamicDayTest >> testHash [

	self assert: yaumAlAhad hash equals: calendar yaumAlAhad hash.
	self assert: yaumAlIthnayna hash equals: calendar yaumAlIthnayna hash.
	self
		assert: yaumAthThalatha hash
		equals: calendar yaumAthThalatha hash.
	self assert: yaumAlArbaa hash equals: calendar yaumAlArbaa hash.
	self assert: yaumAlHamis hash equals: calendar yaumAlHamis hash.
	self assert: yaumAlJuma hash equals: calendar yaumAlJuma hash.
	self assert: yaumAsSabt hash equals: calendar yaumAsSabt hash
]

{ #category : 'test creation' }
IslamicDayTest >> testInvalidNameCreation [

	self
		should: [ calendar dayNamed: 'Pedro Duque, otro' ]
		raise: InvalidDayNameException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals: 'The name Pedro Duque, otro is invalid as a day of a week' ]
]

{ #category : 'test testing' }
IslamicDayTest >> testIs [
	
	self assert: (yaumAlAhad is: YaumAlAhad).
	self assert: (yaumAlIthnayna is: YaumAlIthnayna).
	self assert: (yaumAthThalatha is: YaumAthThalatha).
	self assert: (yaumAlArbaa is: YaumAlArbaa).
	self assert: (yaumAlHamis is: YaumAlHamis).
	self assert: (yaumAlJuma is: YaumAlJuma).
	self assert: (yaumAsSabt is: YaumAsSabt)
]

{ #category : 'test accessing' }
IslamicDayTest >> testName [

	self assert: yaumAlAhad name equals: 'yaum al-ahad'.
	self assert: yaumAlIthnayna name equals: 'yaum al-ithnayna'.
	self assert: yaumAthThalatha name equals: 'yaum ath-thalatha'.
	self assert: yaumAlArbaa name equals: 'yaum al-arba`a`'.
	self assert: yaumAlHamis name equals: 'yaum al-hamis'.
	self assert: yaumAlJuma name equals: 'yaum al-jum`a'.
	self assert: yaumAsSabt name equals: 'yaum as-sabt'
]

{ #category : 'test enumerating' }
IslamicDayTest >> testNext [

	self assert: yaumAlAhad next equals: yaumAlIthnayna.
	self assert: yaumAlIthnayna next equals: yaumAthThalatha.
	self assert: yaumAthThalatha next equals: yaumAlArbaa.
	self assert: yaumAlArbaa next equals: yaumAlHamis.
	self assert: yaumAlHamis next equals: yaumAlJuma.
	self assert: yaumAlJuma next equals: yaumAsSabt.
	self assert: yaumAsSabt next equals: yaumAlAhad
]

{ #category : 'test enumerating' }
IslamicDayTest >> testNextInANumberOfDays [

	self assert: (yaumAlIthnayna next: oneDay) equals: yaumAthThalatha.
	self assert: (yaumAlIthnayna next: twoDays) equals: yaumAlArbaa.
	self assert: (yaumAlIthnayna next: 6 daysMeasure) equals: yaumAlAhad.
	self assert: (yaumAlIthnayna next: sevenDays) equals: yaumAlIthnayna.
	self
		assert: (yaumAlIthnayna next: 14 daysMeasure)
		equals: yaumAlIthnayna.
	self assert: (yaumAlAhad next: 21 daysMeasure) equals: yaumAlAhad
]

{ #category : 'test accessing' }
IslamicDayTest >> testNumberOfDaysSinceFirstDayOfWeek [

	| currentNumberOfDays |
	currentNumberOfDays := zeroDays.
	(yaumAlAhad to: yaumAsSabt) do: [ :aDay |
		self
			assert: aDay numberOfDaysSinceFirstDayOfWeek
			equals: currentNumberOfDays.
		currentNumberOfDays := currentNumberOfDays + oneDay ]
]

{ #category : 'test enumerating' }
IslamicDayTest >> testPrevious [

	self assert: yaumAlAhad previous equals: yaumAsSabt.
	self assert: yaumAlIthnayna previous equals: yaumAlAhad.
	self assert: yaumAthThalatha previous equals: yaumAlIthnayna.
	self assert: yaumAlArbaa previous equals: yaumAthThalatha.
	self assert: yaumAlHamis previous equals: yaumAlArbaa.
	self assert: yaumAlJuma previous equals: yaumAlHamis.
	self assert: yaumAsSabt previous equals: yaumAlJuma
]

{ #category : 'test enumerating' }
IslamicDayTest >> testPreviousInANumberOfDays [

	self assert: (yaumAlIthnayna previous: oneDay) equals: yaumAlAhad.
	self assert: (yaumAlIthnayna previous: twoDays) equals: yaumAsSabt.
	self
		assert: (yaumAlIthnayna previous: 6 daysMeasure)
		equals: yaumAthThalatha.
	self
		assert: (yaumAlIthnayna previous: sevenDays)
		equals: yaumAlIthnayna.
	self
		assert: (yaumAlAhad previous: 6 daysMeasure)
		equals: yaumAlIthnayna.
	self assert: (yaumAlAhad previous: 7 daysMeasure) equals: yaumAlAhad.
	self assert: (yaumAlAhad previous: 14 daysMeasure) equals: yaumAlAhad.
	self assert: (yaumAsSabt previous: 6 daysMeasure) equals: yaumAlAhad.
	self assert: (yaumAsSabt previous: 7 daysMeasure) equals: yaumAsSabt.
	self assert: (yaumAsSabt previous: 14 daysMeasure) equals: yaumAsSabt
]

{ #category : 'test printing' }
IslamicDayTest >> testPrintString [

	self
		assert: (Day
				 named: 'One Christian Day Name'
				 positionInWeek: 1
				 calendar: calendar) printString
		equals: 'One Christian Day Name'
]

{ #category : 'test instance creation' }
IslamicDayTest >> testSinceYaumAlAhad [

	| currentDay |
	currentDay := yaumAlAhad.
	(zeroDays to: 6 daysMeasure) do: [ :aNumberOfDays |
		self
			assert: (calendar sinceYaumAlAhad: aNumberOfDays)
			equals: currentDay.
		currentDay := currentDay next ]
]

{ #category : 'test interval protocol' }
IslamicDayTest >> testTo [

	| interval |
	interval := yaumAlAhad to: yaumAsSabt.
	self assert: interval from equals: yaumAlAhad.
	self assert: interval to equals: yaumAsSabt.
	self assert: interval by equals: oneDay.
	self assert: interval size equals: 7
]

{ #category : 'test interval protocol' }
IslamicDayTest >> testToBy [

	| interval |
	interval := yaumAlAhad to: yaumAlJuma by: twoDays.
	self assert: interval from equals: yaumAlAhad.
	self assert: interval to equals: yaumAlJuma.
	self assert: interval by equals: twoDays.
	self assert: interval last equals: yaumAlHamis.
	self assert: interval size equals: 3
]

{ #category : 'test interval protocol' }
IslamicDayTest >> testToDo [

	| interval currentDayNumber |
	currentDayNumber := 2.
	interval := yaumAlIthnayna to: yaumAsSabt.
	interval do: [ :aDay |
		self assert: aDay positionInWeek equals: currentDayNumber.
		currentDayNumber := currentDayNumber + 1 ].
	self assert: currentDayNumber equals: 8
]

{ #category : 'test interval protocol' }
IslamicDayTest >> testToNegativeBy [

	| interval |
	interval := yaumAlAhad to: yaumAlIthnayna by: minusOneDay.
	self assert: interval from equals: yaumAlAhad.
	self assert: interval to equals: yaumAlIthnayna.
	self assert: interval by equals: minusOneDay.
	self assert: interval size equals: 7
]

{ #category : 'test interval protocol' }
IslamicDayTest >> testToNegativeByDo [

	| interval currentDayNumber |
	currentDayNumber := 7.
	interval := yaumAsSabt to: yaumAlAhad by: minusOneDay.
	interval do: [ :aDay |
		self assert: aDay positionInWeek equals: currentDayNumber.
		currentDayNumber := currentDayNumber - 1 ].
	self assert: currentDayNumber equals: 0
]

{ #category : 'test creation' }
IslamicDayTest >> testValidNameCreation [

	self shouldnt: [calendar dayNamed: 'yaum al-ithnayna'] raise: InvalidDayNameException
]
