Class {
	#name : 'JulianMonthTest',
	#superclass : 'TestCase',
	#instVars : [
		'calendar',
		'january',
		'february',
		'march',
		'april',
		'may',
		'june',
		'july',
		'august',
		'september',
		'october',
		'november',
		'december',
		'zeroMonths',
		'oneMonth',
		'twoMonths',
		'elevenMonths',
		'twelveMonths'
	],
	#category : 'Chalten-Julian-Calendar-Tests',
	#package : 'Chalten-Julian-Calendar-Tests'
}

{ #category : 'accessing' }
JulianMonthTest class >> classUnderTest [

	^ChaltenMonth
]

{ #category : 'initialization' }
JulianMonthTest >> setUp [
	calendar := ChaltenEnvironment calendarNamed: #JulianCalendar.
	january := calendar january.
	february := calendar february.
	march := calendar march.
	april := calendar april.
	may := calendar may.
	june := calendar june.
	july := calendar july.
	august := calendar august.
	september := calendar september.
	october := calendar october.
	november := calendar november.
	december := calendar december.
	zeroMonths := 0 monthsMeasure.
	oneMonth := 1 monthMeasure.
	twoMonths := 2 monthsMeasure.
	elevenMonths := 11 monthsMeasure.
	twelveMonths := 12 monthsMeasure
]

{ #category : 'test accessing' }
JulianMonthTest >> testApril [

	self
		assert: april number equals: 4;
		assert: (calendar monthNamed: april name) equals: april
]

{ #category : 'test accessing' }
JulianMonthTest >> testAugust [

	self
		assert: august number equals: 8;
		assert: (calendar monthNamed: august name) equals: august
]

{ #category : 'test month of year creation' }
JulianMonthTest >> testComma [

	self
		assert: february , 2003
		equals:
		(MonthOfYear yearNumber: 2003 monthNumber: 2 calendar: calendar)
]

{ #category : 'test accessing' }
JulianMonthTest >> testCurrent [

	self assert: calendar currentMonth equals: calendar today month
]

{ #category : 'test day of month creation' }
JulianMonthTest >> testDayOfMonthCreation [

	self
		assert: january first
		equals: (DayOfMonth monthNumber: 1 dayNumber: 1 calendar: calendar).
	self
		assert: january second
		equals: (DayOfMonth monthNumber: 1 dayNumber: 2 calendar: calendar).
	self
		assert: january third
		equals: (DayOfMonth monthNumber: 1 dayNumber: 3 calendar: calendar).
	self
		assert: january fourth
		equals: (DayOfMonth monthNumber: 1 dayNumber: 4 calendar: calendar).
	self
		assert: january fifth
		equals: (DayOfMonth monthNumber: 1 dayNumber: 5 calendar: calendar).
	self
		assert: january sixth
		equals: (DayOfMonth monthNumber: 1 dayNumber: 6 calendar: calendar).
	self
		assert: january seventh
		equals: (DayOfMonth monthNumber: 1 dayNumber: 7 calendar: calendar).
	self
		assert: january eighth
		equals: (DayOfMonth monthNumber: 1 dayNumber: 8 calendar: calendar).
	self
		assert: january ninth
		equals: (DayOfMonth monthNumber: 1 dayNumber: 9 calendar: calendar).
	self
		assert: january tenth
		equals: (DayOfMonth monthNumber: 1 dayNumber: 10 calendar: calendar).
	self
		assert: january eleventh
		equals: (DayOfMonth monthNumber: 1 dayNumber: 11 calendar: calendar).
	self
		assert: january twelfth
		equals: (DayOfMonth monthNumber: 1 dayNumber: 12 calendar: calendar).
	self
		assert: january thirteenth
		equals: (DayOfMonth monthNumber: 1 dayNumber: 13 calendar: calendar).
	self
		assert: january fourteenth
		equals: (DayOfMonth monthNumber: 1 dayNumber: 14 calendar: calendar).
	self
		assert: january fifteenth
		equals: (DayOfMonth monthNumber: 1 dayNumber: 15 calendar: calendar).
	self
		assert: january sixteenth
		equals: (DayOfMonth monthNumber: 1 dayNumber: 16 calendar: calendar).
	self
		assert: january seventeenth
		equals: (DayOfMonth monthNumber: 1 dayNumber: 17 calendar: calendar).
	self
		assert: january eighteenth
		equals: (DayOfMonth monthNumber: 1 dayNumber: 18 calendar: calendar).
	self
		assert: january nineteenth
		equals: (DayOfMonth monthNumber: 1 dayNumber: 19 calendar: calendar).
	self
		assert: january twentieth
		equals: (DayOfMonth monthNumber: 1 dayNumber: 20 calendar: calendar).
	self
		assert: january twentyfirst
		equals: (DayOfMonth monthNumber: 1 dayNumber: 21 calendar: calendar).
	self
		assert: january twentysecond
		equals: (DayOfMonth monthNumber: 1 dayNumber: 22 calendar: calendar).
	self
		assert: january twentythird
		equals: (DayOfMonth monthNumber: 1 dayNumber: 23 calendar: calendar).
	self
		assert: january twentyfourth
		equals: (DayOfMonth monthNumber: 1 dayNumber: 24 calendar: calendar).
	self
		assert: january twentyfifth
		equals: (DayOfMonth monthNumber: 1 dayNumber: 25 calendar: calendar).
	self
		assert: january twentysixth
		equals: (DayOfMonth monthNumber: 1 dayNumber: 26 calendar: calendar).
	self
		assert: january twentyseventh
		equals: (DayOfMonth monthNumber: 1 dayNumber: 27 calendar: calendar).
	self
		assert: january twentyeighth
		equals: (DayOfMonth monthNumber: 1 dayNumber: 28 calendar: calendar).
	self
		assert: january twentyninth
		equals: (DayOfMonth monthNumber: 1 dayNumber: 29 calendar: calendar)
]

{ #category : 'test accessing' }
JulianMonthTest >> testDecember [

	self
		assert: december number equals: 12;
		assert: (calendar monthNamed: december name) equals: december
]

{ #category : 'test comparing' }
JulianMonthTest >> testEqual [

	self assert: january equals: january.
	self assert: february equals: february.
	self assert: march equals: march.
	self assert: april equals: april.
	self assert: may equals: may.
	self assert: june equals: june.
	self assert: july equals: july.
	self assert: august equals: august.
	self assert: september equals: september.
	self assert: october equals: october.
	self assert: november equals: november.
	self assert: december equals: december
]

{ #category : 'test accessing' }
JulianMonthTest >> testFebruary [

	self
		assert: february number equals: 2;
		assert: (calendar monthNamed: february name) equals: february
]

{ #category : 'test accessing' }
JulianMonthTest >> testFirstDayOfMonth [

	self assert: january firstDayOfMonth equals: JulianJanuary first.
	self assert: february firstDayOfMonth equals: JulianFebruary first.
	self assert: march firstDayOfMonth equals: JulianMarch first.
	self assert: april firstDayOfMonth equals: JulianApril first.
	self assert: may firstDayOfMonth equals: JulianMay first.
	self assert: june firstDayOfMonth equals: JulianJune first.
	self assert: july firstDayOfMonth equals: JulianJuly first.
	self assert: august firstDayOfMonth equals: JulianAugust first.
	self assert: september firstDayOfMonth equals: JulianSeptember first.
	self assert: october firstDayOfMonth equals: JulianOctober first.
	self assert: november firstDayOfMonth equals: JulianNovember first.
	self assert: december firstDayOfMonth equals: JulianDecember first
]

{ #category : 'test comparing' }
JulianMonthTest >> testGreaterThan [

	self assert: february > january.
	self assert: december > january.

	self deny: january > february.
	self deny: january > december.

	self
		should: [ january > JulianMonday ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: JulianMonday class
						 with: JulianMonday
						 with: january class
						 with: january) ].

	self
		should: [ january >= JulianMarch first ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: january class
						 with: january
						 with: JulianMarch first class
						 with: JulianMarch first) ]
]

{ #category : 'test comparing' }
JulianMonthTest >> testHash [

	self assert: january hash equals: january hash.
	self assert: february hash equals: february hash.
	self assert: march hash equals: march hash.
	self assert: april hash equals: april hash.
	self assert: may hash equals: may hash.
	self assert: june hash equals: june hash.
	self assert: july hash equals: july hash.
	self assert: august hash equals: august hash.
	self assert: september hash equals: september hash.
	self assert: october hash equals: october hash.
	self assert: november hash equals: november hash.
	self assert: december hash equals: december hash
]

{ #category : 'test comparing' }
JulianMonthTest >> testIdentity [

	self assert: january == january.
	self assert: february == february.
	self assert: march == march.
	self assert: april == april.
	self assert: may == may.
	self assert: june == june.
	self assert: july == july.
	self assert: august == august.
	self assert: september == september.
	self assert: october == october.
	self assert: november == november.
	self assert: december == december
]

{ #category : 'test testing' }
JulianMonthTest >> testIs [

	self assert: (JulianJanuary is: january).
	self assert: (JulianFebruary is: february).
	self assert: (JulianMarch is: march).
	self assert: (JulianApril is: april).
	self assert: (JulianMay is: may).
	self assert: (JulianJune is: june).
	self assert: (JulianJuly is: july).
	self assert: (JulianAugust is: august).
	self assert: (JulianSeptember is: september).
	self assert: (JulianOctober is: october).
	self assert: (JulianNovember is: november).
	self assert: (JulianDecember is: december)
]

{ #category : 'test accessing' }
JulianMonthTest >> testJanuary [

	self
		assert: january number equals: 1;
		assert: (calendar monthNamed: january name) equals: january
]

{ #category : 'test accessing' }
JulianMonthTest >> testJuly [

	self
		assert: july number equals: 7;
		assert: (calendar monthNamed: july name) equals: july
]

{ #category : 'test accessing' }
JulianMonthTest >> testJune [

	self
		assert: june number equals: 6;
		assert: (calendar monthNamed: june name) equals: june
]

{ #category : 'test accessing' }
JulianMonthTest >> testLastDayOfMonth [

	self assert: january lastDayOfMonth equals: JulianJanuary thirtyfirst.
	self
		assert: february lastDayOfMonth
		equals: JulianFebruary twentyninth.
	self assert: march lastDayOfMonth equals: JulianMarch thirtyfirst.
	self assert: april lastDayOfMonth equals: JulianApril thirtieth.
	self assert: may lastDayOfMonth equals: JulianMay thirtyfirst.
	self assert: june lastDayOfMonth equals: JulianJune thirtieth.
	self assert: july lastDayOfMonth equals: JulianJuly thirtyfirst.
	self assert: august lastDayOfMonth equals: JulianAugust thirtyfirst.
	self
		assert: september lastDayOfMonth
		equals: JulianSeptember thirtieth.
	self assert: october lastDayOfMonth equals: JulianOctober thirtyfirst.
	self assert: november lastDayOfMonth equals: JulianNovember thirtieth.
	self
		assert: december lastDayOfMonth
		equals: JulianDecember thirtyfirst
]

{ #category : 'test comparing' }
JulianMonthTest >> testLessThan [

	self assert: january < february.
	self assert: january < december.

	self deny: february < january.
	self deny: december < january.

	self
		should: [ january > JulianMonday ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: JulianMonday class
						 with: JulianMonday
						 with: january class
						 with: january) ].

	self
		should: [ january >= JulianMarch first ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: january class
						 with: january
						 with: JulianMarch first class
						 with: JulianMarch first) ]
]

{ #category : 'test accessing' }
JulianMonthTest >> testMarch [

	self
		assert: march number equals: 3;
		assert: (calendar monthNamed: march name) equals: march
]

{ #category : 'test accessing' }
JulianMonthTest >> testMay [

	self
		assert: may number equals: 5;
		assert: (calendar monthNamed: may name) equals: may
]

{ #category : 'test creation' }
JulianMonthTest >> testMonthCreation [

	| otherJanuary otherFebruary otheMarch otherApril otherMay otherJune otherJuly otherAugust otherSeptember ohterOctober otherNovember otherDecember |
	otherJanuary := calendar createJanuary.
	otherFebruary := calendar createFebruary.
	otheMarch := calendar createMarch.
	otherApril := calendar createApril.
	otherMay := calendar createMay.
	otherJune := calendar createJune.
	otherJuly := calendar createJuly.
	otherAugust := calendar createAugust.
	otherSeptember := calendar createSeptember.
	ohterOctober := calendar createOctober.
	otherNovember := calendar createNovember.
	otherDecember := calendar createDecember.
	self assert: january name equals: otherJanuary name.
	self assert: january number equals: otherJanuary number.
	self assert: february name equals: otherFebruary name.
	self assert: february number equals: otherFebruary number.
	self assert: march name equals: otheMarch name.
	self assert: march number equals: otheMarch number.
	self assert: april name equals: otherApril name.
	self assert: april number equals: otherApril number.
	self assert: may name equals: otherMay name.
	self assert: may number equals: otherMay number.
	self assert: june name equals: otherJune name.
	self assert: june number equals: otherJune number.
	self assert: july name equals: otherJuly name.
	self assert: july number equals: otherJuly number.
	self assert: august name equals: otherAugust name.
	self assert: august number equals: otherAugust number.
	self assert: september name equals: otherSeptember name.
	self assert: september number equals: otherSeptember number.
	self assert: october name equals: ohterOctober name.
	self assert: october number equals: ohterOctober number.
	self assert: november name equals: otherNovember name.
	self assert: november number equals: otherNovember number.
	self assert: december name equals: otherDecember name.
	self assert: december number equals: otherDecember number
]

{ #category : 'test querying' }
JulianMonthTest >> testMonthsFrom [

	self assert: (january distanceFrom: january) equals: zeroMonths.
	self assert: (january distanceFrom: february) equals: elevenMonths.
	self assert: (january distanceFrom: december) equals: oneMonth.
	self assert: (december distanceFrom: january) equals: elevenMonths.
	self assert: (december distanceFrom: november) equals: oneMonth
]

{ #category : 'test querying' }
JulianMonthTest >> testMonthsTo [

	self assert: (january distanceTo: january) equals: zeroMonths.
	self assert: (january distanceTo: february) equals: oneMonth.
	self assert: (january distanceTo: december) equals: elevenMonths.
	self assert: (december distanceTo: january) equals: oneMonth.
	self assert: (december distanceTo: november) equals: elevenMonths
]

{ #category : 'test enumerating' }
JulianMonthTest >> testNext [

	self assert: december next equals: january.
	self assert: january next equals: february.
	self assert: february next equals: march
]

{ #category : 'test enumerating' }
JulianMonthTest >> testNextInANumberOfMonths [

	self assert: (december next: oneMonth) equals: january.
	self assert: (december next: twelveMonths) equals: december
]

{ #category : 'test accessing' }
JulianMonthTest >> testNovember [

	self
		assert: november number equals: 11;
		assert: (calendar monthNamed: november name) equals: november
]

{ #category : 'test accessing' }
JulianMonthTest >> testNumberOfDays [

	self assert: january numberOfDays equals: 31 daysMeasure.
	self assert: february numberOfDays equals: 29 daysMeasure.
	self assert: march numberOfDays equals: 31 daysMeasure.
	self assert: april numberOfDays equals: 30 daysMeasure.
	self assert: may numberOfDays equals: 31 daysMeasure.
	self assert: june numberOfDays equals: 30 daysMeasure.
	self assert: july numberOfDays equals: 31 daysMeasure.
	self assert: august numberOfDays equals: 31 daysMeasure.
	self assert: september numberOfDays equals: 30 daysMeasure.
	self assert: october numberOfDays equals: 31 daysMeasure.
	self assert: november numberOfDays equals: 30 daysMeasure.
	self assert: december numberOfDays equals: 31 daysMeasure
]

{ #category : 'test accessing' }
JulianMonthTest >> testNumberOfDaysFromBeginningOfYearIn [

	| leapYear nonleapYear |
	leapYear := 2008 asJulianYear.
	nonleapYear := 2007 asJulianYear.
	self
		assert: (january numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 0 daysMeasure.
	self
		assert: (january numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 0 daysMeasure.
	self
		assert: (february numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 31 daysMeasure.
	self
		assert: (february numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 31 daysMeasure.
	self
		assert: (march numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 60 daysMeasure.
	self
		assert: (march numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 59 daysMeasure.
	self
		assert: (april numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 91 daysMeasure.
	self
		assert: (april numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 90 daysMeasure.
	self
		assert: (may numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 121 daysMeasure.
	self
		assert: (may numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 120 daysMeasure.
	self
		assert: (june numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 152 daysMeasure.
	self
		assert: (june numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 151 daysMeasure.
	self
		assert: (july numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 182 daysMeasure.
	self
		assert: (july numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 181 daysMeasure.
	self
		assert: (august numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 213 daysMeasure.
	self
		assert: (august numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 212 daysMeasure.
	self
		assert: (september numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 244 daysMeasure.
	self
		assert: (september numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 243 daysMeasure.
	self
		assert: (october numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 274 daysMeasure.
	self
		assert: (october numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 273 daysMeasure.
	self
		assert: (november numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 305 daysMeasure.
	self
		assert: (november numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 304 daysMeasure.
	self
		assert: (december numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 335 daysMeasure.
	self
		assert: (december numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 334 daysMeasure
]

{ #category : 'test accessing' }
JulianMonthTest >> testNumberOfDaysIn [

	| leapYear nonleapYear |
	leapYear := 2008 asJulianYear.
	nonleapYear := 2007 asJulianYear.
	self
		assert: (january numberOfDaysIn: leapYear)
		equals: 31 daysMeasure.
	self
		assert: (january numberOfDaysIn: nonleapYear)
		equals: 31 daysMeasure.
	self
		assert: (february numberOfDaysIn: leapYear)
		equals: 29 daysMeasure.
	self
		assert: (february numberOfDaysIn: nonleapYear)
		equals: 28 daysMeasure.
	self assert: (march numberOfDaysIn: leapYear) equals: 31 daysMeasure.
	self
		assert: (march numberOfDaysIn: nonleapYear)
		equals: 31 daysMeasure.
	self assert: (april numberOfDaysIn: leapYear) equals: 30 daysMeasure.
	self
		assert: (april numberOfDaysIn: nonleapYear)
		equals: 30 daysMeasure.
	self assert: (may numberOfDaysIn: leapYear) equals: 31 daysMeasure.
	self assert: (may numberOfDaysIn: nonleapYear) equals: 31 daysMeasure.
	self assert: (june numberOfDaysIn: leapYear) equals: 30 daysMeasure.
	self
		assert: (june numberOfDaysIn: nonleapYear)
		equals: 30 daysMeasure.
	self assert: (july numberOfDaysIn: leapYear) equals: 31 daysMeasure.
	self
		assert: (july numberOfDaysIn: nonleapYear)
		equals: 31 daysMeasure.
	self assert: (august numberOfDaysIn: leapYear) equals: 31 daysMeasure.
	self
		assert: (august numberOfDaysIn: nonleapYear)
		equals: 31 daysMeasure.
	self
		assert: (september numberOfDaysIn: leapYear)
		equals: 30 daysMeasure.
	self
		assert: (september numberOfDaysIn: nonleapYear)
		equals: 30 daysMeasure.
	self
		assert: (october numberOfDaysIn: leapYear)
		equals: 31 daysMeasure.
	self
		assert: (october numberOfDaysIn: nonleapYear)
		equals: 31 daysMeasure.
	self
		assert: (november numberOfDaysIn: leapYear)
		equals: 30 daysMeasure.
	self
		assert: (november numberOfDaysIn: nonleapYear)
		equals: 30 daysMeasure.
	self
		assert: (december numberOfDaysIn: leapYear)
		equals: 31 daysMeasure.
	self
		assert: (december numberOfDaysIn: nonleapYear)
		equals: 31 daysMeasure
]

{ #category : 'test accessing' }
JulianMonthTest >> testOctober [

	self
		assert: october number equals: 10;
		assert: (calendar monthNamed: october name) equals: october
]

{ #category : 'test month of year creation' }
JulianMonthTest >> testOf [

	self
		assert: (february of: 2003)
		equals:
		(MonthOfYear yearNumber: 2003 monthNumber: 2 calendar: calendar)
]

{ #category : 'test month of year creation' }
JulianMonthTest >> testOfYear [

	self
		assert: (february ofYear: 2003 asJulianYear)
		equals:
		(MonthOfYear yearNumber: 2003 monthNumber: 2 calendar: calendar)
]

{ #category : 'test enumerating' }
JulianMonthTest >> testPrevious [

	self assert: january previous equals: december.
	self assert: february previous equals: january.
	self assert: december previous equals: november
]

{ #category : 'test enumerating' }
JulianMonthTest >> testPreviousInANumberOfMonths [

	self assert: (january previous: oneMonth) equals: december.
	self assert: (january previous: twelveMonths) equals: january.
	self assert: (february previous: twoMonths) equals: december
]

{ #category : 'test printing' }
JulianMonthTest >> testPrintString [

	self assert: january printString equals: 'January'.
	self assert: february printString equals: 'February'.
	self assert: march printString equals: 'March'.
	self assert: april printString equals: 'April'.
	self assert: may printString equals: 'May'.
	self assert: june printString equals: 'June'.
	self assert: july printString equals: 'July'.
	self assert: august printString equals: 'August'.
	self assert: september printString equals: 'September'.
	self assert: october printString equals: 'October'.
	self assert: november printString equals: 'November'.
	self assert: december printString equals: 'December'
]

{ #category : 'test accessing' }
JulianMonthTest >> testSeptember [

	self
		assert: september number equals: 9;
		assert: (calendar monthNamed: september name) equals: september
]

{ #category : 'test interval protocol' }
JulianMonthTest >> testTo [

	| interval |
	interval := january to: december.
	self assert: interval from equals: january.
	self assert: interval to equals: december.
	self assert: interval by equals: oneMonth
]

{ #category : 'test interval protocol' }
JulianMonthTest >> testToBy [

	| interval |
	interval := january to: december by: twoMonths.
	self assert: interval from equals: january.
	self assert: interval to equals: december.
	self assert: interval by equals: twoMonths
]

{ #category : 'test interval protocol' }
JulianMonthTest >> testToByDo [

	| number |
	number := 1.
	(january to: december by: twoMonths) do: [ :month |
		self assert: month number equals: number.
		number := number + 2 ].
	self assert: number equals: 13.

	number := 7.
	(july to: june by: oneMonth) do: [ :month |
		self assert: month number equals: number.
		number := number + 1 rem: 12.
		number = 0 ifTrue: [ number := 12 ] ].
	self assert: number equals: 7
]

{ #category : 'test interval protocol' }
JulianMonthTest >> testToNegativeByDo [

	| number |
	number := 12.
	(december to: january by: oneMonth negated) do: [ :month |
		self assert: month number equals: number.
		number := number - 1 ].
	self assert: number equals: 0
]

{ #category : 'test interval protocol' }
JulianMonthTest >> testToReverse [

	| coll number |
	coll := (january to: november by: twoMonths) reverse.
	number := 11.
	coll do: [ :month |
		self assert: month number equals: number.
		number := number - 2 ].
	self assert: number equals: -1
]
