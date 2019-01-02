Class {
	#name : #IslamicCalendarDefinitionTest,
	#superclass : #TestCase,
	#instVars : [
		'months'
	],
	#category : #'Chalten-Islamic-Calendar-Tests'
}

{ #category : #initialization }
IslamicCalendarDefinitionTest >> setUp [ 

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

{ #category : #'test days accessing' }
IslamicCalendarDefinitionTest >> testAmountOfDaysPerWeek [

	self assert: IslamicCalendar amountOfDaysPerWeek = 7
]

{ #category : #'test months accessing' }
IslamicCalendarDefinitionTest >> testAmountOfMonthsInLeapYears [

	self assert: IslamicCalendar amountOfMonthsInLeapYears = 12
]

{ #category : #'test months accessing' }
IslamicCalendarDefinitionTest >> testAmountOfMonthsInNonleapYears [

	self assert: IslamicCalendar amountOfMonthsInNonleapYears = 12
]

{ #category : #'test months accessing' }
IslamicCalendarDefinitionTest >> testAmountOfMonthsPerYear [

	self assert: IslamicCalendar amountOfMonthsPerYear = 12
]

{ #category : #'test converting' }
IslamicCalendarDefinitionTest >> testConvert [

	self assert: (IslamicCalendar convert: January fourteenth, 2005) = (DhuAlHijja third, 1425).
	self assert: (IslamicCalendar convert: March fourteenth, 2005) = (Safar third, 1426).
	self assert: (IslamicCalendar convert: September eighteenth, 1999) = (JumadaII seventh, 1420).
	self assert: (IslamicCalendar convert: October twentyfifth, 2008) = (Shawwal twentyfourth, 1429).
	self assert: (IslamicCalendar convert: December fifteenth, 2015) = (RabiI third, 1437).
	
	self assert: (IslamicCalendar convert: (January fourteenth, 2005 at: TimeOfDay noon)) =
		(DhuAlHijja third, 1425 at: TimeOfDay noon).
	self assert: (IslamicCalendar convert: (March fourteenth, 2005 at: TimeOfDay noon)) =
		(Safar third, 1426 at: TimeOfDay noon).
	self assert: (IslamicCalendar convert: (September eighteenth, 1999 at: TimeOfDay noon)) =
		(JumadaII seventh, 1420 at: TimeOfDay noon).
	self assert: (IslamicCalendar convert: (October twentyfifth, 2008 at: TimeOfDay noon)) =
		(Shawwal twentyfourth, 1429 at: TimeOfDay noon).
	self assert: (IslamicCalendar convert: (December fifteenth, 2015 at: TimeOfDay noon)) =
		(RabiI third, 1437 at: TimeOfDay noon).
	
	self
		should: [ IslamicCalendar convert: 1 ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex description = 'Error: 1 can`t be converted to Date nor DateTime' ]
]

{ #category : #'test converting' }
IslamicCalendarDefinitionTest >> testConvertToSmalltalkDate [

	| islamicDate smalltalkDate |

	islamicDate := Safar twentyfirst, 1430.
	smalltalkDate := Date newDay: 17 month: 2 year: 2009.
	self assert: (IslamicCalendar convertToSmalltalkDate: islamicDate) = smalltalkDate
]

{ #category : #'test dates accessing' }
IslamicCalendarDefinitionTest >> testCurrentDayOfMonth [
	| smalltalkToday gregorianToday |
	smalltalkToday := Date today.
	gregorianToday := FixedDate 
				yearNumber: smalltalkToday year
				monthNumber: smalltalkToday monthIndex
				dayNumber: smalltalkToday dayOfMonth
				calendar: GregorianCalendar.
	self assert: IslamicCalendar currentDayOfMonth 
				= (IslamicCalendar convertToIslamicDate: gregorianToday) dayOfMonth
]

{ #category : #'test dates accessing' }
IslamicCalendarDefinitionTest >> testCurrentMonth [
	| smalltalkToday gregorianToday |
	smalltalkToday := Date today.
	gregorianToday := FixedDate 
				yearNumber: smalltalkToday year
				monthNumber: smalltalkToday monthIndex
				dayNumber: smalltalkToday dayOfMonth
				calendar: GregorianCalendar.
	self assert: IslamicCalendar currentMonth 
				= (IslamicCalendar convertToIslamicDate: gregorianToday) month
]

{ #category : #'test dates accessing' }
IslamicCalendarDefinitionTest >> testCurrentMonthOfYear [
	| smalltalkToday gregorianToday |
	smalltalkToday := Date today.
	gregorianToday := FixedDate 
				yearNumber: smalltalkToday year
				monthNumber: smalltalkToday monthIndex
				dayNumber: smalltalkToday dayOfMonth
				calendar: GregorianCalendar.
	self assert: IslamicCalendar currentMonthOfYear 
				= (IslamicCalendar convertToIslamicDate: gregorianToday) monthOfYear
]

{ #category : #'test dates accessing' }
IslamicCalendarDefinitionTest >> testCurrentYear [
	| smalltalkToday gregorianToday |
	smalltalkToday := Date today.
	gregorianToday := FixedDate 
				yearNumber: smalltalkToday year
				monthNumber: smalltalkToday monthIndex
				dayNumber: smalltalkToday dayOfMonth
				calendar: GregorianCalendar.
	self assert: IslamicCalendar currentYear 
				= (IslamicCalendar convertToIslamicDate: gregorianToday) year
]

{ #category : #'test dates accessing' }
IslamicCalendarDefinitionTest >> testDateFromFixed [
	| muharramThirdOf1 muharramSeventhOf1 muharramThirdOf2 rabiISecondOf4 muharramThirdOf5 |
	muharramThirdOf1 := Muharram third , 1.
	muharramSeventhOf1 := Muharram seventh , 1.
	muharramThirdOf2 := Muharram third , 2.
	rabiISecondOf4 := RabiI second , 4.
	muharramThirdOf5 := Muharram third , 5.
	self 
		assert: (IslamicCalendar dateFromNumberOfDays: 227017) = muharramThirdOf1.
	self 
		assert: (IslamicCalendar dateFromNumberOfDays: 227021) = muharramSeventhOf1.
	self 
		assert: (IslamicCalendar dateFromNumberOfDays: 227371) = muharramThirdOf2.
	self 
		assert: (IslamicCalendar dateFromNumberOfDays: 228138) = rabiISecondOf4.
	self 
		assert: (IslamicCalendar dateFromNumberOfDays: 228434) = muharramThirdOf5
]

{ #category : #'test days accessing' }
IslamicCalendarDefinitionTest >> testDayNamed [

	self
		assert: (IslamicCalendar dayNamed: 'yaum al-ahad') = YaumAlAhad;
		assert: (IslamicCalendar dayNamed: 'yaum al-ithnayna') = YaumAlIthnayna;
		assert: (IslamicCalendar dayNamed: 'yaum ath-thalatha') = YaumAthThalatha;
		assert: (IslamicCalendar dayNamed: 'yaum al-arba`a`') = YaumAlArbaa;
		assert: (IslamicCalendar dayNamed: 'yaum al-hamis') = YaumAlHamis;
		assert: (IslamicCalendar dayNamed: 'yaum al-jum`a') = YaumAlJuma;
		assert: (IslamicCalendar dayNamed: 'yaum as-sabt') = YaumAsSabt
]

{ #category : #'test days accessing' }
IslamicCalendarDefinitionTest >> testDayOf [

	self assert: (IslamicCalendar dayOf: Muharram twentysecond, 1435) = YaumAthThalatha
]

{ #category : #'test days accessing' }
IslamicCalendarDefinitionTest >> testDayPositionedInWeek [

	self
		assert: (IslamicCalendar dayPositionedInWeek: 1) = YaumAlAhad;
		assert: (IslamicCalendar dayPositionedInWeek: 2) = YaumAlIthnayna;
		assert: (IslamicCalendar dayPositionedInWeek: 3) = YaumAthThalatha;
		assert: (IslamicCalendar dayPositionedInWeek: 4) = YaumAlArbaa;
		assert: (IslamicCalendar dayPositionedInWeek: 5) = YaumAlHamis;
		assert: (IslamicCalendar dayPositionedInWeek: 6) = YaumAlJuma;
		assert: (IslamicCalendar dayPositionedInWeek: 7) = YaumAsSabt
]

{ #category : #'test days accessing' }
IslamicCalendarDefinitionTest >> testDaysFromEpochTo [
	| muharramFirstOf0 muharramFirstOf1 muharramSecondOf1 muharramFifteenthOf1 muharramFirstOf2 muharramFirstOf5 |
	muharramFirstOf0 := Muharram first , 0.
	muharramFirstOf1 := Muharram first , 1.
	muharramSecondOf1 := Muharram second , 1.
	muharramFifteenthOf1 := Muharram fifteenth , 1.
	muharramFirstOf2 := Muharram first , 2.
	muharramFirstOf5 := Muharram first , 5.
	self assert: (IslamicCalendar numberOfDaysFromEpochTo: muharramFirstOf0) = 226660 daysMeasure.
	self assert: (IslamicCalendar numberOfDaysFromEpochTo: muharramFirstOf1) = 227014 daysMeasure.
	self assert: (IslamicCalendar numberOfDaysFromEpochTo: muharramSecondOf1) = 227015 daysMeasure.
	self assert: (IslamicCalendar numberOfDaysFromEpochTo: muharramFifteenthOf1) = 227028 daysMeasure.
	self assert: (IslamicCalendar numberOfDaysFromEpochTo: muharramFirstOf2) = 227368 daysMeasure.
	self assert: (IslamicCalendar numberOfDaysFromEpochTo: muharramFirstOf5) = 228431 daysMeasure
]

{ #category : #'test global variables' }
IslamicCalendarDefinitionTest >> testDaysGlobalVariables [

	self
		assert: YaumAlAhad = IslamicCalendar yaumAlAhad;
		assert: YaumAlIthnayna = IslamicCalendar yaumAlIthnayna;
		assert: YaumAthThalatha = IslamicCalendar yaumAthThalatha;
		assert: YaumAlArbaa = IslamicCalendar yaumAlArbaa;
		assert: YaumAlHamis = IslamicCalendar yaumAlHamis;
		assert: YaumAlJuma = IslamicCalendar yaumAlJuma;
		assert: YaumAsSabt = IslamicCalendar yaumAsSabt
]

{ #category : #'test months accessing' }
IslamicCalendarDefinitionTest >> testDhuAlHijja [

	self assert: IslamicCalendar dhuAlHijja = DhuAlHijja
]

{ #category : #'test month names' }
IslamicCalendarDefinitionTest >> testDhuAlHijjaName [

	self assert: IslamicCalendar dhuAlHijjaName = 'Dhu al-Hijja'
]

{ #category : #'test month numbers' }
IslamicCalendarDefinitionTest >> testDhuAlHijjaNumber [

	self assert: IslamicCalendar dhuAlHijjaNumber = 12
]

{ #category : #'test months accessing' }
IslamicCalendarDefinitionTest >> testDhuAlQada [

	self assert: IslamicCalendar dhuAlQada = DhuAlQada
]

{ #category : #'test month names' }
IslamicCalendarDefinitionTest >> testDhuAlQadaName [

	self assert: IslamicCalendar dhuAlQadaName = 'Dhu al-Qa`da'
]

{ #category : #'test month numbers' }
IslamicCalendarDefinitionTest >> testDhuAlQadaNumber [

	self assert: IslamicCalendar dhuAlQadaNumber = 11
]

{ #category : #'test year querying' }
IslamicCalendarDefinitionTest >> testDistanceInYearsFromTo [

	self assert: (IslamicCalendar
		distanceInYearsFrom: 1435 asIslamicYear
		to: 1437 asIslamicYear) = 2 yearsMeasure
]

{ #category : #'test accessing' }
IslamicCalendarDefinitionTest >> testEpoch [

	self assert: IslamicCalendar epoch = 227015
]

{ #category : #'test months accessing' }
IslamicCalendarDefinitionTest >> testFirstMonth [

	self assert: IslamicCalendar firstMonth = Muharram
]

{ #category : #'test month of year accessing' }
IslamicCalendarDefinitionTest >> testFirstMonthOf [
	| year |
	year := 1428 asIslamicYear.
	self assert: (IslamicCalendar firstMonthOf: year) = (Muharram , 1428)
]

{ #category : #'test dates accessing' }
IslamicCalendarDefinitionTest >> testFixedFromDate [
	| muharramFirstOf1 dhuAlQadaTwelveOf1945 |
	muharramFirstOf1 := Muharram first , 1.
	dhuAlQadaTwelveOf1945 := DhuAlQada twelfth , 1945.
	self
		assert: (IslamicCalendar numberOfDaysFromDate: muharramFirstOf1) = 227015;
		assert: (IslamicCalendar numberOfDaysFromDate: dhuAlQadaTwelveOf1945) 
					= 916210
]

{ #category : #'test month testing' }
IslamicCalendarDefinitionTest >> testIsDhuAlHijja [

	self assert: (IslamicCalendar isDhuAlHijja: DhuAlHijja)
]

{ #category : #'test month testing' }
IslamicCalendarDefinitionTest >> testIsDhuAlQada [

	self assert: (IslamicCalendar isDhuAlQada: DhuAlQada)
]

{ #category : #'test year testing' }
IslamicCalendarDefinitionTest >> testIsFirstMonthOfYear [

	self assert: (IslamicCalendar isFirstMonthOfYear: Muharram).
	self deny: (IslamicCalendar isFirstMonthOfYear: Ramadan).
	self deny: (IslamicCalendar isFirstMonthOfYear: DhuAlHijja)
]

{ #category : #'test month testing' }
IslamicCalendarDefinitionTest >> testIsJumadaI [

	self assert: (IslamicCalendar isJumadaI: JumadaI)
]

{ #category : #'test month testing' }
IslamicCalendarDefinitionTest >> testIsJumadaII [

	self assert: (IslamicCalendar isJumadaII: JumadaII)
]

{ #category : #'test month testing' }
IslamicCalendarDefinitionTest >> testIsMuharram [

	self assert: (IslamicCalendar isMuharram: Muharram)
]

{ #category : #'test month testing' }
IslamicCalendarDefinitionTest >> testIsRabiI [

	self assert: (IslamicCalendar isRabiI: RabiI)
]

{ #category : #'test month testing' }
IslamicCalendarDefinitionTest >> testIsRabiII [

	self assert: (IslamicCalendar isRabiII: RabiII)
]

{ #category : #'test month testing' }
IslamicCalendarDefinitionTest >> testIsRajab [

	self assert: (IslamicCalendar isRajab: Rajab)
]

{ #category : #'test month testing' }
IslamicCalendarDefinitionTest >> testIsRamadan [

	self assert: (IslamicCalendar isRamadan: Ramadan)
]

{ #category : #'test month testing' }
IslamicCalendarDefinitionTest >> testIsSafar [

	self assert: (IslamicCalendar isSafar: Safar)
]

{ #category : #'test month testing' }
IslamicCalendarDefinitionTest >> testIsShaban [

	self assert: (IslamicCalendar isShaban: Shaban)
]

{ #category : #'test month testing' }
IslamicCalendarDefinitionTest >> testIsShawwal [

	self assert: (IslamicCalendar isShawwal: Shawwal)
]

{ #category : #'test day testing' }
IslamicCalendarDefinitionTest >> testIsYaumAlAhad [

	self assert: (IslamicCalendar isYaumAlAhad: YaumAlAhad)
]

{ #category : #'test day testing' }
IslamicCalendarDefinitionTest >> testIsYaumAlArbaa [

	self assert: (IslamicCalendar isYaumAlArbaa: YaumAlArbaa)
]

{ #category : #'test day testing' }
IslamicCalendarDefinitionTest >> testIsYaumAlHamis [

	self assert: (IslamicCalendar isYaumAlHamis: YaumAlHamis)
]

{ #category : #'test day testing' }
IslamicCalendarDefinitionTest >> testIsYaumAlIthnayna [

	self assert: (IslamicCalendar isYaumAlIthnayna: YaumAlIthnayna)
]

{ #category : #'test day testing' }
IslamicCalendarDefinitionTest >> testIsYaumAlJuma [

	self assert: (IslamicCalendar isYaumAlJuma: YaumAlJuma)
]

{ #category : #'test day testing' }
IslamicCalendarDefinitionTest >> testIsYaumAsSabt [

	self assert: (IslamicCalendar isYaumAsSabt: YaumAsSabt)
]

{ #category : #'test day testing' }
IslamicCalendarDefinitionTest >> testIsYaumAthThalatha [

	self assert: (IslamicCalendar isYaumAthThalatha: YaumAthThalatha)
]

{ #category : #'test year testing' }
IslamicCalendarDefinitionTest >> testIsYearNumberLeap [

	self
		assert: (IslamicCalendar isYearNumberLeap: -4);
		assert: (IslamicCalendar isYearNumberLeap: 2);
		assert: (IslamicCalendar isYearNumberLeap: 5);
		assert: (IslamicCalendar isYearNumberLeap: 7);
		assert: (IslamicCalendar isYearNumberLeap: 10);
		assert: (IslamicCalendar isYearNumberLeap: 13);
		assert: (IslamicCalendar isYearNumberLeap: 16);
		assert: (IslamicCalendar isYearNumberLeap: 18);
		assert: (IslamicCalendar isYearNumberLeap: 21);
		assert: (IslamicCalendar isYearNumberLeap: 24);
		assert: (IslamicCalendar isYearNumberLeap: 26);
		assert: (IslamicCalendar isYearNumberLeap: 29);
		assert: (IslamicCalendar isYearNumberLeap: 1428).

	self
		deny: (IslamicCalendar isYearNumberLeap: -3);
		deny: (IslamicCalendar isYearNumberLeap: 195);
		deny: (IslamicCalendar isYearNumberLeap: 1400);
		deny: (IslamicCalendar isYearNumberLeap: 1429)
]

{ #category : #'test months accessing' }
IslamicCalendarDefinitionTest >> testJumadaI [

	self assert: IslamicCalendar jumadaI = JumadaI
]

{ #category : #'test months accessing' }
IslamicCalendarDefinitionTest >> testJumadaII [

	self assert: IslamicCalendar jumadaII = JumadaII
]

{ #category : #'test month names' }
IslamicCalendarDefinitionTest >> testJumadaIIName [

	self assert: IslamicCalendar jumadaIIName = 'Jumada II (Jumada al-Ahira)'
]

{ #category : #'test month numbers' }
IslamicCalendarDefinitionTest >> testJumadaIINumber [

	self assert: IslamicCalendar jumadaIINumber = 6
]

{ #category : #'test month names' }
IslamicCalendarDefinitionTest >> testJumadaIName [

	self assert: IslamicCalendar jumadaIName = 'Jumada I (Jumada al-Ula)'
]

{ #category : #'test month numbers' }
IslamicCalendarDefinitionTest >> testJumadaINumber [

	self assert: IslamicCalendar jumadaINumber = 5
]

{ #category : #'test months accessing' }
IslamicCalendarDefinitionTest >> testLastMonth [

	self assert: IslamicCalendar lastMonth = DhuAlHijja
]

{ #category : #'test month of year accessing' }
IslamicCalendarDefinitionTest >> testLastMonthOf [
	| year |
	year := 1428 asIslamicYear.
	self assert: (IslamicCalendar lastMonthOf: year) = (DhuAlHijja , 1428)
]

{ #category : #'test days accessing' }
IslamicCalendarDefinitionTest >> testMaximumNumberOfDaysInOneYear [

	self assert: IslamicCalendar maximumNumberOfDaysInOneYear = 355 daysMeasure
]

{ #category : #'test months accessing' }
IslamicCalendarDefinitionTest >> testMonthNamed [

	self
		assert: (IslamicCalendar monthNamed: 'Muharram') = Muharram;
		assert: (IslamicCalendar monthNamed: 'Safar') = Safar;
		assert: (IslamicCalendar monthNamed: 'Rabi` I (Rabi` al-Awwal)') = RabiI;
		assert: (IslamicCalendar monthNamed: 'Rabi` II (Rabi` al-Ahir)') = RabiII;
		assert: (IslamicCalendar monthNamed: 'Jumada I (Jumada al-Ula)') = JumadaI;
		assert: (IslamicCalendar monthNamed: 'Jumada II (Jumada al-Ahira)') = JumadaII;
		assert: (IslamicCalendar monthNamed: 'Rajab') = Rajab;
		assert: (IslamicCalendar monthNamed: 'Sha`ban') = Shaban;
		assert: (IslamicCalendar monthNamed: 'Ramadan') = Ramadan;
		assert: (IslamicCalendar monthNamed: 'Shawwal') = Shawwal;
		assert: (IslamicCalendar monthNamed: 'Dhu al-Qa`da') = DhuAlQada;
		assert: (IslamicCalendar monthNamed: 'Dhu al-Hijja') = DhuAlHijja.
		
	self
		should: [ GregorianCalendar monthNamed: 'invalid name' ]
		raise: InvalidMonthNameException
		withExceptionDo: [ :ex | self assert: ex description = 'invalid name is an invalid name for a month' ]
]

{ #category : #'test months accessing' }
IslamicCalendarDefinitionTest >> testMonthNumbered [

	self
		assert: (IslamicCalendar monthNumbered: 1) = Muharram;
		assert: (IslamicCalendar monthNumbered: 2) = Safar;
		assert: (IslamicCalendar monthNumbered: 3) = RabiI;
		assert: (IslamicCalendar monthNumbered: 4) = RabiII;
		assert: (IslamicCalendar monthNumbered: 5) = JumadaI;
		assert: (IslamicCalendar monthNumbered: 6) = JumadaII;
		assert: (IslamicCalendar monthNumbered: 7) = Rajab;
		assert: (IslamicCalendar monthNumbered: 8) = Shaban;
		assert: (IslamicCalendar monthNumbered: 9) = Ramadan;
		assert: (IslamicCalendar monthNumbered: 10) = Shawwal;
		assert: (IslamicCalendar monthNumbered: 11) = DhuAlQada;
		assert: (IslamicCalendar monthNumbered: 12) = DhuAlHijja
]

{ #category : #'test months accessing' }
IslamicCalendarDefinitionTest >> testMonthsForLeapYears [

	self assert: IslamicCalendar monthsForLeapYears = months
]

{ #category : #'test months accessing' }
IslamicCalendarDefinitionTest >> testMonthsForNonleapYears [

	self assert: IslamicCalendar monthsForNonleapYears = months
]

{ #category : #'test global variables' }
IslamicCalendarDefinitionTest >> testMonthsGlobalVariables [

	self
		assert: Muharram = IslamicCalendar muharram;
		assert: Safar = IslamicCalendar safar;
		assert: RabiI = IslamicCalendar rabiI;
		assert: RabiII = IslamicCalendar rabiII;
		assert: JumadaI = IslamicCalendar jumadaI;
		assert: JumadaII = IslamicCalendar jumadaII;
		assert: Rajab = IslamicCalendar rajab;
		assert: Shaban = IslamicCalendar shaban;
		assert: Ramadan = IslamicCalendar ramadan;
		assert: Shawwal = IslamicCalendar shawwal;
		assert: DhuAlQada = IslamicCalendar dhuAlQada;
		assert: DhuAlHijja = IslamicCalendar dhuAlHijja
]

{ #category : #'test months accessing' }
IslamicCalendarDefinitionTest >> testMuharram [

	self assert: IslamicCalendar muharram = Muharram
]

{ #category : #'test month names' }
IslamicCalendarDefinitionTest >> testMuharramName [

	self assert: IslamicCalendar muharramName = 'Muharram'
]

{ #category : #'test month numbers' }
IslamicCalendarDefinitionTest >> testMuharramNumber [

	self assert: IslamicCalendar muharramNumber = 1
]

{ #category : #'test dates accessing' }
IslamicCalendarDefinitionTest >> testNow [
	| now nowInOneSecond |
	now := IslamicCalendar now.
	(Delay forSeconds: 1) wait.
	nowInOneSecond := IslamicCalendar now.
	self assert: now < nowInOneSecond.
	self assert: ((now distanceTo: nowInOneSecond) convertTo: TimeUnits second) truncated = 1 secondMeasure
]

{ #category : #'test days accessing' }
IslamicCalendarDefinitionTest >> testNumberOfDaysIN [

	self assert: (IslamicCalendar numberOfDaysIn: 1435 asIslamicYear) = 354 daysMeasure
]

{ #category : #'test days accessing' }
IslamicCalendarDefinitionTest >> testNumberOfDaysPerWeek [
	self assert: IslamicCalendar numberOfDaysPerWeek = 7 daysMeasure
]

{ #category : #'test months accessing' }
IslamicCalendarDefinitionTest >> testNumberOfMonthsPerYear [
	self assert: IslamicCalendar numberOfMonthsPerYear = 12 monthsMeasure
]

{ #category : #'test printing' }
IslamicCalendarDefinitionTest >> testPrintString [

	self assert: IslamicCalendar printString  = 'Islamic Calendar'
]

{ #category : #'test months accessing' }
IslamicCalendarDefinitionTest >> testRabiI [

	self assert: IslamicCalendar rabiI = RabiI
]

{ #category : #'test months accessing' }
IslamicCalendarDefinitionTest >> testRabiII [

	self assert: IslamicCalendar rabiII = RabiII
]

{ #category : #'test month names' }
IslamicCalendarDefinitionTest >> testRabiIIName [

	self assert: IslamicCalendar rabiIIName = 'Rabi` II (Rabi` al-Ahir)'
]

{ #category : #'test month numbers' }
IslamicCalendarDefinitionTest >> testRabiIINumber [

	self assert: IslamicCalendar rabiIINumber = 4
]

{ #category : #'test month names' }
IslamicCalendarDefinitionTest >> testRabiIName [

	self assert: IslamicCalendar rabiIName = 'Rabi` I (Rabi` al-Awwal)'
]

{ #category : #'test month numbers' }
IslamicCalendarDefinitionTest >> testRabiINumber [

	self assert: IslamicCalendar rabiINumber = 3
]

{ #category : #'test months accessing' }
IslamicCalendarDefinitionTest >> testRajab [

	self assert: IslamicCalendar rajab = Rajab
]

{ #category : #'test month names' }
IslamicCalendarDefinitionTest >> testRajabName [

	self assert: IslamicCalendar rajabName = 'Rajab'
]

{ #category : #'test month numbers' }
IslamicCalendarDefinitionTest >> testRajabNumber [

	self assert: IslamicCalendar rajabNumber = 7
]

{ #category : #'test months accessing' }
IslamicCalendarDefinitionTest >> testRamadan [

	self assert: IslamicCalendar ramadan = Ramadan
]

{ #category : #'test month names' }
IslamicCalendarDefinitionTest >> testRamadanName [

	self assert: IslamicCalendar ramadanName = 'Ramadan'
]

{ #category : #'test month numbers' }
IslamicCalendarDefinitionTest >> testRamadanNumber [

	self assert: IslamicCalendar ramadanNumber = 9
]

{ #category : #'test months accessing' }
IslamicCalendarDefinitionTest >> testSafar [

	self assert: IslamicCalendar safar = Safar
]

{ #category : #'test month names' }
IslamicCalendarDefinitionTest >> testSafarName [

	self assert: IslamicCalendar safarName = 'Safar'
]

{ #category : #'test month numbers' }
IslamicCalendarDefinitionTest >> testSafarNumber [

	self assert: IslamicCalendar safarNumber = 2
]

{ #category : #'test months accessing' }
IslamicCalendarDefinitionTest >> testShaban [

	self assert: IslamicCalendar shaban = Shaban
]

{ #category : #'test month names' }
IslamicCalendarDefinitionTest >> testShabanName [

	self assert: IslamicCalendar shabanName = 'Sha`ban'
]

{ #category : #'test month numbers' }
IslamicCalendarDefinitionTest >> testShabanNumber [

	self assert: IslamicCalendar shabanNumber = 8
]

{ #category : #'test months accessing' }
IslamicCalendarDefinitionTest >> testShawwal [

	self assert: IslamicCalendar shawwal = Shawwal
]

{ #category : #'test month names' }
IslamicCalendarDefinitionTest >> testShawwalName [

	self assert: IslamicCalendar shawwalName = 'Shawwal'
]

{ #category : #'test month numbers' }
IslamicCalendarDefinitionTest >> testShawwalNumber [

	self assert: IslamicCalendar shawwalNumber = 10
]

{ #category : #'test days accessing' }
IslamicCalendarDefinitionTest >> testSinceFirstDayOfWeek [
	| currentDay zeroDays |
	zeroDays := 0 daysMeasure.
	currentDay := IslamicCalendar yaumAlAhad.
	(zeroDays to: 6 daysMeasure)
		do: [ :aNumberOfDays | 
			self assert: (IslamicCalendar sinceFirstDayOfWeek: aNumberOfDays) = currentDay.
			currentDay := currentDay next ]
]

{ #category : #'test days accessing' }
IslamicCalendarDefinitionTest >> testSinceYaumAlAhad [
	| currentDay zeroDays |
	zeroDays := 0 daysMeasure.
	currentDay := IslamicCalendar yaumAlAhad.
	(zeroDays to: 6 daysMeasure)
		do: [ :aNumberOfDays | 
			self assert: (IslamicCalendar sinceYaumAlAhad: aNumberOfDays) = currentDay.
			currentDay := currentDay next ]
]

{ #category : #'test dates accessing' }
IslamicCalendarDefinitionTest >> testToday [
	| smalltalkToday gregorianToday |
	smalltalkToday := Date today.
	gregorianToday := FixedDate 
				yearNumber: smalltalkToday year
				monthNumber: smalltalkToday monthIndex
				dayNumber: smalltalkToday dayOfMonth
				calendar: GregorianCalendar.
	self assert: IslamicCalendar today 
				= (IslamicCalendar convertToIslamicDate: gregorianToday)
]

{ #category : #'test dates accessing' }
IslamicCalendarDefinitionTest >> testTomorrow [
	| smalltalkToday gregorianToday |
	smalltalkToday := Date today.
	gregorianToday := FixedDate 
				yearNumber: smalltalkToday year
				monthNumber: smalltalkToday monthIndex
				dayNumber: smalltalkToday dayOfMonth
				calendar: GregorianCalendar.
	self assert: IslamicCalendar tomorrow 
				= (IslamicCalendar convertToIslamicDate: gregorianToday) next
]

{ #category : #'test days accessing' }
IslamicCalendarDefinitionTest >> testYaumAlAhad [

	self assert: IslamicCalendar yaumAlAhad = YaumAlAhad
]

{ #category : #'test day names' }
IslamicCalendarDefinitionTest >> testYaumAlAhadName [

	self assert: IslamicCalendar yaumAlAhadName = 'yaum al-ahad'
]

{ #category : #'test day positions in week' }
IslamicCalendarDefinitionTest >> testYaumAlAhadPositionInWeek [

	self assert: IslamicCalendar yaumAlAhadPositionInWeek = 1
]

{ #category : #'test days accessing' }
IslamicCalendarDefinitionTest >> testYaumAlArbaa [

	self assert: IslamicCalendar yaumAlArbaa = YaumAlArbaa
]

{ #category : #'test day names' }
IslamicCalendarDefinitionTest >> testYaumAlArbaaName [

	self assert: IslamicCalendar yaumAlArbaaName = 'yaum al-arba`a`'
]

{ #category : #'test day positions in week' }
IslamicCalendarDefinitionTest >> testYaumAlArbaaPositionInWeek [

	self assert: IslamicCalendar yaumAlArbaaPositionInWeek = 4
]

{ #category : #'test days accessing' }
IslamicCalendarDefinitionTest >> testYaumAlHamis [

	self assert: IslamicCalendar yaumAlHamis = YaumAlHamis
]

{ #category : #'test day names' }
IslamicCalendarDefinitionTest >> testYaumAlHamisName [

	self assert: IslamicCalendar yaumAlHamisName = 'yaum al-hamis'
]

{ #category : #'test day positions in week' }
IslamicCalendarDefinitionTest >> testYaumAlHamisPositionInWeek [

	self assert: IslamicCalendar yaumAlHamisPositionInWeek = 5
]

{ #category : #'test days accessing' }
IslamicCalendarDefinitionTest >> testYaumAlIthnayna [

	self assert: IslamicCalendar yaumAlIthnayna = YaumAlIthnayna
]

{ #category : #'test day names' }
IslamicCalendarDefinitionTest >> testYaumAlIthnaynaName [

	self assert: IslamicCalendar yaumAlIthnaynaName = 'yaum al-ithnayna'
]

{ #category : #'test day positions in week' }
IslamicCalendarDefinitionTest >> testYaumAlIthnaynaPositionInWeek [

	self assert: IslamicCalendar yaumAlIthnaynaPositionInWeek = 2
]

{ #category : #'test days accessing' }
IslamicCalendarDefinitionTest >> testYaumAlJuma [

	self assert: IslamicCalendar yaumAlJuma = YaumAlJuma
]

{ #category : #'test day names' }
IslamicCalendarDefinitionTest >> testYaumAlJumaName [

	self assert: IslamicCalendar yaumAlJumaName = 'yaum al-jum`a'
]

{ #category : #'test day positions in week' }
IslamicCalendarDefinitionTest >> testYaumAlJumaPositionInWeek [

	self assert: IslamicCalendar yaumAlJumaPositionInWeek = 6
]

{ #category : #'test days accessing' }
IslamicCalendarDefinitionTest >> testYaumAsSabt [

	self assert: IslamicCalendar yaumAsSabt = YaumAsSabt
]

{ #category : #'test day names' }
IslamicCalendarDefinitionTest >> testYaumAsSabtName [

	self assert: IslamicCalendar yaumAsSabtName = 'yaum as-sabt'
]

{ #category : #'test day positions in week' }
IslamicCalendarDefinitionTest >> testYaumAsSabtPositionInWeek [

	self assert: IslamicCalendar yaumAsSabtPositionInWeek = 7
]

{ #category : #'test days accessing' }
IslamicCalendarDefinitionTest >> testYaumAtThalatha [

	self assert: IslamicCalendar yaumAthThalatha = YaumAthThalatha
]

{ #category : #'test day names' }
IslamicCalendarDefinitionTest >> testYaumAthThalathaName [

	self assert: IslamicCalendar yaumAthThalathaName = 'yaum ath-thalatha'
]

{ #category : #'test day positions in week' }
IslamicCalendarDefinitionTest >> testYaumAthThalathaPositionInWeek [

	self assert: IslamicCalendar yaumAthThalathaPositionInWeek = 3
]

{ #category : #'test dates accessing' }
IslamicCalendarDefinitionTest >> testYesterday [
	| smalltalkToday gregorianToday |
	smalltalkToday := Date today.
	gregorianToday := FixedDate 
				yearNumber: smalltalkToday year
				monthNumber: smalltalkToday monthIndex
				dayNumber: smalltalkToday dayOfMonth
				calendar: GregorianCalendar.
	self assert: IslamicCalendar yesterday 
				= (IslamicCalendar convertToIslamicDate: gregorianToday) previous
]
