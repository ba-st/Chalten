Class {
	#name : #IslamicMonthTest,
	#superclass : #TestCase,
	#instVars : [
		'calendar',
		'muharram',
		'safar',
		'rabiI',
		'rabiII',
		'jumadaI',
		'jumadaII',
		'rajab',
		'shaban',
		'ramadan',
		'shawwal',
		'dhuAlQada',
		'dhuAlHijja',
		'zeroMonths',
		'oneMonth',
		'twoMonths',
		'elevenMonths',
		'twelveMonths'
	],
	#category : #'Chalten-Tests-Islamic'
}

{ #category : #accessing }
IslamicMonthTest class >> classUnderTest [

	^ChaltenMonth
]

{ #category : #initialization }
IslamicMonthTest >> setUp [
	calendar := IslamicCalendar.
	muharram := calendar muharram.
	safar := calendar safar.
	rabiI := calendar rabiI.
	rabiII := calendar rabiII.
	jumadaI := calendar jumadaI.
	jumadaII := calendar jumadaII.
	rajab := calendar rajab.
	shaban := calendar shaban.
	ramadan := calendar ramadan.
	shawwal := calendar shawwal.
	dhuAlQada := calendar dhuAlQada.
	dhuAlHijja := calendar dhuAlHijja.
	zeroMonths := 0 monthsMeasure.
	oneMonth := 1 monthMeasure.
	twoMonths := 2 monthsMeasure.
	elevenMonths := 11 monthsMeasure.
	twelveMonths := 12 monthsMeasure
]

{ #category : #'test month of year creation' }
IslamicMonthTest >> testComma [

	self assert: (safar, 2003) = (MonthOfYear yearNumber: 2003 monthNumber: 2 calendar: calendar)
]

{ #category : #'test day of month creation' }
IslamicMonthTest >> testDayOfMonthCreation [

	self assert: ramadan first = (DayOfMonth monthNumber: 9 dayNumber: 1 calendar: calendar).
	self assert: ramadan second = (DayOfMonth monthNumber: 9 dayNumber: 2 calendar: calendar).
	self assert: ramadan third = (DayOfMonth monthNumber: 9 dayNumber: 3 calendar: calendar).
	self assert: ramadan fourth = (DayOfMonth monthNumber: 9 dayNumber: 4 calendar: calendar).
	self assert: ramadan fifth = (DayOfMonth monthNumber: 9 dayNumber: 5 calendar: calendar).
	self assert: ramadan sixth = (DayOfMonth monthNumber: 9 dayNumber: 6 calendar: calendar).
	self assert: ramadan seventh = (DayOfMonth monthNumber: 9 dayNumber: 7 calendar: calendar).
	self assert: ramadan eighth = (DayOfMonth monthNumber: 9 dayNumber: 8 calendar: calendar).
	self assert: ramadan ninth = (DayOfMonth monthNumber: 9 dayNumber: 9 calendar: calendar).
	self assert: ramadan tenth = (DayOfMonth monthNumber: 9 dayNumber: 10 calendar: calendar).
	self assert: ramadan eleventh = (DayOfMonth monthNumber: 9 dayNumber: 11 calendar: calendar).
	self assert: ramadan twelfth = (DayOfMonth monthNumber: 9 dayNumber: 12 calendar: calendar).
	self assert: ramadan thirteenth = (DayOfMonth monthNumber: 9 dayNumber: 13 calendar: calendar).
	self assert: ramadan fourteenth = (DayOfMonth monthNumber: 9 dayNumber: 14 calendar: calendar).
	self assert: ramadan fifteenth = (DayOfMonth monthNumber: 9 dayNumber: 15 calendar: calendar).
	self assert: ramadan sixteenth = (DayOfMonth monthNumber: 9 dayNumber: 16 calendar: calendar).
	self assert: ramadan seventeenth = (DayOfMonth monthNumber: 9 dayNumber: 17 calendar: calendar).
	self assert: ramadan eighteenth = (DayOfMonth monthNumber: 9 dayNumber: 18 calendar: calendar).
	self assert: ramadan nineteenth = (DayOfMonth monthNumber: 9 dayNumber: 19 calendar: calendar).
	self assert: ramadan twentieth = (DayOfMonth monthNumber: 9 dayNumber: 20 calendar: calendar).
	self assert: ramadan twentyfirst = (DayOfMonth monthNumber: 9 dayNumber: 21 calendar: calendar).
	self assert: ramadan twentysecond = (DayOfMonth monthNumber: 9 dayNumber: 22 calendar: calendar).
	self assert: ramadan twentythird = (DayOfMonth monthNumber: 9 dayNumber: 23 calendar: calendar).
	self assert: ramadan twentyfourth = (DayOfMonth monthNumber: 9 dayNumber: 24 calendar: calendar).
	self assert: ramadan twentyfifth = (DayOfMonth monthNumber: 9 dayNumber: 25 calendar: calendar).
	self assert: ramadan twentysixth = (DayOfMonth monthNumber: 9 dayNumber: 26 calendar: calendar).
	self assert: ramadan twentyseventh = (DayOfMonth monthNumber: 9 dayNumber: 27 calendar: calendar).
	self assert: ramadan twentyeighth = (DayOfMonth monthNumber: 9 dayNumber: 28 calendar: calendar).
	self assert: ramadan twentyninth = (DayOfMonth monthNumber: 9 dayNumber: 29 calendar: calendar).
	self assert: ramadan thirtieth = (DayOfMonth monthNumber: 9 dayNumber: 30 calendar: calendar)
]

{ #category : #'test accessing' }
IslamicMonthTest >> testDhuAlHijja [

	self assert: dhuAlHijja name = 'Dhu al-Hijja'.
	self assert: dhuAlHijja number = 12
]

{ #category : #'test accessing' }
IslamicMonthTest >> testDhuAlQada [

	self assert: dhuAlQada name = 'Dhu al-Qa`da'.
	self assert: dhuAlQada number = 11
]

{ #category : #'test comparing' }
IslamicMonthTest >> testEqual [

	self assert: muharram = muharram.
	self assert: safar = safar.
	self assert: rabiI = rabiI.
	self assert: rabiII = rabiII.
	self assert: jumadaI = jumadaI.
	self assert: jumadaII = jumadaII.
	self assert: rajab = rajab.
	self assert: shaban = shaban.
	self assert: ramadan = ramadan.
	self assert: shawwal = shawwal.
	self assert: dhuAlQada = dhuAlQada.
	self assert: dhuAlHijja = dhuAlHijja
]

{ #category : #'test accessing' }
IslamicMonthTest >> testFirstDayOfMonth [

	self assert: muharram firstDayOfMonth = Muharram first.
	self assert: safar firstDayOfMonth = Safar first.
	self assert: rabiI firstDayOfMonth = RabiI first.
	self assert: rabiII firstDayOfMonth = RabiII first.
	self assert: jumadaI firstDayOfMonth = JumadaI first.
	self assert: jumadaII firstDayOfMonth = JumadaII first.
	self assert: rajab firstDayOfMonth = Rajab first.
	self assert: shaban firstDayOfMonth = Shaban first.
	self assert: ramadan firstDayOfMonth = Ramadan first.
	self assert: shawwal firstDayOfMonth = Shawwal first.
	self assert: dhuAlQada firstDayOfMonth = DhuAlQada first.
	self assert: dhuAlHijja firstDayOfMonth = DhuAlHijja first
]

{ #category : #'test comparing' }
IslamicMonthTest >> testGreatherThan [

	self assert: safar > muharram.
	self assert: dhuAlHijja > muharram.
	
	self deny: muharram > safar.
	self deny: muharram > dhuAlHijja.
	
	self should: [ muharram > YomHamishi ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: YomHamishi class
				with: YomHamishi
				with: muharram class
				with: muharram) ].
	
	self should: [ muharram >= dhuAlHijja first ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: muharram class
				with: muharram
				with: dhuAlHijja first class
				with: dhuAlHijja first) ]
]

{ #category : #'test comparing' }
IslamicMonthTest >> testHash [

	self assert: muharram hash = muharram hash.
	self assert: safar hash = safar hash.
	self assert: rabiI hash = rabiI hash.
	self assert: rabiII hash = rabiII hash.
	self assert: jumadaI hash = jumadaI hash.
	self assert: jumadaII hash = jumadaII hash.
	self assert: rajab hash = rajab hash.
	self assert: shaban hash = shaban hash.
	self assert: ramadan hash = ramadan hash.
	self assert: shawwal hash = shawwal hash.
	self assert: dhuAlQada hash = dhuAlQada hash.
	self assert: dhuAlHijja hash = dhuAlHijja hash
]

{ #category : #'test comparing' }
IslamicMonthTest >> testIdentity [

	self assert: muharram == muharram.
	self assert: safar == safar.
	self assert: rabiI == rabiI.
	self assert: rabiII == rabiII.
	self assert: jumadaI == jumadaI.
	self assert: jumadaII == jumadaII.
	self assert: rajab == rajab.
	self assert: shaban == shaban.
	self assert: ramadan == ramadan.
	self assert: shawwal == shawwal.
	self assert: dhuAlQada == dhuAlQada.
	self assert: dhuAlHijja == dhuAlHijja.

	self deny: muharram == safar.
	self deny: safar == rabiI.
	self deny: rabiI == rabiII.
	self deny: rabiII == rabiI.
	self deny: jumadaI == jumadaII.
	self deny: jumadaII == jumadaI.
	self deny: rajab == shaban.
	self deny: shaban == ramadan.
	self deny: ramadan == dhuAlQada.
	self deny: shawwal == ramadan.
	self deny: dhuAlQada == dhuAlHijja.
	self deny: dhuAlHijja == dhuAlQada
]

{ #category : #'test testing' }
IslamicMonthTest >> testIs [

	self assert: (Muharram is: muharram).
	self assert: (Safar is: safar).
	self assert: (RabiI is: rabiI).
	self assert: (RabiII is: rabiII).
	self assert: (JumadaI is: jumadaI).
	self assert: (JumadaII is: jumadaII).
	self assert: (Rajab is: rajab).
	self assert: (Shaban is: shaban).
	self assert: (Ramadan is: ramadan).
	self assert: (Shawwal is: shawwal).
	self assert: (DhuAlQada is: dhuAlQada).
	self assert: (DhuAlHijja is: dhuAlHijja)
]

{ #category : #'test accessing' }
IslamicMonthTest >> testJumadaI [

	self assert: jumadaI name = 'Jumada I (Jumada al-Ula)'.
	self assert: jumadaI number = 5
]

{ #category : #'test accessing' }
IslamicMonthTest >> testJumadaII [

	self assert: jumadaII name = 'Jumada II (Jumada al-Ahira)'.
	self assert: jumadaII number = 6
]

{ #category : #'test accessing' }
IslamicMonthTest >> testLastDayNumber [

	self assert: muharram lastDayNumber = 30.
	self assert: safar lastDayNumber = 29.
	self assert: rabiI lastDayNumber = 30.
	self assert: rabiII lastDayNumber = 29.
	self assert: jumadaI lastDayNumber = 30.
	self assert: jumadaII lastDayNumber = 29.
	self assert: rajab lastDayNumber = 30.
	self assert: shaban lastDayNumber = 29.
	self assert: ramadan lastDayNumber = 30.
	self assert: shawwal lastDayNumber = 29.
	self assert: dhuAlQada lastDayNumber = 30.
	self assert: dhuAlHijja lastDayNumber = 30
]

{ #category : #'test accessing' }
IslamicMonthTest >> testLastDayNumberIn [
	| leapYear nonleapYear |
	leapYear := 1428 asIslamicYear.
	nonleapYear := 1427 asIslamicYear.
	self assert: (muharram lastDayNumberIn: leapYear) = 30.
	self assert: (muharram lastDayNumberIn: nonleapYear) = 30.
	self assert: (safar lastDayNumberIn: leapYear) = 29.
	self assert: (safar lastDayNumberIn: nonleapYear) = 29.
	self assert: (rabiI lastDayNumberIn: leapYear) = 30.
	self assert: (rabiI lastDayNumberIn: nonleapYear) = 30.
	self assert: (rabiII lastDayNumberIn: leapYear) = 29.
	self assert: (rabiII lastDayNumberIn: nonleapYear) = 29.
	self assert: (jumadaI lastDayNumberIn: leapYear) = 30.
	self assert: (jumadaI lastDayNumberIn: nonleapYear) = 30.
	self assert: (jumadaII lastDayNumberIn: leapYear) = 29.
	self assert: (jumadaII lastDayNumberIn: nonleapYear) = 29.
	self assert: (rajab lastDayNumberIn: leapYear) = 30.
	self assert: (rajab lastDayNumberIn: nonleapYear) = 30.
	self assert: (shaban lastDayNumberIn: leapYear) = 29.
	self assert: (shaban lastDayNumberIn: nonleapYear) = 29.
	self assert: (ramadan lastDayNumberIn: leapYear) = 30.
	self assert: (ramadan lastDayNumberIn: nonleapYear) = 30.
	self assert: (shawwal lastDayNumberIn: leapYear) = 29.
	self assert: (shawwal lastDayNumberIn: nonleapYear) = 29.
	self assert: (dhuAlQada lastDayNumberIn: leapYear) = 30.
	self assert: (dhuAlQada lastDayNumberIn: nonleapYear) = 30.
	self assert: (dhuAlHijja lastDayNumberIn: leapYear) = 30.
	self assert: (dhuAlHijja lastDayNumberIn: nonleapYear) = 29
]

{ #category : #'test accessing' }
IslamicMonthTest >> testLastDayOfMonth [

	self assert: muharram lastDayOfMonth = Muharram thirtieth.
	self assert: safar lastDayOfMonth = Safar twentyninth.
	self assert: rabiI lastDayOfMonth = RabiI thirtieth.
	self assert: rabiII lastDayOfMonth = RabiII twentyninth.
	self assert: jumadaI lastDayOfMonth = JumadaI thirtieth.
	self assert: jumadaII lastDayOfMonth = JumadaII twentyninth.
	self assert: rajab lastDayOfMonth = Rajab thirtieth.
	self assert: shaban lastDayOfMonth = Shaban twentyninth.
	self assert: ramadan lastDayOfMonth = Ramadan thirtieth.
	self assert: shawwal lastDayOfMonth = Shawwal twentyninth.
	self assert: dhuAlQada lastDayOfMonth = DhuAlQada thirtieth.
	self assert: dhuAlHijja lastDayOfMonth = DhuAlHijja thirtieth
]

{ #category : #'test comparing' }
IslamicMonthTest >> testLessThan [

	self assert: muharram < safar.
	self assert: muharram < dhuAlHijja.
	
	self deny: safar < muharram.
	self deny: dhuAlHijja < muharram.
	
	self should: [ muharram <= YomHamishi ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: YomHamishi class
				with: YomHamishi
				with: muharram class
				with: muharram) ].
	
	self should: [ muharram < dhuAlHijja first ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: muharram class
				with: muharram
				with: dhuAlHijja first class
				with: dhuAlHijja first) ]
]

{ #category : #'test creation' }
IslamicMonthTest >> testMonthCreation [

	| otherMuharram otherSafar otheRabiI otherRabiII otherJumadaI otherJumadaII otherRajab otherShaban
	  otherRamadan ohterShawwal otherDhuAlQada otherDhuAlHijja |

	otherMuharram := calendar createMuharram.
	otherSafar := calendar createSafar.
	otheRabiI := calendar createRabiI.
	otherRabiII := calendar createRabiII.
	otherJumadaI := calendar createJumadaI.
	otherJumadaII := calendar createJumadaII.
	otherRajab := calendar createRajab.
	otherShaban := calendar createShaban.
	otherRamadan := calendar createRamadan.
	ohterShawwal := calendar createShawwal.
	otherDhuAlQada := calendar createDhuAlQada.
	otherDhuAlHijja := calendar createDhuAlHijja.

	self assert: muharram name = otherMuharram name.
	self assert: muharram number = otherMuharram number.
	self assert: safar name = otherSafar name.
	self assert: safar number = otherSafar number.
	self assert: rabiI name = otheRabiI name.
	self assert: rabiI number = otheRabiI number.
	self assert: rabiII name = otherRabiII name.
	self assert: rabiII number = otherRabiII number.
	self assert: jumadaI name = otherJumadaI name.
	self assert: jumadaI number = otherJumadaI number.
	self assert: jumadaII name = otherJumadaII name.
	self assert: jumadaII number = otherJumadaII number.
	self assert: rajab name = otherRajab name.
	self assert: rajab number = otherRajab number.
	self assert: shaban name = otherShaban name.
	self assert: shaban number = otherShaban number.
	self assert: ramadan name = otherRamadan name.
	self assert: ramadan number = otherRamadan number.
	self assert: shawwal name = ohterShawwal name.
	self assert: shawwal number = ohterShawwal number.
	self assert: dhuAlQada name = otherDhuAlQada name.
	self assert: dhuAlQada number = otherDhuAlQada number.
	self assert: dhuAlHijja name = otherDhuAlHijja name.
	self assert: dhuAlHijja number = otherDhuAlHijja number
]

{ #category : #'test querying' }
IslamicMonthTest >> testMonthsFrom [

	| stream |
	
	stream := CircularReadStream on: IslamicCalendar monthsForLeapYears moving: TimeUnits month.
	
	self assert: (stream distanceFrom: muharram to: muharram) = zeroMonths.
	self assert: (stream distanceFrom: safar to: muharram) = elevenMonths.
	self assert: (stream distanceFrom: dhuAlHijja to: muharram) = oneMonth.

	self assert: (stream distanceFrom: muharram to: dhuAlHijja) = elevenMonths.
	self assert: (stream distanceFrom: dhuAlQada to: dhuAlHijja) = oneMonth
]

{ #category : #'test querying' }
IslamicMonthTest >> testMonthsTo [

	| stream |
	
	stream := CircularReadStream on: IslamicCalendar monthsForLeapYears moving: TimeUnits month.
	
	self assert: (stream distanceTo: muharram from: muharram) = zeroMonths.
	self assert: (stream distanceTo: safar from: muharram) = oneMonth.
	self assert: (stream distanceTo: dhuAlHijja from: muharram) = elevenMonths.

	self assert: (stream distanceTo: muharram from: dhuAlHijja) = oneMonth.
	self assert: (stream distanceTo: dhuAlQada from: dhuAlHijja) = elevenMonths
]

{ #category : #'test accessing' }
IslamicMonthTest >> testMuharram [

	self assert: muharram name = 'Muharram'.
	self assert: muharram number = 1
]

{ #category : #'test enumerating' }
IslamicMonthTest >> testNextInLeapYears [

	| stream |
	
	stream := CircularReadStream on: IslamicCalendar monthsForLeapYears moving: TimeUnits month.
	
	self assert: stream next = safar.
	self assert: stream next = rabiI.
	self assert: stream next = rabiII.
	self assert: stream next = jumadaI.
	self assert: stream next = jumadaII.
	self assert: stream next = rajab.
	self assert: stream next = shaban.
	self assert: stream next = ramadan.
	self assert: stream next = shawwal.
	self assert: stream next = dhuAlQada.
	self assert: stream next = dhuAlHijja.
	self assert: stream next = muharram
]

{ #category : #'test enumerating' }
IslamicMonthTest >> testNextInLeapYearsInANumberOfMonths [

	| stream |
	
	stream := CircularReadStream on: IslamicCalendar monthsForLeapYears moving: TimeUnits month.
	
	stream upToEnd.
	self assert: (stream next: oneMonth) = muharram.
	
	stream upToEnd.
	self assert: (stream next: twelveMonths) = dhuAlHijja.
	
	stream upToEnd.
	self assert: (stream next: twelveMonths + oneMonth) = muharram
]

{ #category : #'test enumerating' }
IslamicMonthTest >> testNextInNonleapYears [

	| stream |
	
	stream := CircularReadStream on: IslamicCalendar monthsForNonleapYears moving: TimeUnits month.
	
	self assert: stream next = safar.
	self assert: stream next = rabiI.
	self assert: stream next = rabiII.
	self assert: stream next = jumadaI.
	self assert: stream next = jumadaII.
	self assert: stream next = rajab.
	self assert: stream next = shaban.
	self assert: stream next = ramadan.
	self assert: stream next = shawwal.
	self assert: stream next = dhuAlQada.
	self assert: stream next = dhuAlHijja.
	self assert: stream next = muharram
]

{ #category : #'test enumerating' }
IslamicMonthTest >> testNextInNonleapYearsInANumberOfMonths [

	| stream |
	
	stream := CircularReadStream on: IslamicCalendar monthsForNonleapYears moving: TimeUnits month.
	
	stream upToEnd.
	self assert: (stream next: oneMonth) = muharram.
	
	stream upToEnd.
	self assert: (stream next: twelveMonths) = dhuAlHijja.
	
	stream upToEnd.
	self assert: (stream next: twelveMonths + oneMonth) = muharram
]

{ #category : #'test accessing' }
IslamicMonthTest >> testNumberOfDays [
	self assert: muharram numberOfDays = 30 daysMeasure.
	self assert: safar numberOfDays = 29 daysMeasure.
	self assert: rabiI numberOfDays = 30 daysMeasure.
	self assert: rabiII numberOfDays = 29 daysMeasure.
	self assert: jumadaI numberOfDays = 30 daysMeasure.
	self assert: jumadaII numberOfDays = 29 daysMeasure.
	self assert: rajab numberOfDays = 30 daysMeasure.
	self assert: shaban numberOfDays = 29 daysMeasure.
	self assert: ramadan numberOfDays = 30 daysMeasure.
	self assert: shawwal numberOfDays = 29 daysMeasure.
	self assert: dhuAlQada numberOfDays = 30 daysMeasure.
	self assert: dhuAlHijja numberOfDays = 30 daysMeasure
]

{ #category : #'test accessing' }
IslamicMonthTest >> testNumberOfDaysFromBeginningOfYearIn [
	| leapYear nonleapYear |
	leapYear := 1428 asIslamicYear.
	nonleapYear := 1427 asIslamicYear.
	self assert: (muharram numberOfDaysFromBeginningOfYearIn: leapYear) = 0 daysMeasure.
	self assert: (muharram numberOfDaysFromBeginningOfYearIn: nonleapYear) = 0 daysMeasure.
	self assert: (safar numberOfDaysFromBeginningOfYearIn: leapYear) = 30 daysMeasure.
	self assert: (safar numberOfDaysFromBeginningOfYearIn: nonleapYear) = 30 daysMeasure.
	self assert: (rabiI numberOfDaysFromBeginningOfYearIn: leapYear) = 59 daysMeasure.
	self assert: (rabiI numberOfDaysFromBeginningOfYearIn: nonleapYear) = 59 daysMeasure.
	self assert: (rabiII numberOfDaysFromBeginningOfYearIn: leapYear) = 89 daysMeasure.
	self assert: (rabiII numberOfDaysFromBeginningOfYearIn: nonleapYear) = 89 daysMeasure.
	self assert: (jumadaI numberOfDaysFromBeginningOfYearIn: leapYear) = 118 daysMeasure.
	self assert: (jumadaI numberOfDaysFromBeginningOfYearIn: nonleapYear) = 118 daysMeasure.
	self assert: (jumadaII numberOfDaysFromBeginningOfYearIn: leapYear) = 148 daysMeasure.
	self assert: (jumadaII numberOfDaysFromBeginningOfYearIn: nonleapYear) = 148 daysMeasure.
	self assert: (rajab numberOfDaysFromBeginningOfYearIn: leapYear) = 177 daysMeasure.
	self assert: (rajab numberOfDaysFromBeginningOfYearIn: nonleapYear) = 177 daysMeasure.
	self assert: (shaban numberOfDaysFromBeginningOfYearIn: leapYear) = 207 daysMeasure.
	self assert: (shaban numberOfDaysFromBeginningOfYearIn: nonleapYear) = 207 daysMeasure.
	self assert: (ramadan numberOfDaysFromBeginningOfYearIn: leapYear) = 236 daysMeasure.
	self assert: (ramadan numberOfDaysFromBeginningOfYearIn: nonleapYear) = 236 daysMeasure.
	self assert: (shawwal numberOfDaysFromBeginningOfYearIn: leapYear) = 266 daysMeasure.
	self assert: (shawwal numberOfDaysFromBeginningOfYearIn: nonleapYear) = 266 daysMeasure.
	self assert: (dhuAlQada numberOfDaysFromBeginningOfYearIn: leapYear) = 295 daysMeasure.
	self assert: (dhuAlQada numberOfDaysFromBeginningOfYearIn: nonleapYear) = 295 daysMeasure.
	self assert: (dhuAlHijja numberOfDaysFromBeginningOfYearIn: leapYear) = 325 daysMeasure.
	self assert: (dhuAlHijja numberOfDaysFromBeginningOfYearIn: nonleapYear) = 325 daysMeasure
]

{ #category : #'test accessing' }
IslamicMonthTest >> testNumberOfDaysIn [
	| leapYear nonleapYear |
	leapYear := 1428 asIslamicYear.
	nonleapYear := 1427 asIslamicYear.
	self assert: (muharram numberOfDaysIn: leapYear) = 30 daysMeasure.
	self assert: (muharram numberOfDaysIn: nonleapYear) = 30 daysMeasure.
	self assert: (safar numberOfDaysIn: leapYear) = 29 daysMeasure.
	self assert: (safar numberOfDaysIn: nonleapYear) = 29 daysMeasure.
	self assert: (rabiI numberOfDaysIn: leapYear) = 30 daysMeasure.
	self assert: (rabiI numberOfDaysIn: nonleapYear) = 30 daysMeasure.
	self assert: (rabiII numberOfDaysIn: leapYear) = 29 daysMeasure.
	self assert: (rabiII numberOfDaysIn: nonleapYear) = 29 daysMeasure.
	self assert: (jumadaI numberOfDaysIn: leapYear) = 30 daysMeasure.
	self assert: (jumadaI numberOfDaysIn: nonleapYear) = 30 daysMeasure.
	self assert: (jumadaII numberOfDaysIn: leapYear) = 29 daysMeasure.
	self assert: (jumadaII numberOfDaysIn: nonleapYear) = 29 daysMeasure.
	self assert: (rajab numberOfDaysIn: leapYear) = 30 daysMeasure.
	self assert: (rajab numberOfDaysIn: nonleapYear) = 30 daysMeasure.
	self assert: (shaban numberOfDaysIn: leapYear) = 29 daysMeasure.
	self assert: (shaban numberOfDaysIn: nonleapYear) = 29 daysMeasure.
	self assert: (ramadan numberOfDaysIn: leapYear) = 30 daysMeasure.
	self assert: (ramadan numberOfDaysIn: nonleapYear) = 30 daysMeasure.
	self assert: (shawwal numberOfDaysIn: leapYear) = 29 daysMeasure.
	self assert: (shawwal numberOfDaysIn: nonleapYear) = 29 daysMeasure.
	self assert: (dhuAlQada numberOfDaysIn: leapYear) = 30 daysMeasure.
	self assert: (dhuAlQada numberOfDaysIn: nonleapYear) = 30 daysMeasure.
	self assert: (dhuAlHijja numberOfDaysIn: leapYear) = 30 daysMeasure.
	self assert: (dhuAlHijja numberOfDaysIn: nonleapYear) = 29 daysMeasure
]

{ #category : #'test month of year creation' }
IslamicMonthTest >> testOf [

	self assert: (safar of: 2003) = (MonthOfYear yearNumber: 2003 monthNumber: 2 calendar: calendar)
]

{ #category : #'test month of year creation' }
IslamicMonthTest >> testOfYear [
	self assert: (safar ofYear: 2003 asIslamicYear) = (MonthOfYear yearNumber: 2003 monthNumber: 2 calendar: calendar)
]

{ #category : #'test enumerating' }
IslamicMonthTest >> testPreviousInLeapYears [

	| stream |
	
	stream := CircularReadStream on: IslamicCalendar monthsForLeapYears moving: TimeUnits month.
	
	self assert: stream previous = dhuAlHijja.
	self assert: stream previous = dhuAlQada.
	self assert: stream previous = shawwal.
	self assert: stream previous = ramadan.
	self assert: stream previous = shaban.
	self assert: stream previous = rajab.
	self assert: stream previous = jumadaII.
	self assert: stream previous = jumadaI.
	self assert: stream previous = rabiII.
	self assert: stream previous = rabiI.
	self assert: stream previous = safar.
	self assert: stream previous = muharram
]

{ #category : #'test enumerating' }
IslamicMonthTest >> testPreviousInLeapYearsInANumberOfMonths [

	| stream |
	
	stream := CircularReadStream on: IslamicCalendar monthsForLeapYears moving: TimeUnits month.
	
	stream upToEnd.
	self assert: (stream previous: oneMonth) = dhuAlQada.
	
	stream upToEnd.
	self assert: (stream previous: twelveMonths) = dhuAlHijja.
	
	stream upToEnd.
	self assert: (stream previous: twelveMonths + oneMonth) = dhuAlQada
]

{ #category : #'test enumerating' }
IslamicMonthTest >> testPreviousInNonleapYears [

	| stream |
	
	stream := CircularReadStream on: IslamicCalendar monthsForNonleapYears moving: TimeUnits month.
	
	self assert: stream previous = dhuAlHijja.
	self assert: stream previous = dhuAlQada.
	self assert: stream previous = shawwal.
	self assert: stream previous = ramadan.
	self assert: stream previous = shaban.
	self assert: stream previous = rajab.
	self assert: stream previous = jumadaII.
	self assert: stream previous = jumadaI.
	self assert: stream previous = rabiII.
	self assert: stream previous = rabiI.
	self assert: stream previous = safar.
	self assert: stream previous = muharram
]

{ #category : #'test enumerating' }
IslamicMonthTest >> testPreviousInNonleapYearsInANumberOfMonths [

	| stream |
	
	stream := CircularReadStream on: IslamicCalendar monthsForNonleapYears moving: TimeUnits month.
	
	stream upToEnd.
	self assert: (stream previous: oneMonth) = dhuAlQada.
	
	stream upToEnd.
	self assert: (stream previous: twelveMonths) = dhuAlHijja.
	
	stream upToEnd.
	self assert: (stream previous: twelveMonths + oneMonth) = dhuAlQada
]

{ #category : #'test printing' }
IslamicMonthTest >> testPrintString [

	self assert: muharram printString = 'Muharram'.
	self assert: safar printString = 'Safar'.
	self assert: rabiI printString = 'Rabi` I (Rabi` al-Awwal)'.
	self assert: rabiII printString = 'Rabi` II (Rabi` al-Ahir)'.
	self assert: jumadaI printString = 'Jumada I (Jumada al-Ula)'.
	self assert: jumadaII printString = 'Jumada II (Jumada al-Ahira)'.
	self assert: rajab printString = 'Rajab'.
	self assert: shaban printString = 'Sha`ban'.
	self assert: ramadan printString = 'Ramadan'.
	self assert: shawwal printString = 'Shawwal'.
	self assert: dhuAlQada printString = 'Dhu al-Qa`da'.
	self assert: dhuAlHijja printString = 'Dhu al-Hijja'
]

{ #category : #'test accessing' }
IslamicMonthTest >> testRabiI [

	self assert: rabiI name = 'Rabi` I (Rabi` al-Awwal)'.
	self assert: rabiI number = 3
]

{ #category : #'test accessing' }
IslamicMonthTest >> testRabiII [

	self assert: rabiII name = 'Rabi` II (Rabi` al-Ahir)'.
	self assert: rabiII number = 4
]

{ #category : #'test accessing' }
IslamicMonthTest >> testRajab [

	self assert: rajab name = 'Rajab'.
	self assert: rajab number = 7
]

{ #category : #'test accessing' }
IslamicMonthTest >> testRamadan [

	self assert: ramadan name = 'Ramadan'.
	self assert: ramadan number = 9
]

{ #category : #'test accessing' }
IslamicMonthTest >> testSafar [

	self assert: safar name = 'Safar'.
	self assert: safar number = 2
]

{ #category : #'test accessing' }
IslamicMonthTest >> testShaban [

	self assert: shaban name = 'Sha`ban'.
	self assert: shaban number = 8
]

{ #category : #'test accessing' }
IslamicMonthTest >> testShawwal [

	self assert: shawwal name = 'Shawwal'.
	self assert: shawwal number = 10
]

{ #category : #'test interval protocol' }
IslamicMonthTest >> testTo [

	| interval |

	interval := muharram to: dhuAlHijja.

	self assert: interval from = muharram.
	self assert: interval to = dhuAlHijja.
	self assert: interval by = oneMonth
]

{ #category : #'test interval protocol' }
IslamicMonthTest >> testToBy [

	| interval |

	interval := muharram to: dhuAlHijja by: twoMonths.

	self assert: interval from = muharram.
	self assert: interval to = dhuAlHijja.
	self assert: interval by = twoMonths
]

{ #category : #'test interval protocol' }
IslamicMonthTest >> testToByDo [

	| number |

	number := 1.
	(muharram to: dhuAlHijja by: twoMonths) do: [:month |
		self assert: month number = number.
		number := number + 2].

	self assert: number = 13.

	number := 7.
	(rajab to: jumadaII by: oneMonth) do: [:month |
		self assert: month number = number.
		number := (number + 1) rem: 12.
		number = 0 ifTrue: [number := 12]].

	self assert: number = 7
]

{ #category : #'test interval protocol' }
IslamicMonthTest >> testToNegativeByDo [

	| number |

	number := 12.
	(dhuAlHijja to: muharram by: oneMonth negated) do: [:month |
		self assert: month number = number.
		number := number - 1].

	self assert: number = 0
]

{ #category : #'test interval protocol' }
IslamicMonthTest >> testToReverse [

	| coll number |

	coll := (muharram to: dhuAlQada by: twoMonths) reverse.
	number := 11.
	coll do: [:month |
		self assert: month number = number.
		number := number - 2].

	self assert: number = -1
]
