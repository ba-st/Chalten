Class {
	#name : 'JulianDateTest',
	#superclass : 'TestCase',
	#instVars : [
		'calendar'
	],
	#category : 'Chalten-Julian-Calendar-Tests',
	#package : 'Chalten-Julian-Calendar-Tests'
}

{ #category : 'accessing' }
JulianDateTest class >> classUnderTest [

	^FixedDate
]

{ #category : 'test support' }
JulianDateTest >> january [

	^calendar january
]

{ #category : 'test support' }
JulianDateTest >> oneDay [
	^ 1 dayMeasure
]

{ #category : 'initialization' }
JulianDateTest >> setUp [
	calendar := ChaltenEnvironment calendarNamed: #JulianCalendar
]

{ #category : 'test support' }
JulianDateTest >> tenDays [
	^ 10 daysMeasure
]

{ #category : 'test interval protocol' }
JulianDateTest >> test29OfFebruaryToEveryDayOfMonth [

	| dates |
	dates := JulianOctober first , 2003
		         to: JulianMarch first , 2009
		         everyDayOfMonth: JulianFebruary twentyninth.
	self assert: dates size equals: 2.
	self assert: (dates includes: JulianFebruary twentyninth , 2004).
	self assert: (dates includes: JulianFebruary twentyninth , 2008)
]

{ #category : 'test converting' }
JulianDateTest >> testAsGregorianDate [

	self
		assert: (JulianJanuary fourteenth , 2005) asGregorian
		equals: January twentyseventh , 2005.
	self
		assert: (JulianMarch fourteenth , 2005) asGregorian
		equals: March twentyseventh , 2005.
	self
		assert: (JulianSeptember eighteenth , 1999) asGregorian
		equals: October first , 1999.
	self
		assert: (JulianOctober twentyfifth , 2008) asGregorian
		equals: November seventh , 2008.
	self
		assert: (JulianDecember fifteenth , 2015) asGregorian
		equals: December twentyeighth , 2015
]

{ #category : 'test converting' }
JulianDateTest >> testAsJulianDate [

	self
		assert: JulianJanuary fourteenth , 2005
		equals: (January twentyseventh , 2005) asJulian.
	self
		assert: JulianMarch fourteenth , 2005
		equals: (March twentyseventh , 2005) asJulian.
	self
		assert: JulianSeptember eighteenth , 1999
		equals: (October first , 1999) asJulian.
	self
		assert: JulianOctober twentyfifth , 2008
		equals: (November seventh , 2008) asJulian.
	self
		assert: JulianDecember fifteenth , 2015
		equals: (December twentyeighth , 2015) asJulian
]

{ #category : 'test converting' }
JulianDateTest >> testAsSmalltalkDate [

	| julianDate gregorianDate smalltalkDate |
	julianDate := JulianMay fourth , 2007.
	gregorianDate := julianDate asGregorian.
	smalltalkDate := julianDate asSmalltalkDate.
	self assert: gregorianDate year number equals: smalltalkDate year.
	self
		assert: gregorianDate month number
		equals: smalltalkDate monthIndex.
	self assert: gregorianDate dayNumber equals: smalltalkDate dayOfMonth
]

{ #category : 'test accessing' }
JulianDateTest >> testAtMidnight [

	self
		assert: (JulianOctober first , 2007) atMidnight
		equals: (ChaltenDateTime
				 date: JulianOctober first , 2007
				 timeOfDay: (TimeOfDay hours: 00))
]

{ #category : 'test accessing' }
JulianDateTest >> testAtNoon [

	self assert: (JulianOctober first , 2007) atNoon equals: (ChaltenDateTime
			 date: JulianOctober first , 2007
			 timeOfDay: (TimeOfDay hours: 12))
]

{ #category : 'test accessing' }
JulianDateTest >> testAtTimeOfDay [

	self
		assert:
		(JulianOctober first , 2007 atTimeOfDay: (TimeOfDay hours: 10))
		equals: (ChaltenDateTime
				 date: JulianOctober first , 2007
				 timeOfDay: (TimeOfDay hours: 10))
]

{ #category : 'test instance creation' }
JulianDateTest >> testCreation [

	| year2007 januaryOf2007 |
	year2007 := 2007 asJulianYear.
	januaryOf2007 := JulianJanuary ofYear: year2007.
	self
		assert: (FixedDate
				 yearNumber: 2007
				 monthNumber: 1
				 dayNumber: 1
				 calendar: calendar) monthOfYear
		equals: januaryOf2007.
	self
		assert: (FixedDate
				 yearNumber: 2007
				 monthNumber: 1
				 dayNumber: 1
				 calendar: calendar) dayNumber
		equals: 1.
	self
		assert:
			(FixedDate
				 monthOfYear: (JulianJanuary ofYear: year2007)
				 dayNumber: 1) monthOfYear
		equals: januaryOf2007.
	self
		assert:
			(FixedDate
				 monthOfYear: (JulianJanuary ofYear: year2007)
				 dayNumber: 1) dayNumber
		equals: 1.
	self
		assert: (FixedDate year: year2007 month: self january dayNumber: 1)
				monthOfYear
		equals: januaryOf2007.
	self
		assert:
		(FixedDate year: year2007 month: self january dayNumber: 1)
			dayNumber
		equals: 1.
	self
		assert:
			(FixedDate yearNumber: 2007 month: self january dayNumber: 1)
				monthOfYear
		equals: januaryOf2007.
	self
		assert:
			(FixedDate yearNumber: 2007 month: self january dayNumber: 1)
				dayNumber
		equals: 1
]

{ #category : 'test accessing' }
JulianDateTest >> testDay [

	self assert: (JulianOctober first , 2007) day equals: calendar sunday.
	self
		assert: (JulianOctober second , 2007) day
		equals: calendar monday.
	self
		assert: (JulianOctober third , 2007) day
		equals: calendar tuesday.
	self
		assert: (JulianOctober fourth , 2007) day
		equals: calendar wednesday.
	self
		assert: (JulianOctober fifth , 2007) day
		equals: calendar thursday.
	self assert: (JulianOctober sixth , 2007) day equals: calendar friday.
	self
		assert: (JulianOctober seventh , 2007) day
		equals: calendar saturday.
	self
		assert: (JulianOctober eighth , 2007) day
		equals: calendar sunday
]

{ #category : 'test accessing' }
JulianDateTest >> testDayNumber [

	self assert: (JulianOctober first , 2007) dayNumber equals: 1
]

{ #category : 'test accessing' }
JulianDateTest >> testDayOfMonth [

	self
		assert: (JulianMarch first , 2007) dayOfMonth
		equals: JulianMarch first
]

{ #category : 'test querying' }
JulianDateTest >> testDaysFrom [

	self
		assert:
		(JulianJanuary first , 2007 distanceFrom: JulianJanuary first , 2007)
		equals: self zeroDays.
	self
		assert:
		(JulianFebruary first , 2007 distanceFrom:
			 JulianJanuary first , 2007)
		equals: self thirtyOneDays.
	self
		assert:
		(JulianMarch first , 2007 distanceFrom: JulianJanuary first , 2007)
		equals: (31 + 28) daysMeasure.
	self
		assert:
		(JulianJanuary first , 2008 distanceFrom: JulianJanuary first , 2007)
		equals: 365 daysMeasure.
	self
		assert:
		(JulianJanuary first , 2009 distanceFrom: JulianJanuary first , 2008)
		equals: 366 daysMeasure.
	self
		assert:
		(JulianJanuary first , 2003 distanceFrom: JulianJanuary first , 2004)
		equals: -365 daysMeasure.
	self
		assert:
		(JulianJanuary first , 2004 distanceFrom: JulianJanuary first , 2005)
		equals: -366 daysMeasure.
	self
		assert:
		(TheBeginningOfTime distanceFrom: JulianJanuary first , 2005)
		equals: ArithmeticObject minusInfinity daysMeasure.
	self
		assert: (TheEndOfTime distanceFrom: JulianJanuary first , 2005)
		equals: ArithmeticObject infinity daysMeasure
]

{ #category : 'test querying' }
JulianDateTest >> testDaysTo [

	self
		assert:
		(JulianJanuary first , 2007 distanceTo: JulianJanuary first , 2007)
		equals: self zeroDays.
	self
		assert:
		(JulianJanuary first , 2007 distanceTo: JulianFebruary first , 2007)
		equals: self thirtyOneDays.
	self
		assert:
		(JulianJanuary first , 2007 distanceTo: JulianMarch first , 2007)
		equals: (31 + 28) daysMeasure.
	self
		assert:
		(JulianJanuary first , 2007 distanceTo: JulianJanuary first , 2008)
		equals: 365 daysMeasure.
	self
		assert:
		(JulianJanuary first , 2008 distanceTo: JulianJanuary first , 2009)
		equals: 366 daysMeasure.
	self
		assert:
		(JulianJanuary first , 2004 distanceTo: JulianJanuary first , 2003)
		equals: -365 daysMeasure.
	self
		assert:
		(JulianJanuary first , 2005 distanceTo: JulianJanuary first , 2004)
		equals: -366 daysMeasure.
	self
		assert: (JulianJanuary first , 2005 distanceTo: TheBeginningOfTime)
		equals: ArithmeticObject minusInfinity daysMeasure.
	self
		assert: (JulianJanuary first , 2005 distanceTo: TheEndOfTime)
		equals: ArithmeticObject infinity daysMeasure
]

{ #category : 'test comparing' }
JulianDateTest >> testEqual [

	self
		assert: (FixedDate
				 yearNumber: 2007
				 monthNumber: 1
				 dayNumber: 1
				 calendar: calendar)
		equals: JulianJanuary first , 2007.
	self deny: (FixedDate
			 yearNumber: 2007
			 monthNumber: 1
			 dayNumber: 1
			 calendar: calendar) = (JulianJanuary second , 2007)
]

{ #category : 'test comparing' }
JulianDateTest >> testGreaterThan [

	self assert:
		JulianFebruary first , 2007 > (JulianJanuary thirtyfirst , 2007).
	self assert:
		JulianFebruary first , 2007 > (JulianJanuary first , 2007).
	self assert:
		JulianFebruary first , 2007 > (JulianDecember thirtyfirst , 2006).

	self
		should: [ JulianFebruary first , 2007 > JulianMonday ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: JulianMonday class
						 with: JulianMonday
						 with: (JulianFebruary first , 2007) class
						 with: JulianFebruary first , 2007) ].

	self
		should: [ JulianJanuary thirtyfirst , 2007 >= JulianMarch ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: (JulianJanuary thirtyfirst , 2007) class
						 with: JulianJanuary thirtyfirst , 2007
						 with: JulianMarch class
						 with: JulianMarch) ]
]

{ #category : 'test comparing' }
JulianDateTest >> testHash [

	self assert: (JulianJanuary first , 2007) hash equals: (FixedDate
			 yearNumber: 2007
			 monthNumber: 1
			 dayNumber: 1
			 calendar: calendar) hash
]

{ #category : 'test includes' }
JulianDateTest >> testIncludesDate [

	self
		should: [JulianJanuary first, 2007 includes: JulianJanuary first, 2007]
		raise: Exception
]

{ #category : 'test includes' }
JulianDateTest >> testIncludesDateTime [

	self assert: (JulianJanuary first, 2007 includes: (JulianJanuary first, 2007) atMidnight).
	self assert: (JulianJanuary first, 2007 includes: (JulianJanuary first, 2007) atLastTimeOfDay).

	self deny: (JulianJanuary first, 2007 includes: (JulianFebruary first, 2007) atMidnight).
	self deny: (JulianJanuary first, 2007 includes: (JulianDecember thirtyfirst, 2006) atLastTimeOfDay)
]

{ #category : 'test includes' }
JulianDateTest >> testIncludesMonthOfYear [

	self
		should: [JulianJanuary first, 2007 includes: JulianJanuary, 2007]
		raise: Exception
]

{ #category : 'test includes' }
JulianDateTest >> testIncludesYear [
	self should: [ JulianJanuary first , 2007 includes: 2007 asJulianYear ] raise: Exception
]

{ #category : 'test instance creation' }
JulianDateTest >> testInvalidCreation [

	self
		should: [
			FixedDate
				yearNumber: 2004
				monthNumber: 2
				dayNumber: 30
				calendar: calendar ]
		raise: InvalidDateException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals:
				'The day 30 is invalid for the month February of Year 2004' ].
	self
		should: [
			FixedDate
				yearNumber: 2003
				monthNumber: 2
				dayNumber: 29
				calendar: calendar ]
		raise: InvalidDateException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals:
				'The day 29 is invalid for the month February of Year 2003' ].
	self
		should: [
			FixedDate
				yearNumber: 2004
				monthNumber: 1
				dayNumber: 32
				calendar: calendar ]
		raise: InvalidDateException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals: 'The day 32 is invalid for the month January of Year 2004' ].
	self
		should: [
			FixedDate
				yearNumber: 2004
				monthNumber: 3
				dayNumber: 32
				calendar: calendar ]
		raise: InvalidDateException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals: 'The day 32 is invalid for the month March of Year 2004' ].
	self
		should: [
			FixedDate
				yearNumber: 2004
				monthNumber: 4
				dayNumber: 31
				calendar: calendar ]
		raise: InvalidDateException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals: 'The day 31 is invalid for the month April of Year 2004' ].
	self
		should: [
			FixedDate
				yearNumber: 2004
				monthNumber: 5
				dayNumber: 32
				calendar: calendar ]
		raise: InvalidDateException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals: 'The day 32 is invalid for the month May of Year 2004' ].
	self
		should: [
			FixedDate
				yearNumber: 2004
				monthNumber: 6
				dayNumber: 31
				calendar: calendar ]
		raise: InvalidDateException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals: 'The day 31 is invalid for the month June of Year 2004' ].
	self
		should: [
			FixedDate
				yearNumber: 2004
				monthNumber: 7
				dayNumber: 32
				calendar: calendar ]
		raise: InvalidDateException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals: 'The day 32 is invalid for the month July of Year 2004' ].
	self
		should: [
			FixedDate
				yearNumber: 2004
				monthNumber: 8
				dayNumber: 32
				calendar: calendar ]
		raise: InvalidDateException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals: 'The day 32 is invalid for the month August of Year 2004' ].
	self
		should: [
			FixedDate
				yearNumber: 2004
				monthNumber: 9
				dayNumber: 31
				calendar: calendar ]
		raise: InvalidDateException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals:
				'The day 31 is invalid for the month September of Year 2004' ].
	self
		should: [
			FixedDate
				yearNumber: 2004
				monthNumber: 10
				dayNumber: 32
				calendar: calendar ]
		raise: InvalidDateException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals: 'The day 32 is invalid for the month October of Year 2004' ].
	self
		should: [
			FixedDate
				yearNumber: 2004
				monthNumber: 11
				dayNumber: 31
				calendar: calendar ]
		raise: InvalidDateException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals:
				'The day 31 is invalid for the month November of Year 2004' ].
	self
		should: [
			FixedDate
				yearNumber: 2004
				monthNumber: 12
				dayNumber: 32
				calendar: calendar ]
		raise: InvalidDateException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals:
				'The day 32 is invalid for the month December of Year 2004' ].
	self
		should: [
			FixedDate
				yearNumber: 2004
				monthNumber: 13
				dayNumber: 1
				calendar: calendar ]
		raise: InvalidMonthNumberException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals: '13 is an invalid number for a month' ].
	self
		should: [
			FixedDate
				yearNumber: 2004
				monthNumber: 0
				dayNumber: 1
				calendar: calendar ]
		raise: InvalidMonthNumberException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals: '0 is an invalid number for a month' ].
	self
		should: [
			FixedDate
				yearNumber: 2004
				monthNumber: -1
				dayNumber: 1
				calendar: calendar ]
		raise: InvalidMonthNumberException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals: '-1 is an invalid number for a month' ].
	self
		should: [
			FixedDate
				yearNumber: 2004
				monthNumber: 1
				dayNumber: 0
				calendar: calendar ]
		raise: InvalidDateException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals: 'The day 0 is invalid for the month January of Year 2004' ].
	self
		should: [
			FixedDate
				yearNumber: 2004
				monthNumber: 1
				dayNumber: -1
				calendar: calendar ]
		raise: InvalidDateException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals: 'The day -1 is invalid for the month January of Year 2004' ].
	self
		should: [
			FixedDate
				yearNumber: 0
				monthNumber: 1
				dayNumber: 1
				calendar: calendar ]
		raise: InvalidYearNumberException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals: '0 is an invalid number for a year in the Julian Calendar' ]
]

{ #category : 'test testing days' }
JulianDateTest >> testIs [

	self assert: (JulianSeptember ninth, 2007 is: JulianSaturday).
	self assert: (JulianSeptember tenth, 2007 is: JulianSunday).
	self assert: (JulianSeptember eleventh, 2007 is: JulianMonday).
	self assert: (JulianSeptember twelfth, 2007 is: JulianTuesday).
	self assert: (JulianSeptember thirteenth, 2007 is: JulianWednesday).
	self assert: (JulianSeptember fourteenth, 2007 is: JulianThursday).
	self assert: (JulianSeptember fifteenth, 2007 is: JulianFriday)
]

{ #category : 'test testing' }
JulianDateTest >> testIsFirstDayOfMonth [

	self assert: (JulianJanuary first, 2007) isFirstDayOfMonth.
	self deny: (JulianJanuary second, 2007) isFirstDayOfMonth
]

{ #category : 'test testing' }
JulianDateTest >> testIsFirstDayOfYear [

	self assert: (JulianJanuary first, 2007) isFirstDayOfYear.
	self deny: (JulianFebruary first, 2007) isFirstDayOfYear
]

{ #category : 'test testing' }
JulianDateTest >> testIsFirstMonthOfYear [

	self assert: (JulianJanuary first, 2007) isFirstMonthOfYear.
	self assert: (JulianJanuary second, 2007) isFirstMonthOfYear.
	
	self deny: (JulianFebruary third, 2007) isFirstMonthOfYear.
	self deny: (JulianDecember fifteenth, 2007) isFirstMonthOfYear
]

{ #category : 'test testing months' }
JulianDateTest >> testIsIn [

	self assert: (JulianJanuary seventh, 2007 isIn: JulianJanuary).
	self assert: (JulianFebruary seventh, 2007 isIn: JulianFebruary).
	self assert: (JulianMarch seventh, 2007 isIn: JulianMarch).
	self assert: (JulianApril seventh, 2007 isIn: JulianApril).
	self assert: (JulianMay seventh, 2007 isIn: JulianMay).
	self assert: (JulianJune seventh, 2007 isIn: JulianJune).
	self assert: (JulianJuly seventh, 2007 isIn: JulianJuly).
	self assert: (JulianAugust seventh, 2007 isIn: JulianAugust).
	self assert: (JulianSeptember seventh, 2007 isIn: JulianSeptember).
	self assert: (JulianOctober seventh, 2007 isIn: JulianOctober).
	self assert: (JulianNovember seventh, 2007 isIn: JulianNovember).
	self assert: (JulianDecember seventh, 2007 isIn: JulianDecember)
]

{ #category : 'test testing' }
JulianDateTest >> testIsLastDayOfMonth [

	self assert: (JulianJanuary thirtyfirst, 2007) isLastDayOfMonth.
	self assert: (JulianFebruary twentyeighth, 2007) isLastDayOfMonth.
	self assert: (JulianFebruary twentyninth, 2008) isLastDayOfMonth.
	self assert: (JulianMarch thirtyfirst, 2007) isLastDayOfMonth.

	self deny: (JulianJanuary thirtieth, 2007) isLastDayOfMonth.
	self deny: (JulianFebruary twentyeighth, 2008) isLastDayOfMonth.
	self deny: (JulianMarch thirtieth, 2007) isLastDayOfMonth
]

{ #category : 'test testing' }
JulianDateTest >> testIsLastDayOfYear [

	self assert: (JulianDecember thirtyfirst, 2007) isLastDayOfYear.
	self assert: (JulianDecember thirtyfirst, 2008) isLastDayOfYear.

	self deny: (JulianDecember thirtieth, 2007) isLastDayOfYear.
	self deny: (JulianNovember thirtieth, 2007) isLastDayOfYear.
	self deny: (JulianOctober thirtyfirst, 2007) isLastDayOfYear
]

{ #category : 'test comparing' }
JulianDateTest >> testLessThan [

	self assert:
		JulianJanuary first , 2007 < (JulianJanuary second , 2007).
	self assert:
		JulianJanuary first , 2007 < (JulianFebruary first , 2007).
	self assert:
		JulianJanuary first , 2007 < (JulianJanuary first , 2008).

	self
		should: [ JulianFebruary first , 2007 <= JulianMonday ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: JulianMonday class
						 with: JulianMonday
						 with: (JulianFebruary first , 2007) class
						 with: JulianFebruary first , 2007) ].

	self
		should: [ JulianJanuary thirtyfirst , 2007 < JulianMarch ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: (JulianJanuary thirtyfirst , 2007) class
						 with: JulianJanuary thirtyfirst , 2007
						 with: JulianMarch class
						 with: JulianMarch) ]
]

{ #category : 'test accessing' }
JulianDateTest >> testMonth [

	self assert: (JulianJuly first , 2007) month equals: calendar july
]

{ #category : 'test accessing' }
JulianDateTest >> testMonthNumber [

	self assert: (JulianJuly first , 2007) monthNumber equals: 7
]

{ #category : 'test accessing' }
JulianDateTest >> testMonthOfYear [

	self
		assert: (JulianSeptember tenth , 2007) monthOfYear
		equals: JulianSeptember , 2007
]

{ #category : 'test enumerating' }
JulianDateTest >> testNext [

	| date |
	date := JulianJanuary thirtyfirst , 2007.
	self assert: date next equals: JulianFebruary first , 2007.

	date := JulianFebruary twentyeighth , 2007.
	self assert: date next equals: JulianMarch first , 2007.
	self assert: date next next equals: JulianMarch second , 2007.

	date := JulianDecember thirtyfirst , 2007.
	self assert: date next equals: JulianJanuary first , 2008
]

{ #category : 'test enumerating' }
JulianDateTest >> testNextDay [

	| date |
	date := JulianJanuary first , 2007.
	self
		assert: (date nextDay: calendar monday)
		equals: JulianJanuary second , 2007.
	self
		assert: (date nextDay: calendar tuesday)
		equals: JulianJanuary third , 2007.
	self
		assert: (date nextDay: calendar wednesday)
		equals: JulianJanuary fourth , 2007.
	self
		assert: (date nextDay: calendar thursday)
		equals: JulianJanuary fifth , 2007.
	self
		assert: (date nextDay: calendar friday)
		equals: JulianJanuary sixth , 2007.
	self
		assert: (date nextDay: calendar saturday)
		equals: JulianJanuary seventh , 2007.
	self
		assert: (date nextDay: calendar sunday)
		equals: JulianJanuary eighth , 2007
]

{ #category : 'test enumerating' }
JulianDateTest >> testNextDayOfMonth [

	| date |
	date := JulianJanuary first , 2007.
	self
		assert: (date nextDayOfMonth: JulianMarch third)
		equals: JulianMarch third , 2007.
	self
		assert: ((date nextDayOfMonth: JulianMarch third) nextDayOfMonth:
				 JulianApril fourth)
		equals: JulianApril fourth , 2007.

	date := JulianMarch first , 2007.
	self
		assert: (date nextDayOfMonth: JulianFebruary third)
		equals: JulianFebruary third , 2008.
	self
		assert:
			((date nextDayOfMonth: JulianFebruary third) nextDayOfMonth:
				 JulianApril fourth)
		equals: JulianApril fourth , 2008
]

{ #category : 'test enumerating' }
JulianDateTest >> testNextInNumberOfDays [

	self
		assert: (JulianJanuary first , 2007 next: self tenDays)
		equals: JulianJanuary eleventh , 2007.
	self
		assert: (JulianJanuary first , 2007 next: self thirtyDays)
		equals: JulianJanuary thirtyfirst , 2007.
	self
		assert: (JulianJanuary first , 2007 next: self thirtyOneDays)
		equals: JulianFebruary first , 2007.
	self
		assert: (JulianJanuary first , 2007 next: 365 daysMeasure)
		equals: JulianJanuary first , 2008.
	self
		assert: (JulianJanuary first , 2004 next: 366 daysMeasure)
		equals: JulianJanuary first , 2005.
	self
		assert: (JulianJanuary first , 2007 next: 0 daysMeasure)
		equals: JulianJanuary first , 2007
]

{ #category : 'test enumerating' }
JulianDateTest >> testNextInWeeks [

	self
		assert: (JulianJanuary first , 2007 next: 1 weekMeasure)
		equals: (JulianJanuary first , 2007 next: 7 daysMeasure).
	self
		assert: (JulianJanuary first , 2007 next: 2 weeksMeasure)
		equals: (JulianJanuary first , 2007 next: 14 daysMeasure)
]

{ #category : 'test enumerating' }
JulianDateTest >> testNextMonth [

	| date |
	date := JulianJanuary first , 2007.
	self
		assert: (date nextMonth: 1 monthMeasure)
		equals: JulianFebruary first , 2007.
	self
		assert: (date nextMonth: 2 monthsMeasure)
		equals: JulianMarch first , 2007.
	self
		assert: (date nextMonth: 3 monthsMeasure)
		equals: JulianApril first , 2007.
	self
		assert: (date nextMonth: 4 monthsMeasure)
		equals: JulianMay first , 2007.
	self
		assert: (date nextMonth: 5 monthsMeasure)
		equals: JulianJune first , 2007.
	self
		assert: (date nextMonth: 6 monthsMeasure)
		equals: JulianJuly first , 2007.
	self
		assert: (date nextMonth: 7 monthsMeasure)
		equals: JulianAugust first , 2007.
	self
		assert: (date nextMonth: 8 monthsMeasure)
		equals: JulianSeptember first , 2007.
	self
		assert: (date nextMonth: 9 monthsMeasure)
		equals: JulianOctober first , 2007.
	self
		assert: (date nextMonth: 10 monthsMeasure)
		equals: JulianNovember first , 2007.
	self
		assert: (date nextMonth: 11 monthsMeasure)
		equals: JulianDecember first , 2007.
	self
		assert: (date nextMonth: 12 monthsMeasure)
		equals: JulianJanuary first , 2008
]

{ #category : 'test accessing' }
JulianDateTest >> testNumberOfDaysFromBeginnigOfYear [

	self
		assert: (JulianJanuary first , 2007) numberOfDaysFromBeginningOfYear
		equals: 0 daysMeasure.
	self
		assert:
		(JulianJanuary thirtyfirst , 2007) numberOfDaysFromBeginningOfYear
		equals: 30 daysMeasure.
	self
		assert:
		(JulianDecember thirtyfirst , 2007) numberOfDaysFromBeginningOfYear
		equals: 364 daysMeasure.
	self
		assert: (JulianJanuary first , 2008) numberOfDaysFromBeginningOfYear
		equals: 0 daysMeasure.
	self
		assert:
		(JulianJanuary thirtyfirst , 2008) numberOfDaysFromBeginningOfYear
		equals: 30 daysMeasure.
	self
		assert:
		(JulianDecember thirtyfirst , 2008) numberOfDaysFromBeginningOfYear
		equals: 365 daysMeasure
]

{ #category : 'test accessing' }
JulianDateTest >> testNumberOfDaysFromBeginningOfMonth [

	self
		assert:
		(JulianJanuary first , 2007) numberOfDaysFromBeginningOfMonth
		equals: 0 daysMeasure.
	self
		assert:
		(JulianJanuary thirtyfirst , 2007) numberOfDaysFromBeginningOfMonth
		equals: 30 daysMeasure.
	self
		assert:
		(JulianFebruary twentyeighth , 2007)
			numberOfDaysFromBeginningOfMonth
		equals: 27 daysMeasure.
	self
		assert:
		(JulianFebruary twentyninth , 2008) numberOfDaysFromBeginningOfMonth
		equals: 28 daysMeasure
]

{ #category : 'test accessing' }
JulianDateTest >> testNumberOfDaysFromEpoch [

	self
		assert: (JulianJanuary first , 1) numberOfDaysFromEpoch
		equals: -2 daysMeasure.
	self
		assert: (JulianDecember thirtyfirst , 1901) numberOfDaysFromEpoch
		equals: 694337 daysMeasure.
	self
		assert: (JulianJanuary first , 2007) numberOfDaysFromEpoch
		equals: 732689 daysMeasure
]

{ #category : 'test accessing' }
JulianDateTest >> testNumberOfDaysToEndOfMonth [

	self
		assert: (JulianJanuary first , 2007) numberOfDaysToEndOfMonth
		equals: 30 daysMeasure.
	self
		assert: (JulianJanuary thirtyfirst , 2007) numberOfDaysToEndOfMonth
		equals: 0 daysMeasure.
	self
		assert:
		(JulianFebruary twentyseventh , 2007) numberOfDaysToEndOfMonth
		equals: 1 dayMeasure
]

{ #category : 'test accessing' }
JulianDateTest >> testNumberOfDaysToEndOfYear [

	self
		assert: (JulianJanuary first , 2007) numberOfDaysToEndOfYear
		equals: 364 daysMeasure.
	self
		assert: (JulianDecember thirtyfirst , 2007) numberOfDaysToEndOfYear
		equals: 0 daysMeasure
]

{ #category : 'test enumerating' }
JulianDateTest >> testPrevious [

	| date |
	date := JulianJanuary first , 2007.
	self assert: date previous equals: JulianDecember thirtyfirst , 2006.

	date := JulianMarch first , 2007.
	self assert: date previous equals: JulianFebruary twentyeighth , 2007.

	date := JulianMarch first , 2008.
	self assert: date previous equals: JulianFebruary twentyninth , 2008
]

{ #category : 'test enumerating' }
JulianDateTest >> testPreviousDay [

	| date |
	date := JulianJanuary first , 2007.
	self
		assert: (date previousDay: calendar monday)
		equals: JulianDecember twentysixth , 2006.
	self
		assert: (date previousDay: calendar tuesday)
		equals: JulianDecember twentyseventh , 2006.
	self
		assert: (date previousDay: calendar wednesday)
		equals: JulianDecember twentyeighth , 2006.
	self
		assert: (date previousDay: calendar thursday)
		equals: JulianDecember twentyninth , 2006.
	self
		assert: (date previousDay: calendar friday)
		equals: JulianDecember thirtieth , 2006.
	self
		assert: (date previousDay: calendar saturday)
		equals: JulianDecember thirtyfirst , 2006.
	self
		assert: (date previousDay: calendar sunday)
		equals: JulianDecember twentyfifth , 2006
]

{ #category : 'test enumerating' }
JulianDateTest >> testPreviousDayOfMonth [

	| date |
	date := JulianJanuary first , 2007.
	self
		assert: (date previousDayOfMonth: JulianMarch third)
		equals: JulianMarch third , 2006.
	self
		assert:
			((date previousDayOfMonth: JulianMarch third) previousDayOfMonth:
				 JulianApril fourth)
		equals: JulianApril fourth , 2005
]

{ #category : 'test enumerating' }
JulianDateTest >> testPreviousInNumberOfDays [

	self
		assert: (JulianJanuary eleventh , 2007 previous: self tenDays)
		equals: JulianJanuary first , 2007.
	self
		assert: (JulianJanuary thirtyfirst , 2007 previous: self thirtyDays)
		equals: JulianJanuary first , 2007.
	self
		assert: (JulianFebruary first , 2007 previous: self thirtyOneDays)
		equals: JulianJanuary first , 2007.
	self
		assert: (JulianJanuary first , 2005 previous: 366 daysMeasure)
		equals: JulianJanuary first , 2004.
	self
		assert: (JulianJanuary first , 2007 previous: 365 daysMeasure)
		equals: JulianJanuary first , 2006
]

{ #category : 'test enumerating' }
JulianDateTest >> testPreviousInWeeks [

	self
		assert: (JulianJanuary first , 2007 previous: 1 weekMeasure)
		equals: (JulianJanuary first , 2007 previous: 7 daysMeasure).
	self
		assert: (JulianJanuary first , 2007 previous: 2 weeksMeasure)
		equals: (JulianJanuary first , 2007 previous: 14 daysMeasure)
]

{ #category : 'test printing' }
JulianDateTest >> testPrintString [

	| date |
	date := JulianOctober first , 2007.
	self assert: date printString equals: 'October 1, 2007'
]

{ #category : 'test interval protocol' }
JulianDateTest >> testTo [

	| interval |
	interval := JulianJanuary first , 2007 to: JulianJanuary tenth , 2007.
	self assert: interval from equals: JulianJanuary first , 2007.
	self assert: interval to equals: JulianJanuary tenth , 2007.
	self assert: interval by equals: self oneDay
]

{ #category : 'test interval protocol' }
JulianDateTest >> testToBy [

	| interval |
	interval := JulianJanuary first , 2007 to: JulianJanuary tenth , 2007
	            by: self twoDays.
	self assert: interval from equals: JulianJanuary first , 2007.
	self assert: interval to equals: JulianJanuary tenth , 2007.
	self assert: interval by equals: self twoDays
]

{ #category : 'test interval protocol' }
JulianDateTest >> testToByDo [

	| daysTo januaryFirst2007 |
	daysTo := 0.
	januaryFirst2007 := JulianJanuary first , 2007.
	(januaryFirst2007 to: JulianJanuary first , 2008 by: self twoDays)
		do: [ :date |
			self
				assert: (januaryFirst2007 distanceTo: date) amount
				equals: daysTo.
			daysTo := daysTo + 2 ].
	self assert: daysTo equals: 366
]

{ #category : 'test interval protocol' }
JulianDateTest >> testToByReverse [

	| coll number |
	coll := (JulianJanuary first , 2007 to:
	         JulianJanuary thirtieth , 2007 by: self twoDays) reverse.
	number := 29.
	coll do: [ :date |
		self assert: date dayNumber equals: number.
		number := number - 2 ].
	self assert: number equals: -1
]

{ #category : 'test interval protocol' }
JulianDateTest >> testToEveryBeginningDifferentDay [

	| monday expectedDayNumbers interval |
	monday := JulianJanuary second , 2007.
	interval := monday
		            to: (monday nextDay: calendar monday) next
		            every: (Array
				             with: calendar tuesday
				             with: calendar wednesday
				             with: calendar friday).
	self assert: interval first equals: monday next.
	self
		assert: interval last
		equals: (monday nextDay: calendar monday) next.
	self assert: interval size equals: 4.
	expectedDayNumbers := #( 3 4 6 10 ).
	interval inject: 1 into: [ :index :date |
		self assert: date dayNumber equals: (expectedDayNumbers at: index).
		index + 1 ]
]

{ #category : 'test interval protocol' }
JulianDateTest >> testToEveryBeginningSameDay [

	| monday expectedDayNumbers interval |
	monday := JulianJanuary second , 2007.
	interval := monday
		            to: (monday nextDay: calendar monday)
		            every: (Array
				             with: calendar monday
				             with: calendar wednesday
				             with: calendar friday).
	self assert: interval first equals: monday.
	self assert: interval last equals: (monday nextDay: calendar monday).
	self assert: interval size equals: 4.
	expectedDayNumbers := #( 2 4 6 9 ).
	interval inject: 1 into: [ :index :date |
		self assert: date dayNumber equals: (expectedDayNumbers at: index).
		index + 1 ]
]

{ #category : 'test interval protocol' }
JulianDateTest >> testToEveryDayBeginningDifferentDay [

	| monday expectedDayNumbers interval |
	monday := JulianJanuary second , 2007.
	interval := monday
		            to: (monday nextDay: calendar monday) next
		            everyDay: calendar tuesday.
	self assert: interval first equals: monday next.
	self
		assert: interval last
		equals: (monday nextDay: calendar monday) next.
	self assert: interval size equals: 2.
	expectedDayNumbers := #( 3 10 ).
	interval inject: 1 into: [ :index :date |
		self assert: date dayNumber equals: (expectedDayNumbers at: index).
		index + 1 ]
]

{ #category : 'test interval protocol' }
JulianDateTest >> testToEveryDayBeginningSameDay [

	| monday expectedDayNumbers interval |
	monday := JulianJanuary second , 2007.
	interval := monday
		            to: (monday nextDay: calendar monday)
		            everyDay: calendar monday.
	self assert: interval first equals: monday.
	self assert: interval last equals: (monday nextDay: calendar monday).
	self assert: interval size equals: 2.
	expectedDayNumbers := #( 2 9 ).
	interval inject: 1 into: [ :index :date |
		self assert: date dayNumber equals: (expectedDayNumbers at: index).
		index + 1 ]
]

{ #category : 'test interval protocol' }
JulianDateTest >> testToEveryDayNumber [

	| expectedMonths interval |
	interval := JulianJanuary first , 2007
		            to: JulianDecember thirtyfirst , 2007
		            everyDayNumber: 31.
	self assert: interval first equals: JulianJanuary thirtyfirst , 2007.
	self assert: interval last equals: JulianDecember thirtyfirst , 2007.
	self assert: interval size equals: 7.
	expectedMonths := calendar months select: [ :month |
		                  (month lastDayNumberIn: 2007 asJulianYear) = 31 ].
	interval inject: 1 into: [ :index :date |
		self assert: date month equals: (expectedMonths at: index).
		self assert: date dayNumber equals: 31.
		index + 1 ]
]

{ #category : 'test interval protocol' }
JulianDateTest >> testToEveryDayNumbers [

	| expectedDayNumbers interval |
	interval := JulianJanuary first , 2007
		            to: JulianDecember thirtyfirst , 2007
		            everyDayNumbers: (Array
				             with: 5
				             with: 20
				             with: 31
				             with: 1).
	self assert: interval first equals: JulianJanuary first , 2007.
	self assert: interval last equals: JulianDecember thirtyfirst , 2007.
	self assert: interval size equals: 43.
	expectedDayNumbers := #( 1 5 20 31 1 5 20 1 5 20 31 1 5 20 1 5 20 31
	                         1 5 20 1 5 20 31 1 5 20 31 1 5 20 1 5 20 31
	                         1 5 20 1 5 20 31 ).
	interval inject: 1 into: [ :index :date |
		self assert: date dayNumber equals: (expectedDayNumbers at: index).
		index + 1 ]
]

{ #category : 'test interval protocol' }
JulianDateTest >> testToEveryDayOfMonth [

	| dates |
	dates := JulianJanuary tenth , 2007
		         to: JulianJanuary ninth , 2009
		         everyDayOfMonth: JulianJanuary tenth.
	self assert: dates size equals: 2.
	self assert: (dates includes: JulianJanuary tenth , 2007).
	self assert: (dates includes: JulianJanuary tenth , 2008).

	dates := JulianJanuary tenth , 2007
		         to: JulianJanuary tenth , 2009
		         everyDayOfMonth: JulianJanuary tenth.
	self assert: (dates includes: JulianJanuary tenth , 2007).
	self assert: (dates includes: JulianJanuary tenth , 2008).
	self assert: (dates includes: JulianJanuary tenth , 2009)
]

{ #category : 'test interval protocol' }
JulianDateTest >> testToNegativeBy [

	| interval number |
	interval := JulianJanuary thirtieth , 2007 to:
	            JulianJanuary first , 2007 by: self twoDays negated.
	number := 30.
	interval do: [ :date |
		self assert: date dayNumber equals: number.
		number := number - 2 ].
	self assert: number equals: 0
]

{ #category : 'test days accessing' }
JulianDateTest >> testToday [

	| tomorrow yesterday |
	tomorrow := calendar tomorrow.
	yesterday := calendar yesterday.
	self assert: calendar today equals: yesterday next.
	self assert: calendar today equals: tomorrow previous
]

{ #category : 'test days accessing' }
JulianDateTest >> testTomorrow [

	| today |
	today := calendar today.
	self assert: calendar tomorrow equals: today next
]

{ #category : 'test accessing' }
JulianDateTest >> testYear [

	self
		assert: (JulianOctober first , 2007) year
		equals: 2007 asJulianYear
]

{ #category : 'test accessing' }
JulianDateTest >> testYearNumber [

	self assert: (JulianJuly first , 2007) yearNumber equals: 2007
]

{ #category : 'test days accessing' }
JulianDateTest >> testYesterday [

	| today |
	today := calendar today.
	self assert: calendar yesterday equals: today previous
]

{ #category : 'test support' }
JulianDateTest >> thirtyDays [
	^ 30 daysMeasure
]

{ #category : 'test support' }
JulianDateTest >> thirtyOneDays [
	^ 31 daysMeasure
]

{ #category : 'test support' }
JulianDateTest >> twoDays [
	^ 2 daysMeasure
]

{ #category : 'test support' }
JulianDateTest >> zeroDays [
	^ 0 daysMeasure
]
