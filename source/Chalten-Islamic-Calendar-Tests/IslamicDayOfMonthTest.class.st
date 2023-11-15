Class {
	#name : 'IslamicDayOfMonthTest',
	#superclass : 'TestCase',
	#instVars : [
		'calendar',
		'oneDay',
		'twoDays'
	],
	#category : 'Chalten-Islamic-Calendar-Tests',
	#package : 'Chalten-Islamic-Calendar-Tests'
}

{ #category : 'accessing' }
IslamicDayOfMonthTest class >> classUnderTest [

	^DayOfMonth
]

{ #category : 'initialization' }
IslamicDayOfMonthTest >> setUp [
	calendar := ChaltenEnvironment calendarNamed: #IslamicCalendar.
	oneDay := 1 dayMeasure.
	twoDays := 2 daysMeasure
]

{ #category : 'test date creation' }
IslamicDayOfMonthTest >> testComma [

	| muharram |
	muharram := calendar muharram.
	self
		assert:
		(DayOfMonth monthNumber: 1 dayNumber: 1 calendar: calendar) , 2005
		equals: (FixedDate
				 yearNumber: 2005
				 monthNumber: 1
				 dayNumber: 1
				 calendar: calendar).
	self assert: muharram first , 2006 equals: (FixedDate
			 yearNumber: 2006
			 monthNumber: 1
			 dayNumber: 1
			 calendar: calendar)
]

{ #category : 'test comparing' }
IslamicDayOfMonthTest >> testComparing [

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
		should: [ firstDayOfFirstMonth > YaumAlAhad ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: YaumAlAhad class
						 with: YaumAlAhad
						 with: firstDayOfFirstMonth class
						 with: firstDayOfFirstMonth) ].

	self
		should: [ lastDayOfFirstMonth < Muharram ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: lastDayOfFirstMonth class
						 with: lastDayOfFirstMonth
						 with: Muharram class
						 with: Muharram) ]
]

{ #category : 'test instance creation' }
IslamicDayOfMonthTest >> testCreation [

	self
		assert:
		(DayOfMonth monthNumber: 1 dayNumber: 1 calendar: calendar) month
		equals: calendar muharram.
	self
		assert:
		(DayOfMonth monthNumber: 1 dayNumber: 1 calendar: calendar)
			dayNumber
		equals: 1.
	self
		assert: (DayOfMonth month: calendar dhuAlHijja dayNumber: 30) month
		equals: calendar dhuAlHijja.
	self
		assert:
		(DayOfMonth month: calendar dhuAlHijja dayNumber: 30) dayNumber
		equals: 30
]

{ #category : 'test date creation' }
IslamicDayOfMonthTest >> testDateOfYear [

	self
		assert: (Muharram first ofYear: 2005 asIslamicYear)
		equals: (FixedDate
				 yearNumber: 2005
				 monthNumber: 1
				 dayNumber: 1
				 calendar: calendar)
]

{ #category : 'test querying' }
IslamicDayOfMonthTest >> testDaysFrom [

	self
		assert:
		(DhuAlHijja twentyninth distanceFrom: DhuAlHijja twentyninth)
		equals: 0 daysMeasure.
	self
		assert: (DhuAlHijja twentyninth distanceFrom: Muharram first)
		equals: 353 daysMeasure
]

{ #category : 'test querying' }
IslamicDayOfMonthTest >> testDaysTo [

	self
		assert: (DhuAlHijja twentyninth distanceTo: DhuAlHijja twentyninth)
		equals: 0 daysMeasure.
	self
		assert: (DhuAlHijja twentyninth distanceTo: Muharram first)
		equals: 1 dayMeasure.
	self
		assert: (Muharram first distanceTo: DhuAlHijja twentyninth)
		equals: 353 daysMeasure.
	self
		assert: (Muharram tenth distanceTo: Muharram first)
		equals: 345 daysMeasure
]

{ #category : 'test comparing' }
IslamicDayOfMonthTest >> testEqual [

	self assert: Muharram first equals: Muharram first.
	self deny: Muharram second = Muharram first
]

{ #category : 'test comparing' }
IslamicDayOfMonthTest >> testHash [

	self assert: Muharram first hash equals: Muharram first hash.
	self deny: Muharram second hash = Muharram first hash
]

{ #category : 'test instance creation' }
IslamicDayOfMonthTest >> testInvalidCreation [

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
				equals: 'Day of month 0 invalid for Muharram' ].
	self
		should: [
		DayOfMonth monthNumber: 1 dayNumber: 31 calendar: calendar ]
		raise: InvalidDayOfMonthException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals: 'Day of month 31 invalid for Muharram' ]
]

{ #category : 'test querying' }
IslamicDayOfMonthTest >> testIsFirstDayOfMonth [

	self assert: Muharram first isFirstDayOfMonth.
	self deny: Muharram second isFirstDayOfMonth
]

{ #category : 'test querying' }
IslamicDayOfMonthTest >> testIsFirstDayOfYear [

	self assert: Muharram first isFirstDayOfYear.
	self deny: Muharram second isFirstDayOfYear
]

{ #category : 'test querying' }
IslamicDayOfMonthTest >> testIsLastDayOfMonth [

	self assert: Muharram thirtieth isLastDayOfMonth.
	self assert: Safar twentyninth isLastDayOfMonth.
	self assert: RabiII twentyninth isLastDayOfMonth.
	self deny: Muharram twentyninth isLastDayOfMonth.
	self deny: Safar twentyeighth isLastDayOfMonth.
	self deny: RabiI twentyninth isLastDayOfMonth
]

{ #category : 'test querying' }
IslamicDayOfMonthTest >> testIsLastDayOfMonthIn [
	| leapYear nonleapYear |
	leapYear := 1428 asIslamicYear.
	nonleapYear := 1429 asIslamicYear.
	self assert: (Muharram thirtieth isLastDayOfMonthIn: leapYear).
	self assert: (Muharram thirtieth isLastDayOfMonthIn: nonleapYear).
	self assert: (Safar twentyninth isLastDayOfMonthIn: leapYear).
	self assert: (Safar twentyninth isLastDayOfMonthIn: nonleapYear).
	self assert: (DhuAlHijja thirtieth isLastDayOfMonthIn: leapYear).
	self assert: (DhuAlHijja twentyninth isLastDayOfMonthIn: nonleapYear).
	self deny: (Muharram twentyninth isLastDayOfMonthIn: leapYear).
	self deny: (Muharram twentyninth isLastDayOfMonthIn: nonleapYear).
	self deny: (Safar twentyeighth isLastDayOfMonthIn: leapYear).
	self deny: (Safar twentyeighth isLastDayOfMonthIn: nonleapYear).
	self deny: (DhuAlHijja twentyninth isLastDayOfMonthIn: leapYear)
]

{ #category : 'test querying' }
IslamicDayOfMonthTest >> testIsLastDayOfYear [

	self assert: DhuAlHijja thirtieth isLastDayOfYear.
	self deny: DhuAlHijja twentyninth isLastDayOfYear.
	self deny: DhuAlQada thirtieth isLastDayOfYear
]

{ #category : 'test querying' }
IslamicDayOfMonthTest >> testIsLastDayOfYearIn [
	| leapYear nonleapYear |
	leapYear := 1428 asIslamicYear.
	nonleapYear := 1429 asIslamicYear.
	self assert: (DhuAlHijja thirtieth isLastDayOfYearIn: leapYear).
	self deny: (DhuAlHijja twentyninth isLastDayOfYearIn: leapYear).
	self deny: (DhuAlHijja thirtieth isLastDayOfYearIn: nonleapYear).
	self assert: (DhuAlHijja twentyninth isLastDayOfYearIn: nonleapYear).
	self deny: (DhuAlHijja twentyninth isLastDayOfYearIn: leapYear).
	self deny: (DhuAlQada thirtieth isLastDayOfYearIn: nonleapYear)
]

{ #category : 'test querying' }
IslamicDayOfMonthTest >> testMaximumNumberOfDaysInOneYear [

	self
		assert: Safar third maximumNumberOfDaysInOneYear
		equals: 355 daysMeasure
]

{ #category : 'test enumerating' }
IslamicDayOfMonthTest >> testNext [

	self assert: DhuAlHijja twentyninth next equals: Muharram first.
	self assert: Safar twentyninth next equals: RabiI first
]

{ #category : 'test enumerating' }
IslamicDayOfMonthTest >> testNextANumberOfDays [

	self
		assert: (DhuAlHijja twentyninth next: 7 daysMeasure)
		equals: Muharram seventh.
	self
		assert: (Safar twentyninth next: 7 daysMeasure)
		equals: RabiI seventh.
	self
		assert: (Muharram first next: -1 dayMeasure)
		equals: DhuAlHijja twentyninth.
	self
		assert: (Muharram first next: -32 daysMeasure)
		equals: DhuAlQada twentyeighth
]

{ #category : 'test accessing' }
IslamicDayOfMonthTest >> testNumberOfDaysFromBeginningOfMonth [

	self
		assert: Muharram first numberOfDaysFromBeginningOfMonth
		equals: 0 daysMeasure.
	self
		assert: Muharram thirtieth numberOfDaysFromBeginningOfMonth
		equals: 29 daysMeasure.
	self
		assert: Safar twentyninth numberOfDaysFromBeginningOfMonth
		equals: 28 daysMeasure
]

{ #category : 'test accessing' }
IslamicDayOfMonthTest >> testNumberOfDaysToEndOfMonth [

	self
		assert: Muharram twentyfirst numberOfDaysToEndOfMonth
		equals: 9 daysMeasure.
	self
		assert: Muharram thirtieth numberOfDaysToEndOfMonth
		equals: 0 daysMeasure.
	self
		assert: Safar twentyeighth numberOfDaysToEndOfMonth
		equals: 1 dayMeasure
]

{ #category : 'test accessing' }
IslamicDayOfMonthTest >> testNumberOfDaysToEndOfYear [

	self
		assert: Muharram first numberOfDaysToEndOfYear
		equals: 354 daysMeasure.
	self
		assert: DhuAlHijja thirtieth numberOfDaysToEndOfYear
		equals: 0 daysMeasure
]

{ #category : 'test enumerating' }
IslamicDayOfMonthTest >> testPrevious [

	self assert: Muharram first previous equals: DhuAlHijja twentyninth.
	self assert: RabiI first previous equals: Safar twentyninth
]

{ #category : 'test enumerating' }
IslamicDayOfMonthTest >> testPreviousANumberOfDays [

	self
		assert: (DhuAlQada thirtieth previous: 7 daysMeasure)
		equals: DhuAlQada twentythird.
	self
		assert: (Safar twentyninth previous: 7 daysMeasure)
		equals: Safar twentysecond.
	self
		assert: (Muharram first previous: -1 dayMeasure)
		equals: Muharram second.
	self
		assert: (Muharram first previous: -32 daysMeasure)
		equals: Safar third
]

{ #category : 'test printing' }
IslamicDayOfMonthTest >> testPrintString [

	self
		assert: DhuAlHijja thirtieth printString
		equals: 'Dhu al-Hijja 30'
]

{ #category : 'test interval protocol' }
IslamicDayOfMonthTest >> testTo [

	| interval |
	interval := Muharram first to: Muharram tenth.
	self assert: interval from equals: Muharram first.
	self assert: interval to equals: Muharram tenth.
	self assert: interval by equals: oneDay
]

{ #category : 'test interval protocol' }
IslamicDayOfMonthTest >> testToBy [

	| interval |
	interval := Muharram first to: Muharram tenth by: twoDays.
	self assert: interval from equals: Muharram first.
	self assert: interval to equals: Muharram tenth.
	self assert: interval by equals: twoDays
]

{ #category : 'test interval protocol' }
IslamicDayOfMonthTest >> testToByDo [

	| daysTo muharramFirst dayOfMonth |
	daysTo := 0.
	muharramFirst := Muharram first.
	dayOfMonth := muharramFirst.
	(muharramFirst to: DhuAlHijja twentyninth) do: [ :aDayOfMonth |
		self assert: aDayOfMonth equals: dayOfMonth.
		self
			assert: (muharramFirst distanceTo: aDayOfMonth) amount
			equals: daysTo.
		dayOfMonth := dayOfMonth next.
		daysTo := daysTo + 1 ].
	self assert: daysTo equals: 354
]

{ #category : 'test interval protocol' }
IslamicDayOfMonthTest >> testToEveryDayNumber [

	| expectedMonths interval |
	interval := Muharram first
		            to: DhuAlHijja twentyninth
		            everyDayNumber: 30.
	self assert: interval first equals: Muharram thirtieth.
	self assert: interval last equals: DhuAlQada thirtieth.
	self assert: interval size equals: 6.
	expectedMonths := calendar months select: [ :month |
		                  month lastDayNumber = 30 ].
	interval inject: 1 into: [ :index :dayMonth |
		self assert: dayMonth month equals: (expectedMonths at: index).
		self assert: dayMonth dayNumber equals: 30.
		index + 1 ]
]

{ #category : 'test interval protocol' }
IslamicDayOfMonthTest >> testToEveryDayNumbers [

	| expectedDayNumbers interval |
	interval := Muharram first
		            to: DhuAlHijja thirtieth
		            everyDayNumbers: (Array
				             with: 5
				             with: 20
				             with: 30
				             with: 1).
	self assert: interval first equals: Muharram first.
	self assert: interval last equals: Muharram first.
	self assert: interval size equals: 43.
	expectedDayNumbers := #( 1 5 20 30 1 5 20 1 5 20 30 1 5 20 1 5 20 30
	                         1 5 20 1 5 20 30 1 5 20 1 5 20 30 1 5 20 1 5
	                         20 30 1 5 20 1 ).
	interval inject: 1 into: [ :index :dayMonth |
		self
			assert: dayMonth dayNumber
			equals: (expectedDayNumbers at: index).
		index + 1 ]
]

{ #category : 'test interval protocol' }
IslamicDayOfMonthTest >> testToNegativeBy [

	| interval number |
	interval := Muharram thirtieth to: Muharram first by: twoDays negated.
	number := 30.
	interval do: [ :dayOfMonth |
		self assert: dayOfMonth dayNumber equals: number.
		number := number - 2 ].
	self assert: number equals: 0
]

{ #category : 'test interval protocol' }
IslamicDayOfMonthTest >> testToReverse [

	| interval |
	interval := Muharram first to: Muharram second by: oneDay.
	self assert: interval reverse first equals: interval to.
	self assert: interval reverse last equals: interval from.

	interval := Muharram first to: Muharram second by: oneDay negated.
	self assert: interval reverse first equals: interval to.
	self assert: interval reverse last equals: interval from
]
