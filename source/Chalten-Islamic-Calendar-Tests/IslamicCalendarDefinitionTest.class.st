Class {
	#name : 'IslamicCalendarDefinitionTest',
	#superclass : 'TestCase',
	#instVars : [
		'months',
		'calendar'
	],
	#category : 'Chalten-Islamic-Calendar-Tests',
	#package : 'Chalten-Islamic-Calendar-Tests'
}

{ #category : 'running' }
IslamicCalendarDefinitionTest >> setUp [

	calendar := ChaltenEnvironment calendarNamed: #IslamicCalendar.
	months := (Array new: 12)
		          at: 1 put: Muharram;
		          at: 2 put: Safar;
		          at: 3 put: RabiI;
		          at: 4 put: RabiII;
		          at: 5 put: JumadaI;
		          at: 6 put: JumadaII;
		          at: 7 put: Rajab;
		          at: 8 put: Shaban;
		          at: 9 put: Ramadan;
		          at: 10 put: Shawwal;
		          at: 11 put: DhuAlQada;
		          at: 12 put: DhuAlHijja;
		          yourself
]

{ #category : 'test days accessing' }
IslamicCalendarDefinitionTest >> testAmountOfDaysPerWeek [

	self assert: calendar amountOfDaysPerWeek equals: 7
]

{ #category : 'test months accessing' }
IslamicCalendarDefinitionTest >> testAmountOfMonthsInLeapYears [

	self assert: calendar amountOfMonthsInLeapYears equals: 12
]

{ #category : 'test months accessing' }
IslamicCalendarDefinitionTest >> testAmountOfMonthsInNonleapYears [

	self assert: calendar amountOfMonthsInNonleapYears equals: 12
]

{ #category : 'test months accessing' }
IslamicCalendarDefinitionTest >> testAmountOfMonthsPerYear [

	self assert: calendar amountOfMonthsPerYear equals: 12
]

{ #category : 'test converting' }
IslamicCalendarDefinitionTest >> testConvert [

	self
		assert: (calendar convert: January fourteenth , 2005)
		equals: DhuAlHijja third , 1425.
	self
		assert: (calendar convert: March fourteenth , 2005)
		equals: Safar third , 1426.
	self
		assert: (calendar convert: September eighteenth , 1999)
		equals: JumadaII seventh , 1420.
	self
		assert: (calendar convert: October twentyfifth , 2008)
		equals: Shawwal twentyfourth , 1429.
	self
		assert: (calendar convert: December fifteenth , 2015)
		equals: RabiI third , 1437.
	self
		assert:
		(calendar convert: (January fourteenth , 2005 at: TimeOfDay noon))
		equals: (DhuAlHijja third , 1425 at: TimeOfDay noon).
	self
		assert:
		(calendar convert: (March fourteenth , 2005 at: TimeOfDay noon))
		equals: (Safar third , 1426 at: TimeOfDay noon).
	self
		assert:
		(calendar convert: (September eighteenth , 1999 at: TimeOfDay noon))
		equals: (JumadaII seventh , 1420 at: TimeOfDay noon).
	self
		assert:
		(calendar convert: (October twentyfifth , 2008 at: TimeOfDay noon))
		equals: (Shawwal twentyfourth , 1429 at: TimeOfDay noon).
	self
		assert:
		(calendar convert: (December fifteenth , 2015 at: TimeOfDay noon))
		equals: (RabiI third , 1437 at: TimeOfDay noon).

	self
		should: [ calendar convert: 1 ]
		raise: Error
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals: 'Error: 1 can`t be converted to Date nor DateTime' ]
]

{ #category : 'test converting' }
IslamicCalendarDefinitionTest >> testConvertToSmalltalkDate [

	| islamicDate smalltalkDate |
	islamicDate := Safar twentyfirst , 1430.
	smalltalkDate := Date newDay: 17 monthNumber: 2 year: 2009.
	self
		assert: (calendar convertToSmalltalkDate: islamicDate)
		equals: smalltalkDate
]

{ #category : 'test dates accessing' }
IslamicCalendarDefinitionTest >> testCurrentDayOfMonth [

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
		equals: (calendar convertToIslamicDate: gregorianToday) dayOfMonth
]

{ #category : 'test dates accessing' }
IslamicCalendarDefinitionTest >> testCurrentMonth [

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
		equals: (calendar convertToIslamicDate: gregorianToday) month
]

{ #category : 'test dates accessing' }
IslamicCalendarDefinitionTest >> testCurrentMonthOfYear [

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
		equals: (calendar convertToIslamicDate: gregorianToday) monthOfYear
]

{ #category : 'test dates accessing' }
IslamicCalendarDefinitionTest >> testCurrentYear [

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
		equals: (calendar convertToIslamicDate: gregorianToday) year
]

{ #category : 'test dates accessing' }
IslamicCalendarDefinitionTest >> testDateFromFixed [

	| muharramThirdOf1 muharramSeventhOf1 muharramThirdOf2 rabiISecondOf4 muharramThirdOf5 |
	muharramThirdOf1 := Muharram third , 1.
	muharramSeventhOf1 := Muharram seventh , 1.
	muharramThirdOf2 := Muharram third , 2.
	rabiISecondOf4 := RabiI second , 4.
	muharramThirdOf5 := Muharram third , 5.
	self
		assert: (calendar dateFromNumberOfDays: 227017)
		equals: muharramThirdOf1.
	self
		assert: (calendar dateFromNumberOfDays: 227021)
		equals: muharramSeventhOf1.
	self
		assert: (calendar dateFromNumberOfDays: 227371)
		equals: muharramThirdOf2.
	self
		assert: (calendar dateFromNumberOfDays: 228138)
		equals: rabiISecondOf4.
	self
		assert: (calendar dateFromNumberOfDays: 228434)
		equals: muharramThirdOf5
]

{ #category : 'test days accessing' }
IslamicCalendarDefinitionTest >> testDayNamed [

	self
		assert: (calendar dayNamed: 'yaum al-ahad') equals: YaumAlAhad;
		assert: (calendar dayNamed: 'yaum al-ithnayna')
		equals: YaumAlIthnayna;
		assert: (calendar dayNamed: 'yaum ath-thalatha')
		equals: YaumAthThalatha;
		assert: (calendar dayNamed: 'yaum al-arba`a`') equals: YaumAlArbaa;
		assert: (calendar dayNamed: 'yaum al-hamis') equals: YaumAlHamis;
		assert: (calendar dayNamed: 'yaum al-jum`a') equals: YaumAlJuma;
		assert: (calendar dayNamed: 'yaum as-sabt') equals: YaumAsSabt
]

{ #category : 'test days accessing' }
IslamicCalendarDefinitionTest >> testDayOf [

	self
		assert: (calendar dayOf: Muharram twentysecond , 1435)
		equals: YaumAthThalatha
]

{ #category : 'test days accessing' }
IslamicCalendarDefinitionTest >> testDayPositionedInWeek [

	self
		assert: (calendar dayPositionedInWeek: 1) equals: YaumAlAhad;
		assert: (calendar dayPositionedInWeek: 2) equals: YaumAlIthnayna;
		assert: (calendar dayPositionedInWeek: 3) equals: YaumAthThalatha;
		assert: (calendar dayPositionedInWeek: 4) equals: YaumAlArbaa;
		assert: (calendar dayPositionedInWeek: 5) equals: YaumAlHamis;
		assert: (calendar dayPositionedInWeek: 6) equals: YaumAlJuma;
		assert: (calendar dayPositionedInWeek: 7) equals: YaumAsSabt
]

{ #category : 'test days accessing' }
IslamicCalendarDefinitionTest >> testDaysFromEpochTo [

	| muharramFirstOf0 muharramFirstOf1 muharramSecondOf1 muharramFifteenthOf1 muharramFirstOf2 muharramFirstOf5 |
	muharramFirstOf0 := Muharram first , 0.
	muharramFirstOf1 := Muharram first , 1.
	muharramSecondOf1 := Muharram second , 1.
	muharramFifteenthOf1 := Muharram fifteenth , 1.
	muharramFirstOf2 := Muharram first , 2.
	muharramFirstOf5 := Muharram first , 5.
	self
		assert: (calendar numberOfDaysFromEpochTo: muharramFirstOf0)
		equals: 226660 daysMeasure.
	self
		assert: (calendar numberOfDaysFromEpochTo: muharramFirstOf1)
		equals: 227014 daysMeasure.
	self
		assert: (calendar numberOfDaysFromEpochTo: muharramSecondOf1)
		equals: 227015 daysMeasure.
	self
		assert: (calendar numberOfDaysFromEpochTo: muharramFifteenthOf1)
		equals: 227028 daysMeasure.
	self
		assert: (calendar numberOfDaysFromEpochTo: muharramFirstOf2)
		equals: 227368 daysMeasure.
	self
		assert: (calendar numberOfDaysFromEpochTo: muharramFirstOf5)
		equals: 228431 daysMeasure
]

{ #category : 'test global variables' }
IslamicCalendarDefinitionTest >> testDaysGlobalVariables [

	self
		assert: YaumAlAhad equals: calendar yaumAlAhad;
		assert: YaumAlIthnayna equals: calendar yaumAlIthnayna;
		assert: YaumAthThalatha equals: calendar yaumAthThalatha;
		assert: YaumAlArbaa equals: calendar yaumAlArbaa;
		assert: YaumAlHamis equals: calendar yaumAlHamis;
		assert: YaumAlJuma equals: calendar yaumAlJuma;
		assert: YaumAsSabt equals: calendar yaumAsSabt
]

{ #category : 'test months accessing' }
IslamicCalendarDefinitionTest >> testDhuAlHijja [

	self assert: calendar dhuAlHijja equals: DhuAlHijja
]

{ #category : 'test month names' }
IslamicCalendarDefinitionTest >> testDhuAlHijjaName [

	self assert: calendar dhuAlHijjaName equals: 'Dhu al-Hijja'
]

{ #category : 'test month numbers' }
IslamicCalendarDefinitionTest >> testDhuAlHijjaNumber [

	self assert: calendar dhuAlHijjaNumber equals: 12
]

{ #category : 'test months accessing' }
IslamicCalendarDefinitionTest >> testDhuAlQada [

	self assert: calendar dhuAlQada equals: DhuAlQada
]

{ #category : 'test month names' }
IslamicCalendarDefinitionTest >> testDhuAlQadaName [

	self assert: calendar dhuAlQadaName equals: 'Dhu al-Qa`da'
]

{ #category : 'test month numbers' }
IslamicCalendarDefinitionTest >> testDhuAlQadaNumber [

	self assert: calendar dhuAlQadaNumber equals: 11
]

{ #category : 'test year querying' }
IslamicCalendarDefinitionTest >> testDistanceInYearsFromTo [

	self
		assert: (calendar
				 distanceInYearsFrom: 1435 asIslamicYear
				 to: 1437 asIslamicYear)
		equals: 2 yearsMeasure
]

{ #category : 'test accessing' }
IslamicCalendarDefinitionTest >> testEpoch [

	self assert: calendar epoch equals: 227015
]

{ #category : 'test months accessing' }
IslamicCalendarDefinitionTest >> testFirstMonth [

	self assert: calendar firstMonth equals: Muharram
]

{ #category : 'test month of year accessing' }
IslamicCalendarDefinitionTest >> testFirstMonthOf [

	| year |
	year := 1428 asIslamicYear.
	self assert: (calendar firstMonthOf: year) equals: Muharram , 1428
]

{ #category : 'test dates accessing' }
IslamicCalendarDefinitionTest >> testFixedFromDate [

	| muharramFirstOf1 dhuAlQadaTwelveOf1945 |
	muharramFirstOf1 := Muharram first , 1.
	dhuAlQadaTwelveOf1945 := DhuAlQada twelfth , 1945.
	self
		assert: (calendar numberOfDaysFromDate: muharramFirstOf1)
		equals: 227015;
		assert: (calendar numberOfDaysFromDate: dhuAlQadaTwelveOf1945)
		equals: 916210
]

{ #category : 'test month testing' }
IslamicCalendarDefinitionTest >> testIsDhuAlHijja [

	self assert: (calendar isDhuAlHijja: DhuAlHijja)
]

{ #category : 'test month testing' }
IslamicCalendarDefinitionTest >> testIsDhuAlQada [

	self assert: (calendar isDhuAlQada: DhuAlQada)
]

{ #category : 'test year testing' }
IslamicCalendarDefinitionTest >> testIsFirstMonthOfYear [

	self assert: (calendar isFirstMonthOfYear: Muharram).
	self deny: (calendar isFirstMonthOfYear: Ramadan).
	self deny: (calendar isFirstMonthOfYear: DhuAlHijja)
]

{ #category : 'test month testing' }
IslamicCalendarDefinitionTest >> testIsJumadaI [

	self assert: (calendar isJumadaI: JumadaI)
]

{ #category : 'test month testing' }
IslamicCalendarDefinitionTest >> testIsJumadaII [

	self assert: (calendar isJumadaII: JumadaII)
]

{ #category : 'test month testing' }
IslamicCalendarDefinitionTest >> testIsMuharram [

	self assert: (calendar isMuharram: Muharram)
]

{ #category : 'test month testing' }
IslamicCalendarDefinitionTest >> testIsRabiI [

	self assert: (calendar isRabiI: RabiI)
]

{ #category : 'test month testing' }
IslamicCalendarDefinitionTest >> testIsRabiII [

	self assert: (calendar isRabiII: RabiII)
]

{ #category : 'test month testing' }
IslamicCalendarDefinitionTest >> testIsRajab [

	self assert: (calendar isRajab: Rajab)
]

{ #category : 'test month testing' }
IslamicCalendarDefinitionTest >> testIsRamadan [

	self assert: (calendar isRamadan: Ramadan)
]

{ #category : 'test month testing' }
IslamicCalendarDefinitionTest >> testIsSafar [

	self assert: (calendar isSafar: Safar)
]

{ #category : 'test month testing' }
IslamicCalendarDefinitionTest >> testIsShaban [

	self assert: (calendar isShaban: Shaban)
]

{ #category : 'test month testing' }
IslamicCalendarDefinitionTest >> testIsShawwal [

	self assert: (calendar isShawwal: Shawwal)
]

{ #category : 'test day testing' }
IslamicCalendarDefinitionTest >> testIsYaumAlAhad [

	self assert: (calendar isYaumAlAhad: YaumAlAhad)
]

{ #category : 'test day testing' }
IslamicCalendarDefinitionTest >> testIsYaumAlArbaa [

	self assert: (calendar isYaumAlArbaa: YaumAlArbaa)
]

{ #category : 'test day testing' }
IslamicCalendarDefinitionTest >> testIsYaumAlHamis [

	self assert: (calendar isYaumAlHamis: YaumAlHamis)
]

{ #category : 'test day testing' }
IslamicCalendarDefinitionTest >> testIsYaumAlIthnayna [

	self assert: (calendar isYaumAlIthnayna: YaumAlIthnayna)
]

{ #category : 'test day testing' }
IslamicCalendarDefinitionTest >> testIsYaumAlJuma [

	self assert: (calendar isYaumAlJuma: YaumAlJuma)
]

{ #category : 'test day testing' }
IslamicCalendarDefinitionTest >> testIsYaumAsSabt [

	self assert: (calendar isYaumAsSabt: YaumAsSabt)
]

{ #category : 'test day testing' }
IslamicCalendarDefinitionTest >> testIsYaumAthThalatha [

	self assert: (calendar isYaumAthThalatha: YaumAthThalatha)
]

{ #category : 'test year testing' }
IslamicCalendarDefinitionTest >> testIsYearNumberLeap [

	self
		assert: (calendar isYearNumberLeap: -4);
		assert: (calendar isYearNumberLeap: 2);
		assert: (calendar isYearNumberLeap: 5);
		assert: (calendar isYearNumberLeap: 7);
		assert: (calendar isYearNumberLeap: 10);
		assert: (calendar isYearNumberLeap: 13);
		assert: (calendar isYearNumberLeap: 16);
		assert: (calendar isYearNumberLeap: 18);
		assert: (calendar isYearNumberLeap: 21);
		assert: (calendar isYearNumberLeap: 24);
		assert: (calendar isYearNumberLeap: 26);
		assert: (calendar isYearNumberLeap: 29);
		assert: (calendar isYearNumberLeap: 1428).

	self
		deny: (calendar isYearNumberLeap: -3);
		deny: (calendar isYearNumberLeap: 195);
		deny: (calendar isYearNumberLeap: 1400);
		deny: (calendar isYearNumberLeap: 1429)
]

{ #category : 'test months accessing' }
IslamicCalendarDefinitionTest >> testJumadaI [

	self assert: calendar jumadaI equals: JumadaI
]

{ #category : 'test months accessing' }
IslamicCalendarDefinitionTest >> testJumadaII [

	self assert: calendar jumadaII equals: JumadaII
]

{ #category : 'test month names' }
IslamicCalendarDefinitionTest >> testJumadaIIName [

	self
		assert: calendar jumadaIIName
		equals: 'Jumada II (Jumada al-Ahira)'
]

{ #category : 'test month numbers' }
IslamicCalendarDefinitionTest >> testJumadaIINumber [

	self assert: calendar jumadaIINumber equals: 6
]

{ #category : 'test month names' }
IslamicCalendarDefinitionTest >> testJumadaIName [

	self assert: calendar jumadaIName equals: 'Jumada I (Jumada al-Ula)'
]

{ #category : 'test month numbers' }
IslamicCalendarDefinitionTest >> testJumadaINumber [

	self assert: calendar jumadaINumber equals: 5
]

{ #category : 'test months accessing' }
IslamicCalendarDefinitionTest >> testLastMonth [

	self assert: calendar lastMonth equals: DhuAlHijja
]

{ #category : 'test month of year accessing' }
IslamicCalendarDefinitionTest >> testLastMonthOf [

	| year |
	year := 1428 asIslamicYear.
	self assert: (calendar lastMonthOf: year) equals: DhuAlHijja , 1428
]

{ #category : 'test days accessing' }
IslamicCalendarDefinitionTest >> testMaximumNumberOfDaysInOneYear [

	self
		assert: calendar maximumNumberOfDaysInOneYear
		equals: 355 daysMeasure
]

{ #category : 'test months accessing' }
IslamicCalendarDefinitionTest >> testMonthNamed [

	self
		assert: (calendar monthNamed: 'Muharram') equals: Muharram;
		assert: (calendar monthNamed: 'Safar') equals: Safar;
		assert: (calendar monthNamed: 'Rabi` I (Rabi` al-Awwal)')
		equals: RabiI;
		assert: (calendar monthNamed: 'Rabi` II (Rabi` al-Ahir)')
		equals: RabiII;
		assert: (calendar monthNamed: 'Jumada I (Jumada al-Ula)')
		equals: JumadaI;
		assert: (calendar monthNamed: 'Jumada II (Jumada al-Ahira)')
		equals: JumadaII;
		assert: (calendar monthNamed: 'Rajab') equals: Rajab;
		assert: (calendar monthNamed: 'Sha`ban') equals: Shaban;
		assert: (calendar monthNamed: 'Ramadan') equals: Ramadan;
		assert: (calendar monthNamed: 'Shawwal') equals: Shawwal;
		assert: (calendar monthNamed: 'Dhu al-Qa`da') equals: DhuAlQada;
		assert: (calendar monthNamed: 'Dhu al-Hijja') equals: DhuAlHijja.

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
IslamicCalendarDefinitionTest >> testMonthNumbered [

	self
		assert: (calendar monthNumbered: 1) equals: Muharram;
		assert: (calendar monthNumbered: 2) equals: Safar;
		assert: (calendar monthNumbered: 3) equals: RabiI;
		assert: (calendar monthNumbered: 4) equals: RabiII;
		assert: (calendar monthNumbered: 5) equals: JumadaI;
		assert: (calendar monthNumbered: 6) equals: JumadaII;
		assert: (calendar monthNumbered: 7) equals: Rajab;
		assert: (calendar monthNumbered: 8) equals: Shaban;
		assert: (calendar monthNumbered: 9) equals: Ramadan;
		assert: (calendar monthNumbered: 10) equals: Shawwal;
		assert: (calendar monthNumbered: 11) equals: DhuAlQada;
		assert: (calendar monthNumbered: 12) equals: DhuAlHijja
]

{ #category : 'test months accessing' }
IslamicCalendarDefinitionTest >> testMonthsForLeapYears [

	self assert: calendar monthsForLeapYears equals: months
]

{ #category : 'test months accessing' }
IslamicCalendarDefinitionTest >> testMonthsForNonleapYears [

	self assert: calendar monthsForNonleapYears equals: months
]

{ #category : 'test global variables' }
IslamicCalendarDefinitionTest >> testMonthsGlobalVariables [

	self
		assert: Muharram equals: calendar muharram;
		assert: Safar equals: calendar safar;
		assert: RabiI equals: calendar rabiI;
		assert: RabiII equals: calendar rabiII;
		assert: JumadaI equals: calendar jumadaI;
		assert: JumadaII equals: calendar jumadaII;
		assert: Rajab equals: calendar rajab;
		assert: Shaban equals: calendar shaban;
		assert: Ramadan equals: calendar ramadan;
		assert: Shawwal equals: calendar shawwal;
		assert: DhuAlQada equals: calendar dhuAlQada;
		assert: DhuAlHijja equals: calendar dhuAlHijja
]

{ #category : 'test months accessing' }
IslamicCalendarDefinitionTest >> testMuharram [

	self assert: calendar muharram equals: Muharram
]

{ #category : 'test month names' }
IslamicCalendarDefinitionTest >> testMuharramName [

	self assert: calendar muharramName equals: 'Muharram'
]

{ #category : 'test month numbers' }
IslamicCalendarDefinitionTest >> testMuharramNumber [

	self assert: calendar muharramNumber equals: 1
]

{ #category : 'test dates accessing' }
IslamicCalendarDefinitionTest >> testNow [

	| now nowInOneSecond |
	now := calendar now.
	(Delay forSeconds: 1) wait.
	nowInOneSecond := calendar now.
	self assert: now < nowInOneSecond.
	self
		assert:
			((now distanceTo: nowInOneSecond) convertTo: TimeUnits second)
				truncated
		equals: 1 secondMeasure
]

{ #category : 'test days accessing' }
IslamicCalendarDefinitionTest >> testNumberOfDaysIN [

	self
		assert: (calendar numberOfDaysIn: 1435 asIslamicYear)
		equals: 354 daysMeasure
]

{ #category : 'test days accessing' }
IslamicCalendarDefinitionTest >> testNumberOfDaysPerWeek [

	self assert: calendar numberOfDaysPerWeek equals: 7 daysMeasure
]

{ #category : 'test months accessing' }
IslamicCalendarDefinitionTest >> testNumberOfMonthsPerYear [

	self assert: calendar numberOfMonthsPerYear equals: 12 monthsMeasure
]

{ #category : 'test printing' }
IslamicCalendarDefinitionTest >> testPrintString [

	self assert: calendar printString equals: 'Islamic Calendar'
]

{ #category : 'test months accessing' }
IslamicCalendarDefinitionTest >> testRabiI [

	self assert: calendar rabiI equals: RabiI
]

{ #category : 'test months accessing' }
IslamicCalendarDefinitionTest >> testRabiII [

	self assert: calendar rabiII equals: RabiII
]

{ #category : 'test month names' }
IslamicCalendarDefinitionTest >> testRabiIIName [

	self assert: calendar rabiIIName equals: 'Rabi` II (Rabi` al-Ahir)'
]

{ #category : 'test month numbers' }
IslamicCalendarDefinitionTest >> testRabiIINumber [

	self assert: calendar rabiIINumber equals: 4
]

{ #category : 'test month names' }
IslamicCalendarDefinitionTest >> testRabiIName [

	self assert: calendar rabiIName equals: 'Rabi` I (Rabi` al-Awwal)'
]

{ #category : 'test month numbers' }
IslamicCalendarDefinitionTest >> testRabiINumber [

	self assert: calendar rabiINumber equals: 3
]

{ #category : 'test months accessing' }
IslamicCalendarDefinitionTest >> testRajab [

	self assert: calendar rajab equals: Rajab
]

{ #category : 'test month names' }
IslamicCalendarDefinitionTest >> testRajabName [

	self assert: calendar rajabName equals: 'Rajab'
]

{ #category : 'test month numbers' }
IslamicCalendarDefinitionTest >> testRajabNumber [

	self assert: calendar rajabNumber equals: 7
]

{ #category : 'test months accessing' }
IslamicCalendarDefinitionTest >> testRamadan [

	self assert: calendar ramadan equals: Ramadan
]

{ #category : 'test month names' }
IslamicCalendarDefinitionTest >> testRamadanName [

	self assert: calendar ramadanName equals: 'Ramadan'
]

{ #category : 'test month numbers' }
IslamicCalendarDefinitionTest >> testRamadanNumber [

	self assert: calendar ramadanNumber equals: 9
]

{ #category : 'test months accessing' }
IslamicCalendarDefinitionTest >> testSafar [

	self assert: calendar safar equals: Safar
]

{ #category : 'test month names' }
IslamicCalendarDefinitionTest >> testSafarName [

	self assert: calendar safarName equals: 'Safar'
]

{ #category : 'test month numbers' }
IslamicCalendarDefinitionTest >> testSafarNumber [

	self assert: calendar safarNumber equals: 2
]

{ #category : 'test months accessing' }
IslamicCalendarDefinitionTest >> testShaban [

	self assert: calendar shaban equals: Shaban
]

{ #category : 'test month names' }
IslamicCalendarDefinitionTest >> testShabanName [

	self assert: calendar shabanName equals: 'Sha`ban'
]

{ #category : 'test month numbers' }
IslamicCalendarDefinitionTest >> testShabanNumber [

	self assert: calendar shabanNumber equals: 8
]

{ #category : 'test months accessing' }
IslamicCalendarDefinitionTest >> testShawwal [

	self assert: calendar shawwal equals: Shawwal
]

{ #category : 'test month names' }
IslamicCalendarDefinitionTest >> testShawwalName [

	self assert: calendar shawwalName equals: 'Shawwal'
]

{ #category : 'test month numbers' }
IslamicCalendarDefinitionTest >> testShawwalNumber [

	self assert: calendar shawwalNumber equals: 10
]

{ #category : 'test days accessing' }
IslamicCalendarDefinitionTest >> testSinceFirstDayOfWeek [

	| currentDay zeroDays |
	zeroDays := 0 daysMeasure.
	currentDay := calendar yaumAlAhad.
	(zeroDays to: 6 daysMeasure) do: [ :aNumberOfDays |
		self
			assert: (calendar sinceFirstDayOfWeek: aNumberOfDays)
			equals: currentDay.
		currentDay := currentDay next ]
]

{ #category : 'test days accessing' }
IslamicCalendarDefinitionTest >> testSinceYaumAlAhad [

	| currentDay zeroDays |
	zeroDays := 0 daysMeasure.
	currentDay := calendar yaumAlAhad.
	(zeroDays to: 6 daysMeasure) do: [ :aNumberOfDays |
		self
			assert: (calendar sinceYaumAlAhad: aNumberOfDays)
			equals: currentDay.
		currentDay := currentDay next ]
]

{ #category : 'test dates accessing' }
IslamicCalendarDefinitionTest >> testToday [

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
		equals: (calendar convertToIslamicDate: gregorianToday)
]

{ #category : 'test dates accessing' }
IslamicCalendarDefinitionTest >> testTomorrow [

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
		equals: (calendar convertToIslamicDate: gregorianToday) next
]

{ #category : 'test days accessing' }
IslamicCalendarDefinitionTest >> testYaumAlAhad [

	self assert: calendar yaumAlAhad equals: YaumAlAhad
]

{ #category : 'test day names' }
IslamicCalendarDefinitionTest >> testYaumAlAhadName [

	self assert: calendar yaumAlAhadName equals: 'yaum al-ahad'
]

{ #category : 'test day positions in week' }
IslamicCalendarDefinitionTest >> testYaumAlAhadPositionInWeek [

	self assert: calendar yaumAlAhadPositionInWeek equals: 1
]

{ #category : 'test days accessing' }
IslamicCalendarDefinitionTest >> testYaumAlArbaa [

	self assert: calendar yaumAlArbaa equals: YaumAlArbaa
]

{ #category : 'test day names' }
IslamicCalendarDefinitionTest >> testYaumAlArbaaName [

	self assert: calendar yaumAlArbaaName equals: 'yaum al-arba`a`'
]

{ #category : 'test day positions in week' }
IslamicCalendarDefinitionTest >> testYaumAlArbaaPositionInWeek [

	self assert: calendar yaumAlArbaaPositionInWeek equals: 4
]

{ #category : 'test days accessing' }
IslamicCalendarDefinitionTest >> testYaumAlHamis [

	self assert: calendar yaumAlHamis equals: YaumAlHamis
]

{ #category : 'test day names' }
IslamicCalendarDefinitionTest >> testYaumAlHamisName [

	self assert: calendar yaumAlHamisName equals: 'yaum al-hamis'
]

{ #category : 'test day positions in week' }
IslamicCalendarDefinitionTest >> testYaumAlHamisPositionInWeek [

	self assert: calendar yaumAlHamisPositionInWeek equals: 5
]

{ #category : 'test days accessing' }
IslamicCalendarDefinitionTest >> testYaumAlIthnayna [

	self assert: calendar yaumAlIthnayna equals: YaumAlIthnayna
]

{ #category : 'test day names' }
IslamicCalendarDefinitionTest >> testYaumAlIthnaynaName [

	self assert: calendar yaumAlIthnaynaName equals: 'yaum al-ithnayna'
]

{ #category : 'test day positions in week' }
IslamicCalendarDefinitionTest >> testYaumAlIthnaynaPositionInWeek [

	self assert: calendar yaumAlIthnaynaPositionInWeek equals: 2
]

{ #category : 'test days accessing' }
IslamicCalendarDefinitionTest >> testYaumAlJuma [

	self assert: calendar yaumAlJuma equals: YaumAlJuma
]

{ #category : 'test day names' }
IslamicCalendarDefinitionTest >> testYaumAlJumaName [

	self assert: calendar yaumAlJumaName equals: 'yaum al-jum`a'
]

{ #category : 'test day positions in week' }
IslamicCalendarDefinitionTest >> testYaumAlJumaPositionInWeek [

	self assert: calendar yaumAlJumaPositionInWeek equals: 6
]

{ #category : 'test days accessing' }
IslamicCalendarDefinitionTest >> testYaumAsSabt [

	self assert: calendar yaumAsSabt equals: YaumAsSabt
]

{ #category : 'test day names' }
IslamicCalendarDefinitionTest >> testYaumAsSabtName [

	self assert: calendar yaumAsSabtName equals: 'yaum as-sabt'
]

{ #category : 'test day positions in week' }
IslamicCalendarDefinitionTest >> testYaumAsSabtPositionInWeek [

	self assert: calendar yaumAsSabtPositionInWeek equals: 7
]

{ #category : 'test days accessing' }
IslamicCalendarDefinitionTest >> testYaumAtThalatha [

	self assert: calendar yaumAthThalatha equals: YaumAthThalatha
]

{ #category : 'test day names' }
IslamicCalendarDefinitionTest >> testYaumAthThalathaName [

	self assert: calendar yaumAthThalathaName equals: 'yaum ath-thalatha'
]

{ #category : 'test day positions in week' }
IslamicCalendarDefinitionTest >> testYaumAthThalathaPositionInWeek [

	self assert: calendar yaumAthThalathaPositionInWeek equals: 3
]

{ #category : 'test dates accessing' }
IslamicCalendarDefinitionTest >> testYesterday [

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
		equals: (calendar convertToIslamicDate: gregorianToday) previous
]
