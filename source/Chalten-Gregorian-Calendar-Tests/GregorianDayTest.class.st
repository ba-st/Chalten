Class {
	#name : 'GregorianDayTest',
	#superclass : 'TestCase',
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
	#category : 'Chalten-Gregorian-Calendar-Tests',
	#package : 'Chalten-Gregorian-Calendar-Tests'
}

{ #category : 'accessing' }
GregorianDayTest class >> classUnderTest [

	^Day
]

{ #category : 'initialization' }
GregorianDayTest >> setUp [

	calendar := ChaltenEnvironment calendarNamed: #GregorianCalendar.
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

{ #category : 'test comparing' }
GregorianDayTest >> testComparing [

	self assert: Monday < Saturday.
	self assert: Wednesday < Friday.
	self deny: Friday < Thursday.

	self
		should: [ Monday > February second ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: February second class
						 with: February second
						 with: Monday class
						 with: Monday) ].

	self
		should: [ Friday < March ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: Friday class
						 with: Friday
						 with: March class
						 with: March) ]
]

{ #category : 'test instance creation' }
GregorianDayTest >> testCreation [
	self shouldnt: 
			[Day 
				named: 'One Christian Day Name'
				positionInWeek: 1
				calendar: calendar]
		raise: Exception
]

{ #category : 'test creation' }
GregorianDayTest >> testDayCreation [

	| otherSunday otherMonday otherTuesday otherWednesday otherThursday otherFriday otherSaturday |
	otherSunday := calendar createSunday.
	otherMonday := calendar createMonday.
	otherTuesday := calendar createTuesday.
	otherWednesday := calendar createWednesday.
	otherThursday := calendar createThursday.
	otherFriday := calendar createFriday.
	otherSaturday := calendar createSaturday.
	self assert: otherSunday name equals: sunday name.
	self assert: otherSunday positionInWeek equals: sunday positionInWeek.
	self assert: otherMonday name equals: monday name.
	self assert: otherMonday positionInWeek equals: monday positionInWeek.
	self assert: otherThursday name equals: thursday name.
	self
		assert: otherThursday positionInWeek
		equals: thursday positionInWeek.
	self assert: otherWednesday name equals: wednesday name.
	self
		assert: otherWednesday positionInWeek
		equals: wednesday positionInWeek.
	self assert: otherTuesday name equals: tuesday name.
	self
		assert: otherTuesday positionInWeek
		equals: tuesday positionInWeek.
	self assert: otherFriday name equals: friday name.
	self assert: otherFriday positionInWeek equals: friday positionInWeek.
	self assert: otherSaturday name equals: saturday name.
	self
		assert: otherSaturday positionInWeek
		equals: saturday positionInWeek
]

{ #category : 'test accessing' }
GregorianDayTest >> testDayPositionedInWeek [

	| day |
	day := sunday.
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

{ #category : 'test querying' }
GregorianDayTest >> testDaysFrom [

	self assert: (monday distanceFrom: monday) equals: zeroDays.
	self assert: (monday distanceFrom: tuesday) equals: 6 daysMeasure.
	self assert: (monday distanceFrom: wednesday) equals: 5 daysMeasure.
	self assert: (monday distanceFrom: thursday) equals: 4 daysMeasure.
	self assert: (monday distanceFrom: friday) equals: 3 daysMeasure.
	self assert: (monday distanceFrom: saturday) equals: twoDays.
	self assert: (monday distanceFrom: sunday) equals: oneDay
]

{ #category : 'test querying' }
GregorianDayTest >> testDaysTo [

	self assert: (monday distanceTo: monday) equals: zeroDays.
	self assert: (monday distanceTo: tuesday) equals: oneDay.
	self assert: (monday distanceTo: wednesday) equals: twoDays.
	self assert: (monday distanceTo: thursday) equals: 3 daysMeasure.
	self assert: (monday distanceTo: friday) equals: 4 daysMeasure.
	self assert: (monday distanceTo: saturday) equals: 5 daysMeasure.
	self assert: (monday distanceTo: sunday) equals: 6 daysMeasure
]

{ #category : 'test comparing' }
GregorianDayTest >> testEqual [

	self assert: monday equals: Monday.
	self assert: tuesday equals: Tuesday.
	self assert: wednesday equals: Wednesday.
	self assert: thursday equals: Thursday.
	self assert: friday equals: Friday.
	self assert: saturday equals: Saturday.
	self assert: sunday equals: Sunday
]

{ #category : 'test comparing' }
GregorianDayTest >> testHash [

	self assert: monday hash equals: Monday hash.
	self assert: tuesday hash equals: Tuesday hash.
	self assert: wednesday hash equals: Wednesday hash.
	self assert: thursday hash equals: Thursday hash.
	self assert: friday hash equals: Friday hash.
	self assert: saturday hash equals: Saturday hash.
	self assert: sunday hash equals: Sunday hash
]

{ #category : 'test creation' }
GregorianDayTest >> testInvalidNameCreation [

	self
		should: [ calendar dayNamed: 'Pedro Duque, otro' ]
		raise: InvalidDayNameException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals: 'The name Pedro Duque, otro is invalid as a day of a week' ]
]

{ #category : 'test testing' }
GregorianDayTest >> testIs [

	self assert: (sunday is: Sunday).
	self assert: (monday is: Monday).
	self assert: (tuesday is: Tuesday).
	self assert: (wednesday is: Wednesday).
	self assert: (thursday is: Thursday).
	self assert: (friday is: Friday).
	self assert: (saturday is: Saturday).
	
	self deny: (sunday is: Monday).
	self deny: (monday is: Tuesday).
	self deny: (tuesday is: Wednesday).
	self deny: (wednesday is: Thursday).
	self deny: (thursday is: Friday).
	self deny: (friday is: Saturday).
	self deny: (saturday is: Sunday)
]

{ #category : 'test accessing' }
GregorianDayTest >> testName [

	self assert: sunday name equals: 'Sunday'.
	self assert: monday name equals: 'Monday'.
	self assert: tuesday name equals: 'Tuesday'.
	self assert: wednesday name equals: 'Wednesday'.
	self assert: thursday name equals: 'Thursday'.
	self assert: friday name equals: 'Friday'.
	self assert: saturday name equals: 'Saturday'
]

{ #category : 'test enumerating' }
GregorianDayTest >> testNext [

	self assert: monday next equals: tuesday.
	self assert: sunday next equals: monday.
	self assert: saturday next equals: sunday
]

{ #category : 'test enumerating' }
GregorianDayTest >> testNextInANumberOfDays [

	self assert: (monday next: oneDay) equals: tuesday.
	self assert: (monday next: twoDays) equals: wednesday.
	self assert: (monday next: 6 daysMeasure) equals: sunday.
	self assert: (monday next: sevenDays) equals: monday.
	self assert: (monday next: 14 daysMeasure) equals: monday.
	self assert: (sunday next: 21 daysMeasure) equals: sunday
]

{ #category : 'test accessing' }
GregorianDayTest >> testNumberOfDaysSinceFirstDayOfWeek [

	| currentNumberOfDays |
	currentNumberOfDays := zeroDays.
	(sunday to: saturday) do: [ :aDay |
		self
			assert: aDay numberOfDaysSinceFirstDayOfWeek
			equals: currentNumberOfDays.
		currentNumberOfDays := currentNumberOfDays + oneDay ]
]

{ #category : 'test enumerating' }
GregorianDayTest >> testPrevious [

	self assert: monday previous equals: sunday.
	self assert: tuesday previous equals: monday
]

{ #category : 'test enumerating' }
GregorianDayTest >> testPreviousInANumberOfDays [

	self assert: (monday previous: oneDay) equals: sunday.
	self assert: (monday previous: twoDays) equals: saturday.
	self assert: (monday previous: 6 daysMeasure) equals: tuesday.
	self assert: (monday previous: sevenDays) equals: monday.
	self assert: (sunday previous: 6 daysMeasure) equals: monday.
	self assert: (sunday previous: 7 daysMeasure) equals: sunday.
	self assert: (sunday previous: 14 daysMeasure) equals: sunday.
	self assert: (saturday previous: 6 daysMeasure) equals: sunday.
	self assert: (saturday previous: 7 daysMeasure) equals: saturday.
	self assert: (saturday previous: 14 daysMeasure) equals: saturday
]

{ #category : 'test printing' }
GregorianDayTest >> testPrintString [

	self
		assert: (Day
				 named: 'One Christian Day Name'
				 positionInWeek: 1
				 calendar: calendar) printString
		equals: 'One Christian Day Name'
]

{ #category : 'test instance creation' }
GregorianDayTest >> testSinceSunday [

	| currentDay |
	currentDay := sunday.
	(zeroDays to: 6 daysMeasure) do: [ :numberOfDays |
		self assert: (calendar sinceSunday: numberOfDays) equals: currentDay.
		currentDay := currentDay next ]
]

{ #category : 'test interval protocol' }
GregorianDayTest >> testTo [

	| interval |
	interval := sunday to: saturday.
	self assert: interval from equals: sunday.
	self assert: interval to equals: saturday.
	self assert: interval by equals: oneDay.
	self assert: interval size equals: 7
]

{ #category : 'test interval protocol' }
GregorianDayTest >> testToBy [

	| interval |
	interval := sunday to: friday by: twoDays.
	self assert: interval from equals: sunday.
	self assert: interval to equals: friday.
	self assert: interval by equals: twoDays.
	self assert: interval last equals: thursday.
	self assert: interval size equals: 3
]

{ #category : 'test interval protocol' }
GregorianDayTest >> testToDo [

	| interval currentDayNumber |
	currentDayNumber := 2.
	interval := monday to: saturday.
	interval do: [ :aDay |
		self assert: aDay positionInWeek equals: currentDayNumber.
		currentDayNumber := currentDayNumber + 1 ].
	self assert: currentDayNumber equals: 8
]

{ #category : 'test interval protocol' }
GregorianDayTest >> testToNegativeBy [

	| interval |
	interval := sunday to: monday by: minusOneDay.
	self assert: interval from equals: sunday.
	self assert: interval to equals: monday.
	self assert: interval by equals: minusOneDay.
	self assert: interval size equals: 7
]

{ #category : 'test interval protocol' }
GregorianDayTest >> testToNegativeByDo [

	| interval currentDayNumber |
	currentDayNumber := 7.
	interval := saturday to: sunday by: minusOneDay.
	interval do: [ :aDay |
		self assert: aDay positionInWeek equals: currentDayNumber.
		currentDayNumber := currentDayNumber - 1 ].
	self assert: currentDayNumber equals: 0
]

{ #category : 'test creation' }
GregorianDayTest >> testValidNameCreation [

	self shouldnt: [calendar dayNamed: 'Monday'] raise: InvalidDayNameException
]
