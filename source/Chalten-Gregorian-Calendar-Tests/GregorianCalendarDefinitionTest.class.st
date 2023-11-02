Class {
	#name : 'GregorianCalendarDefinitionTest',
	#superclass : 'TestCase',
	#instVars : [
		'calendar'
	],
	#category : 'Chalten-Gregorian-Calendar-Tests',
	#package : 'Chalten-Gregorian-Calendar-Tests'
}

{ #category : 'running' }
GregorianCalendarDefinitionTest >> setUp [

	calendar := ChaltenEnvironment calendarNamed: #GregorianCalendar
]

{ #category : 'test days accessing' }
GregorianCalendarDefinitionTest >> testAmountOfDaysPerWeek [

	self assert: calendar amountOfDaysPerWeek equals: 7
]

{ #category : 'test months accessing' }
GregorianCalendarDefinitionTest >> testAmountOfMonthsInLeapYears [

	self assert: calendar amountOfMonthsInLeapYears equals: 12
]

{ #category : 'test months accessing' }
GregorianCalendarDefinitionTest >> testAmountOfMonthsInNonleapYears [

	self assert: calendar amountOfMonthsInNonleapYears equals: 12
]

{ #category : 'test months accessing' }
GregorianCalendarDefinitionTest >> testAmountOfMonthsPerYear [

	self assert: calendar amountOfMonthsPerYear equals: 12
]

{ #category : 'test months accessing' }
GregorianCalendarDefinitionTest >> testApril [

	self assert: calendar april equals: April
]

{ #category : 'test month names' }
GregorianCalendarDefinitionTest >> testAprilName [

	self assert: calendar aprilName equals: 'April'
]

{ #category : 'test month numbers' }
GregorianCalendarDefinitionTest >> testAprilNumber [

	self assert: calendar aprilNumber equals: 4
]

{ #category : 'test months accessing' }
GregorianCalendarDefinitionTest >> testAugust [

	self assert: calendar august equals: August
]

{ #category : 'test month names' }
GregorianCalendarDefinitionTest >> testAugustName [

	self assert: calendar augustName equals: 'August'
]

{ #category : 'test month numbers' }
GregorianCalendarDefinitionTest >> testAugustNumber [

	self assert: calendar augustNumber equals: 8
]

{ #category : 'test converting' }
GregorianCalendarDefinitionTest >> testConvert [

	self
		assert: (calendar convert: January fourteenth , 2005)
		equals: January fourteenth , 2005.
	self
		assert: (calendar convert: March fourteenth , 2005)
		equals: March fourteenth , 2005.
	self
		assert: (calendar convert: September eighteenth , 1999)
		equals: September eighteenth , 1999.
	self
		assert: (calendar convert: October twentyfifth , 2008)
		equals: October twentyfifth , 2008.
	self
		assert: (calendar convert: December fifteenth , 2015)
		equals: December fifteenth , 2015.
	self
		assert:
		(calendar convert: (January fourteenth , 2005 at: TimeOfDay noon))
		equals: (January fourteenth , 2005 at: TimeOfDay noon).
	self
		assert:
		(calendar convert: (March fourteenth , 2005 at: TimeOfDay noon))
		equals: (March fourteenth , 2005 at: TimeOfDay noon).
	self
		assert:
		(calendar convert: (September eighteenth , 1999 at: TimeOfDay noon))
		equals: (September eighteenth , 1999 at: TimeOfDay noon).
	self
		assert:
		(calendar convert: (October twentyfifth , 2008 at: TimeOfDay noon))
		equals: (October twentyfifth , 2008 at: TimeOfDay noon).
	self
		assert:
		(calendar convert: (December fifteenth , 2015 at: TimeOfDay noon))
		equals: (December fifteenth , 2015 at: TimeOfDay noon).

	self
		should: [ calendar convert: 1 ]
		raise: Error
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals: 'Error: 1 can`t be converted to Date nor DateTime' ]
]

{ #category : 'test converting' }
GregorianCalendarDefinitionTest >> testConvertToSmalltalkDate [

	| gregorianDate smalltalkDate |
	gregorianDate := FixedDate
		                 yearNumber: 2007
		                 monthNumber: 2
		                 dayNumber: 21
		                 calendar: calendar.
	smalltalkDate := Date newDay: 21 monthNumber: 2 year: 2007.
	self
		assert: (calendar convertToSmalltalkDate: gregorianDate)
		equals: smalltalkDate
]

{ #category : 'test dates accessing' }
GregorianCalendarDefinitionTest >> testCurrentDayOfMonth [

	| today gregorianToday |
	today := Date today.
	gregorianToday := FixedDate
		                  yearNumber: today year
		                  monthNumber: today monthIndex
		                  dayNumber: today dayOfMonth
		                  calendar: calendar.
	self
		assert: calendar currentDayOfMonth
		equals: gregorianToday dayOfMonth
]

{ #category : 'test dates accessing' }
GregorianCalendarDefinitionTest >> testCurrentMonth [

	| today gregorianToday |
	today := Date today.
	gregorianToday := FixedDate
		                  yearNumber: today year
		                  monthNumber: today monthIndex
		                  dayNumber: today dayOfMonth
		                  calendar: calendar.
	self assert: calendar currentMonth equals: gregorianToday month
]

{ #category : 'test dates accessing' }
GregorianCalendarDefinitionTest >> testCurrentMonthOfYear [

	| today gregorianToday |
	today := Date today.
	gregorianToday := FixedDate
		                  yearNumber: today year
		                  monthNumber: today monthIndex
		                  dayNumber: today dayOfMonth
		                  calendar: calendar.
	self
		assert: calendar currentMonthOfYear
		equals: gregorianToday monthOfYear
]

{ #category : 'test dates accessing' }
GregorianCalendarDefinitionTest >> testCurrentYear [

	| today gregorianToday |
	today := Date today.
	gregorianToday := FixedDate
		                  yearNumber: today year
		                  monthNumber: today monthIndex
		                  dayNumber: today dayOfMonth
		                  calendar: calendar.
	self assert: calendar currentYear equals: gregorianToday year
]

{ #category : 'test dates accessing' }
GregorianCalendarDefinitionTest >> testDateFromFixed [

	| januaryFirstOf1 januaryFifthOf1 januaryFirstOf2 february29Of4 janauryFirstOf5 |
	januaryFirstOf1 := January first , 1.
	januaryFifthOf1 := January fifth , 1.
	januaryFirstOf2 := January first , 2.
	february29Of4 := February twentyninth , 4.
	janauryFirstOf5 := January first , 5.
	self
		assert: (calendar dateFromNumberOfDays: 1)
		equals: januaryFirstOf1.
	self
		assert: (calendar dateFromNumberOfDays: 5)
		equals: januaryFifthOf1.
	self
		assert: (calendar dateFromNumberOfDays: 366)
		equals: januaryFirstOf2.
	self
		assert: (calendar dateFromNumberOfDays: 1155)
		equals: february29Of4.
	self
		assert: (calendar dateFromNumberOfDays: 1462)
		equals: janauryFirstOf5
]

{ #category : 'test days accessing' }
GregorianCalendarDefinitionTest >> testDayNamed [

	self
		assert: (calendar dayNamed: 'Sunday') equals: Sunday;
		assert: (calendar dayNamed: 'Monday') equals: Monday;
		assert: (calendar dayNamed: 'Tuesday') equals: Tuesday;
		assert: (calendar dayNamed: 'Wednesday') equals: Wednesday;
		assert: (calendar dayNamed: 'Thursday') equals: Thursday;
		assert: (calendar dayNamed: 'Friday') equals: Friday;
		assert: (calendar dayNamed: 'Saturday') equals: Saturday
]

{ #category : 'test days accessing' }
GregorianCalendarDefinitionTest >> testDayOf [

	self assert: (calendar dayOf: May fourth , 2014) equals: Sunday
]

{ #category : 'test days accessing' }
GregorianCalendarDefinitionTest >> testDayPositionedInWeek [

	self
		assert: (calendar dayPositionedInWeek: 1) equals: Sunday;
		assert: (calendar dayPositionedInWeek: 2) equals: Monday;
		assert: (calendar dayPositionedInWeek: 3) equals: Tuesday;
		assert: (calendar dayPositionedInWeek: 4) equals: Wednesday;
		assert: (calendar dayPositionedInWeek: 5) equals: Thursday;
		assert: (calendar dayPositionedInWeek: 6) equals: Friday;
		assert: (calendar dayPositionedInWeek: 7) equals: Saturday
]

{ #category : 'test days accessing' }
GregorianCalendarDefinitionTest >> testDaysFromEpochTo [

	| januaryFirstOf0 januaryFirstOf1 januarySecondOf1 januaryFifteenthOf1 januaryFirstOf2 januaryFirstOf5 |
	januaryFirstOf0 := January first , 0.
	januaryFirstOf1 := January first , 1.
	januarySecondOf1 := January second , 1.
	januaryFifteenthOf1 := January fifteenth , 1.
	januaryFirstOf2 := January first , 2.
	januaryFirstOf5 := January first , 5.
	self
		assert: (calendar numberOfDaysFromEpochTo: januaryFirstOf0)
		equals: 366 daysMeasure negated.
	self
		assert: (calendar numberOfDaysFromEpochTo: januaryFirstOf1)
		equals: 0 daysMeasure.
	self
		assert: (calendar numberOfDaysFromEpochTo: januarySecondOf1)
		equals: 1 dayMeasure.
	self
		assert: (calendar numberOfDaysFromEpochTo: januaryFifteenthOf1)
		equals: 14 daysMeasure.
	self
		assert: (calendar numberOfDaysFromEpochTo: januaryFirstOf2)
		equals: 365 daysMeasure.
	self
		assert: (calendar numberOfDaysFromEpochTo: januaryFirstOf5)
		equals: 1461 daysMeasure
]

{ #category : 'test global variables' }
GregorianCalendarDefinitionTest >> testDaysGlobalVariables [

	self
		assert: Sunday equals: calendar sunday;
		assert: Monday equals: calendar monday;
		assert: Tuesday equals: calendar tuesday;
		assert: Wednesday equals: calendar wednesday;
		assert: Thursday equals: calendar thursday;
		assert: Friday equals: calendar friday;
		assert: Saturday equals: calendar saturday
]

{ #category : 'test months accessing' }
GregorianCalendarDefinitionTest >> testDecember [

	self assert: calendar december equals: December
]

{ #category : 'test month names' }
GregorianCalendarDefinitionTest >> testDecemberName [

	self assert: calendar decemberName equals: 'December'
]

{ #category : 'test month numbers' }
GregorianCalendarDefinitionTest >> testDecemberNumber [

	self assert: calendar decemberNumber equals: 12
]

{ #category : 'test year querying' }
GregorianCalendarDefinitionTest >> testDistanceInYearsFromTo [

	self
		assert: (calendar
				 distanceInYearsFrom: 2012 asGregorianYear
				 to: 2015 asGregorianYear)
		equals: 3 yearsMeasure
]

{ #category : 'test accessing' }
GregorianCalendarDefinitionTest >> testEpoch [

	self assert: calendar epoch equals: 1
]

{ #category : 'test months accessing' }
GregorianCalendarDefinitionTest >> testFebruary [

	self assert: calendar february equals: February
]

{ #category : 'test month names' }
GregorianCalendarDefinitionTest >> testFebruaryName [

	self assert: calendar februaryName equals: 'February'
]

{ #category : 'test month numbers' }
GregorianCalendarDefinitionTest >> testFebruaryNumber [

	self assert: calendar februaryNumber equals: 2
]

{ #category : 'test months accessing' }
GregorianCalendarDefinitionTest >> testFirstMonth [

	self assert: calendar firstMonth equals: January
]

{ #category : 'test month of year accessing' }
GregorianCalendarDefinitionTest >> testFirstMonthOf [

	| year |
	year := 2007 asGregorianYear.
	self assert: (calendar firstMonthOf: year) equals: January , 2007
]

{ #category : 'test dates accessing' }
GregorianCalendarDefinitionTest >> testFixedFromDate [

	| januaryFirstOf1 novemberTwelveOf1945 |
	januaryFirstOf1 := January first , 1.
	novemberTwelveOf1945 := November twelfth , 1945.
	self
		assert: (calendar numberOfDaysFromDate: januaryFirstOf1) equals: 1;
		assert: (calendar numberOfDaysFromDate: novemberTwelveOf1945)
		equals: 710347
]

{ #category : 'test days accessing' }
GregorianCalendarDefinitionTest >> testFriday [

	self assert: calendar friday equals: Friday
]

{ #category : 'test day names' }
GregorianCalendarDefinitionTest >> testFridayName [

	self assert: calendar fridayName equals: 'Friday'
]

{ #category : 'test day positions in week' }
GregorianCalendarDefinitionTest >> testFridayPositionInWeek [

	self assert: calendar fridayPositionInWeek equals: 6
]

{ #category : 'test month testing' }
GregorianCalendarDefinitionTest >> testIsApril [

	self assert: (calendar isApril: April)
]

{ #category : 'test month testing' }
GregorianCalendarDefinitionTest >> testIsAugust [

	self assert: (calendar isAugust: August)
]

{ #category : 'test month testing' }
GregorianCalendarDefinitionTest >> testIsDecember [

	self assert: (calendar isDecember: December)
]

{ #category : 'test month testing' }
GregorianCalendarDefinitionTest >> testIsFebruary [

	self assert: (calendar isFebruary: February)
]

{ #category : 'test year testing' }
GregorianCalendarDefinitionTest >> testIsFirstMonthOfYear [

	self assert: (calendar isFirstMonthOfYear: January).
	self deny: (calendar isFirstMonthOfYear: May).
	self deny: (calendar isFirstMonthOfYear: December)
]

{ #category : 'test day testing' }
GregorianCalendarDefinitionTest >> testIsFriday [

	self assert: (calendar isFriday: Friday)
]

{ #category : 'test month testing' }
GregorianCalendarDefinitionTest >> testIsJanuary [

	self assert: (calendar isJanuary: January)
]

{ #category : 'test month testing' }
GregorianCalendarDefinitionTest >> testIsJuly [

	self assert: (calendar isJuly: July)
]

{ #category : 'test month testing' }
GregorianCalendarDefinitionTest >> testIsJune [

	self assert: (calendar isJune: June)
]

{ #category : 'test month testing' }
GregorianCalendarDefinitionTest >> testIsMarch [

	self assert: (calendar isMarch: March)
]

{ #category : 'test month testing' }
GregorianCalendarDefinitionTest >> testIsMay [

	self assert: (calendar isMay: May)
]

{ #category : 'test day testing' }
GregorianCalendarDefinitionTest >> testIsMonday [

	self assert: (calendar isMonday: Monday)
]

{ #category : 'test month testing' }
GregorianCalendarDefinitionTest >> testIsNovember [

	self assert: (calendar isNovember: November)
]

{ #category : 'test month testing' }
GregorianCalendarDefinitionTest >> testIsOctober [

	self assert: (calendar isOctober: October)
]

{ #category : 'test day testing' }
GregorianCalendarDefinitionTest >> testIsSaturday [

	self assert: (calendar isSaturday: Saturday)
]

{ #category : 'test month testing' }
GregorianCalendarDefinitionTest >> testIsSeptember [

	self assert: (calendar isSeptember: September)
]

{ #category : 'test day testing' }
GregorianCalendarDefinitionTest >> testIsSunday [

	self assert: (calendar isSunday: Sunday)
]

{ #category : 'test day testing' }
GregorianCalendarDefinitionTest >> testIsThursday [

	self assert: (calendar isThursday: Thursday)
]

{ #category : 'test day testing' }
GregorianCalendarDefinitionTest >> testIsTuesday [

	self assert: (calendar isTuesday: Tuesday)
]

{ #category : 'test day testing' }
GregorianCalendarDefinitionTest >> testIsWednesday [

	self assert: (calendar isWednesday: Wednesday)
]

{ #category : 'test year testing' }
GregorianCalendarDefinitionTest >> testIsYearNumberLeap [

	self
		assert: (calendar isYearNumberLeap: 1904);
		assert: (calendar isYearNumberLeap: 1908);
		assert: (calendar isYearNumberLeap: 1992);
		assert: (calendar isYearNumberLeap: 2000);
		assert: (calendar isYearNumberLeap: 2004).

	self
		deny: (calendar isYearNumberLeap: 1900);
		deny: (calendar isYearNumberLeap: 1915);
		deny: (calendar isYearNumberLeap: 1991);
		deny: (calendar isYearNumberLeap: 2007);
		deny: (calendar isYearNumberLeap: 2100)
]

{ #category : 'test months accessing' }
GregorianCalendarDefinitionTest >> testJanuary [

	self assert: calendar january equals: January
]

{ #category : 'test month names' }
GregorianCalendarDefinitionTest >> testJanuaryName [

	self assert: calendar januaryName equals: 'January'
]

{ #category : 'test month numbers' }
GregorianCalendarDefinitionTest >> testJanuaryNumber [

	self assert: calendar januaryNumber equals: 1
]

{ #category : 'test months accessing' }
GregorianCalendarDefinitionTest >> testJuly [

	self assert: calendar july equals: July
]

{ #category : 'test month names' }
GregorianCalendarDefinitionTest >> testJulyName [

	self assert: calendar julyName equals: 'July'
]

{ #category : 'test month numbers' }
GregorianCalendarDefinitionTest >> testJulyNumber [

	self assert: calendar julyNumber equals: 7
]

{ #category : 'test months accessing' }
GregorianCalendarDefinitionTest >> testJune [

	self assert: calendar june equals: June
]

{ #category : 'test month names' }
GregorianCalendarDefinitionTest >> testJuneName [

	self assert: calendar juneName equals: 'June'
]

{ #category : 'test month numbers' }
GregorianCalendarDefinitionTest >> testJuneNumber [

	self assert: calendar juneNumber equals: 6
]

{ #category : 'test months accessing' }
GregorianCalendarDefinitionTest >> testLastMonth [

	self assert: calendar lastMonth equals: December
]

{ #category : 'test month of year accessing' }
GregorianCalendarDefinitionTest >> testLastMonthOf [

	| year |
	year := 2007 asGregorianYear.
	self assert: (calendar lastMonthOf: year) equals: December , 2007
]

{ #category : 'test months accessing' }
GregorianCalendarDefinitionTest >> testMarch [

	self assert: calendar march equals: March
]

{ #category : 'test month names' }
GregorianCalendarDefinitionTest >> testMarchName [

	self assert: calendar marchName equals: 'March'
]

{ #category : 'test month numbers' }
GregorianCalendarDefinitionTest >> testMarchNumber [

	self assert: calendar marchNumber equals: 3
]

{ #category : 'test days accessing' }
GregorianCalendarDefinitionTest >> testMaximumNumberOfDaysInOneYear [

	self
		assert: calendar maximumNumberOfDaysInOneYear
		equals: 366 daysMeasure
]

{ #category : 'test months accessing' }
GregorianCalendarDefinitionTest >> testMay [

	self assert: calendar may equals: May
]

{ #category : 'test month names' }
GregorianCalendarDefinitionTest >> testMayName [

	self assert: calendar mayName equals: 'May'
]

{ #category : 'test month numbers' }
GregorianCalendarDefinitionTest >> testMayNumber [

	self assert: calendar mayNumber equals: 5
]

{ #category : 'test days accessing' }
GregorianCalendarDefinitionTest >> testMonday [

	self assert: calendar monday equals: Monday
]

{ #category : 'test day names' }
GregorianCalendarDefinitionTest >> testMondayName [

	self assert: calendar mondayName equals: 'Monday'
]

{ #category : 'test day positions in week' }
GregorianCalendarDefinitionTest >> testMondayPositionInWeek [

	self assert: calendar mondayPositionInWeek equals: 2
]

{ #category : 'test months accessing' }
GregorianCalendarDefinitionTest >> testMonthNamed [

	self
		assert: (calendar monthNamed: 'January') equals: January;
		assert: (calendar monthNamed: 'February') equals: February;
		assert: (calendar monthNamed: 'March') equals: March;
		assert: (calendar monthNamed: 'April') equals: April;
		assert: (calendar monthNamed: 'May') equals: May;
		assert: (calendar monthNamed: 'June') equals: June;
		assert: (calendar monthNamed: 'July') equals: July;
		assert: (calendar monthNamed: 'August') equals: August;
		assert: (calendar monthNamed: 'September') equals: September;
		assert: (calendar monthNamed: 'October') equals: October;
		assert: (calendar monthNamed: 'November') equals: November;
		assert: (calendar monthNamed: 'December') equals: December.

	self
		should: [ calendar monthNamed: 'invalid name' ]
		raise: InvalidMonthNameException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals: 'invalid name is an invalid name for a month' ]
]

{ #category : 'test months accessing' }
GregorianCalendarDefinitionTest >> testMonthNumbered [

	self
		assert: (calendar monthNumbered: 1) equals: January;
		assert: (calendar monthNumbered: 2) equals: February;
		assert: (calendar monthNumbered: 3) equals: March;
		assert: (calendar monthNumbered: 4) equals: April;
		assert: (calendar monthNumbered: 5) equals: May;
		assert: (calendar monthNumbered: 6) equals: June;
		assert: (calendar monthNumbered: 7) equals: July;
		assert: (calendar monthNumbered: 8) equals: August;
		assert: (calendar monthNumbered: 9) equals: September;
		assert: (calendar monthNumbered: 10) equals: October;
		assert: (calendar monthNumbered: 11) equals: November;
		assert: (calendar monthNumbered: 12) equals: December
]

{ #category : 'test months accessing' }
GregorianCalendarDefinitionTest >> testMonthsForLeapYears [

	| months |
	months := Array new: 12.
	months at: 1 put: January.
	months at: 2 put: February.
	months at: 3 put: March.
	months at: 4 put: April.
	months at: 5 put: May.
	months at: 6 put: June.
	months at: 7 put: July.
	months at: 8 put: August.
	months at: 9 put: September.
	months at: 10 put: October.
	months at: 11 put: November.
	months at: 12 put: December.
	self assert: calendar monthsForLeapYears equals: months
]

{ #category : 'test months accessing' }
GregorianCalendarDefinitionTest >> testMonthsForNonleapYears [

	| months |
	months := Array new: 12.
	months at: 1 put: January.
	months at: 2 put: February.
	months at: 3 put: March.
	months at: 4 put: April.
	months at: 5 put: May.
	months at: 6 put: June.
	months at: 7 put: July.
	months at: 8 put: August.
	months at: 9 put: September.
	months at: 10 put: October.
	months at: 11 put: November.
	months at: 12 put: December.
	self assert: calendar monthsForNonleapYears equals: months
]

{ #category : 'test global variables' }
GregorianCalendarDefinitionTest >> testMonthsGlobalVariables [

	self
		assert: January equals: calendar january;
		assert: February equals: calendar february;
		assert: March equals: calendar march;
		assert: April equals: calendar april;
		assert: May equals: calendar may;
		assert: June equals: calendar june;
		assert: July equals: calendar july;
		assert: August equals: calendar august;
		assert: September equals: calendar september;
		assert: October equals: calendar october;
		assert: November equals: calendar november;
		assert: December equals: calendar december
]

{ #category : 'test months accessing' }
GregorianCalendarDefinitionTest >> testNovember [

	self assert: calendar november equals: November
]

{ #category : 'test month names' }
GregorianCalendarDefinitionTest >> testNovemberName [

	self assert: calendar novemberName equals: 'November'
]

{ #category : 'test month numbers' }
GregorianCalendarDefinitionTest >> testNovemberNumber [

	self assert: calendar novemberNumber equals: 11
]

{ #category : 'test dates accessing' }
GregorianCalendarDefinitionTest >> testNow [

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
GregorianCalendarDefinitionTest >> testNumberOfDaysIn [

	self
		assert: (calendar numberOfDaysIn: 2014 asGregorianYear)
		equals: 365 daysMeasure
]

{ #category : 'test days accessing' }
GregorianCalendarDefinitionTest >> testNumberOfDaysPerWeek [

	self assert: calendar numberOfDaysPerWeek equals: 7 daysMeasure
]

{ #category : 'test months accessing' }
GregorianCalendarDefinitionTest >> testNumberOfMonthsPerYear [

	self assert: calendar numberOfMonthsPerYear equals: 12 monthsMeasure
]

{ #category : 'test months accessing' }
GregorianCalendarDefinitionTest >> testOctober [

	self assert: calendar october equals: October
]

{ #category : 'test month names' }
GregorianCalendarDefinitionTest >> testOctoberName [

	self assert: calendar octoberName equals: 'October'
]

{ #category : 'test month numbers' }
GregorianCalendarDefinitionTest >> testOctoberNumber [

	self assert: calendar octoberNumber equals: 10
]

{ #category : 'test printing' }
GregorianCalendarDefinitionTest >> testPrintString [

	self assert: calendar printString equals: 'Gregorian Calendar'
]

{ #category : 'test days accessing' }
GregorianCalendarDefinitionTest >> testSaturday [

	self assert: calendar saturday equals: Saturday
]

{ #category : 'test day names' }
GregorianCalendarDefinitionTest >> testSaturdayName [

	self assert: calendar saturdayName equals: 'Saturday'
]

{ #category : 'test day positions in week' }
GregorianCalendarDefinitionTest >> testSaturdayPositionInWeek [

	self assert: calendar saturdayPositionInWeek equals: 7
]

{ #category : 'test months accessing' }
GregorianCalendarDefinitionTest >> testSeptember [

	self assert: calendar september equals: September
]

{ #category : 'test month names' }
GregorianCalendarDefinitionTest >> testSeptemberName [

	self assert: calendar septemberName equals: 'September'
]

{ #category : 'test month numbers' }
GregorianCalendarDefinitionTest >> testSeptemberNumber [

	self assert: calendar septemberNumber equals: 9
]

{ #category : 'test days accessing' }
GregorianCalendarDefinitionTest >> testSinceFirstDayOfWeek [

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
GregorianCalendarDefinitionTest >> testSinceSunday [

	| currentDay zeroDays |
	zeroDays := 0 daysMeasure.
	currentDay := calendar sunday.
	(zeroDays to: 6 daysMeasure) do: [ :numberOfDays |
		self assert: (calendar sinceSunday: numberOfDays) equals: currentDay.
		currentDay := currentDay next ]
]

{ #category : 'test days accessing' }
GregorianCalendarDefinitionTest >> testSunday [

	self assert: calendar sunday equals: Sunday
]

{ #category : 'test day names' }
GregorianCalendarDefinitionTest >> testSundayName [

	self assert: calendar sundayName equals: 'Sunday'
]

{ #category : 'test day positions in week' }
GregorianCalendarDefinitionTest >> testSundayPositionInWeek [

	self assert: calendar sundayPositionInWeek equals: 1
]

{ #category : 'test dates accessing' }
GregorianCalendarDefinitionTest >> testTheBeginningOfTime [

	calendar theBeginningOfTime = TheBeginningOfTime
]

{ #category : 'test dates accessing' }
GregorianCalendarDefinitionTest >> testTheEndOfTime [

	calendar theEndOfTime = TheEndOfTime
]

{ #category : 'test days accessing' }
GregorianCalendarDefinitionTest >> testThursday [

	self assert: calendar thursday equals: Thursday
]

{ #category : 'test day names' }
GregorianCalendarDefinitionTest >> testThursdayName [

	self assert: calendar thursdayName equals: 'Thursday'
]

{ #category : 'test day positions in week' }
GregorianCalendarDefinitionTest >> testThursdayPositionInWeek [

	self assert: calendar thursdayPositionInWeek equals: 5
]

{ #category : 'test dates accessing' }
GregorianCalendarDefinitionTest >> testToday [

	| today gregorianToday |
	today := Date today.
	gregorianToday := FixedDate
		                  yearNumber: today year
		                  monthNumber: today monthIndex
		                  dayNumber: today dayOfMonth
		                  calendar: calendar.
	self assert: calendar today equals: gregorianToday
]

{ #category : 'test dates accessing' }
GregorianCalendarDefinitionTest >> testTomorrow [

	| today gregorianToday |
	today := Date today.
	gregorianToday := FixedDate
		                  yearNumber: today year
		                  monthNumber: today monthIndex
		                  dayNumber: today dayOfMonth
		                  calendar: calendar.
	self assert: calendar tomorrow equals: gregorianToday next
]

{ #category : 'test days accessing' }
GregorianCalendarDefinitionTest >> testTuesday [

	self assert: calendar tuesday equals: Tuesday
]

{ #category : 'test day names' }
GregorianCalendarDefinitionTest >> testTuesdayName [

	self assert: calendar tuesdayName equals: 'Tuesday'
]

{ #category : 'test day positions in week' }
GregorianCalendarDefinitionTest >> testTuesdayPositionInWeek [

	self assert: calendar tuesdayPositionInWeek equals: 3
]

{ #category : 'test days accessing' }
GregorianCalendarDefinitionTest >> testWednesday [

	self assert: calendar wednesday equals: Wednesday
]

{ #category : 'test day names' }
GregorianCalendarDefinitionTest >> testWednesdayName [

	self assert: calendar wednesdayName equals: 'Wednesday'
]

{ #category : 'test day positions in week' }
GregorianCalendarDefinitionTest >> testWednesdayPositionInWeek [

	self assert: calendar wednesdayPositionInWeek equals: 4
]

{ #category : 'test year accessing' }
GregorianCalendarDefinitionTest >> testYearNumberFromFixed [

	self assert: (calendar yearNumberFromFixed: 1) equals: 1.
	self assert: (calendar yearNumberFromFixed: 36) equals: 1.
	self assert: (calendar yearNumberFromFixed: 360) equals: 1.
	self assert: (calendar yearNumberFromFixed: 365) equals: 1.
	self assert: (calendar yearNumberFromFixed: 366) equals: 2.
	self assert: (calendar yearNumberFromFixed: 370) equals: 2.
	self assert: (calendar yearNumberFromFixed: 730) equals: 2.
	self assert: (calendar yearNumberFromFixed: 731) equals: 3.
	self assert: (calendar yearNumberFromFixed: 1095) equals: 3.
	self assert: (calendar yearNumberFromFixed: 1096) equals: 4.
	self assert: (calendar yearNumberFromFixed: 1461) equals: 4
]

{ #category : 'test dates accessing' }
GregorianCalendarDefinitionTest >> testYesterday [

	| today gregorianToday |
	today := Date today.
	gregorianToday := FixedDate
		                  yearNumber: today year
		                  monthNumber: today monthIndex
		                  dayNumber: today dayOfMonth
		                  calendar: calendar.
	self assert: calendar yesterday equals: gregorianToday previous
]
