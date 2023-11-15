Class {
	#name : 'GregorianDateTest',
	#superclass : 'TestCase',
	#instVars : [
		'calendar'
	],
	#category : 'Chalten-Gregorian-Calendar-Tests',
	#package : 'Chalten-Gregorian-Calendar-Tests'
}

{ #category : 'accessing' }
GregorianDateTest class >> classUnderTest [

	^FixedDate
]

{ #category : 'test support' }
GregorianDateTest >> january [

	^calendar january
]

{ #category : 'test support' }
GregorianDateTest >> oneDay [
	^ 1 dayMeasure
]

{ #category : 'initialization' }
GregorianDateTest >> setUp [
	calendar := ChaltenEnvironment calendarNamed: #GregorianCalendar
]

{ #category : 'test support' }
GregorianDateTest >> tenDays [
	^ 10 daysMeasure
]

{ #category : 'test interval protocol' }
GregorianDateTest >> test29OfFebruaryToEveryDayOfMonth [

	| dates |
	dates := October first , 2003
		         to: March first , 2009
		         everyDayOfMonth: February twentyninth.
	self assert: dates size equals: 2.
	self assert: (dates includes: February twentyninth , 2004).
	self assert: (dates includes: February twentyninth , 2008)
]

{ #category : 'test converting' }
GregorianDateTest >> testAsGregorianDate [

	self
		assert: (January fourteenth , 2005) asGregorian
		equals: January fourteenth , 2005.
	self
		assert: (March fourteenth , 2005) asGregorian
		equals: March fourteenth , 2005.
	self
		assert: (September eighteenth , 1999) asGregorian
		equals: September eighteenth , 1999.
	self
		assert: (October twentyfifth , 2008) asGregorian
		equals: October twentyfifth , 2008.
	self
		assert: (December fifteenth , 2015) asGregorian
		equals: December fifteenth , 2015
]

{ #category : 'test converting' }
GregorianDateTest >> testAsSmalltalkDate [

	| gregorianDate smalltalkDate |
	gregorianDate := May fourth , 2007.
	smalltalkDate := gregorianDate asSmalltalkDate.
	self assert: gregorianDate year number equals: smalltalkDate year.
	self
		assert: gregorianDate month number
		equals: smalltalkDate monthIndex.
	self assert: gregorianDate dayNumber equals: smalltalkDate dayOfMonth
]

{ #category : 'test accessing' }
GregorianDateTest >> testAt [

	self
		assert: (October first , 2007 at: (TimeOfDay hours: 10))
		equals:
		(ChaltenDateTime
			 date: October first , 2007
			 timeOfDay: (TimeOfDay hours: 10))
]

{ #category : 'test accessing' }
GregorianDateTest >> testAtMidnight [

	self
		assert: (October first , 2007) atMidnight
		equals:
		(ChaltenDateTime
			 date: October first , 2007
			 timeOfDay: (TimeOfDay hours: 00))
]

{ #category : 'test accessing' }
GregorianDateTest >> testAtNoon [

	self
		assert: (October first , 2007) atNoon
		equals:
		(ChaltenDateTime
			 date: October first , 2007
			 timeOfDay: (TimeOfDay hours: 12))
]

{ #category : 'test accessing' }
GregorianDateTest >> testAtTimeOfDay [

	self
		assert: (October first , 2007 atTimeOfDay: (TimeOfDay hours: 10))
		equals:
		(ChaltenDateTime
			 date: October first , 2007
			 timeOfDay: (TimeOfDay hours: 10))
]

{ #category : 'test instance creation' }
GregorianDateTest >> testCreation [

	| year2007 januaryOf2007 |
	year2007 := 2007 asGregorianYear.
	januaryOf2007 := January ofYear: year2007.
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
			(FixedDate monthOfYear: (January ofYear: year2007) dayNumber: 1)
				monthOfYear
		equals: januaryOf2007.
	self
		assert:
			(FixedDate monthOfYear: (January ofYear: year2007) dayNumber: 1)
				dayNumber
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
GregorianDateTest >> testDay [

	self assert: (October first , 2007) day equals: calendar monday.
	self assert: (October second , 2007) day equals: calendar tuesday.
	self assert: (October third , 2007) day equals: calendar wednesday.
	self assert: (October fourth , 2007) day equals: calendar thursday.
	self assert: (October fifth , 2007) day equals: calendar friday.
	self assert: (October sixth , 2007) day equals: calendar saturday.
	self assert: (October seventh , 2007) day equals: calendar sunday.
	self assert: (October eighth , 2007) day equals: calendar monday
]

{ #category : 'test accessing' }
GregorianDateTest >> testDayNumber [

	self assert: (October first , 2007) dayNumber equals: 1
]

{ #category : 'test accessing' }
GregorianDateTest >> testDayOfMonth [

	self assert: (March first , 2007) dayOfMonth equals: March first
]

{ #category : 'test querying' }
GregorianDateTest >> testDaysFrom [

	self
		assert: (January first , 2007 distanceFrom: January first , 2007)
		equals: self zeroDays.
	self
		assert: (February first , 2007 distanceFrom: January first , 2007)
		equals: self thirtyOneDays.
	self
		assert: (March first , 2007 distanceFrom: January first , 2007)
		equals: (31 + 28) daysMeasure.
	self
		assert: (January first , 2008 distanceFrom: January first , 2007)
		equals: 365 daysMeasure.
	self
		assert: (January first , 2009 distanceFrom: January first , 2008)
		equals: 366 daysMeasure.
	self
		assert: (January first , 2003 distanceFrom: January first , 2004)
		equals: -365 daysMeasure.
	self
		assert: (January first , 2004 distanceFrom: January first , 2005)
		equals: -366 daysMeasure.
	self
		assert: (TheBeginningOfTime distanceFrom: January first , 2005)
		equals: ArithmeticObject minusInfinity daysMeasure.
	self
		assert: (TheEndOfTime distanceFrom: January first , 2005)
		equals: ArithmeticObject infinity daysMeasure
]

{ #category : 'test querying' }
GregorianDateTest >> testDaysTo [

	self
		assert: (January first , 2007 distanceTo: January first , 2007)
		equals: self zeroDays.
	self
		assert: (January first , 2007 distanceTo: February first , 2007)
		equals: self thirtyOneDays.
	self
		assert: (January first , 2007 distanceTo: March first , 2007)
		equals: (31 + 28) daysMeasure.
	self
		assert: (January first , 2007 distanceTo: January first , 2008)
		equals: 365 daysMeasure.
	self
		assert: (January first , 2008 distanceTo: January first , 2009)
		equals: 366 daysMeasure.
	self
		assert: (January first , 2004 distanceTo: January first , 2003)
		equals: -365 daysMeasure.
	self
		assert: (January first , 2005 distanceTo: January first , 2004)
		equals: -366 daysMeasure.
	self
		assert: (January first , 2005 distanceTo: TheBeginningOfTime)
		equals: ArithmeticObject minusInfinity daysMeasure.
	self
		assert: (January first , 2005 distanceTo: TheEndOfTime)
		equals: ArithmeticObject infinity daysMeasure
]

{ #category : 'test comparing' }
GregorianDateTest >> testEqual [

	self
		assert: (FixedDate
				 yearNumber: 2007
				 monthNumber: 1
				 dayNumber: 1
				 calendar: calendar)
		equals: January first , 2007.
	self deny: (FixedDate
			 yearNumber: 2007
			 monthNumber: 1
			 dayNumber: 1
			 calendar: calendar) = (January second , 2007)
]

{ #category : 'test accessing datetime' }
GregorianDateTest >> testFirstTimeOfDay [

	self
		assert: (May fourth , 2014) firstTimeOfDay
		equals:
		(ChaltenDateTime
			 date: May fourth , 2014
			 timeOfDay: TimeOfDay firstTimeOfDay)
]

{ #category : 'test comparing' }
GregorianDateTest >> testGreaterThan [

	self assert: February first , 2007 > (January thirtyfirst , 2007).
	self assert: February first , 2007 > (January first , 2007).
	self assert: February first , 2007 > (December thirtyfirst , 2006).

	self
		should: [ February first , 2007 > Monday ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: Monday class
						 with: Monday
						 with: (February first , 2007) class
						 with: February first , 2007) ].

	self
		should: [ January thirtyfirst , 2007 >= March ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: (January thirtyfirst , 2007) class
						 with: January thirtyfirst , 2007
						 with: March class
						 with: March) ]
]

{ #category : 'test comparing' }
GregorianDateTest >> testHash [

	self assert: (January first , 2007) hash equals: (FixedDate
			 yearNumber: 2007
			 monthNumber: 1
			 dayNumber: 1
			 calendar: calendar) hash
]

{ #category : 'test includes' }
GregorianDateTest >> testIncludesDate [

	self
		should: [January first, 2007 includes: January first, 2007]
		raise: Exception
]

{ #category : 'test includes' }
GregorianDateTest >> testIncludesDateTime [

	self assert: (January first, 2007 includes: (January first, 2007) atMidnight).
	self assert: (January first, 2007 includes: (January first, 2007) atLastTimeOfDay).

	self deny: (January first, 2007 includes: (February first, 2007) atMidnight).
	self deny: (January first, 2007 includes: (December thirtyfirst, 2006) atLastTimeOfDay)
]

{ #category : 'test includes' }
GregorianDateTest >> testIncludesMonthOfYear [

	self
		should: [January first, 2007 includes: January, 2007]
		raise: Exception
]

{ #category : 'test includes' }
GregorianDateTest >> testIncludesYear [
	self should: [ January first , 2007 includes: 2007 asGregorianYear ] raise: Exception
]

{ #category : 'test instance creation' }
GregorianDateTest >> testInvalidCreation [

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
				equals: 'The day -1 is invalid for the month January of Year 2004' ]
]

{ #category : 'test testing days' }
GregorianDateTest >> testIs [

	self assert: (September ninth, 2007 is: Sunday).
	self assert: (September tenth, 2007 is: Monday).
	self assert: (September eleventh, 2007 is: Tuesday).
	self assert: (September twelfth, 2007 is: Wednesday).
	self assert: (September thirteenth, 2007 is: Thursday).
	self assert: (September fourteenth, 2007 is: Friday).
	self assert: (September fifteenth, 2007 is: Saturday)
]

{ #category : 'test testing' }
GregorianDateTest >> testIsFirstDayOfMonth [

	self assert: (January first, 2007) isFirstDayOfMonth.
	self deny: (January second, 2007) isFirstDayOfMonth
]

{ #category : 'test testing' }
GregorianDateTest >> testIsFirstDayOfYear [

	self assert: (January first, 2007) isFirstDayOfYear.
	self deny: (February first, 2007) isFirstDayOfYear
]

{ #category : 'test testing' }
GregorianDateTest >> testIsFirstMonthOfYear [

	self assert: (January first, 2007) isFirstMonthOfYear.
	self assert: (January second, 2007) isFirstMonthOfYear.
	
	self deny: (February third, 2007) isFirstMonthOfYear.
	self deny: (December fifteenth, 2007) isFirstMonthOfYear
]

{ #category : 'test testing months' }
GregorianDateTest >> testIsIn [

	self assert: (January seventh, 2007 isIn: January).
	self assert: (February seventh, 2007 isIn: February).
	self assert: (March seventh, 2007 isIn: March).
	self assert: (April seventh, 2007 isIn: April).
	self assert: (May seventh, 2007 isIn: May).
	self assert: (June seventh, 2007 isIn: June).
	self assert: (July seventh, 2007 isIn: July).
	self assert: (August seventh, 2007 isIn: August).
	self assert: (September seventh, 2007 isIn: September).
	self assert: (October seventh, 2007 isIn: October).
	self assert: (November seventh, 2007 isIn: November).
	self assert: (December seventh, 2007 isIn: December)
]

{ #category : 'test testing' }
GregorianDateTest >> testIsLastDayOfMonth [

	self assert: (January thirtyfirst, 2007) isLastDayOfMonth.
	self assert: (February twentyeighth, 2007) isLastDayOfMonth.
	self assert: (February twentyninth, 2008) isLastDayOfMonth.
	self assert: (March thirtyfirst, 2007) isLastDayOfMonth.

	self deny: (January thirtieth, 2007) isLastDayOfMonth.
	self deny: (February twentyeighth, 2008) isLastDayOfMonth.
	self deny: (March thirtieth, 2007) isLastDayOfMonth
]

{ #category : 'test testing' }
GregorianDateTest >> testIsLastDayOfYear [

	self assert: (December thirtyfirst, 2007) isLastDayOfYear.
	self assert: (December thirtyfirst, 2008) isLastDayOfYear.

	self deny: (December thirtieth, 2007) isLastDayOfYear.
	self deny: (November thirtieth, 2007) isLastDayOfYear.
	self deny: (October thirtyfirst, 2007) isLastDayOfYear
]

{ #category : 'test accessing datetime' }
GregorianDateTest >> testLastTimeOfDay [

	self
		assert: (May fourth , 2014) lastTimeOfDay
		equals:
		(ChaltenDateTime date: May fourth , 2014 timeOfDay: TimeOfDay lastTimeOfDay)
]

{ #category : 'test comparing' }
GregorianDateTest >> testLessThan [

	self assert: January first , 2007 < (January second , 2007).
	self assert: January first , 2007 < (February first , 2007).
	self assert: January first , 2007 < (January first , 2008).

	self
		should: [ February first , 2007 <= Monday ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: Monday class
						 with: Monday
						 with: (February first , 2007) class
						 with: February first , 2007) ].

	self
		should: [ January thirtyfirst , 2007 < March ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: (January thirtyfirst , 2007) class
						 with: January thirtyfirst , 2007
						 with: March class
						 with: March) ]
]

{ #category : 'test accessing' }
GregorianDateTest >> testMonth [

	self assert: (July first , 2007) month equals: calendar july
]

{ #category : 'test accessing' }
GregorianDateTest >> testMonthNumber [

	self assert: (July first , 2007) monthNumber equals: 7
]

{ #category : 'test accessing' }
GregorianDateTest >> testMonthOfYear [

	self
		assert: (September tenth , 2007) monthOfYear
		equals: September , 2007
]

{ #category : 'test enumerating' }
GregorianDateTest >> testNext [

	| date |
	date := January thirtyfirst , 2007.
	self assert: date next equals: February first , 2007.

	date := February twentyeighth , 2007.
	self assert: date next equals: March first , 2007.
	self assert: date next next equals: March second , 2007.

	date := December thirtyfirst , 2007.
	self assert: date next equals: January first , 2008
]

{ #category : 'test enumerating' }
GregorianDateTest >> testNextDay [

	| date |
	date := January first , 2007.
	self
		assert: (date nextDay: calendar monday)
		equals: January eighth , 2007.
	self
		assert: (date nextDay: calendar tuesday)
		equals: January second , 2007.
	self
		assert: (date nextDay: calendar wednesday)
		equals: January third , 2007.
	self
		assert: (date nextDay: calendar thursday)
		equals: January fourth , 2007.
	self
		assert: (date nextDay: calendar friday)
		equals: January fifth , 2007.
	self
		assert: (date nextDay: calendar saturday)
		equals: January sixth , 2007.
	self
		assert: (date nextDay: calendar sunday)
		equals: January seventh , 2007
]

{ #category : 'test enumerating' }
GregorianDateTest >> testNextDayOfMonth [

	| date |
	date := January first , 2007.
	self
		assert: (date nextDayOfMonth: March third)
		equals: March third , 2007.
	self
		assert:
		((date nextDayOfMonth: March third) nextDayOfMonth: April fourth)
		equals: April fourth , 2007.

	date := March first , 2007.
	self
		assert: (date nextDayOfMonth: February third)
		equals: February third , 2008.
	self
		assert:
		((date nextDayOfMonth: February third) nextDayOfMonth: April fourth)
		equals: April fourth , 2008
]

{ #category : 'test enumerating' }
GregorianDateTest >> testNextInNumberOfDays [

	self
		assert: (January first , 2007 next: self tenDays)
		equals: January eleventh , 2007.
	self
		assert: (January first , 2007 next: self thirtyDays)
		equals: January thirtyfirst , 2007.
	self
		assert: (January first , 2007 next: self thirtyOneDays)
		equals: February first , 2007.
	self
		assert: (January first , 2007 next: 365 daysMeasure)
		equals: January first , 2008.
	self
		assert: (January first , 2004 next: 366 daysMeasure)
		equals: January first , 2005.
	self
		assert: (January first , 2007 next: 0 daysMeasure)
		equals: January first , 2007
]

{ #category : 'test enumerating' }
GregorianDateTest >> testNextInWeeks [

	self
		assert: (January first , 2007 next: 1 weekMeasure)
		equals: (January first , 2007 next: 7 daysMeasure).
	self
		assert: (January first , 2007 next: 2 weeksMeasure)
		equals: (January first , 2007 next: 14 daysMeasure)
]

{ #category : 'test enumerating' }
GregorianDateTest >> testNextMonth [

	| date |
	date := January first , 2007.
	self
		assert: (date nextMonth: 1 monthMeasure)
		equals: February first , 2007.
	self
		assert: (date nextMonth: 2 monthsMeasure)
		equals: March first , 2007.
	self
		assert: (date nextMonth: 3 monthsMeasure)
		equals: April first , 2007.
	self
		assert: (date nextMonth: 4 monthsMeasure)
		equals: May first , 2007.
	self
		assert: (date nextMonth: 5 monthsMeasure)
		equals: June first , 2007.
	self
		assert: (date nextMonth: 6 monthsMeasure)
		equals: July first , 2007.
	self
		assert: (date nextMonth: 7 monthsMeasure)
		equals: August first , 2007.
	self
		assert: (date nextMonth: 8 monthsMeasure)
		equals: September first , 2007.
	self
		assert: (date nextMonth: 9 monthsMeasure)
		equals: October first , 2007.
	self
		assert: (date nextMonth: 10 monthsMeasure)
		equals: November first , 2007.
	self
		assert: (date nextMonth: 11 monthsMeasure)
		equals: December first , 2007.
	self
		assert: (date nextMonth: 12 monthsMeasure)
		equals: January first , 2008
]

{ #category : 'test accessing' }
GregorianDateTest >> testNumberOfDaysFromBeginnigOfYear [

	self
		assert: (January first , 2007) numberOfDaysFromBeginningOfYear
		equals: 0 daysMeasure.
	self
		assert: (January thirtyfirst , 2007) numberOfDaysFromBeginningOfYear
		equals: 30 daysMeasure.
	self
		assert:
		(December thirtyfirst , 2007) numberOfDaysFromBeginningOfYear
		equals: 364 daysMeasure
]

{ #category : 'test accessing' }
GregorianDateTest >> testNumberOfDaysFromBeginningOfMonth [

	self
		assert: (January first , 2007) numberOfDaysFromBeginningOfMonth
		equals: 0 daysMeasure.
	self
		assert:
		(January thirtyfirst , 2007) numberOfDaysFromBeginningOfMonth
		equals: 30 daysMeasure.
	self
		assert:
		(February twentyeighth , 2007) numberOfDaysFromBeginningOfMonth
		equals: 27 daysMeasure.
	self
		assert:
		(February twentyninth , 2008) numberOfDaysFromBeginningOfMonth
		equals: 28 daysMeasure
]

{ #category : 'test accessing' }
GregorianDateTest >> testNumberOfDaysFromEpoch [

	self
		assert: (January first , 1) numberOfDaysFromEpoch
		equals: 0 daysMeasure.
	self
		assert: (December thirtyfirst , 1901) numberOfDaysFromEpoch
		equals: 694324 daysMeasure.
	self
		assert: (January first , 2007) numberOfDaysFromEpoch
		equals: 732676 daysMeasure
]

{ #category : 'test accessing' }
GregorianDateTest >> testNumberOfDaysToEndOfMonth [

	self
		assert: (January first , 2007) numberOfDaysToEndOfMonth
		equals: 30 daysMeasure.
	self
		assert: (January thirtyfirst , 2007) numberOfDaysToEndOfMonth
		equals: 0 daysMeasure.
	self
		assert: (February twentyseventh , 2007) numberOfDaysToEndOfMonth
		equals: 1 dayMeasure
]

{ #category : 'test accessing' }
GregorianDateTest >> testNumberOfDaysToEndOfYear [

	self
		assert: (January first , 2007) numberOfDaysToEndOfYear
		equals: 364 daysMeasure.
	self
		assert: (December thirtyfirst , 2007) numberOfDaysToEndOfYear
		equals: 0 daysMeasure
]

{ #category : 'test enumerating' }
GregorianDateTest >> testPrevious [

	| date |
	date := January first , 2007.
	self assert: date previous equals: December thirtyfirst , 2006.

	date := March first , 2007.
	self assert: date previous equals: February twentyeighth , 2007.

	date := March first , 2008.
	self assert: date previous equals: February twentyninth , 2008
]

{ #category : 'test enumerating' }
GregorianDateTest >> testPreviousDay [

	| date |
	date := January first , 2007.
	self
		assert: (date previousDay: calendar monday)
		equals: December twentyfifth , 2006.
	self
		assert: (date previousDay: calendar tuesday)
		equals: December twentysixth , 2006.
	self
		assert: (date previousDay: calendar wednesday)
		equals: December twentyseventh , 2006.
	self
		assert: (date previousDay: calendar thursday)
		equals: December twentyeighth , 2006.
	self
		assert: (date previousDay: calendar friday)
		equals: December twentyninth , 2006.
	self
		assert: (date previousDay: calendar saturday)
		equals: December thirtieth , 2006.
	self
		assert: (date previousDay: calendar sunday)
		equals: December thirtyfirst , 2006
]

{ #category : 'test enumerating' }
GregorianDateTest >> testPreviousDayOfMonth [

	| date |
	date := January first , 2007.
	self
		assert: (date previousDayOfMonth: March third)
		equals: March third , 2006.
	self
		assert: ((date previousDayOfMonth: March third) previousDayOfMonth:
				 April fourth)
		equals: April fourth , 2005
]

{ #category : 'test enumerating' }
GregorianDateTest >> testPreviousInNumberOfDays [

	self
		assert: (January eleventh , 2007 previous: self tenDays)
		equals: January first , 2007.
	self
		assert: (January thirtyfirst , 2007 previous: self thirtyDays)
		equals: January first , 2007.
	self
		assert: (February first , 2007 previous: self thirtyOneDays)
		equals: January first , 2007.
	self
		assert: (January first , 2005 previous: 366 daysMeasure)
		equals: January first , 2004.
	self
		assert: (January first , 2007 previous: 365 daysMeasure)
		equals: January first , 2006
]

{ #category : 'test enumerating' }
GregorianDateTest >> testPreviousInWeeks [

	self
		assert: (January first , 2007 previous: 1 weekMeasure)
		equals: (January first , 2007 previous: 7 daysMeasure).
	self
		assert: (January first , 2007 previous: 2 weeksMeasure)
		equals: (January first , 2007 previous: 14 daysMeasure)
]

{ #category : 'test printing' }
GregorianDateTest >> testPrintString [

	| date |
	date := October first , 2007.
	self assert: date printString equals: 'October 1, 2007'
]

{ #category : 'test interval protocol' }
GregorianDateTest >> testTo [

	| interval |
	interval := January first , 2007 to: January tenth , 2007.
	self assert: interval from equals: January first , 2007.
	self assert: interval to equals: January tenth , 2007.
	self assert: interval by equals: self oneDay
]

{ #category : 'test interval protocol' }
GregorianDateTest >> testToBy [

	| interval |
	interval := January first , 2007 to: January tenth , 2007 by:
	            self twoDays.
	self assert: interval from equals: January first , 2007.
	self assert: interval to equals: January tenth , 2007.
	self assert: interval by equals: self twoDays
]

{ #category : 'test interval protocol' }
GregorianDateTest >> testToByDo [

	| daysTo januaryFirst2007 |
	daysTo := 0.
	januaryFirst2007 := January first , 2007.
	(januaryFirst2007 to: January first , 2008 by: self twoDays) do: [
		:date |
		self
			assert: (januaryFirst2007 distanceTo: date) amount
			equals: daysTo.
		daysTo := daysTo + 2 ].
	self assert: daysTo equals: 366
]

{ #category : 'test interval protocol' }
GregorianDateTest >> testToByReverse [

	| coll number |
	coll := (January first , 2007 to: January thirtieth , 2007 by:
	         self twoDays) reverse.
	number := 29.
	coll do: [ :date |
		self assert: date dayNumber equals: number.
		number := number - 2 ].
	self assert: number equals: -1
]

{ #category : 'test interval protocol' }
GregorianDateTest >> testToEveryBeginningDifferentDay [

	| monday expectedDayNumbers interval |
	monday := January first , 2007.
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
	expectedDayNumbers := #( 2 3 5 9 ).
	interval inject: 1 into: [ :index :date |
		self assert: date dayNumber equals: (expectedDayNumbers at: index).
		index + 1 ]
]

{ #category : 'test interval protocol' }
GregorianDateTest >> testToEveryBeginningSameDay [

	| monday expectedDayNumbers interval |
	monday := January first , 2007.
	interval := monday
		            to: (monday nextDay: calendar monday)
		            every: (Array
				             with: calendar monday
				             with: calendar wednesday
				             with: calendar friday).
	self assert: interval first equals: monday.
	self assert: interval last equals: (monday nextDay: calendar monday).
	self assert: interval size equals: 4.
	expectedDayNumbers := #( 1 3 5 8 ).
	interval inject: 1 into: [ :index :date |
		self assert: date dayNumber equals: (expectedDayNumbers at: index).
		index + 1 ]
]

{ #category : 'test interval protocol' }
GregorianDateTest >> testToEveryDayBeginningDifferentDay [

	| monday expectedDayNumbers interval |
	monday := January first , 2007.
	interval := monday
		            to: (monday nextDay: calendar monday) next
		            everyDay: calendar tuesday.
	self assert: interval first equals: monday next.
	self
		assert: interval last
		equals: (monday nextDay: calendar monday) next.
	self assert: interval size equals: 2.
	expectedDayNumbers := #( 2 9 ).
	interval inject: 1 into: [ :index :date |
		self assert: date dayNumber equals: (expectedDayNumbers at: index).
		index + 1 ]
]

{ #category : 'test interval protocol' }
GregorianDateTest >> testToEveryDayBeginningSameDay [

	| monday expectedDayNumbers interval |
	monday := January first , 2007.
	interval := monday
		            to: (monday nextDay: calendar monday)
		            everyDay: calendar monday.
	self assert: interval first equals: monday.
	self assert: interval last equals: (monday nextDay: calendar monday).
	self assert: interval size equals: 2.
	expectedDayNumbers := #( 1 8 ).
	interval inject: 1 into: [ :index :date |
		self assert: date dayNumber equals: (expectedDayNumbers at: index).
		index + 1 ]
]

{ #category : 'test interval protocol' }
GregorianDateTest >> testToEveryDayNumber [

	| expectedMonths interval |
	interval := January first , 2007
		            to: December thirtyfirst , 2007
		            everyDayNumber: 31.
	self assert: interval first equals: January thirtyfirst , 2007.
	self assert: interval last equals: December thirtyfirst , 2007.
	self assert: interval size equals: 7.
	expectedMonths := calendar months select: [ :month |
		                  (month lastDayNumberIn: 2007 asGregorianYear) = 31 ].
	interval inject: 1 into: [ :index :date |
		self assert: date month equals: (expectedMonths at: index).
		self assert: date dayNumber equals: 31.
		index + 1 ]
]

{ #category : 'test interval protocol' }
GregorianDateTest >> testToEveryDayNumbers [

	| expectedDayNumbers interval |
	interval := January first , 2007
		            to: December thirtyfirst , 2007
		            everyDayNumbers: (Array
				             with: 5
				             with: 20
				             with: 31
				             with: 1).
	self assert: interval first equals: January first , 2007.
	self assert: interval last equals: December thirtyfirst , 2007.
	self assert: interval size equals: 43.
	expectedDayNumbers := #( 1 5 20 31 1 5 20 1 5 20 31 1 5 20 1 5 20 31
	                         1 5 20 1 5 20 31 1 5 20 31 1 5 20 1 5 20 31
	                         1 5 20 1 5 20 31 ).
	interval inject: 1 into: [ :index :date |
		self assert: date dayNumber equals: (expectedDayNumbers at: index).
		index + 1 ]
]

{ #category : 'test interval protocol' }
GregorianDateTest >> testToEveryDayOfMonth [

	| dates |
	dates := January tenth , 2007
		         to: January ninth , 2009
		         everyDayOfMonth: January tenth.
	self assert: dates size equals: 2.
	self assert: (dates includes: January tenth , 2007).
	self assert: (dates includes: January tenth , 2008).

	dates := January tenth , 2007
		         to: January tenth , 2009
		         everyDayOfMonth: January tenth.
	self assert: (dates includes: January tenth , 2007).
	self assert: (dates includes: January tenth , 2008).
	self assert: (dates includes: January tenth , 2009)
]

{ #category : 'test interval protocol' }
GregorianDateTest >> testToNegativeBy [

	| interval number |
	interval := January thirtieth , 2007 to: January first , 2007 by:
	            self twoDays negated.
	number := 30.
	interval do: [ :date |
		self assert: date dayNumber equals: number.
		number := number - 2 ].
	self assert: number equals: 0
]

{ #category : 'test days accessing' }
GregorianDateTest >> testToday [

	| tomorrow yesterday |
	tomorrow := calendar tomorrow.
	yesterday := calendar yesterday.
	self assert: calendar today equals: yesterday next.
	self assert: calendar today equals: tomorrow previous
]

{ #category : 'test days accessing' }
GregorianDateTest >> testTomorrow [

	| today |
	today := calendar today.
	self assert: calendar tomorrow equals: today next
]

{ #category : 'test accessing' }
GregorianDateTest >> testYear [

	self assert: (October first , 2007) year equals: 2007 asGregorianYear
]

{ #category : 'test accessing' }
GregorianDateTest >> testYearNumber [

	self assert: (July first , 2007) yearNumber equals: 2007
]

{ #category : 'test days accessing' }
GregorianDateTest >> testYesterday [

	| today |
	today := calendar today.
	self assert: calendar yesterday equals: today previous
]

{ #category : 'test support' }
GregorianDateTest >> thirtyDays [
	^ 30 daysMeasure
]

{ #category : 'test support' }
GregorianDateTest >> thirtyOneDays [
	^ 31 daysMeasure
]

{ #category : 'test support' }
GregorianDateTest >> twoDays [
	^ 2 daysMeasure
]

{ #category : 'test support' }
GregorianDateTest >> zeroDays [
	^ 0 daysMeasure
]
