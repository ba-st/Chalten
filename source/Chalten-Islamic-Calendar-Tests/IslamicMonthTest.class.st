Class {
	#name : 'IslamicMonthTest',
	#superclass : 'TestCase',
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
	#category : 'Chalten-Islamic-Calendar-Tests',
	#package : 'Chalten-Islamic-Calendar-Tests'
}

{ #category : 'accessing' }
IslamicMonthTest class >> classUnderTest [

	^ChaltenMonth
]

{ #category : 'initialization' }
IslamicMonthTest >> setUp [
	calendar := ChaltenEnvironment calendarNamed: #IslamicCalendar.
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

{ #category : 'test month of year creation' }
IslamicMonthTest >> testComma [

	self
		assert: safar , 2003
		equals:
		(MonthOfYear yearNumber: 2003 monthNumber: 2 calendar: calendar)
]

{ #category : 'test day of month creation' }
IslamicMonthTest >> testDayOfMonthCreation [

	self
		assert: ramadan first
		equals: (DayOfMonth monthNumber: 9 dayNumber: 1 calendar: calendar).
	self
		assert: ramadan second
		equals: (DayOfMonth monthNumber: 9 dayNumber: 2 calendar: calendar).
	self
		assert: ramadan third
		equals: (DayOfMonth monthNumber: 9 dayNumber: 3 calendar: calendar).
	self
		assert: ramadan fourth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 4 calendar: calendar).
	self
		assert: ramadan fifth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 5 calendar: calendar).
	self
		assert: ramadan sixth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 6 calendar: calendar).
	self
		assert: ramadan seventh
		equals: (DayOfMonth monthNumber: 9 dayNumber: 7 calendar: calendar).
	self
		assert: ramadan eighth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 8 calendar: calendar).
	self
		assert: ramadan ninth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 9 calendar: calendar).
	self
		assert: ramadan tenth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 10 calendar: calendar).
	self
		assert: ramadan eleventh
		equals: (DayOfMonth monthNumber: 9 dayNumber: 11 calendar: calendar).
	self
		assert: ramadan twelfth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 12 calendar: calendar).
	self
		assert: ramadan thirteenth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 13 calendar: calendar).
	self
		assert: ramadan fourteenth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 14 calendar: calendar).
	self
		assert: ramadan fifteenth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 15 calendar: calendar).
	self
		assert: ramadan sixteenth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 16 calendar: calendar).
	self
		assert: ramadan seventeenth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 17 calendar: calendar).
	self
		assert: ramadan eighteenth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 18 calendar: calendar).
	self
		assert: ramadan nineteenth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 19 calendar: calendar).
	self
		assert: ramadan twentieth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 20 calendar: calendar).
	self
		assert: ramadan twentyfirst
		equals: (DayOfMonth monthNumber: 9 dayNumber: 21 calendar: calendar).
	self
		assert: ramadan twentysecond
		equals: (DayOfMonth monthNumber: 9 dayNumber: 22 calendar: calendar).
	self
		assert: ramadan twentythird
		equals: (DayOfMonth monthNumber: 9 dayNumber: 23 calendar: calendar).
	self
		assert: ramadan twentyfourth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 24 calendar: calendar).
	self
		assert: ramadan twentyfifth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 25 calendar: calendar).
	self
		assert: ramadan twentysixth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 26 calendar: calendar).
	self
		assert: ramadan twentyseventh
		equals: (DayOfMonth monthNumber: 9 dayNumber: 27 calendar: calendar).
	self
		assert: ramadan twentyeighth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 28 calendar: calendar).
	self
		assert: ramadan twentyninth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 29 calendar: calendar).
	self
		assert: ramadan thirtieth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 30 calendar: calendar)
]

