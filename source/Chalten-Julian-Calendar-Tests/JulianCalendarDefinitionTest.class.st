Class {
	#name : #JulianCalendarDefinitionTest,
	#superclass : #TestCase,
	#category : #'Chalten-Julian-Calendar-Tests'
}

{ #category : #'test days accessing' }
JulianCalendarDefinitionTest >> testAmountOfDaysPerWeek [

	self assert: JulianCalendar amountOfDaysPerWeek = 7
]

{ #category : #'test months accessing' }
JulianCalendarDefinitionTest >> testAmountOfMonthsInLeapYears [

	self assert: JulianCalendar amountOfMonthsInLeapYears = 12
]

{ #category : #'test months accessing' }
JulianCalendarDefinitionTest >> testAmountOfMonthsInNonleapYears [

	self assert: JulianCalendar amountOfMonthsInNonleapYears = 12
]

{ #category : #'test months accessing' }
JulianCalendarDefinitionTest >> testAmountOfMonthsPerYear [

	self assert: JulianCalendar amountOfMonthsPerYear = 12
]

{ #category : #'test months accessing' }
JulianCalendarDefinitionTest >> testApril [

	self assert: JulianCalendar april = JulianApril
]

{ #category : #'test month names' }
JulianCalendarDefinitionTest >> testAprilName [

	self assert: JulianCalendar aprilName = 'April'
]

{ #category : #'test month numbers' }
JulianCalendarDefinitionTest >> testAprilNumber [

	self assert: JulianCalendar aprilNumber = 4
]

{ #category : #'test months accessing' }
JulianCalendarDefinitionTest >> testAugust [

	self assert: JulianCalendar august = JulianAugust
]

{ #category : #'test month names' }
JulianCalendarDefinitionTest >> testAugustName [

	self assert: JulianCalendar augustName = 'August'
]

{ #category : #'test month numbers' }
JulianCalendarDefinitionTest >> testAugustNumber [

	self assert: JulianCalendar augustNumber = 8
]

{ #category : #'test converting' }
JulianCalendarDefinitionTest >> testConvert [

	self assert: (JulianCalendar convert: January fourteenth , 2005) = (JulianJanuary first , 2005).
	self assert: (JulianCalendar convert: March fourteenth , 2005) = (JulianMarch first , 2005).
	self assert: (JulianCalendar convert: September eighteenth , 1999) = (JulianSeptember fifth , 1999).
	self assert: (JulianCalendar convert: October twentyfifth , 2008) = (JulianOctober twelfth , 2008).
	self assert: (JulianCalendar convert: December fifteenth , 2015) = (JulianDecember second , 2015).
	
	self assert: (JulianCalendar convert: (January fourteenth , 2005 at: TimeOfDay noon)) =
		(JulianJanuary first , 2005 at: TimeOfDay noon).
	self assert: (JulianCalendar convert: (March fourteenth , 2005 at: TimeOfDay noon)) =
		(JulianMarch first , 2005 at: TimeOfDay noon).
	self assert: (JulianCalendar convert: (September eighteenth , 1999 at: TimeOfDay noon)) =
		(JulianSeptember fifth , 1999 at: TimeOfDay noon).
	self assert: (JulianCalendar convert: (October twentyfifth , 2008 at: TimeOfDay noon)) =
		(JulianOctober twelfth , 2008 at: TimeOfDay noon).
	self assert: (JulianCalendar convert: (December fifteenth , 2015 at: TimeOfDay noon)) =
		(JulianDecember second , 2015 at: TimeOfDay noon).
	
	self
		should: [ JulianCalendar convert: 1 ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex description = 'Error: 1 can`t be converted to Date nor DateTime' ]
]

{ #category : #'test converting' }
JulianCalendarDefinitionTest >> testConvertToSmalltalkDate [

	| julianDate smalltalkDate |

	julianDate := JulianFebruary twentyfirst, 2007.
	smalltalkDate := Date newDay: 6 month: 3 year: 2007.
	self assert: (JulianCalendar convertToSmalltalkDate: julianDate) = smalltalkDate
]

{ #category : #'test dates accessing' }
JulianCalendarDefinitionTest >> testCurrentDayOfMonth [
	| smalltalkToday gregorianToday |
	smalltalkToday := Date today.
	gregorianToday := FixedDate 
				yearNumber: smalltalkToday year
				monthNumber: smalltalkToday monthIndex
				dayNumber: smalltalkToday dayOfMonth
				calendar: GregorianCalendar.
	self assert: JulianCalendar currentDayOfMonth 
				= (JulianCalendar convertToJulianDate: gregorianToday) dayOfMonth
]

{ #category : #'test dates accessing' }
JulianCalendarDefinitionTest >> testCurrentMonth [
	| smalltalkToday gregorianToday |
	smalltalkToday := Date today.
	gregorianToday := FixedDate 
				yearNumber: smalltalkToday year
				monthNumber: smalltalkToday monthIndex
				dayNumber: smalltalkToday dayOfMonth
				calendar: GregorianCalendar.
	self assert: JulianCalendar currentMonth 
				= (JulianCalendar convertToJulianDate: gregorianToday) month
]

{ #category : #'test dates accessing' }
JulianCalendarDefinitionTest >> testCurrentMonthOfYear [
	| smalltalkToday gregorianToday |
	smalltalkToday := Date today.
	gregorianToday := FixedDate 
				yearNumber: smalltalkToday year
				monthNumber: smalltalkToday monthIndex
				dayNumber: smalltalkToday dayOfMonth
				calendar: GregorianCalendar.
	self assert: JulianCalendar currentMonthOfYear 
				= (JulianCalendar convertToJulianDate: gregorianToday) monthOfYear
]

{ #category : #'test dates accessing' }
JulianCalendarDefinitionTest >> testCurrentYear [
	| smalltalkToday gregorianToday |
	smalltalkToday := Date today.
	gregorianToday := FixedDate 
				yearNumber: smalltalkToday year
				monthNumber: smalltalkToday monthIndex
				dayNumber: smalltalkToday dayOfMonth
				calendar: GregorianCalendar.
	self assert: JulianCalendar currentYear 
				= (JulianCalendar convertToJulianDate: gregorianToday) year
]

{ #category : #'test dates accessing' }
JulianCalendarDefinitionTest >> testDateFromFixed [
	| januaryThirdOf1 januarySeventhOf1 januaryThirdOf2 marchSecondOf4 janauryThirdOf5 |
	januaryThirdOf1 := JulianJanuary third , 1.
	januarySeventhOf1 := JulianJanuary seventh , 1.
	januaryThirdOf2 := JulianJanuary third , 2.
	marchSecondOf4 := JulianMarch second , 4.
	janauryThirdOf5 := JulianJanuary third , 5.
	self assert: (JulianCalendar dateFromNumberOfDays: 1) = januaryThirdOf1.
	self assert: (JulianCalendar dateFromNumberOfDays: 5) = januarySeventhOf1.
	self assert: (JulianCalendar dateFromNumberOfDays: 366) = januaryThirdOf2.
	self assert: (JulianCalendar dateFromNumberOfDays: 1155) = marchSecondOf4.
	self assert: (JulianCalendar dateFromNumberOfDays: 1462) = janauryThirdOf5
]

{ #category : #'test days accessing' }
JulianCalendarDefinitionTest >> testDayNamed [

	self
		assert: (JulianCalendar dayNamed: 'Sunday') = JulianSunday;
		assert: (JulianCalendar dayNamed: 'Monday') = JulianMonday;
		assert: (JulianCalendar dayNamed: 'Tuesday') = JulianTuesday;
		assert: (JulianCalendar dayNamed: 'Wednesday') = JulianWednesday;
		assert: (JulianCalendar dayNamed: 'Thursday') = JulianThursday;
		assert: (JulianCalendar dayNamed: 'Friday') = JulianFriday;
		assert: (JulianCalendar dayNamed: 'Saturday') = JulianSaturday
]

{ #category : #'test days accessing' }
JulianCalendarDefinitionTest >> testDayOf [

	self assert: (JulianCalendar dayOf: May fourth, 2014) = JulianSunday
]

{ #category : #'test days accessing' }
JulianCalendarDefinitionTest >> testDayPositionedInWeek [

	self
		assert: (JulianCalendar dayPositionedInWeek: 1) = JulianSunday;
		assert: (JulianCalendar dayPositionedInWeek: 2) = JulianMonday;
		assert: (JulianCalendar dayPositionedInWeek: 3) = JulianTuesday;
		assert: (JulianCalendar dayPositionedInWeek: 4) = JulianWednesday;
		assert: (JulianCalendar dayPositionedInWeek: 5) = JulianThursday;
		assert: (JulianCalendar dayPositionedInWeek: 6) = JulianFriday;
		assert: (JulianCalendar dayPositionedInWeek: 7) = JulianSaturday
]

{ #category : #'test days accessing' }
JulianCalendarDefinitionTest >> testDaysFromEpochTo [
	| januaryFirstOf1 januarySecondOf1 januaryFifteenthOf1 januaryFirstOf2 januaryFirstOf5 |
	januaryFirstOf1 := JulianJanuary first , 1.
	januarySecondOf1 := JulianJanuary second , 1.
	januaryFifteenthOf1 := JulianJanuary fifteenth , 1.
	januaryFirstOf2 := JulianJanuary first , 2.
	januaryFirstOf5 := JulianJanuary first , 5.
	self assert: (JulianCalendar numberOfDaysFromEpochTo: januaryFirstOf1) = 2 daysMeasure negated.
	self assert: (JulianCalendar numberOfDaysFromEpochTo: januarySecondOf1) = 1 dayMeasure negated.
	self assert: (JulianCalendar numberOfDaysFromEpochTo: januaryFifteenthOf1) = 12 daysMeasure.
	self assert: (JulianCalendar numberOfDaysFromEpochTo: januaryFirstOf2) = 363 daysMeasure.
	self assert: (JulianCalendar numberOfDaysFromEpochTo: januaryFirstOf5) = 1459 daysMeasure
]

{ #category : #'test global variables' }
JulianCalendarDefinitionTest >> testDaysGlobalVariables [

	self
		assert: JulianSunday = JulianCalendar sunday;
		assert: JulianMonday = JulianCalendar monday;
		assert: JulianTuesday = JulianCalendar tuesday;
		assert: JulianWednesday = JulianCalendar wednesday;
		assert: JulianThursday = JulianCalendar thursday;
		assert: JulianFriday = JulianCalendar friday;
		assert: JulianSaturday = JulianCalendar saturday
]

{ #category : #'test months accessing' }
JulianCalendarDefinitionTest >> testDecember [

	self assert: JulianCalendar december = JulianDecember
]

{ #category : #'test month names' }
JulianCalendarDefinitionTest >> testDecemberName [

	self assert: JulianCalendar decemberName = 'December'
]

{ #category : #'test month numbers' }
JulianCalendarDefinitionTest >> testDecemberNumber [

	self assert: JulianCalendar decemberNumber = 12
]

{ #category : #'test year querying' }
JulianCalendarDefinitionTest >> testDistanceInYearsFromTo [

	self assert: (JulianCalendar
		distanceInYearsFrom: 2012 asJulianYear
		to: 2015 asJulianYear) = 3 julianYears
]

{ #category : #'test accessing' }
JulianCalendarDefinitionTest >> testEpoch [

	self assert: JulianCalendar epoch = -1
]

{ #category : #'test months accessing' }
JulianCalendarDefinitionTest >> testFebruary [

	self assert: JulianCalendar february = JulianFebruary
]

{ #category : #'test month names' }
JulianCalendarDefinitionTest >> testFebruaryName [

	self assert: JulianCalendar februaryName = 'February'
]

{ #category : #'test month numbers' }
JulianCalendarDefinitionTest >> testFebruaryNumber [

	self assert: JulianCalendar februaryNumber = 2
]

{ #category : #'test months accessing' }
JulianCalendarDefinitionTest >> testFirstMonth [

	self assert: JulianCalendar firstMonth = JulianJanuary
]

{ #category : #'test month of year accessing' }
JulianCalendarDefinitionTest >> testFirstMonthOf [
	| year |
	year := 2007 asJulianYear.
	self assert: (JulianCalendar firstMonthOf: year) = (JulianJanuary , 2007)
]

{ #category : #'test dates accessing' }
JulianCalendarDefinitionTest >> testFixedFromDate [
	| januaryFirstOf1 novemberTwelveOf1945 |
	januaryFirstOf1 := JulianJanuary first , 1.
	novemberTwelveOf1945 := JulianJanuary twelfth , 1945.
	JulianCalendar.
	self
		assert: (JulianCalendar numberOfDaysFromDate: januaryFirstOf1) = -1;
		assert: (JulianCalendar numberOfDaysFromDate: novemberTwelveOf1945) 
					= 710056
]

{ #category : #'test days accessing' }
JulianCalendarDefinitionTest >> testFriday [

	self assert: JulianCalendar friday = JulianFriday
]

{ #category : #'test day names' }
JulianCalendarDefinitionTest >> testFridayName [

	self assert: JulianCalendar fridayName = 'Friday'
]

{ #category : #'test day positions in week' }
JulianCalendarDefinitionTest >> testFridayPositionInWeek [

	self assert: JulianCalendar fridayPositionInWeek = 6
]

{ #category : #'test month testing' }
JulianCalendarDefinitionTest >> testIsApril [

	self assert: (JulianCalendar isApril: JulianApril)
]

{ #category : #'test month testing' }
JulianCalendarDefinitionTest >> testIsAugust [

	self assert: (JulianCalendar isAugust: JulianAugust)
]

{ #category : #'test month testing' }
JulianCalendarDefinitionTest >> testIsDecember [

	self assert: (JulianCalendar isDecember: JulianDecember)
]

{ #category : #'test month testing' }
JulianCalendarDefinitionTest >> testIsFebruary [

	self assert: (JulianCalendar isFebruary: JulianFebruary)
]

{ #category : #'test year testing' }
JulianCalendarDefinitionTest >> testIsFirstMonthOfYear [

	self assert: (JulianCalendar isFirstMonthOfYear: JulianJanuary).
	self deny: (JulianCalendar isFirstMonthOfYear: JulianMay).
	self deny: (JulianCalendar isFirstMonthOfYear: JulianDecember)
]

{ #category : #'test day testing' }
JulianCalendarDefinitionTest >> testIsFriday [

	self assert: (JulianCalendar isFriday: JulianFriday)
]

{ #category : #'test month testing' }
JulianCalendarDefinitionTest >> testIsJanuary [

	self assert: (JulianCalendar isJanuary: JulianJanuary)
]

{ #category : #'test month testing' }
JulianCalendarDefinitionTest >> testIsJuly [

	self assert: (JulianCalendar isJuly: JulianJuly)
]

{ #category : #'test month testing' }
JulianCalendarDefinitionTest >> testIsJune [

	self assert: (JulianCalendar isJune: JulianJune)
]

{ #category : #'test month testing' }
JulianCalendarDefinitionTest >> testIsMarch [

	self assert: (JulianCalendar isMarch: JulianMarch)
]

{ #category : #'test month testing' }
JulianCalendarDefinitionTest >> testIsMay [

	self assert: (JulianCalendar isMay: JulianMay)
]

{ #category : #'test day testing' }
JulianCalendarDefinitionTest >> testIsMonday [

	self assert: (JulianCalendar isMonday: JulianMonday)
]

{ #category : #'test month testing' }
JulianCalendarDefinitionTest >> testIsNovember [

	self assert: (JulianCalendar isNovember: JulianNovember)
]

{ #category : #'test month testing' }
JulianCalendarDefinitionTest >> testIsOctober [

	self assert: (JulianCalendar isOctober: JulianOctober)
]

{ #category : #'test day testing' }
JulianCalendarDefinitionTest >> testIsSaturday [

	self assert: (JulianCalendar isSaturday: JulianSaturday)
]

{ #category : #'test month testing' }
JulianCalendarDefinitionTest >> testIsSeptember [

	self assert: (JulianCalendar isSeptember: JulianSeptember)
]

{ #category : #'test day testing' }
JulianCalendarDefinitionTest >> testIsSunday [

	self assert: (JulianCalendar isSunday: JulianSunday)
]

{ #category : #'test day testing' }
JulianCalendarDefinitionTest >> testIsThursday [

	self assert: (JulianCalendar isThursday: JulianThursday)
]

{ #category : #'test day testing' }
JulianCalendarDefinitionTest >> testIsTuesday [

	self assert: (JulianCalendar isTuesday: JulianTuesday)
]

{ #category : #'test day testing' }
JulianCalendarDefinitionTest >> testIsWednesday [

	self assert: (JulianCalendar isWednesday: JulianWednesday)
]

{ #category : #'test year testing' }
JulianCalendarDefinitionTest >> testIsYearNumberLeap [

	self
		assert: (JulianCalendar isYearNumberLeap: -1);
		assert: (JulianCalendar isYearNumberLeap: 1900);
		assert: (JulianCalendar isYearNumberLeap: 1904);
		assert: (JulianCalendar isYearNumberLeap: 1908);
		assert: (JulianCalendar isYearNumberLeap: 1992);
		assert: (JulianCalendar isYearNumberLeap: 2000);
		assert: (JulianCalendar isYearNumberLeap: 2004);
		assert: (JulianCalendar isYearNumberLeap: 2100).

	self
		deny: (JulianCalendar isYearNumberLeap: -4);
		deny: (JulianCalendar isYearNumberLeap: 1915);
		deny: (JulianCalendar isYearNumberLeap: 1991);
		deny: (JulianCalendar isYearNumberLeap: 2007)
]

{ #category : #'test months accessing' }
JulianCalendarDefinitionTest >> testJanuary [

	self assert: JulianCalendar january = JulianJanuary
]

{ #category : #'test month names' }
JulianCalendarDefinitionTest >> testJanuaryName [

	self assert: JulianCalendar januaryName = 'January'
]

{ #category : #'test month numbers' }
JulianCalendarDefinitionTest >> testJanuaryNumber [

	self assert: JulianCalendar januaryNumber = 1
]

{ #category : #'test months accessing' }
JulianCalendarDefinitionTest >> testJuly [

	self assert: JulianCalendar july = JulianJuly
]

{ #category : #'test month names' }
JulianCalendarDefinitionTest >> testJulyName [

	self assert: JulianCalendar julyName = 'July'
]

{ #category : #'test month numbers' }
JulianCalendarDefinitionTest >> testJulyNumber [

	self assert: JulianCalendar julyNumber = 7
]

{ #category : #'test months accessing' }
JulianCalendarDefinitionTest >> testJune [

	self assert: JulianCalendar june = JulianJune
]

{ #category : #'test month names' }
JulianCalendarDefinitionTest >> testJuneName [

	self assert: JulianCalendar juneName = 'June'
]

{ #category : #'test month numbers' }
JulianCalendarDefinitionTest >> testJuneNumber [

	self assert: JulianCalendar juneNumber = 6
]

{ #category : #'test months accessing' }
JulianCalendarDefinitionTest >> testLastMonth [

	self assert: JulianCalendar lastMonth = JulianDecember
]

{ #category : #'test month of year accessing' }
JulianCalendarDefinitionTest >> testLastMonthOf [
	| year |
	year := 2007 asJulianYear.
	self assert: (JulianCalendar lastMonthOf: year) = (JulianDecember , 2007)
]

{ #category : #'test months accessing' }
JulianCalendarDefinitionTest >> testMarch [

	self assert: JulianCalendar march = JulianMarch
]

{ #category : #'test month names' }
JulianCalendarDefinitionTest >> testMarchName [

	self assert: JulianCalendar marchName = 'March'
]

{ #category : #'test month numbers' }
JulianCalendarDefinitionTest >> testMarchNumber [

	self assert: JulianCalendar marchNumber = 3
]

{ #category : #'test days accessing' }
JulianCalendarDefinitionTest >> testMaximumNumberOfDaysInOneYear [

	self assert: JulianCalendar maximumNumberOfDaysInOneYear = 366 daysMeasure
]

{ #category : #'test months accessing' }
JulianCalendarDefinitionTest >> testMay [

	self assert: JulianCalendar may = JulianMay
]

{ #category : #'test month names' }
JulianCalendarDefinitionTest >> testMayName [

	self assert: JulianCalendar mayName = 'May'
]

{ #category : #'test month numbers' }
JulianCalendarDefinitionTest >> testMayNumber [

	self assert: JulianCalendar mayNumber = 5
]

{ #category : #'test days accessing' }
JulianCalendarDefinitionTest >> testMonday [

	self assert: JulianCalendar monday = JulianMonday
]

{ #category : #'test day names' }
JulianCalendarDefinitionTest >> testMondayName [

	self assert: JulianCalendar mondayName = 'Monday'
]

{ #category : #'test day positions in week' }
JulianCalendarDefinitionTest >> testMondayPositionInWeek [

	self assert: JulianCalendar mondayPositionInWeek = 2
]

{ #category : #'test months accessing' }
JulianCalendarDefinitionTest >> testMonthNamed [

	self
		assert: (JulianCalendar monthNamed: 'January') = JulianJanuary;
		assert: (JulianCalendar monthNamed: 'February') = JulianFebruary;
		assert: (JulianCalendar monthNamed: 'March') = JulianMarch;
		assert: (JulianCalendar monthNamed: 'April') = JulianApril;
		assert: (JulianCalendar monthNamed: 'May') = JulianMay;
		assert: (JulianCalendar monthNamed: 'June') = JulianJune;
		assert: (JulianCalendar monthNamed: 'July') = JulianJuly;
		assert: (JulianCalendar monthNamed: 'August') = JulianAugust;
		assert: (JulianCalendar monthNamed: 'September') = JulianSeptember;
		assert: (JulianCalendar monthNamed: 'October') = JulianOctober;
		assert: (JulianCalendar monthNamed: 'November') = JulianNovember;
		assert: (JulianCalendar monthNamed: 'December') = JulianDecember.
		
	self
		should: [ GregorianCalendar monthNamed: 'invalid name' ]
		raise: InvalidMonthNameException
		withExceptionDo: [ :ex | self assert: ex description = 'invalid name is an invalid name for a month' ]
]

{ #category : #'test months accessing' }
JulianCalendarDefinitionTest >> testMonthNumbered [

	self
		assert: (JulianCalendar monthNumbered: 1) = JulianJanuary;
		assert: (JulianCalendar monthNumbered: 2) = JulianFebruary;
		assert: (JulianCalendar monthNumbered: 3) = JulianMarch;
		assert: (JulianCalendar monthNumbered: 4) = JulianApril;
		assert: (JulianCalendar monthNumbered: 5) = JulianMay;
		assert: (JulianCalendar monthNumbered: 6) = JulianJune;
		assert: (JulianCalendar monthNumbered: 7) = JulianJuly;
		assert: (JulianCalendar monthNumbered: 8) = JulianAugust;
		assert: (JulianCalendar monthNumbered: 9) = JulianSeptember;
		assert: (JulianCalendar monthNumbered: 10) = JulianOctober;
		assert: (JulianCalendar monthNumbered: 11) = JulianNovember;
		assert: (JulianCalendar monthNumbered: 12) = JulianDecember
]

{ #category : #'test months accessing' }
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
	
	self assert: JulianCalendar monthsForLeapYears = months
]

{ #category : #'test months accessing' }
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
	
	self assert: JulianCalendar monthsForNonleapYears = months
]

{ #category : #'test global variables' }
JulianCalendarDefinitionTest >> testMonthsGlobalVariables [

	self
		assert: JulianJanuary = JulianCalendar january;
		assert: JulianFebruary = JulianCalendar february;
		assert: JulianMarch = JulianCalendar march;
		assert: JulianApril = JulianCalendar april;
		assert: JulianMay = JulianCalendar may;
		assert: JulianJune = JulianCalendar june;
		assert: JulianJuly = JulianCalendar july;
		assert: JulianAugust = JulianCalendar august;
		assert: JulianSeptember = JulianCalendar september;
		assert: JulianOctober = JulianCalendar october;
		assert: JulianNovember = JulianCalendar november;
		assert: JulianDecember = JulianCalendar december
]

{ #category : #'test months accessing' }
JulianCalendarDefinitionTest >> testNovember [

	self assert: JulianCalendar november = JulianNovember
]

{ #category : #'test month names' }
JulianCalendarDefinitionTest >> testNovemberName [

	self assert: JulianCalendar novemberName = 'November'
]

{ #category : #'test month numbers' }
JulianCalendarDefinitionTest >> testNovemberNumber [

	self assert: JulianCalendar novemberNumber = 11
]

{ #category : #'test dates accessing' }
JulianCalendarDefinitionTest >> testNow [
	| now nowInTwoSeconds |
	now := JulianCalendar now.
	(Delay forSeconds: 1) wait.
	nowInTwoSeconds := JulianCalendar now.
	self assert: now < nowInTwoSeconds.
	self assert: ((now distanceTo: nowInTwoSeconds) convertTo: TimeUnits second) truncated = 1 secondMeasure
]

{ #category : #'test days accessing' }
JulianCalendarDefinitionTest >> testNumberOfDaysIn [

	self assert: (JulianCalendar numberOfDaysIn: 2014 asJulianYear) = 365 daysMeasure
]

{ #category : #'test days accessing' }
JulianCalendarDefinitionTest >> testNumberOfDaysPerWeek [
	self assert: JulianCalendar numberOfDaysPerWeek = 7 daysMeasure
]

{ #category : #'test months accessing' }
JulianCalendarDefinitionTest >> testNumberOfMonthsPerYear [
	self assert: JulianCalendar numberOfMonthsPerYear = 12 julianMonths
]

{ #category : #'test months accessing' }
JulianCalendarDefinitionTest >> testOctober [

	self assert: JulianCalendar october = JulianOctober
]

{ #category : #'test month names' }
JulianCalendarDefinitionTest >> testOctoberName [

	self assert: JulianCalendar octoberName = 'October'
]

{ #category : #'test month numbers' }
JulianCalendarDefinitionTest >> testOctoberNumber [

	self assert: JulianCalendar octoberNumber = 10
]

{ #category : #'test printing' }
JulianCalendarDefinitionTest >> testPrintString [

	self assert: JulianCalendar printString  = 'Julian Calendar'
]

{ #category : #'test days accessing' }
JulianCalendarDefinitionTest >> testSaturday [

	self assert: JulianCalendar saturday = JulianSaturday
]

{ #category : #'test day names' }
JulianCalendarDefinitionTest >> testSaturdayName [

	self assert: JulianCalendar saturdayName = 'Saturday'
]

{ #category : #'test day positions in week' }
JulianCalendarDefinitionTest >> testSaturdayPositionInWeek [

	self assert: JulianCalendar saturdayPositionInWeek = 7
]

{ #category : #'test months accessing' }
JulianCalendarDefinitionTest >> testSeptember [

	self assert: JulianCalendar september = JulianSeptember
]

{ #category : #'test month names' }
JulianCalendarDefinitionTest >> testSeptemberName [

	self assert: JulianCalendar septemberName = 'September'
]

{ #category : #'test month numbers' }
JulianCalendarDefinitionTest >> testSeptemberNumber [

	self assert: JulianCalendar septemberNumber = 9
]

{ #category : #'test days accessing' }
JulianCalendarDefinitionTest >> testSinceFirstDayOfWeek [
	| currentDay zeroDays |
	zeroDays := 0 daysMeasure.
	currentDay := JulianCalendar sunday.
	(zeroDays to: 6 daysMeasure)
		do: [ :numberOfDays | 
			self assert: (JulianCalendar sinceFirstDayOfWeek: numberOfDays) = currentDay.
			currentDay := currentDay next ]
]

{ #category : #'test days accessing' }
JulianCalendarDefinitionTest >> testSinceSunday [
	| currentDay zeroDays |
	zeroDays := 0 daysMeasure.
	currentDay := JulianCalendar sunday.
	(zeroDays to: 6 daysMeasure)
		do: [ :numberOfDays | 
			self assert: (JulianCalendar sinceSunday: numberOfDays) = currentDay.
			currentDay := currentDay next ]
]

{ #category : #'test days accessing' }
JulianCalendarDefinitionTest >> testSunday [

	self assert: JulianCalendar sunday = JulianSunday
]

{ #category : #'test day names' }
JulianCalendarDefinitionTest >> testSundayName [

	self assert: JulianCalendar sundayName = 'Sunday'
]

{ #category : #'test day positions in week' }
JulianCalendarDefinitionTest >> testSundayPositionInWeek [

	self assert: JulianCalendar sundayPositionInWeek = 1
]

{ #category : #'test days accessing' }
JulianCalendarDefinitionTest >> testThursday [

	self assert: JulianCalendar thursday = JulianThursday
]

{ #category : #'test day names' }
JulianCalendarDefinitionTest >> testThursdayName [

	self assert: JulianCalendar thursdayName = 'Thursday'
]

{ #category : #'test day positions in week' }
JulianCalendarDefinitionTest >> testThursdayPositionInWeek [

	self assert: JulianCalendar thursdayPositionInWeek = 5
]

{ #category : #'test dates accessing' }
JulianCalendarDefinitionTest >> testToday [
	| smalltalkToday gregorianToday |
	smalltalkToday := Date today.
	gregorianToday := FixedDate 
				yearNumber: smalltalkToday year
				monthNumber: smalltalkToday monthIndex
				dayNumber: smalltalkToday dayOfMonth
				calendar: GregorianCalendar.
	self assert: JulianCalendar today 
				= (JulianCalendar convertToJulianDate: gregorianToday)
]

{ #category : #'test dates accessing' }
JulianCalendarDefinitionTest >> testTomorrow [
	| smalltalkToday gregorianToday |
	smalltalkToday := Date today.
	gregorianToday := FixedDate 
				yearNumber: smalltalkToday year
				monthNumber: smalltalkToday monthIndex
				dayNumber: smalltalkToday dayOfMonth
				calendar: GregorianCalendar.
	self assert: JulianCalendar tomorrow 
				= (JulianCalendar convertToJulianDate: gregorianToday) next
]

{ #category : #'test days accessing' }
JulianCalendarDefinitionTest >> testTuesday [

	self assert: JulianCalendar tuesday = JulianTuesday
]

{ #category : #'test day names' }
JulianCalendarDefinitionTest >> testTuesdayName [

	self assert: JulianCalendar tuesdayName = 'Tuesday'
]

{ #category : #'test day positions in week' }
JulianCalendarDefinitionTest >> testTuesdayPositionInWeek [

	self assert: JulianCalendar tuesdayPositionInWeek = 3
]

{ #category : #'test days accessing' }
JulianCalendarDefinitionTest >> testWednesday [

	self assert: JulianCalendar wednesday = JulianWednesday
]

{ #category : #'test day names' }
JulianCalendarDefinitionTest >> testWednesdayName [

	self assert: JulianCalendar wednesdayName = 'Wednesday'
]

{ #category : #'test day positions in week' }
JulianCalendarDefinitionTest >> testWednesdayPositionInWeek [

	self assert: JulianCalendar wednesdayPositionInWeek = 4
]

{ #category : #'test year accessing' }
JulianCalendarDefinitionTest >> testYearNumberFromFixed [

	self assert: (JulianCalendar yearNumberFromFixed: 1) = 1.
	self assert: (JulianCalendar yearNumberFromFixed: 36) = 1.
	self assert: (JulianCalendar yearNumberFromFixed: 360) = 1.
	self assert: (JulianCalendar yearNumberFromFixed: 365) = 2.
	self assert: (JulianCalendar yearNumberFromFixed: 366) = 2.
	self assert: (JulianCalendar yearNumberFromFixed: 370) = 2.
	self assert: (JulianCalendar yearNumberFromFixed: 730) = 3.
	self assert: (JulianCalendar yearNumberFromFixed: 731) = 3.
	self assert: (JulianCalendar yearNumberFromFixed: 1095) = 4.
	self assert: (JulianCalendar yearNumberFromFixed: 1096) = 4.
	self assert: (JulianCalendar yearNumberFromFixed: 1461) = 5
]

{ #category : #'test dates accessing' }
JulianCalendarDefinitionTest >> testYesterday [
	| smalltalkToday gregorianToday |
	smalltalkToday := Date today.
	gregorianToday := FixedDate 
				yearNumber: smalltalkToday year
				monthNumber: smalltalkToday monthIndex
				dayNumber: smalltalkToday dayOfMonth
				calendar: GregorianCalendar.
	self assert: JulianCalendar yesterday 
				= (JulianCalendar convertToJulianDate: gregorianToday) previous
]
