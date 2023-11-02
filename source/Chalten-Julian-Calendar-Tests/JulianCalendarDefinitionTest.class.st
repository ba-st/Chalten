Class {
	#name : 'JulianCalendarDefinitionTest',
	#superclass : 'TestCase',
	#instVars : [
		'calendar'
	],
	#category : 'Chalten-Julian-Calendar-Tests',
	#package : 'Chalten-Julian-Calendar-Tests'
}

{ #category : 'running' }
JulianCalendarDefinitionTest >> setUp [

	calendar := ChaltenEnvironment calendarNamed: #JulianCalendar
]

{ #category : 'test days accessing' }
JulianCalendarDefinitionTest >> testAmountOfDaysPerWeek [

	self assert: calendar amountOfDaysPerWeek equals: 7
]

{ #category : 'test months accessing' }
JulianCalendarDefinitionTest >> testAmountOfMonthsInLeapYears [

	self assert: calendar amountOfMonthsInLeapYears equals: 12
]

{ #category : 'test months accessing' }
JulianCalendarDefinitionTest >> testAmountOfMonthsInNonleapYears [

	self assert: calendar amountOfMonthsInNonleapYears equals: 12
]

{ #category : 'test months accessing' }
JulianCalendarDefinitionTest >> testAmountOfMonthsPerYear [

	self assert: calendar amountOfMonthsPerYear equals: 12
]

{ #category : 'test months accessing' }
JulianCalendarDefinitionTest >> testApril [

	self assert: calendar april equals: JulianApril
]

{ #category : 'test month names' }
JulianCalendarDefinitionTest >> testAprilName [

	self assert: calendar aprilName equals: 'April'
]

{ #category : 'test month numbers' }
JulianCalendarDefinitionTest >> testAprilNumber [

	self assert: calendar aprilNumber equals: 4
]

{ #category : 'test months accessing' }
JulianCalendarDefinitionTest >> testAugust [

	self assert: calendar august equals: JulianAugust
]

{ #category : 'test month names' }
JulianCalendarDefinitionTest >> testAugustName [

	self assert: calendar augustName equals: 'August'
]

{ #category : 'test month numbers' }
JulianCalendarDefinitionTest >> testAugustNumber [

	self assert: calendar augustNumber equals: 8
]

{ #category : 'test converting' }
JulianCalendarDefinitionTest >> testConvert [

	self
		assert: (calendar convert: January fourteenth , 2005)
		equals: JulianJanuary first , 2005.
	self
		assert: (calendar convert: March fourteenth , 2005)
		equals: JulianMarch first , 2005.
	self
		assert: (calendar convert: September eighteenth , 1999)
		equals: JulianSeptember fifth , 1999.
	self
		assert: (calendar convert: October twentyfifth , 2008)
		equals: JulianOctober twelfth , 2008.
	self
		assert: (calendar convert: December fifteenth , 2015)
		equals: JulianDecember second , 2015.
	self
		assert:
		(calendar convert: (January fourteenth , 2005 at: TimeOfDay noon))
		equals: (JulianJanuary first , 2005 at: TimeOfDay noon).
	self
		assert:
		(calendar convert: (March fourteenth , 2005 at: TimeOfDay noon))
		equals: (JulianMarch first , 2005 at: TimeOfDay noon).
	self
		assert:
		(calendar convert: (September eighteenth , 1999 at: TimeOfDay noon))
		equals: (JulianSeptember fifth , 1999 at: TimeOfDay noon).
	self
		assert:
		(calendar convert: (October twentyfifth , 2008 at: TimeOfDay noon))
		equals: (JulianOctober twelfth , 2008 at: TimeOfDay noon).
	self
		assert:
		(calendar convert: (December fifteenth , 2015 at: TimeOfDay noon))
		equals: (JulianDecember second , 2015 at: TimeOfDay noon).

	self
		should: [ calendar convert: 1 ]
		raise: Error
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals: 'Error: 1 can`t be converted to Date nor DateTime' ]
]

{ #category : 'test converting' }
JulianCalendarDefinitionTest >> testConvertToSmalltalkDate [

	| julianDate smalltalkDate |
	julianDate := JulianFebruary twentyfirst , 2007.
	smalltalkDate := Date newDay: 6 monthNumber: 3 year: 2007.
	self
		assert: (calendar convertToSmalltalkDate: julianDate)
		equals: smalltalkDate
]

{ #category : 'test dates accessing' }
JulianCalendarDefinitionTest >> testCurrentDayOfMonth [

	| smalltalkToday gregorianToday |
	smalltalkToday := Date today.
	gregorianToday := FixedDate
		                  yearNumber: smalltalkToday year
		                  monthNumber: smalltalkToday monthIndex
		                  dayNumber: smalltalkToday dayOfMonth
		                  calendar:
		                  (ChaltenEnvironment calendarNamed:
			                   #GregorianCalendar).
	self
		assert: calendar currentDayOfMonth
		equals: (calendar convertToJulianDate: gregorianToday) dayOfMonth
]

{ #category : 'test dates accessing' }
JulianCalendarDefinitionTest >> testCurrentMonth [

	| smalltalkToday gregorianToday |
	smalltalkToday := Date today.
	gregorianToday := FixedDate
		                  yearNumber: smalltalkToday year
		                  monthNumber: smalltalkToday monthIndex
		                  dayNumber: smalltalkToday dayOfMonth
		                  calendar:
		                  (ChaltenEnvironment calendarNamed:
			                   #GregorianCalendar).
	self
		assert: calendar currentMonth
		equals: (calendar convertToJulianDate: gregorianToday) month
]

{ #category : 'test dates accessing' }
JulianCalendarDefinitionTest >> testCurrentMonthOfYear [

	| smalltalkToday gregorianToday |
	smalltalkToday := Date today.
	gregorianToday := FixedDate
		                  yearNumber: smalltalkToday year
		                  monthNumber: smalltalkToday monthIndex
		                  dayNumber: smalltalkToday dayOfMonth
		                  calendar:
		                  (ChaltenEnvironment calendarNamed:
			                   #GregorianCalendar).
	self
		assert: calendar currentMonthOfYear
		equals: (calendar convertToJulianDate: gregorianToday) monthOfYear
]

{ #category : 'test dates accessing' }
JulianCalendarDefinitionTest >> testCurrentYear [

	| smalltalkToday gregorianToday |
	smalltalkToday := Date today.
	gregorianToday := FixedDate
		                  yearNumber: smalltalkToday year
		                  monthNumber: smalltalkToday monthIndex
		                  dayNumber: smalltalkToday dayOfMonth
		                  calendar:
		                  (ChaltenEnvironment calendarNamed:
			                   #GregorianCalendar).
	self
		assert: calendar currentYear
		equals: (calendar convertToJulianDate: gregorianToday) year
]

{ #category : 'test dates accessing' }
JulianCalendarDefinitionTest >> testDateFromFixed [

	| januaryThirdOf1 januarySeventhOf1 januaryThirdOf2 marchSecondOf4 janauryThirdOf5 |
	januaryThirdOf1 := JulianJanuary third , 1.
	januarySeventhOf1 := JulianJanuary seventh , 1.
	januaryThirdOf2 := JulianJanuary third , 2.
	marchSecondOf4 := JulianMarch second , 4.
	janauryThirdOf5 := JulianJanuary third , 5.
	self
		assert: (calendar dateFromNumberOfDays: 1)
		equals: januaryThirdOf1.
	self
		assert: (calendar dateFromNumberOfDays: 5)
		equals: januarySeventhOf1.
	self
		assert: (calendar dateFromNumberOfDays: 366)
		equals: januaryThirdOf2.
	self
		assert: (calendar dateFromNumberOfDays: 1155)
		equals: marchSecondOf4.
	self
		assert: (calendar dateFromNumberOfDays: 1462)
		equals: janauryThirdOf5
]

{ #category : 'test days accessing' }
JulianCalendarDefinitionTest >> testDayNamed [

	self
		assert: (calendar dayNamed: 'Sunday') equals: JulianSunday;
		assert: (calendar dayNamed: 'Monday') equals: JulianMonday;
		assert: (calendar dayNamed: 'Tuesday') equals: JulianTuesday;
		assert: (calendar dayNamed: 'Wednesday') equals: JulianWednesday;
		assert: (calendar dayNamed: 'Thursday') equals: JulianThursday;
		assert: (calendar dayNamed: 'Friday') equals: JulianFriday;
		assert: (calendar dayNamed: 'Saturday') equals: JulianSaturday
]

{ #category : 'test days accessing' }
JulianCalendarDefinitionTest >> testDayOf [

	self assert: (calendar dayOf: May fourth , 2014) equals: JulianSunday
]

{ #category : 'test days accessing' }
JulianCalendarDefinitionTest >> testDayPositionedInWeek [

	self
		assert: (calendar dayPositionedInWeek: 1) equals: JulianSunday;
		assert: (calendar dayPositionedInWeek: 2) equals: JulianMonday;
		assert: (calendar dayPositionedInWeek: 3) equals: JulianTuesday;
		assert: (calendar dayPositionedInWeek: 4) equals: JulianWednesday;
		assert: (calendar dayPositionedInWeek: 5) equals: JulianThursday;
		assert: (calendar dayPositionedInWeek: 6) equals: JulianFriday;
		assert: (calendar dayPositionedInWeek: 7) equals: JulianSaturday
]

{ #category : 'test days accessing' }
JulianCalendarDefinitionTest >> testDaysFromEpochTo [

	| januaryFirstOf1 januarySecondOf1 januaryFifteenthOf1 januaryFirstOf2 januaryFirstOf5 |
	januaryFirstOf1 := JulianJanuary first , 1.
	januarySecondOf1 := JulianJanuary second , 1.
	januaryFifteenthOf1 := JulianJanuary fifteenth , 1.
	januaryFirstOf2 := JulianJanuary first , 2.
	januaryFirstOf5 := JulianJanuary first , 5.
	self
		assert: (calendar numberOfDaysFromEpochTo: januaryFirstOf1)
		equals: 2 daysMeasure negated.
	self
		assert: (calendar numberOfDaysFromEpochTo: januarySecondOf1)
		equals: 1 dayMeasure negated.
	self
		assert: (calendar numberOfDaysFromEpochTo: januaryFifteenthOf1)
		equals: 12 daysMeasure.
	self
		assert: (calendar numberOfDaysFromEpochTo: januaryFirstOf2)
		equals: 363 daysMeasure.
	self
		assert: (calendar numberOfDaysFromEpochTo: januaryFirstOf5)
		equals: 1459 daysMeasure
]

{ #category : 'test global variables' }
JulianCalendarDefinitionTest >> testDaysGlobalVariables [

	self
		assert: JulianSunday equals: calendar sunday;
		assert: JulianMonday equals: calendar monday;
		assert: JulianTuesday equals: calendar tuesday;
		assert: JulianWednesday equals: calendar wednesday;
		assert: JulianThursday equals: calendar thursday;
		assert: JulianFriday equals: calendar friday;
		assert: JulianSaturday equals: calendar saturday
]

{ #category : 'test months accessing' }
JulianCalendarDefinitionTest >> testDecember [

	self assert: calendar december equals: JulianDecember
]

{ #category : 'test month names' }
JulianCalendarDefinitionTest >> testDecemberName [

	self assert: calendar decemberName equals: 'December'
]

{ #category : 'test month numbers' }
JulianCalendarDefinitionTest >> testDecemberNumber [

	self assert: calendar decemberNumber equals: 12
]

{ #category : 'test year querying' }
JulianCalendarDefinitionTest >> testDistanceInYearsFromTo [

	self
		assert:
		(calendar
			 distanceInYearsFrom: 2012 asJulianYear
			 to: 2015 asJulianYear)
		equals: 3 yearsMeasure
]

{ #category : 'test accessing' }
JulianCalendarDefinitionTest >> testEpoch [

	self assert: calendar epoch equals: -1
]

{ #category : 'test months accessing' }
JulianCalendarDefinitionTest >> testFebruary [

	self assert: calendar february equals: JulianFebruary
]

{ #category : 'test month names' }
JulianCalendarDefinitionTest >> testFebruaryName [

	self assert: calendar februaryName equals: 'February'
]

{ #category : 'test month numbers' }
JulianCalendarDefinitionTest >> testFebruaryNumber [

	self assert: calendar februaryNumber equals: 2
]

{ #category : 'test months accessing' }
JulianCalendarDefinitionTest >> testFirstMonth [

	self assert: calendar firstMonth equals: JulianJanuary
]

{ #category : 'test month of year accessing' }
JulianCalendarDefinitionTest >> testFirstMonthOf [

	| year |
	year := 2007 asJulianYear.
	self
		assert: (calendar firstMonthOf: year)
		equals: JulianJanuary , 2007
]

{ #category : 'test dates accessing' }
JulianCalendarDefinitionTest >> testFixedFromDate [

	| januaryFirstOf1 novemberTwelveOf1945 |
	januaryFirstOf1 := JulianJanuary first , 1.
	novemberTwelveOf1945 := JulianJanuary twelfth , 1945.
	calendar.
	self
		assert: (calendar numberOfDaysFromDate: januaryFirstOf1) equals: -1;
		assert: (calendar numberOfDaysFromDate: novemberTwelveOf1945)
		equals: 710056
]

{ #category : 'test days accessing' }
JulianCalendarDefinitionTest >> testFriday [

	self assert: calendar friday equals: JulianFriday
]

{ #category : 'test day names' }
JulianCalendarDefinitionTest >> testFridayName [

	self assert: calendar fridayName equals: 'Friday'
]

{ #category : 'test day positions in week' }
JulianCalendarDefinitionTest >> testFridayPositionInWeek [

	self assert: calendar fridayPositionInWeek equals: 6
]

{ #category : 'test month testing' }
JulianCalendarDefinitionTest >> testIsApril [

	self assert: (calendar isApril: JulianApril)
]

{ #category : 'test month testing' }
JulianCalendarDefinitionTest >> testIsAugust [

	self assert: (calendar isAugust: JulianAugust)
]

{ #category : 'test month testing' }
JulianCalendarDefinitionTest >> testIsDecember [

	self assert: (calendar isDecember: JulianDecember)
]

{ #category : 'test month testing' }
JulianCalendarDefinitionTest >> testIsFebruary [

	self assert: (calendar isFebruary: JulianFebruary)
]

{ #category : 'test year testing' }
JulianCalendarDefinitionTest >> testIsFirstMonthOfYear [

	self assert: (calendar isFirstMonthOfYear: JulianJanuary).
	self deny: (calendar isFirstMonthOfYear: JulianMay).
	self deny: (calendar isFirstMonthOfYear: JulianDecember)
]

{ #category : 'test day testing' }
JulianCalendarDefinitionTest >> testIsFriday [

	self assert: (calendar isFriday: JulianFriday)
]

{ #category : 'test month testing' }
JulianCalendarDefinitionTest >> testIsJanuary [

	self assert: (calendar isJanuary: JulianJanuary)
]

{ #category : 'test month testing' }
JulianCalendarDefinitionTest >> testIsJuly [

	self assert: (calendar isJuly: JulianJuly)
]

{ #category : 'test month testing' }
JulianCalendarDefinitionTest >> testIsJune [

	self assert: (calendar isJune: JulianJune)
]

{ #category : 'test month testing' }
JulianCalendarDefinitionTest >> testIsMarch [

	self assert: (calendar isMarch: JulianMarch)
]

{ #category : 'test month testing' }
JulianCalendarDefinitionTest >> testIsMay [

	self assert: (calendar isMay: JulianMay)
]

{ #category : 'test day testing' }
JulianCalendarDefinitionTest >> testIsMonday [

	self assert: (calendar isMonday: JulianMonday)
]

{ #category : 'test month testing' }
JulianCalendarDefinitionTest >> testIsNovember [

	self assert: (calendar isNovember: JulianNovember)
]

{ #category : 'test month testing' }
JulianCalendarDefinitionTest >> testIsOctober [

	self assert: (calendar isOctober: JulianOctober)
]

{ #category : 'test day testing' }
JulianCalendarDefinitionTest >> testIsSaturday [

	self assert: (calendar isSaturday: JulianSaturday)
]

{ #category : 'test month testing' }
JulianCalendarDefinitionTest >> testIsSeptember [

	self assert: (calendar isSeptember: JulianSeptember)
]

{ #category : 'test day testing' }
JulianCalendarDefinitionTest >> testIsSunday [

	self assert: (calendar isSunday: JulianSunday)
]

{ #category : 'test day testing' }
JulianCalendarDefinitionTest >> testIsThursday [

	self assert: (calendar isThursday: JulianThursday)
]

{ #category : 'test day testing' }
JulianCalendarDefinitionTest >> testIsTuesday [

	self assert: (calendar isTuesday: JulianTuesday)
]

{ #category : 'test day testing' }
JulianCalendarDefinitionTest >> testIsWednesday [

	self assert: (calendar isWednesday: JulianWednesday)
]

{ #category : 'test year testing' }
JulianCalendarDefinitionTest >> testIsYearNumberLeap [

	self
		assert: (calendar isYearNumberLeap: -1);
		assert: (calendar isYearNumberLeap: 1900);
		assert: (calendar isYearNumberLeap: 1904);
		assert: (calendar isYearNumberLeap: 1908);
		assert: (calendar isYearNumberLeap: 1992);
		assert: (calendar isYearNumberLeap: 2000);
		assert: (calendar isYearNumberLeap: 2004);
		assert: (calendar isYearNumberLeap: 2100).

	self
		deny: (calendar isYearNumberLeap: -4);
		deny: (calendar isYearNumberLeap: 1915);
		deny: (calendar isYearNumberLeap: 1991);
		deny: (calendar isYearNumberLeap: 2007)
]

{ #category : 'test months accessing' }
JulianCalendarDefinitionTest >> testJanuary [

	self assert: calendar january equals: JulianJanuary
]

{ #category : 'test month names' }
JulianCalendarDefinitionTest >> testJanuaryName [

	self assert: calendar januaryName equals: 'January'
]

{ #category : 'test month numbers' }
JulianCalendarDefinitionTest >> testJanuaryNumber [

	self assert: calendar januaryNumber equals: 1
]

{ #category : 'test months accessing' }
JulianCalendarDefinitionTest >> testJuly [

	self assert: calendar july equals: JulianJuly
]

{ #category : 'test month names' }
JulianCalendarDefinitionTest >> testJulyName [

	self assert: calendar julyName equals: 'July'
]

{ #category : 'test month numbers' }
JulianCalendarDefinitionTest >> testJulyNumber [

	self assert: calendar julyNumber equals: 7
]

{ #category : 'test months accessing' }
JulianCalendarDefinitionTest >> testJune [

	self assert: calendar june equals: JulianJune
]

{ #category : 'test month names' }
JulianCalendarDefinitionTest >> testJuneName [

	self assert: calendar juneName equals: 'June'
]

{ #category : 'test month numbers' }
JulianCalendarDefinitionTest >> testJuneNumber [

	self assert: calendar juneNumber equals: 6
]

{ #category : 'test months accessing' }
JulianCalendarDefinitionTest >> testLastMonth [

	self assert: calendar lastMonth equals: JulianDecember
]

{ #category : 'test month of year accessing' }
JulianCalendarDefinitionTest >> testLastMonthOf [

	| year |
	year := 2007 asJulianYear.
	self
		assert: (calendar lastMonthOf: year)
		equals: JulianDecember , 2007
]

{ #category : 'test months accessing' }
JulianCalendarDefinitionTest >> testMarch [

	self assert: calendar march equals: JulianMarch
]

{ #category : 'test month names' }
JulianCalendarDefinitionTest >> testMarchName [

	self assert: calendar marchName equals: 'March'
]

{ #category : 'test month numbers' }
JulianCalendarDefinitionTest >> testMarchNumber [

	self assert: calendar marchNumber equals: 3
]

{ #category : 'test days accessing' }
JulianCalendarDefinitionTest >> testMaximumNumberOfDaysInOneYear [

	self
		assert: calendar maximumNumberOfDaysInOneYear
		equals: 366 daysMeasure
]

{ #category : 'test months accessing' }
JulianCalendarDefinitionTest >> testMay [

	self assert: calendar may equals: JulianMay
]

{ #category : 'test month names' }
JulianCalendarDefinitionTest >> testMayName [

	self assert: calendar mayName equals: 'May'
]

{ #category : 'test month numbers' }
JulianCalendarDefinitionTest >> testMayNumber [

	self assert: calendar mayNumber equals: 5
]

{ #category : 'test days accessing' }
JulianCalendarDefinitionTest >> testMonday [

	self assert: calendar monday equals: JulianMonday
]

{ #category : 'test day names' }
JulianCalendarDefinitionTest >> testMondayName [

	self assert: calendar mondayName equals: 'Monday'
]

{ #category : 'test day positions in week' }
JulianCalendarDefinitionTest >> testMondayPositionInWeek [

	self assert: calendar mondayPositionInWeek equals: 2
]

{ #category : 'test months accessing' }
JulianCalendarDefinitionTest >> testMonthNamed [

	self
		assert: (calendar monthNamed: 'January') equals: JulianJanuary;
		assert: (calendar monthNamed: 'February') equals: JulianFebruary;
		assert: (calendar monthNamed: 'March') equals: JulianMarch;
		assert: (calendar monthNamed: 'April') equals: JulianApril;
		assert: (calendar monthNamed: 'May') equals: JulianMay;
		assert: (calendar monthNamed: 'June') equals: JulianJune;
		assert: (calendar monthNamed: 'July') equals: JulianJuly;
		assert: (calendar monthNamed: 'August') equals: JulianAugust;
		assert: (calendar monthNamed: 'September') equals: JulianSeptember;
		assert: (calendar monthNamed: 'October') equals: JulianOctober;
		assert: (calendar monthNamed: 'November') equals: JulianNovember;
		assert: (calendar monthNamed: 'December') equals: JulianDecember.

	self
		should: [
			(ChaltenEnvironment calendarNamed: #GregorianCalendar) monthNamed:
				'invalid name' ]
		raise: InvalidMonthNameException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals: 'invalid name is an invalid name for a month' ]
]

{ #category : 'test months accessing' }
JulianCalendarDefinitionTest >> testMonthNumbered [

	self
		assert: (calendar monthNumbered: 1) equals: JulianJanuary;
		assert: (calendar monthNumbered: 2) equals: JulianFebruary;
		assert: (calendar monthNumbered: 3) equals: JulianMarch;
		assert: (calendar monthNumbered: 4) equals: JulianApril;
		assert: (calendar monthNumbered: 5) equals: JulianMay;
		assert: (calendar monthNumbered: 6) equals: JulianJune;
		assert: (calendar monthNumbered: 7) equals: JulianJuly;
		assert: (calendar monthNumbered: 8) equals: JulianAugust;
		assert: (calendar monthNumbered: 9) equals: JulianSeptember;
		assert: (calendar monthNumbered: 10) equals: JulianOctober;
		assert: (calendar monthNumbered: 11) equals: JulianNovember;
		assert: (calendar monthNumbered: 12) equals: JulianDecember
]

{ #category : 'test months accessing' }
JulianCalendarDefinitionTest >> testMonthsForLeapYears [

	| months |
	months := Array new: 12.
	months at: 1 put: JulianJanuary.
	months at: 2 put: JulianFebruary.
	months at: 3 put: JulianMarch.
	months at: 4 put: JulianApril.
	months at: 5 put: JulianMay.
	months at: 6 put: JulianJune.
	months at: 7 put: JulianJuly.
	months at: 8 put: JulianAugust.
	months at: 9 put: JulianSeptember.
	months at: 10 put: JulianOctober.
	months at: 11 put: JulianNovember.
	months at: 12 put: JulianDecember.
	self assert: calendar monthsForLeapYears equals: months
]

{ #category : 'test months accessing' }
JulianCalendarDefinitionTest >> testMonthsForNonleapYears [

	| months |
	months := Array new: 12.
	months at: 1 put: JulianJanuary.
	months at: 2 put: JulianFebruary.
	months at: 3 put: JulianMarch.
	months at: 4 put: JulianApril.
	months at: 5 put: JulianMay.
	months at: 6 put: JulianJune.
	months at: 7 put: JulianJuly.
	months at: 8 put: JulianAugust.
	months at: 9 put: JulianSeptember.
	months at: 10 put: JulianOctober.
	months at: 11 put: JulianNovember.
	months at: 12 put: JulianDecember.
	self assert: calendar monthsForNonleapYears equals: months
]

{ #category : 'test global variables' }
JulianCalendarDefinitionTest >> testMonthsGlobalVariables [

	self
		assert: JulianJanuary equals: calendar january;
		assert: JulianFebruary equals: calendar february;
		assert: JulianMarch equals: calendar march;
		assert: JulianApril equals: calendar april;
		assert: JulianMay equals: calendar may;
		assert: JulianJune equals: calendar june;
		assert: JulianJuly equals: calendar july;
		assert: JulianAugust equals: calendar august;
		assert: JulianSeptember equals: calendar september;
		assert: JulianOctober equals: calendar october;
		assert: JulianNovember equals: calendar november;
		assert: JulianDecember equals: calendar december
]

{ #category : 'test months accessing' }
JulianCalendarDefinitionTest >> testNovember [

	self assert: calendar november equals: JulianNovember
]

{ #category : 'test month names' }
JulianCalendarDefinitionTest >> testNovemberName [

	self assert: calendar novemberName equals: 'November'
]

{ #category : 'test month numbers' }
JulianCalendarDefinitionTest >> testNovemberNumber [

	self assert: calendar novemberNumber equals: 11
]

{ #category : 'test dates accessing' }
JulianCalendarDefinitionTest >> testNow [

	| now nowInTwoSeconds |
	now := calendar now.
	(Delay forSeconds: 1) wait.
	nowInTwoSeconds := calendar now.
	self assert: now < nowInTwoSeconds.
	self
		assert:
			((now distanceTo: nowInTwoSeconds) convertTo: TimeUnits second)
				truncated
		equals: 1 secondMeasure
]

{ #category : 'test days accessing' }
JulianCalendarDefinitionTest >> testNumberOfDaysIn [

	self
		assert: (calendar numberOfDaysIn: 2014 asJulianYear)
		equals: 365 daysMeasure
]

{ #category : 'test days accessing' }
JulianCalendarDefinitionTest >> testNumberOfDaysPerWeek [

	self assert: calendar numberOfDaysPerWeek equals: 7 daysMeasure
]

{ #category : 'test months accessing' }
JulianCalendarDefinitionTest >> testNumberOfMonthsPerYear [

	self assert: calendar numberOfMonthsPerYear equals: 12 monthsMeasure
]

{ #category : 'test months accessing' }
JulianCalendarDefinitionTest >> testOctober [

	self assert: calendar october equals: JulianOctober
]

{ #category : 'test month names' }
JulianCalendarDefinitionTest >> testOctoberName [

	self assert: calendar octoberName equals: 'October'
]

{ #category : 'test month numbers' }
JulianCalendarDefinitionTest >> testOctoberNumber [

	self assert: calendar octoberNumber equals: 10
]

{ #category : 'test printing' }
JulianCalendarDefinitionTest >> testPrintString [

	self assert: calendar printString equals: 'Julian Calendar'
]

{ #category : 'test days accessing' }
JulianCalendarDefinitionTest >> testSaturday [

	self assert: calendar saturday equals: JulianSaturday
]

{ #category : 'test day names' }
JulianCalendarDefinitionTest >> testSaturdayName [

	self assert: calendar saturdayName equals: 'Saturday'
]

{ #category : 'test day positions in week' }
JulianCalendarDefinitionTest >> testSaturdayPositionInWeek [

	self assert: calendar saturdayPositionInWeek equals: 7
]

{ #category : 'test months accessing' }
JulianCalendarDefinitionTest >> testSeptember [

	self assert: calendar september equals: JulianSeptember
]

{ #category : 'test month names' }
JulianCalendarDefinitionTest >> testSeptemberName [

	self assert: calendar septemberName equals: 'September'
]

{ #category : 'test month numbers' }
JulianCalendarDefinitionTest >> testSeptemberNumber [

	self assert: calendar septemberNumber equals: 9
]

{ #category : 'test days accessing' }
JulianCalendarDefinitionTest >> testSinceFirstDayOfWeek [

	| currentDay zeroDays |
	zeroDays := 0 daysMeasure.
	currentDay := calendar sunday.
	(zeroDays to: 6 daysMeasure) do: [ :numberOfDays |
		self
			assert: (calendar sinceFirstDayOfWeek: numberOfDays)
			equals: currentDay.
		currentDay := currentDay next ]
]

{ #category : 'test days accessing' }
JulianCalendarDefinitionTest >> testSinceSunday [

	| currentDay zeroDays |
	zeroDays := 0 daysMeasure.
	currentDay := calendar sunday.
	(zeroDays to: 6 daysMeasure) do: [ :numberOfDays |
		self assert: (calendar sinceSunday: numberOfDays) equals: currentDay.
		currentDay := currentDay next ]
]

{ #category : 'test days accessing' }
JulianCalendarDefinitionTest >> testSunday [

	self assert: calendar sunday equals: JulianSunday
]

{ #category : 'test day names' }
JulianCalendarDefinitionTest >> testSundayName [

	self assert: calendar sundayName equals: 'Sunday'
]

{ #category : 'test day positions in week' }
JulianCalendarDefinitionTest >> testSundayPositionInWeek [

	self assert: calendar sundayPositionInWeek equals: 1
]

{ #category : 'test days accessing' }
JulianCalendarDefinitionTest >> testThursday [

	self assert: calendar thursday equals: JulianThursday
]

{ #category : 'test day names' }
JulianCalendarDefinitionTest >> testThursdayName [

	self assert: calendar thursdayName equals: 'Thursday'
]

{ #category : 'test day positions in week' }
JulianCalendarDefinitionTest >> testThursdayPositionInWeek [

	self assert: calendar thursdayPositionInWeek equals: 5
]

{ #category : 'test dates accessing' }
JulianCalendarDefinitionTest >> testToday [

	| smalltalkToday gregorianToday |
	smalltalkToday := Date today.
	gregorianToday := FixedDate
		                  yearNumber: smalltalkToday year
		                  monthNumber: smalltalkToday monthIndex
		                  dayNumber: smalltalkToday dayOfMonth
		                  calendar:
		                  (ChaltenEnvironment calendarNamed:
			                   #GregorianCalendar).
	self
		assert: calendar today
		equals: (calendar convertToJulianDate: gregorianToday)
]

{ #category : 'test dates accessing' }
JulianCalendarDefinitionTest >> testTomorrow [

	| smalltalkToday gregorianToday |
	smalltalkToday := Date today.
	gregorianToday := FixedDate
		                  yearNumber: smalltalkToday year
		                  monthNumber: smalltalkToday monthIndex
		                  dayNumber: smalltalkToday dayOfMonth
		                  calendar:
		                  (ChaltenEnvironment calendarNamed:
			                   #GregorianCalendar).
	self
		assert: calendar tomorrow
		equals: (calendar convertToJulianDate: gregorianToday) next
]

{ #category : 'test days accessing' }
JulianCalendarDefinitionTest >> testTuesday [

	self assert: calendar tuesday equals: JulianTuesday
]

{ #category : 'test day names' }
JulianCalendarDefinitionTest >> testTuesdayName [

	self assert: calendar tuesdayName equals: 'Tuesday'
]

{ #category : 'test day positions in week' }
JulianCalendarDefinitionTest >> testTuesdayPositionInWeek [

	self assert: calendar tuesdayPositionInWeek equals: 3
]

{ #category : 'test days accessing' }
JulianCalendarDefinitionTest >> testWednesday [

	self assert: calendar wednesday equals: JulianWednesday
]

{ #category : 'test day names' }
JulianCalendarDefinitionTest >> testWednesdayName [

	self assert: calendar wednesdayName equals: 'Wednesday'
]

{ #category : 'test day positions in week' }
JulianCalendarDefinitionTest >> testWednesdayPositionInWeek [

	self assert: calendar wednesdayPositionInWeek equals: 4
]

{ #category : 'test year accessing' }
JulianCalendarDefinitionTest >> testYearNumberFromFixed [

	self assert: (calendar yearNumberFromFixed: 1) equals: 1.
	self assert: (calendar yearNumberFromFixed: 36) equals: 1.
	self assert: (calendar yearNumberFromFixed: 360) equals: 1.
	self assert: (calendar yearNumberFromFixed: 365) equals: 2.
	self assert: (calendar yearNumberFromFixed: 366) equals: 2.
	self assert: (calendar yearNumberFromFixed: 370) equals: 2.
	self assert: (calendar yearNumberFromFixed: 730) equals: 3.
	self assert: (calendar yearNumberFromFixed: 731) equals: 3.
	self assert: (calendar yearNumberFromFixed: 1095) equals: 4.
	self assert: (calendar yearNumberFromFixed: 1096) equals: 4.
	self assert: (calendar yearNumberFromFixed: 1461) equals: 5
]

{ #category : 'test dates accessing' }
JulianCalendarDefinitionTest >> testYesterday [

	| smalltalkToday gregorianToday |
	smalltalkToday := Date today.
	gregorianToday := FixedDate
		                  yearNumber: smalltalkToday year
		                  monthNumber: smalltalkToday monthIndex
		                  dayNumber: smalltalkToday dayOfMonth
		                  calendar:
		                  (ChaltenEnvironment calendarNamed:
			                   #GregorianCalendar).
	self
		assert: calendar yesterday
		equals: (calendar convertToJulianDate: gregorianToday) previous
]
