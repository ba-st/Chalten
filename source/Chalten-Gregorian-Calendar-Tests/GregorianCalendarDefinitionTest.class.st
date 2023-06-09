Class {
	#name : #GregorianCalendarDefinitionTest,
	#superclass : #TestCase,
	#pools : [
		'GregorianTimeConcepts'
	],
	#category : #'Chalten-Gregorian-Calendar-Tests'
}

{ #category : #'not categorized' }
GregorianCalendarDefinitionTest >> gregorianMonthUnit [

	^ GregorianTimeUnits >> #month
]

{ #category : #'not categorized' }
GregorianCalendarDefinitionTest >> gregorianYearUnit [

	^ GregorianTimeUnits >> #year
]

{ #category : #'test days accessing' }
GregorianCalendarDefinitionTest >> testAmountOfDaysPerWeek [

	self assert: GregorianCalendar amountOfDaysPerWeek = 7
]

{ #category : #'test months accessing' }
GregorianCalendarDefinitionTest >> testAmountOfMonthsInLeapYears [

	self assert: GregorianCalendar amountOfMonthsInLeapYears = 12
]

{ #category : #'test months accessing' }
GregorianCalendarDefinitionTest >> testAmountOfMonthsInNonleapYears [

	self assert: GregorianCalendar amountOfMonthsInNonleapYears = 12
]

{ #category : #'test months accessing' }
GregorianCalendarDefinitionTest >> testAmountOfMonthsPerYear [

	self assert: GregorianCalendar amountOfMonthsPerYear = 12
]

{ #category : #'test months accessing' }
GregorianCalendarDefinitionTest >> testApril [

	self assert: GregorianCalendar april = April
]

{ #category : #'test month names' }
GregorianCalendarDefinitionTest >> testAprilName [

	self assert: GregorianCalendar aprilName = 'April'
]

{ #category : #'test month numbers' }
GregorianCalendarDefinitionTest >> testAprilNumber [

	self assert: GregorianCalendar aprilNumber = 4
]

{ #category : #'test months accessing' }
GregorianCalendarDefinitionTest >> testAugust [

	self assert: GregorianCalendar august = August
]

{ #category : #'test month names' }
GregorianCalendarDefinitionTest >> testAugustName [

	self assert: GregorianCalendar augustName = 'August'
]

{ #category : #'test month numbers' }
GregorianCalendarDefinitionTest >> testAugustNumber [

	self assert: GregorianCalendar augustNumber = 8
]

{ #category : #'test converting' }
GregorianCalendarDefinitionTest >> testConvert [

	self assert: (GregorianCalendar convert: January fourteenth, 2005) = (January fourteenth, 2005).
	self assert: (GregorianCalendar convert: March fourteenth, 2005) = (March fourteenth, 2005).
	self assert: (GregorianCalendar convert: September eighteenth, 1999) = (September eighteenth, 1999).
	self assert: (GregorianCalendar convert: October twentyfifth, 2008) = (October twentyfifth, 2008).
	self assert: (GregorianCalendar convert: December fifteenth, 2015) = (December fifteenth, 2015).
	
	self assert: (GregorianCalendar convert: (January fourteenth, 2005 at: TimeOfDay noon)) =
		(January fourteenth, 2005 at: TimeOfDay noon).
	self assert: (GregorianCalendar convert: (March fourteenth, 2005 at: TimeOfDay noon)) =
		(March fourteenth, 2005 at: TimeOfDay noon).
	self assert: (GregorianCalendar convert: (September eighteenth, 1999 at: TimeOfDay noon)) =
		(September eighteenth, 1999 at: TimeOfDay noon).
	self assert: (GregorianCalendar convert: (October twentyfifth, 2008 at: TimeOfDay noon)) =
		(October twentyfifth, 2008 at: TimeOfDay noon).
	self assert: (GregorianCalendar convert: (December fifteenth, 2015 at: TimeOfDay noon)) =
		(December fifteenth, 2015 at: TimeOfDay noon).
	
	self
		should: [ GregorianCalendar convert: 1 ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex description = 'Error: 1 can`t be converted to Date nor DateTime' ]
]

{ #category : #'test converting' }
GregorianCalendarDefinitionTest >> testConvertToSmalltalkDate [

	| gregorianDate smalltalkDate |
	gregorianDate := FixedDate 
		yearNumber: 2007
		monthNumber: 2
		dayNumber: 21
		calendar: GregorianCalendar.
	smalltalkDate := Date 
		newDay: 21
		month: 2
		year: 2007.
		
	self assert: (GregorianCalendar convertToSmalltalkDate: gregorianDate) = smalltalkDate
]

{ #category : #'test dates accessing' }
GregorianCalendarDefinitionTest >> testCurrentDayOfMonth [
	| today gregorianToday |
	today := Date today.
	gregorianToday := FixedDate 
				yearNumber: today year
				monthNumber: today monthIndex
				dayNumber: today dayOfMonth
				calendar: GregorianCalendar.
	self 
		assert: GregorianCalendar currentDayOfMonth = gregorianToday dayOfMonth
]

{ #category : #'test dates accessing' }
GregorianCalendarDefinitionTest >> testCurrentMonth [
	| today gregorianToday |
	today := Date today.
	gregorianToday := FixedDate 
				yearNumber: today year
				monthNumber: today monthIndex
				dayNumber: today dayOfMonth
				calendar: GregorianCalendar.
	self assert: GregorianCalendar currentMonth = gregorianToday month
]

{ #category : #'test dates accessing' }
GregorianCalendarDefinitionTest >> testCurrentMonthOfYear [
	| today gregorianToday |
	today := Date today.
	gregorianToday := FixedDate 
				yearNumber: today year
				monthNumber: today monthIndex
				dayNumber: today dayOfMonth
				calendar: GregorianCalendar.
	self 
		assert: GregorianCalendar currentMonthOfYear = gregorianToday monthOfYear
]

{ #category : #'test dates accessing' }
GregorianCalendarDefinitionTest >> testCurrentYear [
	| today gregorianToday |
	today := Date today.
	gregorianToday := FixedDate 
				yearNumber: today year
				monthNumber: today monthIndex
				dayNumber: today dayOfMonth
				calendar: GregorianCalendar.
	self assert: GregorianCalendar currentYear = gregorianToday year
]

{ #category : #'test dates accessing' }
GregorianCalendarDefinitionTest >> testDateFromFixed [
	| januaryFirstOf1 januaryFifthOf1 januaryFirstOf2 february29Of4 janauryFirstOf5 |
	januaryFirstOf1 := January first , 1.
	januaryFifthOf1 := January fifth , 1.
	januaryFirstOf2 := January first , 2.
	february29Of4 := February twentyninth , 4.
	janauryFirstOf5 := January first , 5.
	self assert: (GregorianCalendar dateFromNumberOfDays: 1) = januaryFirstOf1.
	self assert: (GregorianCalendar dateFromNumberOfDays: 5) = januaryFifthOf1.
	self 
		assert: (GregorianCalendar dateFromNumberOfDays: 366) = januaryFirstOf2.
	self 
		assert: (GregorianCalendar dateFromNumberOfDays: 1155) = february29Of4.
	self 
		assert: (GregorianCalendar dateFromNumberOfDays: 1462) = janauryFirstOf5
]

{ #category : #'test days accessing' }
GregorianCalendarDefinitionTest >> testDayNamed [

	self
		assert: (GregorianCalendar dayNamed: 'Sunday') = Sunday;
		assert: (GregorianCalendar dayNamed: 'Monday') = Monday;
		assert: (GregorianCalendar dayNamed: 'Tuesday') = Tuesday;
		assert: (GregorianCalendar dayNamed: 'Wednesday') = Wednesday;
		assert: (GregorianCalendar dayNamed: 'Thursday') = Thursday;
		assert: (GregorianCalendar dayNamed: 'Friday') = Friday;
		assert: (GregorianCalendar dayNamed: 'Saturday') = Saturday
]

{ #category : #'test days accessing' }
GregorianCalendarDefinitionTest >> testDayOf [

	self assert: (GregorianCalendar dayOf: May fourth, 2014) = Sunday
]

{ #category : #'test days accessing' }
GregorianCalendarDefinitionTest >> testDayPositionedInWeek [

	self
		assert: (GregorianCalendar dayPositionedInWeek: 1) = Sunday;
		assert: (GregorianCalendar dayPositionedInWeek: 2) = Monday;
		assert: (GregorianCalendar dayPositionedInWeek: 3) = Tuesday;
		assert: (GregorianCalendar dayPositionedInWeek: 4) = Wednesday;
		assert: (GregorianCalendar dayPositionedInWeek: 5) = Thursday;
		assert: (GregorianCalendar dayPositionedInWeek: 6) = Friday;
		assert: (GregorianCalendar dayPositionedInWeek: 7) = Saturday
]

{ #category : #'test days accessing' }
GregorianCalendarDefinitionTest >> testDaysFromEpochTo [
	| januaryFirstOf0 januaryFirstOf1 januarySecondOf1 januaryFifteenthOf1 januaryFirstOf2 januaryFirstOf5 |
	januaryFirstOf0 := January first , 0.
	januaryFirstOf1 := January first , 1.
	januarySecondOf1 := January second , 1.
	januaryFifteenthOf1 := January fifteenth , 1.
	januaryFirstOf2 := January first , 2.
	januaryFirstOf5 := January first , 5.
	self assert: (GregorianCalendar numberOfDaysFromEpochTo: januaryFirstOf0) = 366 daysMeasure negated.
	self assert: (GregorianCalendar numberOfDaysFromEpochTo: januaryFirstOf1) = 0 daysMeasure.
	self assert: (GregorianCalendar numberOfDaysFromEpochTo: januarySecondOf1) = 1 dayMeasure.
	self assert: (GregorianCalendar numberOfDaysFromEpochTo: januaryFifteenthOf1) = 14 daysMeasure.
	self assert: (GregorianCalendar numberOfDaysFromEpochTo: januaryFirstOf2) = 365 daysMeasure.
	self assert: (GregorianCalendar numberOfDaysFromEpochTo: januaryFirstOf5) = 1461 daysMeasure
]

{ #category : #'test global variables' }
GregorianCalendarDefinitionTest >> testDaysGlobalVariables [

	self
		assert: Sunday = GregorianCalendar sunday;
		assert: Monday = GregorianCalendar monday;
		assert: Tuesday = GregorianCalendar tuesday;
		assert: Wednesday = GregorianCalendar wednesday;
		assert: Thursday = GregorianCalendar thursday;
		assert: Friday = GregorianCalendar friday;
		assert: Saturday = GregorianCalendar saturday
]

{ #category : #'test months accessing' }
GregorianCalendarDefinitionTest >> testDecember [

	self assert: GregorianCalendar december = December
]

{ #category : #'test month names' }
GregorianCalendarDefinitionTest >> testDecemberName [

	self assert: GregorianCalendar decemberName = 'December'
]

{ #category : #'test month numbers' }
GregorianCalendarDefinitionTest >> testDecemberNumber [

	self assert: GregorianCalendar decemberNumber = 12
]

{ #category : #'test year querying' }
GregorianCalendarDefinitionTest >> testDistanceInYearsFromTo [

	self assert: (GregorianCalendar
		distanceInYearsFrom: 2012 asGregorianYear
		to: 2015 asGregorianYear) = (self gregorianYearUnit with: 3)
]

{ #category : #'test accessing' }
GregorianCalendarDefinitionTest >> testEpoch [

	self assert: GregorianCalendar epoch = 1
]

{ #category : #'test months accessing' }
GregorianCalendarDefinitionTest >> testFebruary [

	self assert: GregorianCalendar february = February
]

{ #category : #'test month names' }
GregorianCalendarDefinitionTest >> testFebruaryName [

	self assert: GregorianCalendar februaryName = 'February'
]

{ #category : #'test month numbers' }
GregorianCalendarDefinitionTest >> testFebruaryNumber [

	self assert: GregorianCalendar februaryNumber = 2
]

{ #category : #'test months accessing' }
GregorianCalendarDefinitionTest >> testFirstMonth [

	self assert: GregorianCalendar firstMonth = January
]

{ #category : #'test month of year accessing' }
GregorianCalendarDefinitionTest >> testFirstMonthOf [
	| year |
	year := 2007 asGregorianYear.
	self assert: (GregorianCalendar firstMonthOf: year) = (January , 2007)
]

{ #category : #'test dates accessing' }
GregorianCalendarDefinitionTest >> testFixedFromDate [
	| januaryFirstOf1 novemberTwelveOf1945 |
	januaryFirstOf1 := January first , 1.
	novemberTwelveOf1945 := November twelfth , 1945.
	self
		assert: (GregorianCalendar numberOfDaysFromDate: januaryFirstOf1) = 1;
		assert: (GregorianCalendar numberOfDaysFromDate: novemberTwelveOf1945) 
					= 710347
]

{ #category : #'test days accessing' }
GregorianCalendarDefinitionTest >> testFriday [

	self assert: GregorianCalendar friday = Friday
]

{ #category : #'test day names' }
GregorianCalendarDefinitionTest >> testFridayName [

	self assert: GregorianCalendar fridayName = 'Friday'
]

{ #category : #'test day positions in week' }
GregorianCalendarDefinitionTest >> testFridayPositionInWeek [

	self assert: GregorianCalendar fridayPositionInWeek = 6
]

{ #category : #'test month testing' }
GregorianCalendarDefinitionTest >> testIsApril [

	self assert: (GregorianCalendar isApril: April)
]

{ #category : #'test month testing' }
GregorianCalendarDefinitionTest >> testIsAugust [

	self assert: (GregorianCalendar isAugust: August)
]

{ #category : #'test month testing' }
GregorianCalendarDefinitionTest >> testIsDecember [

	self assert: (GregorianCalendar isDecember: December)
]

{ #category : #'test month testing' }
GregorianCalendarDefinitionTest >> testIsFebruary [

	self assert: (GregorianCalendar isFebruary: February)
]

{ #category : #'test year testing' }
GregorianCalendarDefinitionTest >> testIsFirstMonthOfYear [

	self assert: (GregorianCalendar isFirstMonthOfYear: January).
	self deny: (GregorianCalendar isFirstMonthOfYear: May).
	self deny: (GregorianCalendar isFirstMonthOfYear: December)
]

{ #category : #'test day testing' }
GregorianCalendarDefinitionTest >> testIsFriday [

	self assert: (GregorianCalendar isFriday: Friday)
]

{ #category : #'test month testing' }
GregorianCalendarDefinitionTest >> testIsJanuary [

	self assert: (GregorianCalendar isJanuary: January)
]

{ #category : #'test month testing' }
GregorianCalendarDefinitionTest >> testIsJuly [

	self assert: (GregorianCalendar isJuly: July)
]

{ #category : #'test month testing' }
GregorianCalendarDefinitionTest >> testIsJune [

	self assert: (GregorianCalendar isJune: June)
]

{ #category : #'test month testing' }
GregorianCalendarDefinitionTest >> testIsMarch [

	self assert: (GregorianCalendar isMarch: March)
]

{ #category : #'test month testing' }
GregorianCalendarDefinitionTest >> testIsMay [

	self assert: (GregorianCalendar isMay: May)
]

{ #category : #'test day testing' }
GregorianCalendarDefinitionTest >> testIsMonday [

	self assert: (GregorianCalendar isMonday: Monday)
]

{ #category : #'test month testing' }
GregorianCalendarDefinitionTest >> testIsNovember [

	self assert: (GregorianCalendar isNovember: November)
]

{ #category : #'test month testing' }
GregorianCalendarDefinitionTest >> testIsOctober [

	self assert: (GregorianCalendar isOctober: October)
]

{ #category : #'test day testing' }
GregorianCalendarDefinitionTest >> testIsSaturday [

	self assert: (GregorianCalendar isSaturday: Saturday)
]

{ #category : #'test month testing' }
GregorianCalendarDefinitionTest >> testIsSeptember [

	self assert: (GregorianCalendar isSeptember: September)
]

{ #category : #'test day testing' }
GregorianCalendarDefinitionTest >> testIsSunday [

	self assert: (GregorianCalendar isSunday: Sunday)
]

{ #category : #'test day testing' }
GregorianCalendarDefinitionTest >> testIsThursday [

	self assert: (GregorianCalendar isThursday: Thursday)
]

{ #category : #'test day testing' }
GregorianCalendarDefinitionTest >> testIsTuesday [

	self assert: (GregorianCalendar isTuesday: Tuesday)
]

{ #category : #'test day testing' }
GregorianCalendarDefinitionTest >> testIsWednesday [

	self assert: (GregorianCalendar isWednesday: Wednesday)
]

{ #category : #'test year testing' }
GregorianCalendarDefinitionTest >> testIsYearNumberLeap [

	self
		assert: (GregorianCalendar isYearNumberLeap: 1904);
		assert: (GregorianCalendar isYearNumberLeap: 1908);
		assert: (GregorianCalendar isYearNumberLeap: 1992);
		assert: (GregorianCalendar isYearNumberLeap: 2000);
		assert: (GregorianCalendar isYearNumberLeap: 2004).

	self
		deny: (GregorianCalendar isYearNumberLeap: 1900);
		deny: (GregorianCalendar isYearNumberLeap: 1915);
		deny: (GregorianCalendar isYearNumberLeap: 1991);
		deny: (GregorianCalendar isYearNumberLeap: 2007);
		deny: (GregorianCalendar isYearNumberLeap: 2100)
]

{ #category : #'test months accessing' }
GregorianCalendarDefinitionTest >> testJanuary [

	self assert: GregorianCalendar january = January
]

{ #category : #'test month names' }
GregorianCalendarDefinitionTest >> testJanuaryName [

	self assert: GregorianCalendar januaryName = 'January'
]

{ #category : #'test month numbers' }
GregorianCalendarDefinitionTest >> testJanuaryNumber [

	self assert: GregorianCalendar januaryNumber = 1
]

{ #category : #'test months accessing' }
GregorianCalendarDefinitionTest >> testJuly [

	self assert: GregorianCalendar july = July
]

{ #category : #'test month names' }
GregorianCalendarDefinitionTest >> testJulyName [

	self assert: GregorianCalendar julyName = 'July'
]

{ #category : #'test month numbers' }
GregorianCalendarDefinitionTest >> testJulyNumber [

	self assert: GregorianCalendar julyNumber = 7
]

{ #category : #'test months accessing' }
GregorianCalendarDefinitionTest >> testJune [

	self assert: GregorianCalendar june = June
]

{ #category : #'test month names' }
GregorianCalendarDefinitionTest >> testJuneName [

	self assert: GregorianCalendar juneName = 'June'
]

{ #category : #'test month numbers' }
GregorianCalendarDefinitionTest >> testJuneNumber [

	self assert: GregorianCalendar juneNumber = 6
]

{ #category : #'test months accessing' }
GregorianCalendarDefinitionTest >> testLastMonth [

	self assert: GregorianCalendar lastMonth = December
]

{ #category : #'test month of year accessing' }
GregorianCalendarDefinitionTest >> testLastMonthOf [
	| year |
	year := 2007 asGregorianYear.
	self assert: (GregorianCalendar lastMonthOf: year) = (December , 2007)
]

{ #category : #'test months accessing' }
GregorianCalendarDefinitionTest >> testMarch [

	self assert: GregorianCalendar march = March
]

{ #category : #'test month names' }
GregorianCalendarDefinitionTest >> testMarchName [

	self assert: GregorianCalendar marchName = 'March'
]

{ #category : #'test month numbers' }
GregorianCalendarDefinitionTest >> testMarchNumber [

	self assert: GregorianCalendar marchNumber = 3
]

{ #category : #'test days accessing' }
GregorianCalendarDefinitionTest >> testMaximumNumberOfDaysInOneYear [

	self assert: GregorianCalendar maximumNumberOfDaysInOneYear = 366 daysMeasure
]

{ #category : #'test months accessing' }
GregorianCalendarDefinitionTest >> testMay [

	self assert: GregorianCalendar may = May
]

{ #category : #'test month names' }
GregorianCalendarDefinitionTest >> testMayName [

	self assert: GregorianCalendar mayName = 'May'
]

{ #category : #'test month numbers' }
GregorianCalendarDefinitionTest >> testMayNumber [

	self assert: GregorianCalendar mayNumber = 5
]

{ #category : #'test days accessing' }
GregorianCalendarDefinitionTest >> testMonday [

	self assert: GregorianCalendar monday = Monday
]

{ #category : #'test day names' }
GregorianCalendarDefinitionTest >> testMondayName [

	self assert: GregorianCalendar mondayName = 'Monday'
]

{ #category : #'test day positions in week' }
GregorianCalendarDefinitionTest >> testMondayPositionInWeek [

	self assert: GregorianCalendar mondayPositionInWeek = 2
]

{ #category : #'test months accessing' }
GregorianCalendarDefinitionTest >> testMonthNamed [

	self
		assert: (GregorianCalendar monthNamed: 'January') = January;
		assert: (GregorianCalendar monthNamed: 'February') = February;
		assert: (GregorianCalendar monthNamed: 'March') = March;
		assert: (GregorianCalendar monthNamed: 'April') = April;
		assert: (GregorianCalendar monthNamed: 'May') = May;
		assert: (GregorianCalendar monthNamed: 'June') = June;
		assert: (GregorianCalendar monthNamed: 'July') = July;
		assert: (GregorianCalendar monthNamed: 'August') = August;
		assert: (GregorianCalendar monthNamed: 'September') = September;
		assert: (GregorianCalendar monthNamed: 'October') = October;
		assert: (GregorianCalendar monthNamed: 'November') = November;
		assert: (GregorianCalendar monthNamed: 'December') = December.
		
	self
		should: [ GregorianCalendar monthNamed: 'invalid name' ]
		raise: InvalidMonthNameException
		withExceptionDo: [ :ex | self assert: ex description = 'invalid name is an invalid name for a month' ]
]

{ #category : #'test months accessing' }
GregorianCalendarDefinitionTest >> testMonthNumbered [

	self
		assert: (GregorianCalendar monthNumbered: 1) = January;
		assert: (GregorianCalendar monthNumbered: 2) = February;
		assert: (GregorianCalendar monthNumbered: 3) = March;
		assert: (GregorianCalendar monthNumbered: 4) = April;
		assert: (GregorianCalendar monthNumbered: 5) = May;
		assert: (GregorianCalendar monthNumbered: 6) = June;
		assert: (GregorianCalendar monthNumbered: 7) = July;
		assert: (GregorianCalendar monthNumbered: 8) = August;
		assert: (GregorianCalendar monthNumbered: 9) = September;
		assert: (GregorianCalendar monthNumbered: 10) = October;
		assert: (GregorianCalendar monthNumbered: 11) = November;
		assert: (GregorianCalendar monthNumbered: 12) = December
]

{ #category : #'test months accessing' }
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
	
	self assert: GregorianCalendar monthsForLeapYears = months
]

{ #category : #'test months accessing' }
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
	
	self assert: GregorianCalendar monthsForNonleapYears = months
]

{ #category : #'test global variables' }
GregorianCalendarDefinitionTest >> testMonthsGlobalVariables [

	self
		assert: January = GregorianCalendar january;
		assert: February = GregorianCalendar february;
		assert: March = GregorianCalendar march;
		assert: April = GregorianCalendar april;
		assert: May = GregorianCalendar may;
		assert: June = GregorianCalendar june;
		assert: July = GregorianCalendar july;
		assert: August = GregorianCalendar august;
		assert: September = GregorianCalendar september;
		assert: October = GregorianCalendar october;
		assert: November = GregorianCalendar november;
		assert: December = GregorianCalendar december
]

{ #category : #'test months accessing' }
GregorianCalendarDefinitionTest >> testNovember [

	self assert: GregorianCalendar november = November
]

{ #category : #'test month names' }
GregorianCalendarDefinitionTest >> testNovemberName [

	self assert: GregorianCalendar novemberName = 'November'
]

{ #category : #'test month numbers' }
GregorianCalendarDefinitionTest >> testNovemberNumber [

	self assert: GregorianCalendar novemberNumber = 11
]

{ #category : #'test dates accessing' }
GregorianCalendarDefinitionTest >> testNow [
	| now nowInTwoSeconds |
	now := GregorianCalendar now.
	(Delay forSeconds: 1) wait.
	nowInTwoSeconds := GregorianCalendar now.
	self assert: now < nowInTwoSeconds.
	self assert: ((now distanceTo: nowInTwoSeconds) convertTo: TimeUnits second) truncated = 1 secondMeasure
]

{ #category : #'test days accessing' }
GregorianCalendarDefinitionTest >> testNumberOfDaysIn [

	self assert: (GregorianCalendar numberOfDaysIn: 2014 asGregorianYear) = 365 daysMeasure
]

{ #category : #'test days accessing' }
GregorianCalendarDefinitionTest >> testNumberOfDaysPerWeek [
	self assert: GregorianCalendar numberOfDaysPerWeek = 7 daysMeasure
]

{ #category : #'test months accessing' }
GregorianCalendarDefinitionTest >> testNumberOfMonthsPerYear [
	self assert: GregorianCalendar numberOfMonthsPerYear = (self gregorianMonthUnit with: 12)
]

{ #category : #'test months accessing' }
GregorianCalendarDefinitionTest >> testOctober [

	self assert: GregorianCalendar october = October
]

{ #category : #'test month names' }
GregorianCalendarDefinitionTest >> testOctoberName [

	self assert: GregorianCalendar octoberName = 'October'
]

{ #category : #'test month numbers' }
GregorianCalendarDefinitionTest >> testOctoberNumber [

	self assert: GregorianCalendar octoberNumber = 10
]

{ #category : #'test printing' }
GregorianCalendarDefinitionTest >> testPrintString [

	self assert: GregorianCalendar printString  = 'Gregorian Calendar'
]

{ #category : #'test days accessing' }
GregorianCalendarDefinitionTest >> testSaturday [

	self assert: GregorianCalendar saturday = Saturday
]

{ #category : #'test day names' }
GregorianCalendarDefinitionTest >> testSaturdayName [

	self assert: GregorianCalendar saturdayName = 'Saturday'
]

{ #category : #'test day positions in week' }
GregorianCalendarDefinitionTest >> testSaturdayPositionInWeek [

	self assert: GregorianCalendar saturdayPositionInWeek = 7
]

{ #category : #'test months accessing' }
GregorianCalendarDefinitionTest >> testSeptember [

	self assert: GregorianCalendar september = September
]

{ #category : #'test month names' }
GregorianCalendarDefinitionTest >> testSeptemberName [

	self assert: GregorianCalendar septemberName = 'September'
]

{ #category : #'test month numbers' }
GregorianCalendarDefinitionTest >> testSeptemberNumber [

	self assert: GregorianCalendar septemberNumber = 9
]

{ #category : #'test days accessing' }
GregorianCalendarDefinitionTest >> testSinceFirstDayOfWeek [
	| currentDay zeroDays |
	zeroDays := 0 daysMeasure.
	currentDay := GregorianCalendar sunday.
	(zeroDays to: 6 daysMeasure)
		do: [ :numberOfDays | 
			self assert: (GregorianCalendar sinceFirstDayOfWeek: numberOfDays) = currentDay.
			currentDay := currentDay next ]
]

{ #category : #'test days accessing' }
GregorianCalendarDefinitionTest >> testSinceSunday [
	| currentDay zeroDays |
	zeroDays := 0 daysMeasure.
	currentDay := GregorianCalendar sunday.
	(zeroDays to: 6 daysMeasure)
		do: [ :numberOfDays | 
			self assert: (GregorianCalendar sinceSunday: numberOfDays) = currentDay.
			currentDay := currentDay next ]
]

{ #category : #'test days accessing' }
GregorianCalendarDefinitionTest >> testSunday [

	self assert: GregorianCalendar sunday = Sunday
]

{ #category : #'test day names' }
GregorianCalendarDefinitionTest >> testSundayName [

	self assert: GregorianCalendar sundayName = 'Sunday'
]

{ #category : #'test day positions in week' }
GregorianCalendarDefinitionTest >> testSundayPositionInWeek [

	self assert: GregorianCalendar sundayPositionInWeek = 1
]

{ #category : #'test dates accessing' }
GregorianCalendarDefinitionTest >> testTheBeginningOfTime [

	GregorianCalendar theBeginningOfTime = TheBeginningOfTime
]

{ #category : #'test dates accessing' }
GregorianCalendarDefinitionTest >> testTheEndOfTime [

	GregorianCalendar theEndOfTime = TheEndOfTime
]

{ #category : #'test days accessing' }
GregorianCalendarDefinitionTest >> testThursday [

	self assert: GregorianCalendar thursday = Thursday
]

{ #category : #'test day names' }
GregorianCalendarDefinitionTest >> testThursdayName [

	self assert: GregorianCalendar thursdayName = 'Thursday'
]

{ #category : #'test day positions in week' }
GregorianCalendarDefinitionTest >> testThursdayPositionInWeek [

	self assert: GregorianCalendar thursdayPositionInWeek = 5
]

{ #category : #'test dates accessing' }
GregorianCalendarDefinitionTest >> testToday [
	| today gregorianToday |
	today := Date today.
	gregorianToday := FixedDate 
				yearNumber: today year
				monthNumber: today monthIndex
				dayNumber: today dayOfMonth
				calendar: GregorianCalendar.
	self assert: GregorianCalendar today = gregorianToday
]

{ #category : #'test dates accessing' }
GregorianCalendarDefinitionTest >> testTomorrow [
	| today gregorianToday |
	today := Date today.
	gregorianToday := FixedDate 
				yearNumber: today year
				monthNumber: today monthIndex
				dayNumber: today dayOfMonth
				calendar: GregorianCalendar.
	self assert: GregorianCalendar tomorrow = gregorianToday next
]

{ #category : #'test days accessing' }
GregorianCalendarDefinitionTest >> testTuesday [

	self assert: GregorianCalendar tuesday = Tuesday
]

{ #category : #'test day names' }
GregorianCalendarDefinitionTest >> testTuesdayName [

	self assert: GregorianCalendar tuesdayName = 'Tuesday'
]

{ #category : #'test day positions in week' }
GregorianCalendarDefinitionTest >> testTuesdayPositionInWeek [

	self assert: GregorianCalendar tuesdayPositionInWeek = 3
]

{ #category : #'test days accessing' }
GregorianCalendarDefinitionTest >> testWednesday [

	self assert: GregorianCalendar wednesday = Wednesday
]

{ #category : #'test day names' }
GregorianCalendarDefinitionTest >> testWednesdayName [

	self assert: GregorianCalendar wednesdayName = 'Wednesday'
]

{ #category : #'test day positions in week' }
GregorianCalendarDefinitionTest >> testWednesdayPositionInWeek [

	self assert: GregorianCalendar wednesdayPositionInWeek = 4
]

{ #category : #'test year accessing' }
GregorianCalendarDefinitionTest >> testYearNumberFromFixed [

	self assert: (GregorianCalendar yearNumberFromFixed: 1) = 1.
	self assert: (GregorianCalendar yearNumberFromFixed: 36) = 1.
	self assert: (GregorianCalendar yearNumberFromFixed: 360) = 1.
	self assert: (GregorianCalendar yearNumberFromFixed: 365) = 1.
	self assert: (GregorianCalendar yearNumberFromFixed: 366) = 2.
	self assert: (GregorianCalendar yearNumberFromFixed: 370) = 2.
	self assert: (GregorianCalendar yearNumberFromFixed: 730) = 2.
	self assert: (GregorianCalendar yearNumberFromFixed: 731) = 3.
	self assert: (GregorianCalendar yearNumberFromFixed: 1095) = 3.
	self assert: (GregorianCalendar yearNumberFromFixed: 1096) = 4.
	self assert: (GregorianCalendar yearNumberFromFixed: 1461) = 4
]

{ #category : #'test dates accessing' }
GregorianCalendarDefinitionTest >> testYesterday [
	| today gregorianToday |
	today := Date today.
	gregorianToday := FixedDate 
				yearNumber: today year
				monthNumber: today monthIndex
				dayNumber: today dayOfMonth
				calendar: GregorianCalendar.
	self assert: GregorianCalendar yesterday = gregorianToday previous
]
