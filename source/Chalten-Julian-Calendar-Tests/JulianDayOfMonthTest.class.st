Class {
	#name : 'JulianDayOfMonthTest',
	#superclass : 'TestCase',
	#instVars : [
		'calendar',
		'twoDays',
		'oneDay'
	],
	#category : 'Chalten-Julian-Calendar-Tests',
	#package : 'Chalten-Julian-Calendar-Tests'
}

{ #category : 'accessing' }
JulianDayOfMonthTest class >> classUnderTest [

	^DayOfMonth
]

{ #category : 'initialization' }
JulianDayOfMonthTest >> setUp [
	calendar := ChaltenEnvironment calendarNamed: #JulianCalendar.
	oneDay := 1 dayMeasure.
	twoDays := 2 daysMeasure
]

{ #category : 'test date creation' }
JulianDayOfMonthTest >> testComma [

	| january |
	january := calendar january.
	self
		assert:
		(DayOfMonth monthNumber: 1 dayNumber: 1 calendar: calendar) , 2005
		equals: JulianJanuary first , 2005.
	self assert: january first , 2006 equals: (FixedDate
			 yearNumber: 2006
			 monthNumber: 1
			 dayNumber: 1
			 calendar: calendar)
]

{ #category : 'test comparing' }
JulianDayOfMonthTest >> testComparing [

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
		                       dayNumber: 31
		                       calendar: calendar.
	firstDayOfSecondMonth := DayOfMonth
		                         monthNumber: 2
		                         dayNumber: 1
		                         calendar: calendar.

	self assert: firstDayOfFirstMonth < secondDayOfFirstMonth.
	self assert: lastDayOfFirstMonth < firstDayOfSecondMonth.
	self deny: firstDayOfFirstMonth < firstDayOfFirstMonth.

	self
		should: [ firstDayOfFirstMonth > JulianMonday ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: JulianMonday class
						 with: JulianMonday
						 with: firstDayOfFirstMonth class
						 with: firstDayOfFirstMonth) ].

	self
		should: [ lastDayOfFirstMonth < JulianMarch ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: lastDayOfFirstMonth class
						 with: lastDayOfFirstMonth
						 with: JulianMarch class
						 with: JulianMarch) ]
]

{ #category : 'test instance creation' }
JulianDayOfMonthTest >> testCreation [

	self
		assert:
		(DayOfMonth monthNumber: 1 dayNumber: 1 calendar: calendar) month
		equals: calendar january.
	self
		assert:
		(DayOfMonth monthNumber: 1 dayNumber: 1 calendar: calendar)
			dayNumber
		equals: 1.
	self
		assert: (DayOfMonth month: calendar december dayNumber: 31) month
		equals: calendar december.
	self
		assert:
		(DayOfMonth month: calendar december dayNumber: 31) dayNumber
		equals: 31.
	self
		assert: (DayOfMonth month: calendar february dayNumber: 29) month
		equals: calendar february.
	self
		assert:
		(DayOfMonth month: calendar february dayNumber: 29) dayNumber
		equals: 29
]

{ #category : 'test date creation' }
JulianDayOfMonthTest >> testDateOfYear [

	self
		assert:
			((DayOfMonth monthNumber: 1 dayNumber: 1 calendar: calendar)
				 ofYear: 2005 asJulianYear)
		equals: JulianJanuary first , 2005
]

{ #category : 'test querying' }
JulianDayOfMonthTest >> testDaysFrom [

	self
		assert:
		(JulianDecember thirtyfirst distanceFrom: JulianDecember thirtyfirst)
		equals: 0 daysMeasure.
	self
		assert:
		(JulianDecember thirtyfirst distanceFrom: JulianJanuary first)
		equals: 364 daysMeasure
]

{ #category : 'test querying' }
JulianDayOfMonthTest >> testDaysTo [

	self
		assert:
		(JulianDecember thirtyfirst distanceTo: JulianDecember thirtyfirst)
		equals: 0 daysMeasure.
	self
		assert: (JulianDecember thirtyfirst distanceTo: JulianJanuary first)
		equals: 1 dayMeasure.
	self
		assert: (JulianJanuary first distanceTo: JulianDecember thirtyfirst)
		equals: 364 daysMeasure.
	self
		assert: (JulianJanuary tenth distanceTo: JulianJanuary first)
		equals: 356 daysMeasure
]

{ #category : 'test comparing' }
JulianDayOfMonthTest >> testEqual [

	self
		assert: (DayOfMonth monthNumber: 1 dayNumber: 1 calendar: calendar)
		equals: (DayOfMonth monthNumber: 1 dayNumber: 1 calendar: calendar).
	self deny:
		(DayOfMonth monthNumber: 1 dayNumber: 2 calendar: calendar)
		= (DayOfMonth monthNumber: 1 dayNumber: 1 calendar: calendar)
]

{ #category : 'test comparing' }
JulianDayOfMonthTest >> testHash [

	self
		assert:
		(DayOfMonth monthNumber: 1 dayNumber: 1 calendar: calendar) hash
		equals:
		(DayOfMonth monthNumber: 1 dayNumber: 1 calendar: calendar) hash
]

{ #category : 'test instance creation' }
JulianDayOfMonthTest >> testInvalidCreation [

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
				equals: 'Day of month 0 invalid for January' ].
	self
		should: [
		DayOfMonth monthNumber: 1 dayNumber: 32 calendar: calendar ]
		raise: InvalidDayOfMonthException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals: 'Day of month 32 invalid for January' ]
]

{ #category : 'test querying' }
JulianDayOfMonthTest >> testIsFirstDayOfMonth [

	self assert: (DayOfMonth monthNumber: 01 dayNumber: 01 calendar: calendar) isFirstDayOfMonth.
	self deny: (DayOfMonth monthNumber: 01 dayNumber: 02 calendar: calendar) isFirstDayOfMonth
]

{ #category : 'test querying' }
JulianDayOfMonthTest >> testIsFirstDayOfYear [

	self assert: (DayOfMonth monthNumber: 01 dayNumber: 01 calendar: calendar) isFirstDayOfYear.
	self deny: (DayOfMonth monthNumber: 01 dayNumber: 02 calendar: calendar) isFirstDayOfYear
]

{ #category : 'test querying' }
JulianDayOfMonthTest >> testIsLastDayOfMonth [

	self assert: (DayOfMonth monthNumber: 01 dayNumber: 31 calendar: calendar) isLastDayOfMonth.
	self assert: (DayOfMonth monthNumber: 02 dayNumber: 29 calendar: calendar) isLastDayOfMonth.
	self assert: (DayOfMonth monthNumber: 04 dayNumber: 30 calendar: calendar) isLastDayOfMonth.

	self deny: (DayOfMonth monthNumber: 01 dayNumber: 30 calendar: calendar) isLastDayOfMonth.
	self deny: (DayOfMonth monthNumber: 02 dayNumber: 28 calendar: calendar) isLastDayOfMonth.
	self deny: (DayOfMonth monthNumber: 03 dayNumber: 30 calendar: calendar) isLastDayOfMonth
]

{ #category : 'test querying' }
JulianDayOfMonthTest >> testIsLastDayOfYear [

	self assert: (DayOfMonth monthNumber: 12 dayNumber: 31 calendar: calendar) isLastDayOfYear.
	self deny: (DayOfMonth monthNumber: 12 dayNumber: 30 calendar: calendar) isLastDayOfYear.
	self deny: (DayOfMonth monthNumber: 11 dayNumber: 30 calendar: calendar) isLastDayOfYear
]

{ #category : 'test querying' }
JulianDayOfMonthTest >> testMaximumNumberOfDaysInOneYear [

	self
		assert: JulianMarch third maximumNumberOfDaysInOneYear
		equals: 366 daysMeasure
]

{ #category : 'test enumerating' }
JulianDayOfMonthTest >> testNext [

	self
		assert: JulianDecember thirtyfirst next
		equals: JulianJanuary first.
	self
		assert: JulianFebruary twentyeighth next
		equals: JulianMarch first
]

{ #category : 'test enumerating' }
JulianDayOfMonthTest >> testNextANumberOfDays [

	self
		assert: (JulianDecember thirtyfirst next: 7 daysMeasure)
		equals: JulianJanuary seventh.
	self
		assert: (JulianFebruary twentyeighth next: 7 daysMeasure)
		equals: JulianMarch seventh.
	self
		assert: (JulianJanuary first next: -1 dayMeasure)
		equals: JulianDecember thirtyfirst.
	self
		assert: (JulianJanuary first next: -32 daysMeasure)
		equals: JulianNovember thirtieth
]

{ #category : 'test accessing' }
JulianDayOfMonthTest >> testNumberOfDaysFromBeginningOfMonth [

	self
		assert: (DayOfMonth monthNumber: 1 dayNumber: 1 calendar: calendar)
				numberOfDaysFromBeginningOfMonth
		equals: 0 daysMeasure.
	self
		assert:
			(DayOfMonth monthNumber: 1 dayNumber: 31 calendar: calendar)
				numberOfDaysFromBeginningOfMonth
		equals: 30 daysMeasure.
	self
		assert:
			(DayOfMonth monthNumber: 2 dayNumber: 29 calendar: calendar)
				numberOfDaysFromBeginningOfMonth
		equals: 28 daysMeasure
]

{ #category : 'test accessing' }
JulianDayOfMonthTest >> testNumberOfDaysToEndOfMonth [

	self
		assert: (DayOfMonth monthNumber: 1 dayNumber: 1 calendar: calendar)
				numberOfDaysToEndOfMonth
		equals: 30 daysMeasure.
	self
		assert:
			(DayOfMonth monthNumber: 1 dayNumber: 31 calendar: calendar)
				numberOfDaysToEndOfMonth
		equals: 0 daysMeasure.
	self
		assert:
			(DayOfMonth monthNumber: 2 dayNumber: 28 calendar: calendar)
				numberOfDaysToEndOfMonth
		equals: 1 dayMeasure
]

{ #category : 'test accessing' }
JulianDayOfMonthTest >> testNumberOfDaysToEndOfYear [

	self
		assert: JulianJanuary first numberOfDaysToEndOfYear
		equals: 364 daysMeasure.
	self
		assert: JulianDecember thirtyfirst numberOfDaysToEndOfYear
		equals: 0 daysMeasure
]

{ #category : 'test enumerating' }
JulianDayOfMonthTest >> testPrevious [

	self
		assert: JulianJanuary first previous
		equals: JulianDecember thirtyfirst.
	self
		assert: JulianMarch first previous
		equals: JulianFebruary twentyeighth
]

{ #category : 'test enumerating' }
JulianDayOfMonthTest >> testPreviousANumberOfDays [

	self
		assert:
			((DayOfMonth monthNumber: 12 dayNumber: 31 calendar: calendar)
				 previous: 7 daysMeasure)
		equals:
		(DayOfMonth monthNumber: 12 dayNumber: 24 calendar: calendar).
	self
		assert:
			((DayOfMonth monthNumber: 2 dayNumber: 29 calendar: calendar)
				 previous: 7 daysMeasure)
		equals: (DayOfMonth monthNumber: 2 dayNumber: 22 calendar: calendar).
	self
		assert:
			((DayOfMonth monthNumber: 1 dayNumber: 1 calendar: calendar)
				 previous: -1 dayMeasure)
		equals: (DayOfMonth monthNumber: 1 dayNumber: 2 calendar: calendar).
	self
		assert:
			((DayOfMonth monthNumber: 1 dayNumber: 1 calendar: calendar)
				 previous: -32 daysMeasure)
		equals: (DayOfMonth monthNumber: 2 dayNumber: 2 calendar: calendar)
]

{ #category : 'test printing' }
JulianDayOfMonthTest >> testPrintString [

	self
		assert:
			(DayOfMonth monthNumber: 12 dayNumber: 31 calendar: calendar)
				printString
		equals: 'December 31'
]

{ #category : 'test interval protocol' }
JulianDayOfMonthTest >> testTo [

	| interval |
	interval := (DayOfMonth
		             monthNumber: 1
		             dayNumber: 1
		             calendar: calendar) to:
	            (DayOfMonth
		             monthNumber: 1
		             dayNumber: 10
		             calendar: calendar).
	self
		assert: interval from
		equals: (DayOfMonth monthNumber: 1 dayNumber: 1 calendar: calendar).
	self
		assert: interval to
		equals: (DayOfMonth monthNumber: 1 dayNumber: 10 calendar: calendar).
	self assert: interval by equals: oneDay
]

{ #category : 'test interval protocol' }
JulianDayOfMonthTest >> testToBy [

	| interval |
	interval := (DayOfMonth
		             monthNumber: 1
		             dayNumber: 1
		             calendar: calendar) to:
	            (DayOfMonth
		             monthNumber: 1
		             dayNumber: 10
		             calendar: calendar) by: twoDays.
	self
		assert: interval from
		equals: (DayOfMonth monthNumber: 1 dayNumber: 1 calendar: calendar).
	self
		assert: interval to
		equals: (DayOfMonth monthNumber: 1 dayNumber: 10 calendar: calendar).
	self assert: interval by equals: twoDays
]

{ #category : 'test interval protocol' }
JulianDayOfMonthTest >> testToByDo [

	| daysTo januaryFirst dayOfMonth |
	daysTo := 0.
	januaryFirst := DayOfMonth
		                monthNumber: 1
		                dayNumber: 1
		                calendar: calendar.
	dayOfMonth := januaryFirst.
	(januaryFirst to:
	 (DayOfMonth monthNumber: 12 dayNumber: 31 calendar: calendar)) do: [
		:aDayOfMonth |
		self assert: aDayOfMonth equals: dayOfMonth.
		self
			assert: (januaryFirst distanceTo: aDayOfMonth) amount
			equals: daysTo.
		dayOfMonth := dayOfMonth next.
		daysTo := daysTo + 1 ].
	self assert: daysTo equals: 365
]

{ #category : 'test interval protocol' }
JulianDayOfMonthTest >> testToEveryDayNumber [

	| expectedMonths interval |
	interval := (DayOfMonth
		             monthNumber: 1
		             dayNumber: 1
		             calendar: calendar)
		            to:
		            (DayOfMonth
			             monthNumber: 12
			             dayNumber: 31
			             calendar: calendar)
		            everyDayNumber: 31.
	self
		assert: interval first
		equals: (DayOfMonth monthNumber: 1 dayNumber: 31 calendar: calendar).
	self
		assert: interval last
		equals:
		(DayOfMonth monthNumber: 12 dayNumber: 31 calendar: calendar).
	self assert: interval size equals: 7.
	expectedMonths := calendar months select: [ :month |
		                  month lastDayNumber = 31 ].
	interval inject: 1 into: [ :index :dayMonth |
		self assert: dayMonth month equals: (expectedMonths at: index).
		self assert: dayMonth dayNumber equals: 31.
		index + 1 ]
]

{ #category : 'test interval protocol' }
JulianDayOfMonthTest >> testToEveryDayNumbers [

	| expectedDayNumbers interval |
	interval := (DayOfMonth
		             monthNumber: 1
		             dayNumber: 1
		             calendar: calendar)
		            to:
		            (DayOfMonth
			             monthNumber: 12
			             dayNumber: 31
			             calendar: calendar)
		            everyDayNumbers: (Array
				             with: 5
				             with: 20
				             with: 31
				             with: 1).
	self
		assert: interval first
		equals: (DayOfMonth monthNumber: 1 dayNumber: 1 calendar: calendar).
	self
		assert: interval last
		equals:
		(DayOfMonth monthNumber: 12 dayNumber: 31 calendar: calendar).
	self assert: interval size equals: 43.
	expectedDayNumbers := #( 1 5 20 31 1 5 20 1 5 20 31 1 5 20 1 5 20 31
	                         1 5 20 1 5 20 31 1 5 20 31 1 5 20 1 5 20 31
	                         1 5 20 1 5 20 31 ).
	interval inject: 1 into: [ :index :dayMonth |
		self
			assert: dayMonth dayNumber
			equals: (expectedDayNumbers at: index).
		index + 1 ]
]

{ #category : 'test interval protocol' }
JulianDayOfMonthTest >> testToNegativeBy [

	| interval number |
	interval := (DayOfMonth
		             monthNumber: 1
		             dayNumber: 30
		             calendar: calendar) to:
	            (DayOfMonth
		             monthNumber: 1
		             dayNumber: 1
		             calendar: calendar) by: twoDays negated.
	number := 30.
	interval do: [ :dayOfMonth |
		self assert: dayOfMonth dayNumber equals: number.
		number := number - 2 ].
	self assert: number equals: 0
]

{ #category : 'test interval protocol' }
JulianDayOfMonthTest >> testToReverse [

	| interval |
	interval := (DayOfMonth
		             monthNumber: 1
		             dayNumber: 1
		             calendar: calendar) to:
	            (DayOfMonth
		             monthNumber: 1
		             dayNumber: 2
		             calendar: calendar) by: oneDay.
	self assert: interval reverse first equals: interval to.
	self assert: interval reverse last equals: interval from.
	interval := (DayOfMonth
		             monthNumber: 1
		             dayNumber: 1
		             calendar: calendar) to:
	            (DayOfMonth
		             monthNumber: 1
		             dayNumber: 2
		             calendar: calendar) by: oneDay negated.
	self assert: interval reverse first equals: interval to.
	self assert: interval reverse last equals: interval from
]