{ #category : 'test accessing' }
IslamicMonthTest >> testDhuAlHijja [

	self assert: dhuAlHijja name equals: 'Dhu al-Hijja'.
	self assert: dhuAlHijja number equals: 12
]

{ #category : 'test accessing' }
IslamicMonthTest >> testDhuAlQada [

	self assert: dhuAlQada name equals: 'Dhu al-Qa`da'.
	self assert: dhuAlQada number equals: 11
]

{ #category : 'test comparing' }
IslamicMonthTest >> testEqual [

	self assert: muharram equals: muharram.
	self assert: safar equals: safar.
	self assert: rabiI equals: rabiI.
	self assert: rabiII equals: rabiII.
	self assert: jumadaI equals: jumadaI.
	self assert: jumadaII equals: jumadaII.
	self assert: rajab equals: rajab.
	self assert: shaban equals: shaban.
	self assert: ramadan equals: ramadan.
	self assert: shawwal equals: shawwal.
	self assert: dhuAlQada equals: dhuAlQada.
	self assert: dhuAlHijja equals: dhuAlHijja
]

{ #category : 'test accessing' }
IslamicMonthTest >> testFirstDayOfMonth [

	self assert: muharram firstDayOfMonth equals: Muharram first.
	self assert: safar firstDayOfMonth equals: Safar first.
	self assert: rabiI firstDayOfMonth equals: RabiI first.
	self assert: rabiII firstDayOfMonth equals: RabiII first.
	self assert: jumadaI firstDayOfMonth equals: JumadaI first.
	self assert: jumadaII firstDayOfMonth equals: JumadaII first.
	self assert: rajab firstDayOfMonth equals: Rajab first.
	self assert: shaban firstDayOfMonth equals: Shaban first.
	self assert: ramadan firstDayOfMonth equals: Ramadan first.
	self assert: shawwal firstDayOfMonth equals: Shawwal first.
	self assert: dhuAlQada firstDayOfMonth equals: DhuAlQada first.
	self assert: dhuAlHijja firstDayOfMonth equals: DhuAlHijja first
]

{ #category : 'test comparing' }
IslamicMonthTest >> testGreatherThan [

	self assert: safar > muharram.
	self assert: dhuAlHijja > muharram.

	self deny: muharram > safar.
	self deny: muharram > dhuAlHijja.

	self
		should: [ muharram > YomHamishi ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: YomHamishi class
						 with: YomHamishi
						 with: muharram class
						 with: muharram) ].

	self
		should: [ muharram >= dhuAlHijja first ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: muharram class
						 with: muharram
						 with: dhuAlHijja first class
						 with: dhuAlHijja first) ]
]

{ #category : 'test comparing' }
IslamicMonthTest >> testHash [

	self assert: muharram hash equals: muharram hash.
	self assert: safar hash equals: safar hash.
	self assert: rabiI hash equals: rabiI hash.
	self assert: rabiII hash equals: rabiII hash.
	self assert: jumadaI hash equals: jumadaI hash.
	self assert: jumadaII hash equals: jumadaII hash.
	self assert: rajab hash equals: rajab hash.
	self assert: shaban hash equals: shaban hash.
	self assert: ramadan hash equals: ramadan hash.
	self assert: shawwal hash equals: shawwal hash.
	self assert: dhuAlQada hash equals: dhuAlQada hash.
	self assert: dhuAlHijja hash equals: dhuAlHijja hash
]

{ #category : 'test comparing' }
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

{ #category : 'test testing' }
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

{ #category : 'test accessing' }
IslamicMonthTest >> testJumadaI [

	self assert: jumadaI name equals: 'Jumada I (Jumada al-Ula)'.
	self assert: jumadaI number equals: 5
]

{ #category : 'test accessing' }
IslamicMonthTest >> testJumadaII [

	self assert: jumadaII name equals: 'Jumada II (Jumada al-Ahira)'.
	self assert: jumadaII number equals: 6
]

{ #category : 'test accessing' }
IslamicMonthTest >> testLastDayNumber [

	self assert: muharram lastDayNumber equals: 30.
	self assert: safar lastDayNumber equals: 29.
	self assert: rabiI lastDayNumber equals: 30.
	self assert: rabiII lastDayNumber equals: 29.
	self assert: jumadaI lastDayNumber equals: 30.
	self assert: jumadaII lastDayNumber equals: 29.
	self assert: rajab lastDayNumber equals: 30.
	self assert: shaban lastDayNumber equals: 29.
	self assert: ramadan lastDayNumber equals: 30.
	self assert: shawwal lastDayNumber equals: 29.
	self assert: dhuAlQada lastDayNumber equals: 30.
	self assert: dhuAlHijja lastDayNumber equals: 30
]

{ #category : 'test accessing' }
IslamicMonthTest >> testLastDayNumberIn [

	| leapYear nonleapYear |
	leapYear := 1428 asIslamicYear.
	nonleapYear := 1427 asIslamicYear.
	self assert: (muharram lastDayNumberIn: leapYear) equals: 30.
	self assert: (muharram lastDayNumberIn: nonleapYear) equals: 30.
	self assert: (safar lastDayNumberIn: leapYear) equals: 29.
	self assert: (safar lastDayNumberIn: nonleapYear) equals: 29.
	self assert: (rabiI lastDayNumberIn: leapYear) equals: 30.
	self assert: (rabiI lastDayNumberIn: nonleapYear) equals: 30.
	self assert: (rabiII lastDayNumberIn: leapYear) equals: 29.
	self assert: (rabiII lastDayNumberIn: nonleapYear) equals: 29.
	self assert: (jumadaI lastDayNumberIn: leapYear) equals: 30.
	self assert: (jumadaI lastDayNumberIn: nonleapYear) equals: 30.
	self assert: (jumadaII lastDayNumberIn: leapYear) equals: 29.
	self assert: (jumadaII lastDayNumberIn: nonleapYear) equals: 29.
	self assert: (rajab lastDayNumberIn: leapYear) equals: 30.
	self assert: (rajab lastDayNumberIn: nonleapYear) equals: 30.
	self assert: (shaban lastDayNumberIn: leapYear) equals: 29.
	self assert: (shaban lastDayNumberIn: nonleapYear) equals: 29.
	self assert: (ramadan lastDayNumberIn: leapYear) equals: 30.
	self assert: (ramadan lastDayNumberIn: nonleapYear) equals: 30.
	self assert: (shawwal lastDayNumberIn: leapYear) equals: 29.
	self assert: (shawwal lastDayNumberIn: nonleapYear) equals: 29.
	self assert: (dhuAlQada lastDayNumberIn: leapYear) equals: 30.
	self assert: (dhuAlQada lastDayNumberIn: nonleapYear) equals: 30.
	self assert: (dhuAlHijja lastDayNumberIn: leapYear) equals: 30.
	self assert: (dhuAlHijja lastDayNumberIn: nonleapYear) equals: 29
]

{ #category : 'test accessing' }
IslamicMonthTest >> testLastDayOfMonth [

	self assert: muharram lastDayOfMonth equals: Muharram thirtieth.
	self assert: safar lastDayOfMonth equals: Safar twentyninth.
	self assert: rabiI lastDayOfMonth equals: RabiI thirtieth.
	self assert: rabiII lastDayOfMonth equals: RabiII twentyninth.
	self assert: jumadaI lastDayOfMonth equals: JumadaI thirtieth.
	self assert: jumadaII lastDayOfMonth equals: JumadaII twentyninth.
	self assert: rajab lastDayOfMonth equals: Rajab thirtieth.
	self assert: shaban lastDayOfMonth equals: Shaban twentyninth.
	self assert: ramadan lastDayOfMonth equals: Ramadan thirtieth.
	self assert: shawwal lastDayOfMonth equals: Shawwal twentyninth.
	self assert: dhuAlQada lastDayOfMonth equals: DhuAlQada thirtieth.
	self assert: dhuAlHijja lastDayOfMonth equals: DhuAlHijja thirtieth
]

{ #category : 'test comparing' }
IslamicMonthTest >> testLessThan [

	self assert: muharram < safar.
	self assert: muharram < dhuAlHijja.

	self deny: safar < muharram.
	self deny: dhuAlHijja < muharram.

	self
		should: [ muharram <= YomHamishi ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: YomHamishi class
						 with: YomHamishi
						 with: muharram class
						 with: muharram) ].

	self
		should: [ muharram < dhuAlHijja first ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: muharram class
						 with: muharram
						 with: dhuAlHijja first class
						 with: dhuAlHijja first) ]
]

{ #category : 'test creation' }
IslamicMonthTest >> testMonthCreation [

	| otherMuharram otherSafar otheRabiI otherRabiII otherJumadaI otherJumadaII otherRajab otherShaban otherRamadan ohterShawwal otherDhuAlQada otherDhuAlHijja |
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
	self assert: muharram name equals: otherMuharram name.
	self assert: muharram number equals: otherMuharram number.
	self assert: safar name equals: otherSafar name.
	self assert: safar number equals: otherSafar number.
	self assert: rabiI name equals: otheRabiI name.
	self assert: rabiI number equals: otheRabiI number.
	self assert: rabiII name equals: otherRabiII name.
	self assert: rabiII number equals: otherRabiII number.
	self assert: jumadaI name equals: otherJumadaI name.
	self assert: jumadaI number equals: otherJumadaI number.
	self assert: jumadaII name equals: otherJumadaII name.
	self assert: jumadaII number equals: otherJumadaII number.
	self assert: rajab name equals: otherRajab name.
	self assert: rajab number equals: otherRajab number.
	self assert: shaban name equals: otherShaban name.
	self assert: shaban number equals: otherShaban number.
	self assert: ramadan name equals: otherRamadan name.
	self assert: ramadan number equals: otherRamadan number.
	self assert: shawwal name equals: ohterShawwal name.
	self assert: shawwal number equals: ohterShawwal number.
	self assert: dhuAlQada name equals: otherDhuAlQada name.
	self assert: dhuAlQada number equals: otherDhuAlQada number.
	self assert: dhuAlHijja name equals: otherDhuAlHijja name.
	self assert: dhuAlHijja number equals: otherDhuAlHijja number
]

{ #category : 'test querying' }
IslamicMonthTest >> testMonthsFrom [

	| stream |
	stream := CircularReadStream
		          on: calendar monthsForLeapYears
		          moving: TimeUnits month.
	self
		assert: (stream distanceFrom: muharram to: muharram)
		equals: zeroMonths.
	self
		assert: (stream distanceFrom: safar to: muharram)
		equals: elevenMonths.
	self
		assert: (stream distanceFrom: dhuAlHijja to: muharram)
		equals: oneMonth.
	self
		assert: (stream distanceFrom: muharram to: dhuAlHijja)
		equals: elevenMonths.
	self
		assert: (stream distanceFrom: dhuAlQada to: dhuAlHijja)
		equals: oneMonth
]

{ #category : 'test querying' }
IslamicMonthTest >> testMonthsTo [

	| stream |
	stream := CircularReadStream
		          on: calendar monthsForLeapYears
		          moving: TimeUnits month.
	self
		assert: (stream distanceTo: muharram from: muharram)
		equals: zeroMonths.
	self
		assert: (stream distanceTo: safar from: muharram)
		equals: oneMonth.
	self
		assert: (stream distanceTo: dhuAlHijja from: muharram)
		equals: elevenMonths.
	self
		assert: (stream distanceTo: muharram from: dhuAlHijja)
		equals: oneMonth.
	self
		assert: (stream distanceTo: dhuAlQada from: dhuAlHijja)
		equals: elevenMonths
]

{ #category : 'test accessing' }
IslamicMonthTest >> testMuharram [

	self assert: muharram name equals: 'Muharram'.
	self assert: muharram number equals: 1
]

{ #category : 'test enumerating' }
IslamicMonthTest >> testNextInLeapYears [

	| stream |
	stream := CircularReadStream
		          on: calendar monthsForLeapYears
		          moving: TimeUnits month.
	self assert: stream next equals: safar.
	self assert: stream next equals: rabiI.
	self assert: stream next equals: rabiII.
	self assert: stream next equals: jumadaI.
	self assert: stream next equals: jumadaII.
	self assert: stream next equals: rajab.
	self assert: stream next equals: shaban.
	self assert: stream next equals: ramadan.
	self assert: stream next equals: shawwal.
	self assert: stream next equals: dhuAlQada.
	self assert: stream next equals: dhuAlHijja.
	self assert: stream next equals: muharram
]

{ #category : 'test enumerating' }
IslamicMonthTest >> testNextInLeapYearsInANumberOfMonths [

	| stream |
	stream := CircularReadStream
		          on: calendar monthsForLeapYears
		          moving: TimeUnits month.

	stream upToEnd.
	self assert: (stream next: oneMonth) equals: muharram.

	stream upToEnd.
	self assert: (stream next: twelveMonths) equals: dhuAlHijja.

	stream upToEnd.
	self assert: (stream next: twelveMonths + oneMonth) equals: muharram
]

{ #category : 'test enumerating' }
IslamicMonthTest >> testNextInNonleapYears [

	| stream |
	stream := CircularReadStream
		          on: calendar monthsForNonleapYears
		          moving: TimeUnits month.
	self assert: stream next equals: safar.
	self assert: stream next equals: rabiI.
	self assert: stream next equals: rabiII.
	self assert: stream next equals: jumadaI.
	self assert: stream next equals: jumadaII.
	self assert: stream next equals: rajab.
	self assert: stream next equals: shaban.
	self assert: stream next equals: ramadan.
	self assert: stream next equals: shawwal.
	self assert: stream next equals: dhuAlQada.
	self assert: stream next equals: dhuAlHijja.
	self assert: stream next equals: muharram
]

{ #category : 'test enumerating' }
IslamicMonthTest >> testNextInNonleapYearsInANumberOfMonths [

	| stream |
	stream := CircularReadStream
		          on: calendar monthsForNonleapYears
		          moving: TimeUnits month.

	stream upToEnd.
	self assert: (stream next: oneMonth) equals: muharram.

	stream upToEnd.
	self assert: (stream next: twelveMonths) equals: dhuAlHijja.

	stream upToEnd.
	self assert: (stream next: twelveMonths + oneMonth) equals: muharram
]

{ #category : 'test accessing' }
IslamicMonthTest >> testNumberOfDays [

	self assert: muharram numberOfDays equals: 30 daysMeasure.
	self assert: safar numberOfDays equals: 29 daysMeasure.
	self assert: rabiI numberOfDays equals: 30 daysMeasure.
	self assert: rabiII numberOfDays equals: 29 daysMeasure.
	self assert: jumadaI numberOfDays equals: 30 daysMeasure.
	self assert: jumadaII numberOfDays equals: 29 daysMeasure.
	self assert: rajab numberOfDays equals: 30 daysMeasure.
	self assert: shaban numberOfDays equals: 29 daysMeasure.
	self assert: ramadan numberOfDays equals: 30 daysMeasure.
	self assert: shawwal numberOfDays equals: 29 daysMeasure.
	self assert: dhuAlQada numberOfDays equals: 30 daysMeasure.
	self assert: dhuAlHijja numberOfDays equals: 30 daysMeasure
]

{ #category : 'test accessing' }
IslamicMonthTest >> testNumberOfDaysFromBeginningOfYearIn [

	| leapYear nonleapYear |
	leapYear := 1428 asIslamicYear.
	nonleapYear := 1427 asIslamicYear.
	self
		assert: (muharram numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 0 daysMeasure.
	self
		assert: (muharram numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 0 daysMeasure.
	self
		assert: (safar numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 30 daysMeasure.
	self
		assert: (safar numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 30 daysMeasure.
	self
		assert: (rabiI numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 59 daysMeasure.
	self
		assert: (rabiI numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 59 daysMeasure.
	self
		assert: (rabiII numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 89 daysMeasure.
	self
		assert: (rabiII numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 89 daysMeasure.
	self
		assert: (jumadaI numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 118 daysMeasure.
	self
		assert: (jumadaI numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 118 daysMeasure.
	self
		assert: (jumadaII numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 148 daysMeasure.
	self
		assert: (jumadaII numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 148 daysMeasure.
	self
		assert: (rajab numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 177 daysMeasure.
	self
		assert: (rajab numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 177 daysMeasure.
	self
		assert: (shaban numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 207 daysMeasure.
	self
		assert: (shaban numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 207 daysMeasure.
	self
		assert: (ramadan numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 236 daysMeasure.
	self
		assert: (ramadan numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 236 daysMeasure.
	self
		assert: (shawwal numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 266 daysMeasure.
	self
		assert: (shawwal numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 266 daysMeasure.
	self
		assert: (dhuAlQada numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 295 daysMeasure.
	self
		assert: (dhuAlQada numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 295 daysMeasure.
	self
		assert: (dhuAlHijja numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 325 daysMeasure.
	self
		assert: (dhuAlHijja numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 325 daysMeasure
]

{ #category : 'test accessing' }
IslamicMonthTest >> testNumberOfDaysIn [

	| leapYear nonleapYear |
	leapYear := 1428 asIslamicYear.
	nonleapYear := 1427 asIslamicYear.
	self
		assert: (muharram numberOfDaysIn: leapYear)
		equals: 30 daysMeasure.
	self
		assert: (muharram numberOfDaysIn: nonleapYear)
		equals: 30 daysMeasure.
	self assert: (safar numberOfDaysIn: leapYear) equals: 29 daysMeasure.
	self
		assert: (safar numberOfDaysIn: nonleapYear)
		equals: 29 daysMeasure.
	self assert: (rabiI numberOfDaysIn: leapYear) equals: 30 daysMeasure.
	self
		assert: (rabiI numberOfDaysIn: nonleapYear)
		equals: 30 daysMeasure.
	self assert: (rabiII numberOfDaysIn: leapYear) equals: 29 daysMeasure.
	self
		assert: (rabiII numberOfDaysIn: nonleapYear)
		equals: 29 daysMeasure.
	self
		assert: (jumadaI numberOfDaysIn: leapYear)
		equals: 30 daysMeasure.
	self
		assert: (jumadaI numberOfDaysIn: nonleapYear)
		equals: 30 daysMeasure.
	self
		assert: (jumadaII numberOfDaysIn: leapYear)
		equals: 29 daysMeasure.
	self
		assert: (jumadaII numberOfDaysIn: nonleapYear)
		equals: 29 daysMeasure.
	self assert: (rajab numberOfDaysIn: leapYear) equals: 30 daysMeasure.
	self
		assert: (rajab numberOfDaysIn: nonleapYear)
		equals: 30 daysMeasure.
	self assert: (shaban numberOfDaysIn: leapYear) equals: 29 daysMeasure.
	self
		assert: (shaban numberOfDaysIn: nonleapYear)
		equals: 29 daysMeasure.
	self
		assert: (ramadan numberOfDaysIn: leapYear)
		equals: 30 daysMeasure.
	self
		assert: (ramadan numberOfDaysIn: nonleapYear)
		equals: 30 daysMeasure.
	self
		assert: (shawwal numberOfDaysIn: leapYear)
		equals: 29 daysMeasure.
	self
		assert: (shawwal numberOfDaysIn: nonleapYear)
		equals: 29 daysMeasure.
	self
		assert: (dhuAlQada numberOfDaysIn: leapYear)
		equals: 30 daysMeasure.
	self
		assert: (dhuAlQada numberOfDaysIn: nonleapYear)
		equals: 30 daysMeasure.
	self
		assert: (dhuAlHijja numberOfDaysIn: leapYear)
		equals: 30 daysMeasure.
	self
		assert: (dhuAlHijja numberOfDaysIn: nonleapYear)
		equals: 29 daysMeasure
]

{ #category : 'test month of year creation' }
IslamicMonthTest >> testOf [

	self
		assert: (safar of: 2003)
		equals:
		(MonthOfYear yearNumber: 2003 monthNumber: 2 calendar: calendar)
]

{ #category : 'test month of year creation' }
IslamicMonthTest >> testOfYear [

	self
		assert: (safar ofYear: 2003 asIslamicYear)
		equals:
		(MonthOfYear yearNumber: 2003 monthNumber: 2 calendar: calendar)
]

{ #category : 'test enumerating' }
IslamicMonthTest >> testPreviousInLeapYears [

	| stream |
	stream := CircularReadStream
		          on: calendar monthsForLeapYears
		          moving: TimeUnits month.
	self assert: stream previous equals: dhuAlHijja.
	self assert: stream previous equals: dhuAlQada.
	self assert: stream previous equals: shawwal.
	self assert: stream previous equals: ramadan.
	self assert: stream previous equals: shaban.
	self assert: stream previous equals: rajab.
	self assert: stream previous equals: jumadaII.
	self assert: stream previous equals: jumadaI.
	self assert: stream previous equals: rabiII.
	self assert: stream previous equals: rabiI.
	self assert: stream previous equals: safar.
	self assert: stream previous equals: muharram
]

{ #category : 'test enumerating' }
IslamicMonthTest >> testPreviousInLeapYearsInANumberOfMonths [

	| stream |
	stream := CircularReadStream
		          on: calendar monthsForLeapYears
		          moving: TimeUnits month.

	stream upToEnd.
	self assert: (stream previous: oneMonth) equals: dhuAlQada.

	stream upToEnd.
	self assert: (stream previous: twelveMonths) equals: dhuAlHijja.

	stream upToEnd.
	self
		assert: (stream previous: twelveMonths + oneMonth)
		equals: dhuAlQada
]

{ #category : 'test enumerating' }
IslamicMonthTest >> testPreviousInNonleapYears [

	| stream |
	stream := CircularReadStream
		          on: calendar monthsForNonleapYears
		          moving: TimeUnits month.
	self assert: stream previous equals: dhuAlHijja.
	self assert: stream previous equals: dhuAlQada.
	self assert: stream previous equals: shawwal.
	self assert: stream previous equals: ramadan.
	self assert: stream previous equals: shaban.
	self assert: stream previous equals: rajab.
	self assert: stream previous equals: jumadaII.
	self assert: stream previous equals: jumadaI.
	self assert: stream previous equals: rabiII.
	self assert: stream previous equals: rabiI.
	self assert: stream previous equals: safar.
	self assert: stream previous equals: muharram
]

{ #category : 'test enumerating' }
IslamicMonthTest >> testPreviousInNonleapYearsInANumberOfMonths [

	| stream |
	stream := CircularReadStream
		          on: calendar monthsForNonleapYears
		          moving: TimeUnits month.

	stream upToEnd.
	self assert: (stream previous: oneMonth) equals: dhuAlQada.

	stream upToEnd.
	self assert: (stream previous: twelveMonths) equals: dhuAlHijja.

	stream upToEnd.
	self
		assert: (stream previous: twelveMonths + oneMonth)
		equals: dhuAlQada
]

{ #category : 'test printing' }
IslamicMonthTest >> testPrintString [

	self assert: muharram printString equals: 'Muharram'.
	self assert: safar printString equals: 'Safar'.
	self assert: rabiI printString equals: 'Rabi` I (Rabi` al-Awwal)'.
	self assert: rabiII printString equals: 'Rabi` II (Rabi` al-Ahir)'.
	self assert: jumadaI printString equals: 'Jumada I (Jumada al-Ula)'.
	self
		assert: jumadaII printString
		equals: 'Jumada II (Jumada al-Ahira)'.
	self assert: rajab printString equals: 'Rajab'.
	self assert: shaban printString equals: 'Sha`ban'.
	self assert: ramadan printString equals: 'Ramadan'.
	self assert: shawwal printString equals: 'Shawwal'.
	self assert: dhuAlQada printString equals: 'Dhu al-Qa`da'.
	self assert: dhuAlHijja printString equals: 'Dhu al-Hijja'
]

{ #category : 'test accessing' }
IslamicMonthTest >> testRabiI [

	self assert: rabiI name equals: 'Rabi` I (Rabi` al-Awwal)'.
	self assert: rabiI number equals: 3
]

{ #category : 'test accessing' }
IslamicMonthTest >> testRabiII [

	self assert: rabiII name equals: 'Rabi` II (Rabi` al-Ahir)'.
	self assert: rabiII number equals: 4
]

{ #category : 'test accessing' }
IslamicMonthTest >> testRajab [

	self assert: rajab name equals: 'Rajab'.
	self assert: rajab number equals: 7
]

{ #category : 'test accessing' }
IslamicMonthTest >> testRamadan [

	self assert: ramadan name equals: 'Ramadan'.
	self assert: ramadan number equals: 9
]

{ #category : 'test accessing' }
IslamicMonthTest >> testSafar [

	self assert: safar name equals: 'Safar'.
	self assert: safar number equals: 2
]

{ #category : 'test accessing' }
IslamicMonthTest >> testShaban [

	self assert: shaban name equals: 'Sha`ban'.
	self assert: shaban number equals: 8
]

{ #category : 'test accessing' }
IslamicMonthTest >> testShawwal [

	self assert: shawwal name equals: 'Shawwal'.
	self assert: shawwal number equals: 10
]

{ #category : 'test interval protocol' }
IslamicMonthTest >> testTo [

	| interval |
	interval := muharram to: dhuAlHijja.
	self assert: interval from equals: muharram.
	self assert: interval to equals: dhuAlHijja.
	self assert: interval by equals: oneMonth
]

{ #category : 'test interval protocol' }
IslamicMonthTest >> testToBy [

	| interval |
	interval := muharram to: dhuAlHijja by: twoMonths.
	self assert: interval from equals: muharram.
	self assert: interval to equals: dhuAlHijja.
	self assert: interval by equals: twoMonths
]

{ #category : 'test interval protocol' }
IslamicMonthTest >> testToByDo [

	| number |
	number := 1.
	(muharram to: dhuAlHijja by: twoMonths) do: [ :month |
		self assert: month number equals: number.
		number := number + 2 ].
	self assert: number equals: 13.

	number := 7.
	(rajab to: jumadaII by: oneMonth) do: [ :month |
		self assert: month number equals: number.
		number := number + 1 rem: 12.
		number = 0 ifTrue: [ number := 12 ] ].
	self assert: number equals: 7
]

{ #category : 'test interval protocol' }
IslamicMonthTest >> testToNegativeByDo [

	| number |
	number := 12.
	(dhuAlHijja to: muharram by: oneMonth negated) do: [ :month |
		self assert: month number equals: number.
		number := number - 1 ].
	self assert: number equals: 0
]

{ #category : 'test interval protocol' }
IslamicMonthTest >> testToReverse [

	| coll number |
	coll := (muharram to: dhuAlQada by: twoMonths) reverse.
	number := 11.
	coll do: [ :month |
		self assert: month number equals: number.
		number := number - 2 ].
	self assert: number equals: -1
]
