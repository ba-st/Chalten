Class {
	#name : #HebrewCalendarDefinitionTest,
	#superclass : #TestCase,
	#category : #'Chalten-Tests-Hebrew'
}

{ #category : #'test months accessing' }
HebrewCalendarDefinitionTest >> testAdarI [

	self assert: HebrewCalendar adarI = AdarI
]

{ #category : #'test months accessing' }
HebrewCalendarDefinitionTest >> testAdarII [

	self assert: HebrewCalendar adarII = AdarII
]

{ #category : #'test month names' }
HebrewCalendarDefinitionTest >> testAdarIIName [

	self assert: HebrewCalendar adarIIName = 'Adar II'
]

{ #category : #'test month numbers' }
HebrewCalendarDefinitionTest >> testAdarIINumber [

	self assert: HebrewCalendar adarIINumber = 13
]

{ #category : #'test month names' }
HebrewCalendarDefinitionTest >> testAdarIName [

	self assert: HebrewCalendar adarIName = 'Adar I'
]

{ #category : #'test month numbers' }
HebrewCalendarDefinitionTest >> testAdarINumber [

	self assert: HebrewCalendar adarINumber = 12
]

{ #category : #'test month names' }
HebrewCalendarDefinitionTest >> testAdarName [

	self assert: HebrewCalendar adarName = 'Adar'
]

{ #category : #'test month numbers' }
HebrewCalendarDefinitionTest >> testAdarNumber [

	self assert: HebrewCalendar adarNumber = 12
]

{ #category : #'test days accessing' }
HebrewCalendarDefinitionTest >> testAmountOfDaysPerWeek [

	self assert: HebrewCalendar amountOfDaysPerWeek = 7
]

{ #category : #'test year testing' }
HebrewCalendarDefinitionTest >> testAmountOfMonthsInYear [
	self assert: (HebrewCalendar amountOfMonthsInYear: 5767 asHebrewYear) = 12.
	self assert: (HebrewCalendar amountOfMonthsInYear: 5768 asHebrewYear) = 13
]

{ #category : #'test months accessing' }
HebrewCalendarDefinitionTest >> testAmountOfMonthsPerYear [

	self assert: HebrewCalendar amountOfMonthsPerYear = 13
]

{ #category : #'test months accessing' }
HebrewCalendarDefinitionTest >> testAv [

	self assert: HebrewCalendar av = Av
]

{ #category : #'test month names' }
HebrewCalendarDefinitionTest >> testAvName [

	self assert: HebrewCalendar avName = 'Av'
]

{ #category : #'test month numbers' }
HebrewCalendarDefinitionTest >> testAvNumber [

	self assert: HebrewCalendar avNumber = 5
]

{ #category : #'test converting' }
HebrewCalendarDefinitionTest >> testConvert [

	self assert: (HebrewCalendar convert: March twentieth, 2007) = (Nisan first, 5767).
	self assert: (HebrewCalendar convert: June fourth, 2008) = (Sivan first, 5768).
	self assert: (HebrewCalendar convert: December second, 2008) = (Kislev fifth, 5769).
	self assert: (HebrewCalendar convert: March tenth, 2006) = (Adar tenth, 5766).
	self assert: (HebrewCalendar convert: February eleventh, 2016) = (AdarI second, 5776).
	
	self assert: (HebrewCalendar convert: (March twentieth, 2007 at: TimeOfDay noon)) =
		(Nisan first, 5767 at: TimeOfDay noon).
	self assert: (HebrewCalendar convert: (June fourth, 2008 at: TimeOfDay noon)) =
		(Sivan first, 5768 at: TimeOfDay noon).
	self assert: (HebrewCalendar convert: (December second, 2008 at: TimeOfDay noon)) =
		(Kislev fifth, 5769 at: TimeOfDay noon).
	self assert: (HebrewCalendar convert: (March tenth, 2006 at: TimeOfDay noon)) =
		(Adar tenth, 5766 at: TimeOfDay noon).
	self assert: (HebrewCalendar convert: (February eleventh, 2016 at: TimeOfDay noon)) =
		(AdarI second, 5776 at: TimeOfDay noon).
	
	self
		should: [ HebrewCalendar convert: 1 ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex description = 'Error: 1 can`t be converted to Date nor DateTime' ]
]

{ #category : #'test converting' }
HebrewCalendarDefinitionTest >> testConvertToSmalltalkDate [

	| hebrewDate smalltalkDate |

	hebrewDate := Iyyar twentyfirst, 5767.
	smalltalkDate := Date newDay: 9 month: 5 year: 2007.
	self assert: (HebrewCalendar convertToSmalltalkDate: hebrewDate) = smalltalkDate
]

{ #category : #'test dates accessing' }
HebrewCalendarDefinitionTest >> testCurrentDayOfMonth [
	| smalltalkToday gregorianToday |
	smalltalkToday := Date today.
	gregorianToday := FixedDate 
				yearNumber: smalltalkToday year
				monthNumber: smalltalkToday monthIndex
				dayNumber: smalltalkToday dayOfMonth
				calendar: GregorianCalendar.
	self assert: HebrewCalendar currentDayOfMonth 
				= (HebrewCalendar convertToHebrewDate: gregorianToday) dayOfMonth
]

{ #category : #'test dates accessing' }
HebrewCalendarDefinitionTest >> testCurrentMonth [
	| smalltalkToday gregorianToday |
	smalltalkToday := Date today.
	gregorianToday := FixedDate 
				yearNumber: smalltalkToday year
				monthNumber: smalltalkToday monthIndex
				dayNumber: smalltalkToday dayOfMonth
				calendar: GregorianCalendar.
	self assert: HebrewCalendar currentMonth 
				= (HebrewCalendar convertToHebrewDate: gregorianToday) month
]

{ #category : #'test dates accessing' }
HebrewCalendarDefinitionTest >> testCurrentMonthOfYear [
	| smalltalkToday gregorianToday |
	smalltalkToday := Date today.
	gregorianToday := FixedDate 
				yearNumber: smalltalkToday year
				monthNumber: smalltalkToday monthIndex
				dayNumber: smalltalkToday dayOfMonth
				calendar: GregorianCalendar.
	self assert: HebrewCalendar currentMonthOfYear 
				= (HebrewCalendar convertToHebrewDate: gregorianToday) monthOfYear
]

{ #category : #'test dates accessing' }
HebrewCalendarDefinitionTest >> testCurrentYear [
	| smalltalkToday gregorianToday |
	smalltalkToday := Date today.
	gregorianToday := FixedDate 
				yearNumber: smalltalkToday year
				monthNumber: smalltalkToday monthIndex
				dayNumber: smalltalkToday dayOfMonth
				calendar: GregorianCalendar.
	self assert: HebrewCalendar currentYear 
				= (HebrewCalendar convertToHebrewDate: gregorianToday) year
]

{ #category : #'test dates accessing' }
HebrewCalendarDefinitionTest >> testDateFromFixed [
	| nisanFirstOf1 tevetTwentiethOf5767 marheshvanTwelfthOf1945 |
	nisanFirstOf1 := Nisan first , 1.
	tevetTwentiethOf5767 := Tevet twentieth , 5767.
	marheshvanTwelfthOf1945 := Marheshvan twelfth , 1945.
	self 
		assert: (HebrewCalendar dateFromNumberOfDays: -1373249) = nisanFirstOf1.
	self assert: (HebrewCalendar dateFromNumberOfDays: 732686) 
				= tevetTwentiethOf5767.
	self assert: (HebrewCalendar dateFromNumberOfDays: -663352) 
				= marheshvanTwelfthOf1945
]

{ #category : #'test days accessing' }
HebrewCalendarDefinitionTest >> testDayNamed [

	self
		assert: (HebrewCalendar dayNamed: 'yom rishon') = YomRishon;
		assert: (HebrewCalendar dayNamed: 'yom sheni') = YomSheni;
		assert: (HebrewCalendar dayNamed: 'yom shelishi') = YomShelishi;
		assert: (HebrewCalendar dayNamed: 'yom revi`i') = YomRevii;
		assert: (HebrewCalendar dayNamed: 'yom hamishi') = YomHamishi;
		assert: (HebrewCalendar dayNamed: 'yom shishi') = YomShishi;
		assert: (HebrewCalendar dayNamed: 'yom shabbat') = YomShabbat
]

{ #category : #'test days accessing' }
HebrewCalendarDefinitionTest >> testDayOf [

	self assert: (HebrewCalendar dayOf: Nisan twentysecond, 5775) = YomShabbat
]

{ #category : #'test days accessing' }
HebrewCalendarDefinitionTest >> testDayPositionedInWeek [

	self
		assert: (HebrewCalendar dayPositionedInWeek: 1) = YomRishon;
		assert: (HebrewCalendar dayPositionedInWeek: 2) = YomSheni;
		assert: (HebrewCalendar dayPositionedInWeek: 3) = YomShelishi;
		assert: (HebrewCalendar dayPositionedInWeek: 4) = YomRevii;
		assert: (HebrewCalendar dayPositionedInWeek: 5) = YomHamishi;
		assert: (HebrewCalendar dayPositionedInWeek: 6) = YomShishi;
		assert: (HebrewCalendar dayPositionedInWeek: 7) = YomShabbat
]

{ #category : #'test days accessing' }
HebrewCalendarDefinitionTest >> testDaysFromEpochTo [
	| nisanFirstOf0 nisanFirstOf1 nisanSecondOf1 nisanFifteenthOf1 nisanFirstOf2 nisanFirstOf5 nisanFirstOf5767 |
	nisanFirstOf0 := Nisan first , 0.
	nisanFirstOf1 := Nisan first , 1.
	nisanSecondOf1 := Nisan second , 1.
	nisanFifteenthOf1 := Nisan fifteenth , 1.
	nisanFirstOf2 := Nisan first , 2.
	nisanFirstOf5 := Nisan first , 5.
	nisanFirstOf5767 := Nisan first , 5767.
	self assert: (HebrewCalendar numberOfDaysFromEpochTo: nisanFirstOf0) = -1373605 daysMeasure.
	self assert: (HebrewCalendar numberOfDaysFromEpochTo: nisanFirstOf1) = -1373250 daysMeasure.
	self assert: (HebrewCalendar numberOfDaysFromEpochTo: nisanSecondOf1) = -1373249 daysMeasure.
	self assert: (HebrewCalendar numberOfDaysFromEpochTo: nisanFifteenthOf1) = -1373236 daysMeasure.
	self assert: (HebrewCalendar numberOfDaysFromEpochTo: nisanFirstOf2) = -1372895 daysMeasure.
	self assert: (HebrewCalendar numberOfDaysFromEpochTo: nisanFirstOf5) = -1371803 daysMeasure.
	self assert: (HebrewCalendar numberOfDaysFromEpochTo: nisanFirstOf5767) = 732754 daysMeasure
]

{ #category : #'test global variables' }
HebrewCalendarDefinitionTest >> testDaysGlobalVariables [

	self
		assert: YomRishon = HebrewCalendar yomRishon;
		assert: YomSheni = HebrewCalendar yomSheni;
		assert: YomShelishi = HebrewCalendar yomShelishi;
		assert: YomRevii = HebrewCalendar yomRevii;
		assert: YomHamishi = HebrewCalendar yomHamishi;
		assert: YomShishi = HebrewCalendar yomShishi;
		assert: YomShabbat = HebrewCalendar yomShabbat
]

{ #category : #'test year querying' }
HebrewCalendarDefinitionTest >> testDistanceInYearsFromTo [

	self assert: (HebrewCalendar
		distanceInYearsFrom: 5773 asHebrewYear
		to: 5775 asHebrewYear) = 2 yearsMeasure
]

{ #category : #'test months accessing' }
HebrewCalendarDefinitionTest >> testElul [

	self assert: HebrewCalendar elul = Elul
]

{ #category : #'test month names' }
HebrewCalendarDefinitionTest >> testElulName [

	self assert: HebrewCalendar elulName = 'Elul'
]

{ #category : #'test month numbers' }
HebrewCalendarDefinitionTest >> testElulNumber [

	self assert: HebrewCalendar elulNumber = 6
]

{ #category : #'test accessing' }
HebrewCalendarDefinitionTest >> testEpoch [

	self assert: HebrewCalendar epoch = -1373427
]

{ #category : #'test months accessing' }
HebrewCalendarDefinitionTest >> testFirstMonth [

	self assert: HebrewCalendar firstMonth = Tishri
]

{ #category : #'test month of year accessing' }
HebrewCalendarDefinitionTest >> testFirstMonthOf [
	| year |
	year := 5767 asHebrewYear.
	self assert: (HebrewCalendar firstMonthOf: year) = (Tishri , 5767).
	year := 5765 asHebrewYear.
	self assert: (HebrewCalendar firstMonthOf: year) = (Tishri , 5765)
]

{ #category : #'test dates accessing' }
HebrewCalendarDefinitionTest >> testFixedFromDate [
	| nisanFirstOf1 marheshvanIITwelveOf1945 tevetTwentiethOf5767 |
	nisanFirstOf1 := Nisan first , 1.
	marheshvanIITwelveOf1945 := Marheshvan twelfth , 1945.
	tevetTwentiethOf5767 := Tevet twentieth , 5767.
	self
		assert: (HebrewCalendar numberOfDaysFromDate: nisanFirstOf1) = -1373249;
		assert: (HebrewCalendar numberOfDaysFromDate: marheshvanIITwelveOf1945) 
					= -663352;
		assert: (HebrewCalendar numberOfDaysFromDate: tevetTwentiethOf5767) 
					= 732686
]

{ #category : #'test month testing' }
HebrewCalendarDefinitionTest >> testIsAdar [

	self assert: (HebrewCalendar isAdar: Adar)
]

{ #category : #'test month testing' }
HebrewCalendarDefinitionTest >> testIsAdarI [

	self assert: (HebrewCalendar isAdarI: AdarI)
]

{ #category : #'test month testing' }
HebrewCalendarDefinitionTest >> testIsAdarII [

	self assert: (HebrewCalendar isAdarII: AdarII)
]

{ #category : #'test month testing' }
HebrewCalendarDefinitionTest >> testIsAv [

	self assert: (HebrewCalendar isAv: Av)
]

{ #category : #'test month testing' }
HebrewCalendarDefinitionTest >> testIsElul [

	self assert: (HebrewCalendar isElul: Elul)
]

{ #category : #'test year testing' }
HebrewCalendarDefinitionTest >> testIsFirstMonthOfYear [

	self assert: (HebrewCalendar isFirstMonthOfYear: Tishri).
	self deny: (HebrewCalendar isFirstMonthOfYear: Nisan).
	self deny: (HebrewCalendar isFirstMonthOfYear: Elul)
]

{ #category : #'test month testing' }
HebrewCalendarDefinitionTest >> testIsIyyar [

	self assert: (HebrewCalendar isIyyar: Iyyar)
]

{ #category : #'test month testing' }
HebrewCalendarDefinitionTest >> testIsKislev [

	self assert: (HebrewCalendar isKislev: Kislev)
]

{ #category : #'test month testing' }
HebrewCalendarDefinitionTest >> testIsLongMarheshvan [

	self assert: (HebrewCalendar isLongMarheshvan: Marheshvan, 5776)
]

{ #category : #'test month testing' }
HebrewCalendarDefinitionTest >> testIsMarheshvan [

	self assert: (HebrewCalendar isMarheshvan: Marheshvan)
]

{ #category : #'test month testing' }
HebrewCalendarDefinitionTest >> testIsNisan [

	self assert: (HebrewCalendar isNisan: Nisan)
]

{ #category : #'test month testing' }
HebrewCalendarDefinitionTest >> testIsShevat [

	self assert: (HebrewCalendar isShevat: Shevat)
]

{ #category : #'test month testing' }
HebrewCalendarDefinitionTest >> testIsShortKislev [

	self assert: (HebrewCalendar isShortKislev: Kislev, 5773)
]

{ #category : #'test month testing' }
HebrewCalendarDefinitionTest >> testIsSivan [

	self assert: (HebrewCalendar isSivan: Sivan)
]

{ #category : #'test month testing' }
HebrewCalendarDefinitionTest >> testIsTammuz [

	self assert: (HebrewCalendar isTammuz: Tammuz)
]

{ #category : #'test month testing' }
HebrewCalendarDefinitionTest >> testIsTevet [

	self assert: (HebrewCalendar isTevet: Tevet)
]

{ #category : #'test month testing' }
HebrewCalendarDefinitionTest >> testIsTishri [

	self assert: (HebrewCalendar isTishri: Tishri)
]

{ #category : #'test year testing' }
HebrewCalendarDefinitionTest >> testIsYearNumberLeap [

	self
		assert: (HebrewCalendar isYearNumberLeap: -2);
		assert: (HebrewCalendar isYearNumberLeap: 0);
		assert: (HebrewCalendar isYearNumberLeap: 3);
		assert: (HebrewCalendar isYearNumberLeap: 6);
		assert: (HebrewCalendar isYearNumberLeap: 8);
		assert: (HebrewCalendar isYearNumberLeap: 11);
		assert: (HebrewCalendar isYearNumberLeap: 14);
		assert: (HebrewCalendar isYearNumberLeap: 17);
		assert: (HebrewCalendar isYearNumberLeap: 19);
		assert: (HebrewCalendar isYearNumberLeap: 22);
		assert: (HebrewCalendar isYearNumberLeap: 25);
		assert: (HebrewCalendar isYearNumberLeap: 27);
		assert: (HebrewCalendar isYearNumberLeap: 5768).

	self
		deny: (HebrewCalendar isYearNumberLeap: -3);
		deny: (HebrewCalendar isYearNumberLeap: 195);
		deny: (HebrewCalendar isYearNumberLeap: 1400);
		deny: (HebrewCalendar isYearNumberLeap: 1429);
		deny: (HebrewCalendar isYearNumberLeap: 5767)
]

{ #category : #'test day testing' }
HebrewCalendarDefinitionTest >> testIsYomHamishi [

	self assert: (HebrewCalendar isYomHamishi: YomHamishi)
]

{ #category : #'test day testing' }
HebrewCalendarDefinitionTest >> testIsYomRevii [

	self assert: (HebrewCalendar isYomRevii: YomRevii)
]

{ #category : #'test day testing' }
HebrewCalendarDefinitionTest >> testIsYomRishon [

	self assert: (HebrewCalendar isYomRishon: YomRishon)
]

{ #category : #'test day testing' }
HebrewCalendarDefinitionTest >> testIsYomShabbat [

	self assert: (HebrewCalendar isYomShabbat: YomShabbat)
]

{ #category : #'test day testing' }
HebrewCalendarDefinitionTest >> testIsYomShelishi [

	self assert: (HebrewCalendar isYomShelishi: YomShelishi)
]

{ #category : #'test day testing' }
HebrewCalendarDefinitionTest >> testIsYomSheni [

	self assert: (HebrewCalendar isYomSheni: YomSheni)
]

{ #category : #'test day testing' }
HebrewCalendarDefinitionTest >> testIsYomShishi [

	self assert: (HebrewCalendar isYomShishi: YomShishi)
]

{ #category : #'test months accessing' }
HebrewCalendarDefinitionTest >> testIyyar [

	self assert: HebrewCalendar iyyar = Iyyar
]

{ #category : #'test month names' }
HebrewCalendarDefinitionTest >> testIyyarName [

	self assert: HebrewCalendar iyyarName = 'Iyyar'
]

{ #category : #'test month numbers' }
HebrewCalendarDefinitionTest >> testIyyarNumber [

	self assert: HebrewCalendar iyyarNumber = 2
]

{ #category : #'test months accessing' }
HebrewCalendarDefinitionTest >> testKislev [

	self assert: HebrewCalendar kislev = Kislev
]

{ #category : #'test month names' }
HebrewCalendarDefinitionTest >> testKislevName [

	self assert: HebrewCalendar kislevName = 'Kislev'
]

{ #category : #'test month numbers' }
HebrewCalendarDefinitionTest >> testKislevNumber [

	self assert: HebrewCalendar kislevNumber = 9
]

{ #category : #'test months accessing' }
HebrewCalendarDefinitionTest >> testLastMonth [

	self assert: HebrewCalendar lastMonth = Elul
]

{ #category : #'test month of year accessing' }
HebrewCalendarDefinitionTest >> testLastMonthOf [
	| year |
	year := 5767 asHebrewYear.
	self assert: (HebrewCalendar lastMonthOf: year) = (Elul , 5767).
	year := 5765 asHebrewYear.
	self assert: (HebrewCalendar lastMonthOf: year) = (Elul , 5765)
]

{ #category : #'test months accessing' }
HebrewCalendarDefinitionTest >> testMarheshvan [

	self assert: HebrewCalendar marheshvan = Marheshvan
]

{ #category : #'test month names' }
HebrewCalendarDefinitionTest >> testMarheshvanName [

	self assert: HebrewCalendar marheshvanName = 'Marheshvan'
]

{ #category : #'test month numbers' }
HebrewCalendarDefinitionTest >> testMarheshvanNumber [

	self assert: HebrewCalendar marheshvanNumber = 8
]

{ #category : #'test days accessing' }
HebrewCalendarDefinitionTest >> testMaximumNumberOfDaysInOneYear [
		
	self assert: HebrewCalendar maximumNumberOfDaysInOneYear = 385 daysMeasure
]

{ #category : #'test months accessing' }
HebrewCalendarDefinitionTest >> testMonthNamed [

	self
		assert: (HebrewCalendar monthNamed: 'Nisan') = Nisan;
		assert: (HebrewCalendar monthNamed: 'Iyyar') = Iyyar;
		assert: (HebrewCalendar monthNamed: 'Sivan') = Sivan;
		assert: (HebrewCalendar monthNamed: 'Tammuz') = Tammuz;
		assert: (HebrewCalendar monthNamed: 'Av') = Av;
		assert: (HebrewCalendar monthNamed: 'Elul') = Elul;
		assert: (HebrewCalendar monthNamed: 'Tishri') = Tishri;
		assert: (HebrewCalendar monthNamed: 'Marheshvan') = Marheshvan;
		assert: (HebrewCalendar monthNamed: 'Kislev') = Kislev;
		assert: (HebrewCalendar monthNamed: 'Tevet') = Tevet;
		assert: (HebrewCalendar monthNamed: 'Shevat') = Shevat;
		assert: (HebrewCalendar monthNamed: 'Adar') = Adar;
		assert: (HebrewCalendar monthNamed: 'Adar I') = AdarI;
		assert: (HebrewCalendar monthNamed: 'Adar II') = AdarII.
		
	self
		should: [ GregorianCalendar monthNamed: 'invalid name' ]
		raise: InvalidMonthNameException
		withExceptionDo: [ :ex | self assert: ex description = 'invalid name is an invalid name for a month' ]
]

{ #category : #'test months accessing' }
HebrewCalendarDefinitionTest >> testMonthNumbered [

	self
		assert: (HebrewCalendar monthNumbered: 1) = Nisan;
		assert: (HebrewCalendar monthNumbered: 2) = Iyyar;
		assert: (HebrewCalendar monthNumbered: 3) = Sivan;
		assert: (HebrewCalendar monthNumbered: 4) = Tammuz;
		assert: (HebrewCalendar monthNumbered: 5) = Av;
		assert: (HebrewCalendar monthNumbered: 6) = Elul;
		assert: (HebrewCalendar monthNumbered: 7) = Tishri;
		assert: (HebrewCalendar monthNumbered: 8) = Marheshvan;
		assert: (HebrewCalendar monthNumbered: 9) = Kislev;
		assert: (HebrewCalendar monthNumbered: 10) = Tevet;
		assert: (HebrewCalendar monthNumbered: 11) = Shevat;
		assert: (HebrewCalendar monthNumbered: 12) = Adar;
		assert: (HebrewCalendar monthNumbered: 13) = AdarII
]

{ #category : #'test global variables' }
HebrewCalendarDefinitionTest >> testMonthsGlobalVariables [

	self
		assert: Nisan = HebrewCalendar nisan;
		assert: Iyyar = HebrewCalendar iyyar;
		assert: Sivan = HebrewCalendar sivan;
		assert: Tammuz = HebrewCalendar tammuz;
		assert: Av = HebrewCalendar av;
		assert: Elul = HebrewCalendar elul;
		assert: Tishri = HebrewCalendar tishri;
		assert: Marheshvan = HebrewCalendar marheshvan;
		assert: Kislev = HebrewCalendar kislev;
		assert: Tevet = HebrewCalendar tevet;
		assert: Shevat = HebrewCalendar shevat;
		assert: AdarI = HebrewCalendar adarI;
		assert: AdarII = HebrewCalendar adarII;
		assert: Adar = HebrewCalendar adar
]

{ #category : #'test months accessing' }
HebrewCalendarDefinitionTest >> testNisan [

	self assert: HebrewCalendar nisan = Nisan
]

{ #category : #'test month names' }
HebrewCalendarDefinitionTest >> testNisanName [

	self assert: HebrewCalendar nisanName = 'Nisan'
]

{ #category : #'test month numbers' }
HebrewCalendarDefinitionTest >> testNisanNumber [

	self assert: HebrewCalendar nisanNumber = 1
]

{ #category : #'test dates accessing' }
HebrewCalendarDefinitionTest >> testNow [
	| now nowInOneSecond |
	now := HebrewCalendar now.
	(Delay forSeconds: 1) wait.
	nowInOneSecond := HebrewCalendar now.
	self assert: now < nowInOneSecond.
	self assert: ((now distanceTo: nowInOneSecond) convertTo: TimeUnits second) truncated = 1 secondMeasure
]

{ #category : #'test days accessing' }
HebrewCalendarDefinitionTest >> testNumberOfDaysIn [

	self assert: (HebrewCalendar numberOfDaysIn: 5775 asHebrewYear) = 354 daysMeasure
]

{ #category : #'test days accessing' }
HebrewCalendarDefinitionTest >> testNumberOfDaysPerWeek [
	self assert: HebrewCalendar numberOfDaysPerWeek = 7 daysMeasure
]

{ #category : #'test months accessing' }
HebrewCalendarDefinitionTest >> testNumberOfMonthsPerYear [
	self assert: HebrewCalendar numberOfMonthsPerYear = 13 monthsMeasure
]

{ #category : #'test printing' }
HebrewCalendarDefinitionTest >> testPrintString [

	self assert: HebrewCalendar printString  = 'Hebrew Calendar'
]

{ #category : #'test months accessing' }
HebrewCalendarDefinitionTest >> testShevat [

	self assert: HebrewCalendar shevat = Shevat
]

{ #category : #'test month names' }
HebrewCalendarDefinitionTest >> testShevatName [

	self assert: HebrewCalendar shevatName = 'Shevat'
]

{ #category : #'test month numbers' }
HebrewCalendarDefinitionTest >> testShevatNumber [

	self assert: HebrewCalendar shevatNumber = 11
]

{ #category : #'test days accessing' }
HebrewCalendarDefinitionTest >> testSinceFirstDayOfWeek [
	| currentDay zeroDays |
	zeroDays := 0 daysMeasure.
	currentDay := HebrewCalendar yomRishon.
	(zeroDays to: 6 daysMeasure)
		do: [ :numberOfDays | 
			self assert: (HebrewCalendar sinceFirstDayOfWeek: numberOfDays) = currentDay.
			currentDay := currentDay next ]
]

{ #category : #'test days accessing' }
HebrewCalendarDefinitionTest >> testSinceYomRishon [
	| currentDay zeroDays |
	zeroDays := 0 daysMeasure.
	currentDay := HebrewCalendar yomRishon.
	(zeroDays to: 6 daysMeasure)
		do: [ :numberOfDays | 
			self assert: (HebrewCalendar sinceYomRishon: numberOfDays) = currentDay.
			currentDay := currentDay next ]
]

{ #category : #'test months accessing' }
HebrewCalendarDefinitionTest >> testSivan [

	self assert: HebrewCalendar sivan = Sivan
]

{ #category : #'test month names' }
HebrewCalendarDefinitionTest >> testSivanName [

	self assert: HebrewCalendar sivanName = 'Sivan'
]

{ #category : #'test month numbers' }
HebrewCalendarDefinitionTest >> testSivanNumber [

	self assert: HebrewCalendar sivanNumber = 3
]

{ #category : #'test months accessing' }
HebrewCalendarDefinitionTest >> testTammuz [

	self assert: HebrewCalendar tammuz = Tammuz
]

{ #category : #'test month names' }
HebrewCalendarDefinitionTest >> testTammuzName [

	self assert: HebrewCalendar tammuzName = 'Tammuz'
]

{ #category : #'test month numbers' }
HebrewCalendarDefinitionTest >> testTammuzNumber [

	self assert: HebrewCalendar tammuzNumber = 4
]

{ #category : #'test months accessing' }
HebrewCalendarDefinitionTest >> testTevet [

	self assert: HebrewCalendar tevet = Tevet
]

{ #category : #'test month names' }
HebrewCalendarDefinitionTest >> testTevetName [

	self assert: HebrewCalendar tevetName = 'Tevet'
]

{ #category : #'test month numbers' }
HebrewCalendarDefinitionTest >> testTevetNumber [

	self assert: HebrewCalendar tevetNumber = 10
]

{ #category : #'test months accessing' }
HebrewCalendarDefinitionTest >> testTishri [

	self assert: HebrewCalendar tishri = Tishri
]

{ #category : #'test month names' }
HebrewCalendarDefinitionTest >> testTishriName [

	self assert: HebrewCalendar tishriName = 'Tishri'
]

{ #category : #'test month numbers' }
HebrewCalendarDefinitionTest >> testTishriNumber [

	self assert: HebrewCalendar tishriNumber = 7
]

{ #category : #'test dates accessing' }
HebrewCalendarDefinitionTest >> testToday [
	| smalltalkToday gregorianToday |
	smalltalkToday := Date today.
	gregorianToday := FixedDate 
				yearNumber: smalltalkToday year
				monthNumber: smalltalkToday monthIndex
				dayNumber: smalltalkToday dayOfMonth
				calendar: GregorianCalendar.
	self assert: HebrewCalendar today 
				= (HebrewCalendar convertToHebrewDate: gregorianToday)
]

{ #category : #'test dates accessing' }
HebrewCalendarDefinitionTest >> testTomorrow [
	| smalltalkToday gregorianToday |
	smalltalkToday := Date today.
	gregorianToday := FixedDate 
				yearNumber: smalltalkToday year
				monthNumber: smalltalkToday monthIndex
				dayNumber: smalltalkToday dayOfMonth
				calendar: GregorianCalendar.
	self assert: HebrewCalendar tomorrow 
				= (HebrewCalendar convertToHebrewDate: gregorianToday) next
]

{ #category : #'test dates accessing' }
HebrewCalendarDefinitionTest >> testYesterday [
	| smalltalkToday gregorianToday |
	smalltalkToday := Date today.
	gregorianToday := FixedDate 
				yearNumber: smalltalkToday year
				monthNumber: smalltalkToday monthIndex
				dayNumber: smalltalkToday dayOfMonth
				calendar: GregorianCalendar.
	self assert: HebrewCalendar yesterday 
				= (HebrewCalendar convertToHebrewDate: gregorianToday) previous
]

{ #category : #'test days accessing' }
HebrewCalendarDefinitionTest >> testYomHamishi [

	self assert: HebrewCalendar yomHamishi = YomHamishi
]

{ #category : #'test day names' }
HebrewCalendarDefinitionTest >> testYomHamishiName [

	self assert: HebrewCalendar yomHamishiName = 'yom hamishi'
]

{ #category : #'test day positions in week' }
HebrewCalendarDefinitionTest >> testYomHamishiPositionInWeek [

	self assert: HebrewCalendar yomHamishiPositionInWeek = 5
]

{ #category : #'test days accessing' }
HebrewCalendarDefinitionTest >> testYomRevii [

	self assert: HebrewCalendar yomRevii = YomRevii
]

{ #category : #'test day names' }
HebrewCalendarDefinitionTest >> testYomReviiName [

	self assert: HebrewCalendar yomReviiName = 'yom revi`i'
]

{ #category : #'test day positions in week' }
HebrewCalendarDefinitionTest >> testYomReviiPositionInWeek [

	self assert: HebrewCalendar yomReviiPositionInWeek = 4
]

{ #category : #'test days accessing' }
HebrewCalendarDefinitionTest >> testYomRishon [

	self assert: HebrewCalendar yomRishon = YomRishon
]

{ #category : #'test day names' }
HebrewCalendarDefinitionTest >> testYomRishonName [

	self assert: HebrewCalendar yomRishonName = 'yom rishon'
]

{ #category : #'test day positions in week' }
HebrewCalendarDefinitionTest >> testYomRishonPositionInWeek [

	self assert: HebrewCalendar yomRishonPositionInWeek = 1
]

{ #category : #'test days accessing' }
HebrewCalendarDefinitionTest >> testYomShabbat [

	self assert: HebrewCalendar yomShabbat = YomShabbat
]

{ #category : #'test day names' }
HebrewCalendarDefinitionTest >> testYomShabbatName [

	self assert: HebrewCalendar yomShabbatName = 'yom shabbat'
]

{ #category : #'test day positions in week' }
HebrewCalendarDefinitionTest >> testYomShabbatPositionInWeek [

	self assert: HebrewCalendar yomShabbatPositionInWeek = 7
]

{ #category : #'test days accessing' }
HebrewCalendarDefinitionTest >> testYomShelishi [

	self assert: HebrewCalendar yomShelishi = YomShelishi
]

{ #category : #'test day names' }
HebrewCalendarDefinitionTest >> testYomShelishiName [

	self assert: HebrewCalendar yomShelishiName = 'yom shelishi'
]

{ #category : #'test day positions in week' }
HebrewCalendarDefinitionTest >> testYomShelishiPositionInWeek [

	self assert: HebrewCalendar yomShelishiPositionInWeek = 3
]

{ #category : #'test days accessing' }
HebrewCalendarDefinitionTest >> testYomSheni [

	self assert: HebrewCalendar yomSheni = YomSheni
]

{ #category : #'test day names' }
HebrewCalendarDefinitionTest >> testYomSheniName [

	self assert: HebrewCalendar yomSheniName = 'yom sheni'
]

{ #category : #'test day positions in week' }
HebrewCalendarDefinitionTest >> testYomSheniPositionInWeek [

	self assert: HebrewCalendar yomSheniPositionInWeek = 2
]

{ #category : #'test days accessing' }
HebrewCalendarDefinitionTest >> testYomShishi [

	self assert: HebrewCalendar yomShishi = YomShishi
]

{ #category : #'test day names' }
HebrewCalendarDefinitionTest >> testYomShishiName [

	self assert: HebrewCalendar yomShishiName = 'yom shishi'
]

{ #category : #'test day positions in week' }
HebrewCalendarDefinitionTest >> testYomShishiPositionInWeek [

	self assert: HebrewCalendar yomShishiPositionInWeek = 6
]
