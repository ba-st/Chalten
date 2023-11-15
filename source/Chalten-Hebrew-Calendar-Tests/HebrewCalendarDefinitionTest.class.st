Class {
	#name : 'HebrewCalendarDefinitionTest',
	#superclass : 'TestCase',
	#instVars : [
		'calendar'
	],
	#category : 'Chalten-Hebrew-Calendar-Tests',
	#package : 'Chalten-Hebrew-Calendar-Tests'
}

{ #category : 'running' }
HebrewCalendarDefinitionTest >> setUp [ 

	calendar := ChaltenEnvironment calendarNamed: #HebrewCalendar.
]

{ #category : 'test months accessing' }
HebrewCalendarDefinitionTest >> testAdarI [

	self assert: calendar adarI equals: AdarI
]

{ #category : 'test months accessing' }
HebrewCalendarDefinitionTest >> testAdarII [

	self assert: calendar adarII equals: AdarII
]

{ #category : 'test month names' }
HebrewCalendarDefinitionTest >> testAdarIIName [

	self assert: calendar adarIIName equals: 'Adar II'
]

{ #category : 'test month numbers' }
HebrewCalendarDefinitionTest >> testAdarIINumber [

	self assert: calendar adarIINumber equals: 13
]

{ #category : 'test month names' }
HebrewCalendarDefinitionTest >> testAdarIName [

	self assert: calendar adarIName equals: 'Adar I'
]

{ #category : 'test month numbers' }
HebrewCalendarDefinitionTest >> testAdarINumber [

	self assert: calendar adarINumber equals: 12
]

{ #category : 'test month names' }
HebrewCalendarDefinitionTest >> testAdarName [

	self assert: calendar adarName equals: 'Adar'
]

{ #category : 'test month numbers' }
HebrewCalendarDefinitionTest >> testAdarNumber [

	self assert: calendar adarNumber equals: 12
]

{ #category : 'test days accessing' }
HebrewCalendarDefinitionTest >> testAmountOfDaysPerWeek [

	self assert: calendar amountOfDaysPerWeek equals: 7
]

{ #category : 'test year testing' }
HebrewCalendarDefinitionTest >> testAmountOfMonthsInYear [

	self
		assert: (calendar amountOfMonthsInYear: 5767 asHebrewYear)
		equals: 12.
	self
		assert: (calendar amountOfMonthsInYear: 5768 asHebrewYear)
		equals: 13
]

{ #category : 'test months accessing' }
HebrewCalendarDefinitionTest >> testAmountOfMonthsPerYear [

	self assert: calendar amountOfMonthsPerYear equals: 13
]

{ #category : 'test months accessing' }
HebrewCalendarDefinitionTest >> testAv [

	self assert: calendar av equals: Av
]

{ #category : 'test month names' }
HebrewCalendarDefinitionTest >> testAvName [

	self assert: calendar avName equals: 'Av'
]

{ #category : 'test month numbers' }
HebrewCalendarDefinitionTest >> testAvNumber [

	self assert: calendar avNumber equals: 5
]

{ #category : 'test converting' }
HebrewCalendarDefinitionTest >> testConvert [

	self
		assert: (calendar convert: March twentieth , 2007)
		equals: Nisan first , 5767.
	self
		assert: (calendar convert: June fourth , 2008)
		equals: Sivan first , 5768.
	self
		assert: (calendar convert: December second , 2008)
		equals: Kislev fifth , 5769.
	self
		assert: (calendar convert: March tenth , 2006)
		equals: Adar tenth , 5766.
	self
		assert: (calendar convert: February eleventh , 2016)
		equals: AdarI second , 5776.
	self
		assert:
		(calendar convert: (March twentieth , 2007 at: TimeOfDay noon))
		equals: (Nisan first , 5767 at: TimeOfDay noon).
	self
		assert: (calendar convert: (June fourth , 2008 at: TimeOfDay noon))
		equals: (Sivan first , 5768 at: TimeOfDay noon).
	self
		assert:
		(calendar convert: (December second , 2008 at: TimeOfDay noon))
		equals: (Kislev fifth , 5769 at: TimeOfDay noon).
	self
		assert: (calendar convert: (March tenth , 2006 at: TimeOfDay noon))
		equals: (Adar tenth , 5766 at: TimeOfDay noon).
	self
		assert:
		(calendar convert: (February eleventh , 2016 at: TimeOfDay noon))
		equals: (AdarI second , 5776 at: TimeOfDay noon).

	self
		should: [ calendar convert: 1 ]
		raise: Error
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals: 'Error: 1 can`t be converted to Date nor DateTime' ]
]

{ #category : 'test converting' }
HebrewCalendarDefinitionTest >> testConvertToSmalltalkDate [

	| hebrewDate smalltalkDate |
	hebrewDate := Iyyar twentyfirst , 5767.
	smalltalkDate := Date newDay: 9 monthNumber: 5 year: 2007.
	self
		assert: (calendar convertToSmalltalkDate: hebrewDate)
		equals: smalltalkDate
]

{ #category : 'test dates accessing' }
HebrewCalendarDefinitionTest >> testCurrentDayOfMonth [

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
		equals: (calendar convertToHebrewDate: gregorianToday) dayOfMonth
]

{ #category : 'test dates accessing' }
HebrewCalendarDefinitionTest >> testCurrentMonth [

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
		equals: (calendar convertToHebrewDate: gregorianToday) month
]

{ #category : 'test dates accessing' }
HebrewCalendarDefinitionTest >> testCurrentMonthOfYear [

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
		equals: (calendar convertToHebrewDate: gregorianToday) monthOfYear
]

{ #category : 'test dates accessing' }
HebrewCalendarDefinitionTest >> testCurrentYear [

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
		equals: (calendar convertToHebrewDate: gregorianToday) year
]

{ #category : 'test dates accessing' }
HebrewCalendarDefinitionTest >> testDateFromFixed [

	| nisanFirstOf1 tevetTwentiethOf5767 marheshvanTwelfthOf1945 |
	nisanFirstOf1 := Nisan first , 1.
	tevetTwentiethOf5767 := Tevet twentieth , 5767.
	marheshvanTwelfthOf1945 := Marheshvan twelfth , 1945.
	self
		assert: (calendar dateFromNumberOfDays: -1373249)
		equals: nisanFirstOf1.
	self
		assert: (calendar dateFromNumberOfDays: 732686)
		equals: tevetTwentiethOf5767.
	self
		assert: (calendar dateFromNumberOfDays: -663352)
		equals: marheshvanTwelfthOf1945
]

{ #category : 'test days accessing' }
HebrewCalendarDefinitionTest >> testDayNamed [

	self
		assert: (calendar dayNamed: 'yom rishon') equals: YomRishon;
		assert: (calendar dayNamed: 'yom sheni') equals: YomSheni;
		assert: (calendar dayNamed: 'yom shelishi') equals: YomShelishi;
		assert: (calendar dayNamed: 'yom revi`i') equals: YomRevii;
		assert: (calendar dayNamed: 'yom hamishi') equals: YomHamishi;
		assert: (calendar dayNamed: 'yom shishi') equals: YomShishi;
		assert: (calendar dayNamed: 'yom shabbat') equals: YomShabbat
]

{ #category : 'test days accessing' }
HebrewCalendarDefinitionTest >> testDayOf [

	self
		assert: (calendar dayOf: Nisan twentysecond , 5775)
		equals: YomShabbat
]

{ #category : 'test days accessing' }
HebrewCalendarDefinitionTest >> testDayPositionedInWeek [

	self
		assert: (calendar dayPositionedInWeek: 1) equals: YomRishon;
		assert: (calendar dayPositionedInWeek: 2) equals: YomSheni;
		assert: (calendar dayPositionedInWeek: 3) equals: YomShelishi;
		assert: (calendar dayPositionedInWeek: 4) equals: YomRevii;
		assert: (calendar dayPositionedInWeek: 5) equals: YomHamishi;
		assert: (calendar dayPositionedInWeek: 6) equals: YomShishi;
		assert: (calendar dayPositionedInWeek: 7) equals: YomShabbat
]

{ #category : 'test days accessing' }
HebrewCalendarDefinitionTest >> testDaysFromEpochTo [

	| nisanFirstOf0 nisanFirstOf1 nisanSecondOf1 nisanFifteenthOf1 nisanFirstOf2 nisanFirstOf5 nisanFirstOf5767 |
	nisanFirstOf0 := Nisan first , 0.
	nisanFirstOf1 := Nisan first , 1.
	nisanSecondOf1 := Nisan second , 1.
	nisanFifteenthOf1 := Nisan fifteenth , 1.
	nisanFirstOf2 := Nisan first , 2.
	nisanFirstOf5 := Nisan first , 5.
	nisanFirstOf5767 := Nisan first , 5767.
	self
		assert: (calendar numberOfDaysFromEpochTo: nisanFirstOf0)
		equals: -1373605 daysMeasure.
	self
		assert: (calendar numberOfDaysFromEpochTo: nisanFirstOf1)
		equals: -1373250 daysMeasure.
	self
		assert: (calendar numberOfDaysFromEpochTo: nisanSecondOf1)
		equals: -1373249 daysMeasure.
	self
		assert: (calendar numberOfDaysFromEpochTo: nisanFifteenthOf1)
		equals: -1373236 daysMeasure.
	self
		assert: (calendar numberOfDaysFromEpochTo: nisanFirstOf2)
		equals: -1372895 daysMeasure.
	self
		assert: (calendar numberOfDaysFromEpochTo: nisanFirstOf5)
		equals: -1371803 daysMeasure.
	self
		assert: (calendar numberOfDaysFromEpochTo: nisanFirstOf5767)
		equals: 732754 daysMeasure
]

{ #category : 'test global variables' }
HebrewCalendarDefinitionTest >> testDaysGlobalVariables [

	self
		assert: YomRishon equals: calendar yomRishon;
		assert: YomSheni equals: calendar yomSheni;
		assert: YomShelishi equals: calendar yomShelishi;
		assert: YomRevii equals: calendar yomRevii;
		assert: YomHamishi equals: calendar yomHamishi;
		assert: YomShishi equals: calendar yomShishi;
		assert: YomShabbat equals: calendar yomShabbat
]

{ #category : 'test year querying' }
HebrewCalendarDefinitionTest >> testDistanceInYearsFromTo [

	self
		assert:
		(calendar
			 distanceInYearsFrom: 5773 asHebrewYear
			 to: 5775 asHebrewYear)
		equals: 2 yearsMeasure
]

{ #category : 'test months accessing' }
HebrewCalendarDefinitionTest >> testElul [

	self assert: calendar elul equals: Elul
]

{ #category : 'test month names' }
HebrewCalendarDefinitionTest >> testElulName [

	self assert: calendar elulName equals: 'Elul'
]

{ #category : 'test month numbers' }
HebrewCalendarDefinitionTest >> testElulNumber [

	self assert: calendar elulNumber equals: 6
]

{ #category : 'test accessing' }
HebrewCalendarDefinitionTest >> testEpoch [

	self assert: calendar epoch equals: -1373427
]

{ #category : 'test months accessing' }
HebrewCalendarDefinitionTest >> testFirstMonth [

	self assert: calendar firstMonth equals: Tishri
]

{ #category : 'test month of year accessing' }
HebrewCalendarDefinitionTest >> testFirstMonthOf [

	| year |
	year := 5767 asHebrewYear.
	self assert: (calendar firstMonthOf: year) equals: Tishri , 5767.
	year := 5765 asHebrewYear.
	self assert: (calendar firstMonthOf: year) equals: Tishri , 5765
]

{ #category : 'test dates accessing' }
HebrewCalendarDefinitionTest >> testFixedFromDate [

	| nisanFirstOf1 marheshvanIITwelveOf1945 tevetTwentiethOf5767 |
	nisanFirstOf1 := Nisan first , 1.
	marheshvanIITwelveOf1945 := Marheshvan twelfth , 1945.
	tevetTwentiethOf5767 := Tevet twentieth , 5767.
	self
		assert: (calendar numberOfDaysFromDate: nisanFirstOf1)
		equals: -1373249;
		assert: (calendar numberOfDaysFromDate: marheshvanIITwelveOf1945)
		equals: -663352;
		assert: (calendar numberOfDaysFromDate: tevetTwentiethOf5767)
		equals: 732686
]

{ #category : 'test month testing' }
HebrewCalendarDefinitionTest >> testIsAdar [

	self assert: (calendar isAdar: Adar)
]

{ #category : 'test month testing' }
HebrewCalendarDefinitionTest >> testIsAdarI [

	self assert: (calendar isAdarI: AdarI)
]

{ #category : 'test month testing' }
HebrewCalendarDefinitionTest >> testIsAdarII [

	self assert: (calendar isAdarII: AdarII)
]

{ #category : 'test month testing' }
HebrewCalendarDefinitionTest >> testIsAv [

	self assert: (calendar isAv: Av)
]

{ #category : 'test month testing' }
HebrewCalendarDefinitionTest >> testIsElul [

	self assert: (calendar isElul: Elul)
]

{ #category : 'test year testing' }
HebrewCalendarDefinitionTest >> testIsFirstMonthOfYear [

	self assert: (calendar isFirstMonthOfYear: Tishri).
	self deny: (calendar isFirstMonthOfYear: Nisan).
	self deny: (calendar isFirstMonthOfYear: Elul)
]

{ #category : 'test month testing' }
HebrewCalendarDefinitionTest >> testIsIyyar [

	self assert: (calendar isIyyar: Iyyar)
]

{ #category : 'test month testing' }
HebrewCalendarDefinitionTest >> testIsKislev [

	self assert: (calendar isKislev: Kislev)
]

{ #category : 'test month testing' }
HebrewCalendarDefinitionTest >> testIsLongMarheshvan [

	self assert: (calendar isLongMarheshvan: Marheshvan, 5776)
]

{ #category : 'test month testing' }
HebrewCalendarDefinitionTest >> testIsMarheshvan [

	self assert: (calendar isMarheshvan: Marheshvan)
]

{ #category : 'test month testing' }
HebrewCalendarDefinitionTest >> testIsNisan [

	self assert: (calendar isNisan: Nisan)
]

{ #category : 'test month testing' }
HebrewCalendarDefinitionTest >> testIsShevat [

	self assert: (calendar isShevat: Shevat)
]

{ #category : 'test month testing' }
HebrewCalendarDefinitionTest >> testIsShortKislev [

	self assert: (calendar isShortKislev: Kislev, 5773)
]

{ #category : 'test month testing' }
HebrewCalendarDefinitionTest >> testIsSivan [

	self assert: (calendar isSivan: Sivan)
]

{ #category : 'test month testing' }
HebrewCalendarDefinitionTest >> testIsTammuz [

	self assert: (calendar isTammuz: Tammuz)
]

{ #category : 'test month testing' }
HebrewCalendarDefinitionTest >> testIsTevet [

	self assert: (calendar isTevet: Tevet)
]

{ #category : 'test month testing' }
HebrewCalendarDefinitionTest >> testIsTishri [

	self assert: (calendar isTishri: Tishri)
]

{ #category : 'test year testing' }
HebrewCalendarDefinitionTest >> testIsYearNumberLeap [

	self
		assert: (calendar isYearNumberLeap: -2);
		assert: (calendar isYearNumberLeap: 0);
		assert: (calendar isYearNumberLeap: 3);
		assert: (calendar isYearNumberLeap: 6);
		assert: (calendar isYearNumberLeap: 8);
		assert: (calendar isYearNumberLeap: 11);
		assert: (calendar isYearNumberLeap: 14);
		assert: (calendar isYearNumberLeap: 17);
		assert: (calendar isYearNumberLeap: 19);
		assert: (calendar isYearNumberLeap: 22);
		assert: (calendar isYearNumberLeap: 25);
		assert: (calendar isYearNumberLeap: 27);
		assert: (calendar isYearNumberLeap: 5768).

	self
		deny: (calendar isYearNumberLeap: -3);
		deny: (calendar isYearNumberLeap: 195);
		deny: (calendar isYearNumberLeap: 1400);
		deny: (calendar isYearNumberLeap: 1429);
		deny: (calendar isYearNumberLeap: 5767)
]

{ #category : 'test day testing' }
HebrewCalendarDefinitionTest >> testIsYomHamishi [

	self assert: (calendar isYomHamishi: YomHamishi)
]

{ #category : 'test day testing' }
HebrewCalendarDefinitionTest >> testIsYomRevii [

	self assert: (calendar isYomRevii: YomRevii)
]

{ #category : 'test day testing' }
HebrewCalendarDefinitionTest >> testIsYomRishon [

	self assert: (calendar isYomRishon: YomRishon)
]

{ #category : 'test day testing' }
HebrewCalendarDefinitionTest >> testIsYomShabbat [

	self assert: (calendar isYomShabbat: YomShabbat)
]

{ #category : 'test day testing' }
HebrewCalendarDefinitionTest >> testIsYomShelishi [

	self assert: (calendar isYomShelishi: YomShelishi)
]

{ #category : 'test day testing' }
HebrewCalendarDefinitionTest >> testIsYomSheni [

	self assert: (calendar isYomSheni: YomSheni)
]

{ #category : 'test day testing' }
HebrewCalendarDefinitionTest >> testIsYomShishi [

	self assert: (calendar isYomShishi: YomShishi)
]

{ #category : 'test months accessing' }
HebrewCalendarDefinitionTest >> testIyyar [

	self assert: calendar iyyar equals: Iyyar
]

{ #category : 'test month names' }
HebrewCalendarDefinitionTest >> testIyyarName [

	self assert: calendar iyyarName equals: 'Iyyar'
]

{ #category : 'test month numbers' }
HebrewCalendarDefinitionTest >> testIyyarNumber [

	self assert: calendar iyyarNumber equals: 2
]

{ #category : 'test months accessing' }
HebrewCalendarDefinitionTest >> testKislev [

	self assert: calendar kislev equals: Kislev
]

{ #category : 'test month names' }
HebrewCalendarDefinitionTest >> testKislevName [

	self assert: calendar kislevName equals: 'Kislev'
]

{ #category : 'test month numbers' }
HebrewCalendarDefinitionTest >> testKislevNumber [

	self assert: calendar kislevNumber equals: 9
]

{ #category : 'test months accessing' }
HebrewCalendarDefinitionTest >> testLastMonth [

	self assert: calendar lastMonth equals: Elul
]

{ #category : 'test month of year accessing' }
HebrewCalendarDefinitionTest >> testLastMonthOf [

	| year |
	year := 5767 asHebrewYear.
	self assert: (calendar lastMonthOf: year) equals: Elul , 5767.
	year := 5765 asHebrewYear.
	self assert: (calendar lastMonthOf: year) equals: Elul , 5765
]

{ #category : 'test months accessing' }
HebrewCalendarDefinitionTest >> testMarheshvan [

	self assert: calendar marheshvan equals: Marheshvan
]

{ #category : 'test month names' }
HebrewCalendarDefinitionTest >> testMarheshvanName [

	self assert: calendar marheshvanName equals: 'Marheshvan'
]

{ #category : 'test month numbers' }
HebrewCalendarDefinitionTest >> testMarheshvanNumber [

	self assert: calendar marheshvanNumber equals: 8
]

{ #category : 'test days accessing' }
HebrewCalendarDefinitionTest >> testMaximumNumberOfDaysInOneYear [

	self
		assert: calendar maximumNumberOfDaysInOneYear
		equals: 385 daysMeasure
]

{ #category : 'test months accessing' }
HebrewCalendarDefinitionTest >> testMonthNamed [

	self
		assert: (calendar monthNamed: 'Nisan') equals: Nisan;
		assert: (calendar monthNamed: 'Iyyar') equals: Iyyar;
		assert: (calendar monthNamed: 'Sivan') equals: Sivan;
		assert: (calendar monthNamed: 'Tammuz') equals: Tammuz;
		assert: (calendar monthNamed: 'Av') equals: Av;
		assert: (calendar monthNamed: 'Elul') equals: Elul;
		assert: (calendar monthNamed: 'Tishri') equals: Tishri;
		assert: (calendar monthNamed: 'Marheshvan') equals: Marheshvan;
		assert: (calendar monthNamed: 'Kislev') equals: Kislev;
		assert: (calendar monthNamed: 'Tevet') equals: Tevet;
		assert: (calendar monthNamed: 'Shevat') equals: Shevat;
		assert: (calendar monthNamed: 'Adar') equals: Adar;
		assert: (calendar monthNamed: 'Adar I') equals: AdarI;
		assert: (calendar monthNamed: 'Adar II') equals: AdarII.

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
HebrewCalendarDefinitionTest >> testMonthNumbered [

	self
		assert: (calendar monthNumbered: 1) equals: Nisan;
		assert: (calendar monthNumbered: 2) equals: Iyyar;
		assert: (calendar monthNumbered: 3) equals: Sivan;
		assert: (calendar monthNumbered: 4) equals: Tammuz;
		assert: (calendar monthNumbered: 5) equals: Av;
		assert: (calendar monthNumbered: 6) equals: Elul;
		assert: (calendar monthNumbered: 7) equals: Tishri;
		assert: (calendar monthNumbered: 8) equals: Marheshvan;
		assert: (calendar monthNumbered: 9) equals: Kislev;
		assert: (calendar monthNumbered: 10) equals: Tevet;
		assert: (calendar monthNumbered: 11) equals: Shevat;
		assert: (calendar monthNumbered: 12) equals: Adar;
		assert: (calendar monthNumbered: 13) equals: AdarII
]

{ #category : 'test global variables' }
HebrewCalendarDefinitionTest >> testMonthsGlobalVariables [

	self
		assert: Nisan equals: calendar nisan;
		assert: Iyyar equals: calendar iyyar;
		assert: Sivan equals: calendar sivan;
		assert: Tammuz equals: calendar tammuz;
		assert: Av equals: calendar av;
		assert: Elul equals: calendar elul;
		assert: Tishri equals: calendar tishri;
		assert: Marheshvan equals: calendar marheshvan;
		assert: Kislev equals: calendar kislev;
		assert: Tevet equals: calendar tevet;
		assert: Shevat equals: calendar shevat;
		assert: AdarI equals: calendar adarI;
		assert: AdarII equals: calendar adarII;
		assert: Adar equals: calendar adar
]

{ #category : 'test months accessing' }
HebrewCalendarDefinitionTest >> testNisan [

	self assert: calendar nisan equals: Nisan
]

{ #category : 'test month names' }
HebrewCalendarDefinitionTest >> testNisanName [

	self assert: calendar nisanName equals: 'Nisan'
]

{ #category : 'test month numbers' }
HebrewCalendarDefinitionTest >> testNisanNumber [

	self assert: calendar nisanNumber equals: 1
]

{ #category : 'test dates accessing' }
HebrewCalendarDefinitionTest >> testNow [

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
HebrewCalendarDefinitionTest >> testNumberOfDaysIn [

	self
		assert: (calendar numberOfDaysIn: 5775 asHebrewYear)
		equals: 354 daysMeasure
]

{ #category : 'test days accessing' }
HebrewCalendarDefinitionTest >> testNumberOfDaysPerWeek [

	self assert: calendar numberOfDaysPerWeek equals: 7 daysMeasure
]

{ #category : 'test months accessing' }
HebrewCalendarDefinitionTest >> testNumberOfMonthsPerYear [

	self assert: calendar numberOfMonthsPerYear equals: 13 monthsMeasure
]

{ #category : 'test printing' }
HebrewCalendarDefinitionTest >> testPrintString [

	self assert: calendar printString equals: 'Hebrew Calendar'
]

{ #category : 'test months accessing' }
HebrewCalendarDefinitionTest >> testShevat [

	self assert: calendar shevat equals: Shevat
]

{ #category : 'test month names' }
HebrewCalendarDefinitionTest >> testShevatName [

	self assert: calendar shevatName equals: 'Shevat'
]

{ #category : 'test month numbers' }
HebrewCalendarDefinitionTest >> testShevatNumber [

	self assert: calendar shevatNumber equals: 11
]

{ #category : 'test days accessing' }
HebrewCalendarDefinitionTest >> testSinceFirstDayOfWeek [

	| currentDay zeroDays |
	zeroDays := 0 daysMeasure.
	currentDay := calendar yomRishon.
	(zeroDays to: 6 daysMeasure) do: [ :numberOfDays |
		self
			assert: (calendar sinceFirstDayOfWeek: numberOfDays)
			equals: currentDay.
		currentDay := currentDay next ]
]

{ #category : 'test days accessing' }
HebrewCalendarDefinitionTest >> testSinceYomRishon [

	| currentDay zeroDays |
	zeroDays := 0 daysMeasure.
	currentDay := calendar yomRishon.
	(zeroDays to: 6 daysMeasure) do: [ :numberOfDays |
		self
			assert: (calendar sinceYomRishon: numberOfDays)
			equals: currentDay.
		currentDay := currentDay next ]
]

{ #category : 'test months accessing' }
HebrewCalendarDefinitionTest >> testSivan [

	self assert: calendar sivan equals: Sivan
]

{ #category : 'test month names' }
HebrewCalendarDefinitionTest >> testSivanName [

	self assert: calendar sivanName equals: 'Sivan'
]

{ #category : 'test month numbers' }
HebrewCalendarDefinitionTest >> testSivanNumber [

	self assert: calendar sivanNumber equals: 3
]

{ #category : 'test months accessing' }
HebrewCalendarDefinitionTest >> testTammuz [

	self assert: calendar tammuz equals: Tammuz
]

{ #category : 'test month names' }
HebrewCalendarDefinitionTest >> testTammuzName [

	self assert: calendar tammuzName equals: 'Tammuz'
]

{ #category : 'test month numbers' }
HebrewCalendarDefinitionTest >> testTammuzNumber [

	self assert: calendar tammuzNumber equals: 4
]

{ #category : 'test months accessing' }
HebrewCalendarDefinitionTest >> testTevet [

	self assert: calendar tevet equals: Tevet
]

{ #category : 'test month names' }
HebrewCalendarDefinitionTest >> testTevetName [

	self assert: calendar tevetName equals: 'Tevet'
]

{ #category : 'test month numbers' }
HebrewCalendarDefinitionTest >> testTevetNumber [

	self assert: calendar tevetNumber equals: 10
]

{ #category : 'test months accessing' }
HebrewCalendarDefinitionTest >> testTishri [

	self assert: calendar tishri equals: Tishri
]

{ #category : 'test month names' }
HebrewCalendarDefinitionTest >> testTishriName [

	self assert: calendar tishriName equals: 'Tishri'
]

{ #category : 'test month numbers' }
HebrewCalendarDefinitionTest >> testTishriNumber [

	self assert: calendar tishriNumber equals: 7
]

{ #category : 'test dates accessing' }
HebrewCalendarDefinitionTest >> testToday [

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
		equals: (calendar convertToHebrewDate: gregorianToday)
]

{ #category : 'test dates accessing' }
HebrewCalendarDefinitionTest >> testTomorrow [

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
		equals: (calendar convertToHebrewDate: gregorianToday) next
]

{ #category : 'test dates accessing' }
HebrewCalendarDefinitionTest >> testYesterday [

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
		equals: (calendar convertToHebrewDate: gregorianToday) previous
]

{ #category : 'test days accessing' }
HebrewCalendarDefinitionTest >> testYomHamishi [

	self assert: calendar yomHamishi equals: YomHamishi
]

{ #category : 'test day names' }
HebrewCalendarDefinitionTest >> testYomHamishiName [

	self assert: calendar yomHamishiName equals: 'yom hamishi'
]

{ #category : 'test day positions in week' }
HebrewCalendarDefinitionTest >> testYomHamishiPositionInWeek [

	self assert: calendar yomHamishiPositionInWeek equals: 5
]

{ #category : 'test days accessing' }
HebrewCalendarDefinitionTest >> testYomRevii [

	self assert: calendar yomRevii equals: YomRevii
]

{ #category : 'test day names' }
HebrewCalendarDefinitionTest >> testYomReviiName [

	self assert: calendar yomReviiName equals: 'yom revi`i'
]

{ #category : 'test day positions in week' }
HebrewCalendarDefinitionTest >> testYomReviiPositionInWeek [

	self assert: calendar yomReviiPositionInWeek equals: 4
]

{ #category : 'test days accessing' }
HebrewCalendarDefinitionTest >> testYomRishon [

	self assert: calendar yomRishon equals: YomRishon
]

{ #category : 'test day names' }
HebrewCalendarDefinitionTest >> testYomRishonName [

	self assert: calendar yomRishonName equals: 'yom rishon'
]

{ #category : 'test day positions in week' }
HebrewCalendarDefinitionTest >> testYomRishonPositionInWeek [

	self assert: calendar yomRishonPositionInWeek equals: 1
]

{ #category : 'test days accessing' }
HebrewCalendarDefinitionTest >> testYomShabbat [

	self assert: calendar yomShabbat equals: YomShabbat
]

{ #category : 'test day names' }
HebrewCalendarDefinitionTest >> testYomShabbatName [

	self assert: calendar yomShabbatName equals: 'yom shabbat'
]

{ #category : 'test day positions in week' }
HebrewCalendarDefinitionTest >> testYomShabbatPositionInWeek [

	self assert: calendar yomShabbatPositionInWeek equals: 7
]

{ #category : 'test days accessing' }
HebrewCalendarDefinitionTest >> testYomShelishi [

	self assert: calendar yomShelishi equals: YomShelishi
]

{ #category : 'test day names' }
HebrewCalendarDefinitionTest >> testYomShelishiName [

	self assert: calendar yomShelishiName equals: 'yom shelishi'
]

{ #category : 'test day positions in week' }
HebrewCalendarDefinitionTest >> testYomShelishiPositionInWeek [

	self assert: calendar yomShelishiPositionInWeek equals: 3
]

{ #category : 'test days accessing' }
HebrewCalendarDefinitionTest >> testYomSheni [

	self assert: calendar yomSheni equals: YomSheni
]

{ #category : 'test day names' }
HebrewCalendarDefinitionTest >> testYomSheniName [

	self assert: calendar yomSheniName equals: 'yom sheni'
]

{ #category : 'test day positions in week' }
HebrewCalendarDefinitionTest >> testYomSheniPositionInWeek [

	self assert: calendar yomSheniPositionInWeek equals: 2
]

{ #category : 'test days accessing' }
HebrewCalendarDefinitionTest >> testYomShishi [

	self assert: calendar yomShishi equals: YomShishi
]

{ #category : 'test day names' }
HebrewCalendarDefinitionTest >> testYomShishiName [

	self assert: calendar yomShishiName equals: 'yom shishi'
]

{ #category : 'test day positions in week' }
HebrewCalendarDefinitionTest >> testYomShishiPositionInWeek [

	self assert: calendar yomShishiPositionInWeek equals: 6
]
