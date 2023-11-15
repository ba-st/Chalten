Class {
	#name : 'HebrewDayOfMonthTest',
	#superclass : 'TestCase',
	#instVars : [
		'calendar',
		'oneDay',
		'twoDays'
	],
	#category : 'Chalten-Hebrew-Calendar-Tests',
	#package : 'Chalten-Hebrew-Calendar-Tests'
}

{ #category : 'accessing' }
HebrewDayOfMonthTest class >> classUnderTest [

	^DayOfMonth
]

{ #category : 'initialization' }
HebrewDayOfMonthTest >> setUp [
	calendar := ChaltenEnvironment calendarNamed: #HebrewCalendar.
	oneDay := 1 dayMeasure.
	twoDays := 2 daysMeasure
]

{ #category : 'test date creation' }
HebrewDayOfMonthTest >> testComma [

	| nisan |
	nisan := calendar nisan.
	self
		assert:
		(DayOfMonth monthNumber: 1 dayNumber: 1 calendar: calendar) , 5767
		equals: (FixedDate
				 yearNumber: 5767
				 monthNumber: 1
				 dayNumber: 1
				 calendar: calendar).
	self assert: nisan first , 5767 equals: (FixedDate
			 yearNumber: 5767
			 monthNumber: 1
			 dayNumber: 1
			 calendar: calendar)
]

{ #category : 'test comparing' }
HebrewDayOfMonthTest >> testComparing [

	| firstDayOfFirstMonth secondDayOfFirstMonth lastDayOfFirstMonth firstDayOfSecondMonth |
	firstDayOfFirstMonth := DayOfMonth
		                        monthNumber: 1
		                        dayNumber: 1
		                        calendar: calendar.
	secondDayOfFirstMonth := DayOfMonth
		                         monthNumber: 1
		                         dayNumber: 2
		                         calendar: calendar.
	lastDayOfFirstMonth := DayOfMonth
		                       monthNumber: 1
		                       dayNumber: 30
		                       calendar: calendar.
	firstDayOfSecondMonth := DayOfMonth
		                         monthNumber: 2
		                         dayNumber: 1
		                         calendar: calendar.

	self assert: firstDayOfFirstMonth < secondDayOfFirstMonth.
	self assert: lastDayOfFirstMonth < firstDayOfSecondMonth.
	self deny: firstDayOfFirstMonth < firstDayOfFirstMonth.

	self
		should: [ firstDayOfFirstMonth > YomRishon ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: YomRishon class
						 with: YomRishon
						 with: firstDayOfFirstMonth class
						 with: firstDayOfFirstMonth) ].

	self
		should: [ lastDayOfFirstMonth < Nisan ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: lastDayOfFirstMonth class
						 with: lastDayOfFirstMonth
						 with: Nisan class
						 with: Nisan) ]
]

{ #category : 'test instance creation' }
HebrewDayOfMonthTest >> testCreation [

	self
		assert:
		(DayOfMonth monthNumber: 1 dayNumber: 1 calendar: calendar) month
		equals: calendar nisan.
	self
		assert:
		(DayOfMonth monthNumber: 1 dayNumber: 1 calendar: calendar)
			dayNumber
		equals: 1.
	self
		assert: (DayOfMonth month: calendar adarII dayNumber: 29) month
		equals: calendar adarII.
	self
		assert: (DayOfMonth month: calendar adarII dayNumber: 29) dayNumber
		equals: 29
]

{ #category : 'test date creation' }
HebrewDayOfMonthTest >> testDateOfYear [

	self
		assert: (Nisan first ofYear: 5767 asHebrewYear)
		equals: (FixedDate
				 yearNumber: 5767
				 monthNumber: 1
				 dayNumber: 1
				 calendar: calendar)
]

{ #category : 'test querying' }
HebrewDayOfMonthTest >> testDaysFrom [

	self
		assert: (Adar twentyninth distanceFrom: Adar twentyninth)
		equals: 0 daysMeasure.
	self
		assert: (Adar twentyninth distanceFrom: Nisan first)
		equals: 354 daysMeasure
]

{ #category : 'test querying' }
HebrewDayOfMonthTest >> testDaysTo [

	self
		assert: (Adar twentyninth distanceTo: Adar twentyninth)
		equals: 0 daysMeasure.
	self
		assert: (Adar twentyninth distanceTo: Nisan first)
		equals: 1 dayMeasure.
	self
		assert: (Nisan first distanceTo: Adar twentyninth)
		equals: 354 daysMeasure.
	self
		assert: (Nisan tenth distanceTo: Nisan first)
		equals: 346 daysMeasure
]

{ #category : 'test comparing' }
HebrewDayOfMonthTest >> testEqual [

	self assert: Nisan first equals: Nisan first.
	self deny: Nisan second = Nisan first
]

{ #category : 'test comparing' }
HebrewDayOfMonthTest >> testHash [

	self assert: Nisan first hash equals: Nisan first hash.
	self deny: Nisan second hash = Nisan first hash
]

{ #category : 'test instance creation' }
HebrewDayOfMonthTest >> testInvalidCreation [

	self
		should: [ DayOfMonth monthNumber: 0 dayNumber: 1 calendar: calendar ]
		raise: InvalidMonthNumberException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals: '0 is an invalid number for a month' ].
	self
		should: [ DayOfMonth monthNumber: 1 dayNumber: 0 calendar: calendar ]
		raise: InvalidDayOfMonthException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals: 'Day of month 0 invalid for Nisan' ].
	self
		should: [
		DayOfMonth monthNumber: 1 dayNumber: 31 calendar: calendar ]
		raise: InvalidDayOfMonthException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals: 'Day of month 31 invalid for Nisan' ]
]

{ #category : 'test querying' }
HebrewDayOfMonthTest >> testIsFirstDayOfMonth [

	self assert: Nisan first isFirstDayOfMonth.
	self deny: Nisan second isFirstDayOfMonth
]

{ #category : 'test querying' }
HebrewDayOfMonthTest >> testIsFirstDayOfYear [

	self assert: Tishri first isFirstDayOfYear.
	self deny: Nisan second isFirstDayOfYear
]

{ #category : 'test querying' }
HebrewDayOfMonthTest >> testIsLastDayOfMonth [

	self assert: Nisan thirtieth isLastDayOfMonth.
	self assert: Iyyar twentyninth isLastDayOfMonth.
	self assert: Sivan thirtieth isLastDayOfMonth.
	
	self deny: Nisan twentyninth isLastDayOfMonth.
	self deny: Iyyar twentyeighth isLastDayOfMonth.
	self deny: Sivan twentyninth isLastDayOfMonth
]

{ #category : 'test querying' }
HebrewDayOfMonthTest >> testIsLastDayOfYear [

	self assert: Elul twentyninth isLastDayOfYear.
	self deny: Elul twentyeighth isLastDayOfYear.
	self deny: AdarI thirtieth isLastDayOfYear
]

{ #category : 'test querying' }
HebrewDayOfMonthTest >> testMaximumNumberOfDaysInOneYear [

	self
		assert: Iyyar third maximumNumberOfDaysInOneYear
		equals: 385 daysMeasure
]

{ #category : 'test enumerating' }
HebrewDayOfMonthTest >> testNext [

	self assert: Adar twentyninth next equals: Nisan first.
	self assert: Iyyar twentyninth next equals: Sivan first
]

{ #category : 'test enumerating' }
HebrewDayOfMonthTest >> testNextANumberOfDays [

	self
		assert: (Adar twentyninth next: 7 daysMeasure)
		equals: Nisan seventh.
	self
		assert: (Iyyar twentyninth next: 7 daysMeasure)
		equals: Sivan seventh.
	self
		assert: (Nisan first next: -1 dayMeasure)
		equals: Adar twentyninth.
	self
		assert: (Nisan first next: -32 daysMeasure)
		equals: Shevat twentyeighth
]

{ #category : 'test accessing' }
HebrewDayOfMonthTest >> testNumberOfDaysFromBeginningOfMonth [

	self
		assert: Nisan first numberOfDaysFromBeginningOfMonth
		equals: 0 daysMeasure.
	self
		assert: Nisan thirtieth numberOfDaysFromBeginningOfMonth
		equals: 29 daysMeasure.
	self
		assert: Iyyar twentyninth numberOfDaysFromBeginningOfMonth
		equals: 28 daysMeasure
]

{ #category : 'test accessing' }
HebrewDayOfMonthTest >> testNumberOfDaysToEndOfMonth [

	self
		assert: Nisan twentyfirst numberOfDaysToEndOfMonth
		equals: 9 daysMeasure.
	self
		assert: Nisan thirtieth numberOfDaysToEndOfMonth
		equals: 0 daysMeasure.
	self
		assert: Iyyar twentyeighth numberOfDaysToEndOfMonth
		equals: 1 dayMeasure
]

{ #category : 'test accessing' }
HebrewDayOfMonthTest >> testNumberOfDaysToEndOfYear [

	self
		assert: Nisan first numberOfDaysToEndOfYear
		equals: 176 daysMeasure.
	self
		assert: Tishri first numberOfDaysToEndOfYear
		equals: 354 daysMeasure.
	self
		assert: Adar twentyninth numberOfDaysToEndOfYear
		equals: 177 daysMeasure.
	self
		assert: Elul twentyninth numberOfDaysToEndOfYear
		equals: 0 daysMeasure
]

{ #category : 'test enumerating' }
HebrewDayOfMonthTest >> testPrevious [

	self assert: Nisan first previous equals: Adar twentyninth.
	self assert: Sivan first previous equals: Iyyar twentyninth
]

{ #category : 'test enumerating' }
HebrewDayOfMonthTest >> testPreviousANumberOfDays [

	self
		assert: (AdarI thirtieth previous: 7 daysMeasure)
		equals: AdarI twentythird.
	self
		assert: (Iyyar twentyninth previous: 7 daysMeasure)
		equals: Iyyar twentysecond.
	self
		assert: (Nisan first previous: -1 dayMeasure)
		equals: Nisan second.
	self
		assert: (Nisan first previous: -32 daysMeasure)
		equals: Iyyar third
]

{ #category : 'test printing' }
HebrewDayOfMonthTest >> testPrintString [

	self assert: Adar twentyninth printString equals: 'Adar 29'
]

{ #category : 'test interval protocol' }
HebrewDayOfMonthTest >> testTo [

	| interval |
	interval := Nisan first to: Nisan tenth.
	self assert: interval from equals: Nisan first.
	self assert: interval to equals: Nisan tenth.
	self assert: interval by equals: oneDay
]

{ #category : 'test interval protocol' }
HebrewDayOfMonthTest >> testToBy [

	| interval |
	interval := Nisan first to: Nisan tenth by: twoDays.
	self assert: interval from equals: Nisan first.
	self assert: interval to equals: Nisan tenth.
	self assert: interval by equals: twoDays
]

{ #category : 'test interval protocol' }
HebrewDayOfMonthTest >> testToByDo [

	| daysTo nisanFirst dayOfMonth |
	daysTo := 0.
	nisanFirst := Nisan first.
	dayOfMonth := nisanFirst.
	(nisanFirst to: Adar twentyninth) do: [ :aDayOfMonth |
		self assert: aDayOfMonth equals: dayOfMonth.
		self
			assert: (nisanFirst distanceTo: aDayOfMonth) amount
			equals: daysTo.
		dayOfMonth := dayOfMonth next.
		daysTo := daysTo + 1 ].
	self assert: daysTo equals: 355
]

{ #category : 'test interval protocol' }
HebrewDayOfMonthTest >> testToEveryDayNumber [

	| expectedMonths interval |
	interval := Nisan first to: Adar twentyninth everyDayNumber: 30.
	self assert: interval first equals: Nisan thirtieth.
	self assert: interval last equals: Shevat thirtieth.
	self assert: interval size equals: 7.
	expectedMonths := calendar months select: [ :month |
		                  month lastDayNumber = 30 ].
	interval inject: 1 into: [ :index :dayMonth |
		self assert: dayMonth month equals: (expectedMonths at: index).
		self assert: dayMonth dayNumber equals: 30.
		index + 1 ]
]

{ #category : 'test interval protocol' }
HebrewDayOfMonthTest >> testToEveryDayNumbers [

	| expectedDayNumbers interval |
	interval := Nisan first to: Adar twentyninth everyDayNumbers: (Array
			             with: 5
			             with: 20
			             with: 30
			             with: 1).
	self assert: interval first equals: Nisan first.
	self assert: interval last equals: Adar twentieth.
	self assert: interval size equals: 43.
	expectedDayNumbers := #( 1 5 20 30 1 5 20 1 5 20 30 1 5 20 1 5 20 30
	                         1 5 20 1 5 20 30 1 5 20 30 1 5 20 30 1 5 20
	                         1 5 20 30 1 5 20 30 1 5 20 ).
	interval inject: 1 into: [ :index :dayMonth |
		self
			assert: dayMonth dayNumber
			equals: (expectedDayNumbers at: index).
		index + 1 ]
]

{ #category : 'test interval protocol' }
HebrewDayOfMonthTest >> testToNegativeBy [

	| interval number |
	interval := Nisan thirtieth to: Nisan first by: twoDays negated.
	number := 30.
	interval do: [ :dayOfMonth |
		self assert: dayOfMonth dayNumber equals: number.
		number := number - 2 ].
	self assert: number equals: 0
]

{ #category : 'test interval protocol' }
HebrewDayOfMonthTest >> testToReverse [

	| interval |
	interval := Nisan first to: Nisan second by: oneDay.
	self assert: interval reverse first equals: interval to.
	self assert: interval reverse last equals: interval from.

	interval := Nisan first to: Nisan second by: oneDay negated.
	self assert: interval reverse first equals: interval to.
	self assert: interval reverse last equals: interval from
]
