Class {
	#name : #JulianMonthTest,
	#superclass : #TestCase,
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
	#category : #'Chalten-Julian-Calendar-Tests'
}

{ #category : #accessing }
JulianMonthTest class >> classUnderTest [

	^ChaltenMonth
]

{ #category : #initialization }
JulianMonthTest >> setUp [
	calendar := JulianCalendar.
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
	zeroMonths := calendar monthUnit with: 0.
	oneMonth := calendar monthUnit with: 1.
	twoMonths := calendar monthUnit with: 2.
	elevenMonths := calendar monthUnit with: 11.
	twelveMonths := calendar monthUnit with: 12
]

{ #category : #'test accessing' }
JulianMonthTest >> testApril [

	self
		assert: april number = 4;
		assert: (calendar monthNamed: april name) = april
]

{ #category : #'test accessing' }
JulianMonthTest >> testAugust [

	self
		assert: august number = 8;
		assert: (calendar monthNamed: august name) = august
]

{ #category : #'test month of year creation' }
JulianMonthTest >> testComma [

	self assert: (february , 2003) = (MonthOfYear yearNumber: 2003 monthNumber: 2 calendar: calendar)
]

{ #category : #'test accessing' }
JulianMonthTest >> testCurrent [

	self assert: calendar currentMonth = calendar today month
]

{ #category : #'test day of month creation' }
JulianMonthTest >> testDayOfMonthCreation [

	self assert: january first = (DayOfMonth monthNumber: 1 dayNumber: 1 calendar: calendar).
	self assert: january second = (DayOfMonth monthNumber: 1 dayNumber: 2 calendar: calendar).
	self assert: january third = (DayOfMonth monthNumber: 1 dayNumber: 3 calendar: calendar).
	self assert: january fourth = (DayOfMonth monthNumber: 1 dayNumber: 4 calendar: calendar).
	self assert: january fifth = (DayOfMonth monthNumber: 1 dayNumber: 5 calendar: calendar).
	self assert: january sixth = (DayOfMonth monthNumber: 1 dayNumber: 6 calendar: calendar).
	self assert: january seventh = (DayOfMonth monthNumber: 1 dayNumber: 7 calendar: calendar).
	self assert: january eighth = (DayOfMonth monthNumber: 1 dayNumber: 8 calendar: calendar).
	self assert: january ninth = (DayOfMonth monthNumber: 1 dayNumber: 9 calendar: calendar).
	self assert: january tenth = (DayOfMonth monthNumber: 1 dayNumber: 10 calendar: calendar).
	self assert: january eleventh = (DayOfMonth monthNumber: 1 dayNumber: 11 calendar: calendar).
	self assert: january twelfth = (DayOfMonth monthNumber: 1 dayNumber: 12 calendar: calendar).
	self assert: january thirteenth = (DayOfMonth monthNumber: 1 dayNumber: 13 calendar: calendar).
	self assert: january fourteenth = (DayOfMonth monthNumber: 1 dayNumber: 14 calendar: calendar).
	self assert: january fifteenth = (DayOfMonth monthNumber: 1 dayNumber: 15 calendar: calendar).
	self assert: january sixteenth = (DayOfMonth monthNumber: 1 dayNumber: 16 calendar: calendar).
	self assert: january seventeenth = (DayOfMonth monthNumber: 1 dayNumber: 17 calendar: calendar).
	self assert: january eighteenth = (DayOfMonth monthNumber: 1 dayNumber: 18 calendar: calendar).
	self assert: january nineteenth = (DayOfMonth monthNumber: 1 dayNumber: 19 calendar: calendar).
	self assert: january twentieth = (DayOfMonth monthNumber: 1 dayNumber: 20 calendar: calendar).
	self assert: january twentyfirst = (DayOfMonth monthNumber: 1 dayNumber: 21 calendar: calendar).
	self assert: january twentysecond = (DayOfMonth monthNumber: 1 dayNumber: 22 calendar: calendar).
	self assert: january twentythird = (DayOfMonth monthNumber: 1 dayNumber: 23 calendar: calendar).
	self assert: january twentyfourth = (DayOfMonth monthNumber: 1 dayNumber: 24 calendar: calendar).
	self assert: january twentyfifth = (DayOfMonth monthNumber: 1 dayNumber: 25 calendar: calendar).
	self assert: january twentysixth = (DayOfMonth monthNumber: 1 dayNumber: 26 calendar: calendar).
	self assert: january twentyseventh = (DayOfMonth monthNumber: 1 dayNumber: 27 calendar: calendar).
	self assert: january twentyeighth = (DayOfMonth monthNumber: 1 dayNumber: 28 calendar: calendar).
	self assert: january twentyninth = (DayOfMonth monthNumber: 1 dayNumber: 29 calendar: calendar)
]

{ #category : #'test accessing' }
JulianMonthTest >> testDecember [

	self
		assert: december number = 12;
		assert: (calendar monthNamed: december name) = december
]

{ #category : #'test comparing' }
JulianMonthTest >> testEqual [

	self assert: january = january.
	self assert: february = february.
	self assert: march = march.
	self assert: april = april.
	self assert: may = may.
	self assert: june = june.
	self assert: july = july.
	self assert: august = august.
	self assert: september = september.
	self assert: october = october.
	self assert: november = november.
	self assert: december = december
]

{ #category : #'test accessing' }
JulianMonthTest >> testFebruary [

	self
		assert: february number = 2;
		assert: (calendar monthNamed: february name) = february
]

{ #category : #'test accessing' }
JulianMonthTest >> testFirstDayOfMonth [

	self assert: january firstDayOfMonth = JulianJanuary first.
	self assert: february firstDayOfMonth = JulianFebruary first.
	self assert: march firstDayOfMonth = JulianMarch first.
	self assert: april firstDayOfMonth = JulianApril first.
	self assert: may firstDayOfMonth = JulianMay first.
	self assert: june firstDayOfMonth = JulianJune first.
	self assert: july firstDayOfMonth = JulianJuly first.
	self assert: august firstDayOfMonth = JulianAugust first.
	self assert: september firstDayOfMonth = JulianSeptember first.
	self assert: october firstDayOfMonth = JulianOctober first.
	self assert: november firstDayOfMonth = JulianNovember first.
	self assert: december firstDayOfMonth = JulianDecember first
]

{ #category : #'test comparing' }
JulianMonthTest >> testGreaterThan [

	self assert: february > january.
	self assert: december > january.

	self deny: january > february.
	self deny: january > december.
	
	self should: [ january > JulianMonday ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: JulianMonday class
				with: JulianMonday
				with: january class
				with: january) ].
	
	self should: [ january >= JulianMarch first ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: january class
				with: january
				with: JulianMarch first class
				with: JulianMarch first) ]
]

{ #category : #'test comparing' }
JulianMonthTest >> testHash [

	self assert: january hash = january hash.
	self assert: february hash = february hash.
	self assert: march hash = march hash.
	self assert: april hash = april hash.
	self assert: may hash = may hash.
	self assert: june hash = june hash.
	self assert: july hash = july hash.
	self assert: august hash = august hash.
	self assert: september hash = september hash.
	self assert: october hash = october hash.
	self assert: november hash = november hash.
	self assert: december hash = december hash
]

{ #category : #'test comparing' }
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

{ #category : #'test testing' }
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

{ #category : #'test accessing' }
JulianMonthTest >> testJanuary [

	self
		assert: january number = 1;
		assert: (calendar monthNamed: january name) = january
]

{ #category : #'test accessing' }
JulianMonthTest >> testJuly [

	self
		assert: july number = 7;
		assert: (calendar monthNamed: july name) = july
]

{ #category : #'test accessing' }
JulianMonthTest >> testJune [

	self
		assert: june number = 6;
		assert: (calendar monthNamed: june name) = june
]

{ #category : #'test accessing' }
JulianMonthTest >> testLastDayOfMonth [

	self assert: january lastDayOfMonth = JulianJanuary thirtyfirst.
	self assert: february lastDayOfMonth = JulianFebruary twentyninth.
	self assert: march lastDayOfMonth = JulianMarch thirtyfirst.
	self assert: april lastDayOfMonth = JulianApril thirtieth.
	self assert: may lastDayOfMonth = JulianMay thirtyfirst.
	self assert: june lastDayOfMonth = JulianJune thirtieth.
	self assert: july lastDayOfMonth = JulianJuly thirtyfirst.
	self assert: august lastDayOfMonth = JulianAugust thirtyfirst.
	self assert: september lastDayOfMonth = JulianSeptember thirtieth.
	self assert: october lastDayOfMonth = JulianOctober thirtyfirst.
	self assert: november lastDayOfMonth = JulianNovember thirtieth.
	self assert: december lastDayOfMonth = JulianDecember thirtyfirst
]

{ #category : #'test comparing' }
JulianMonthTest >> testLessThan [

	self assert: january < february.
	self assert: january < december.

	self deny: february < january.
	self deny: december < january.
	
	self should: [ january > JulianMonday ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: JulianMonday class
				with: JulianMonday
				with: january class
				with: january) ].
	
	self should: [ january >= JulianMarch first ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: january class
				with: january
				with: JulianMarch first class
				with: JulianMarch first) ]
]

{ #category : #'test accessing' }
JulianMonthTest >> testMarch [

	self
		assert: march number = 3;
		assert: (calendar monthNamed: march name) = march
]

{ #category : #'test accessing' }
JulianMonthTest >> testMay [

	self
		assert: may number = 5;
		assert: (calendar monthNamed: may name) = may
]

{ #category : #'test creation' }
JulianMonthTest >> testMonthCreation [

	| otherJanuary otherFebruary otheMarch otherApril otherMay otherJune otherJuly otherAugust
	  otherSeptember ohterOctober otherNovember otherDecember |

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

	self assert: january name = otherJanuary name.
	self assert: january number = otherJanuary number.
	self assert: february name = otherFebruary name.
	self assert: february number = otherFebruary number.
	self assert: march name = otheMarch name.
	self assert: march number = otheMarch number.
	self assert: april name = otherApril name.
	self assert: april number = otherApril number.
	self assert: may name = otherMay name.
	self assert: may number = otherMay number.
	self assert: june name = otherJune name.
	self assert: june number = otherJune number.
	self assert: july name = otherJuly name.
	self assert: july number = otherJuly number.
	self assert: august name = otherAugust name.
	self assert: august number = otherAugust number.
	self assert: september name = otherSeptember name.
	self assert: september number = otherSeptember number.
	self assert: october name = ohterOctober name.
	self assert: october number = ohterOctober number.
	self assert: november name = otherNovember name.
	self assert: november number = otherNovember number.
	self assert: december name = otherDecember name.
	self assert: december number = otherDecember number
]

{ #category : #'test querying' }
JulianMonthTest >> testMonthsFrom [

	self assert: (january distanceFrom: january) = zeroMonths.
	self assert: (january distanceFrom: february) = elevenMonths.
	self assert: (january distanceFrom: december) = oneMonth.

	self assert: (december distanceFrom: january) = elevenMonths.
	self assert: (december distanceFrom: november) = oneMonth
]

{ #category : #'test querying' }
JulianMonthTest >> testMonthsTo [

	self assert: (january distanceTo: january) = zeroMonths.
	self assert: (january distanceTo: february) = oneMonth.
	self assert: (january distanceTo: december) = elevenMonths.

	self assert: (december distanceTo: january) = oneMonth.
	self assert: (december distanceTo: november) = elevenMonths
]

{ #category : #'test enumerating' }
JulianMonthTest >> testNext [

	self assert: december next = january.
	self assert: january next = february.
	self assert: february next = march
]

{ #category : #'test enumerating' }
JulianMonthTest >> testNextInANumberOfMonths [

	self assert: (december next: oneMonth) = january.
	self assert: (december next: twelveMonths) = december
]

{ #category : #'test accessing' }
JulianMonthTest >> testNovember [

	self
		assert: november number = 11;
		assert: (calendar monthNamed: november name) = november
]

{ #category : #'test accessing' }
JulianMonthTest >> testNumberOfDays [
	self assert: january numberOfDays = 31 daysMeasure.
	self assert: february numberOfDays = 29 daysMeasure.
	self assert: march numberOfDays = 31 daysMeasure.
	self assert: april numberOfDays = 30 daysMeasure.
	self assert: may numberOfDays = 31 daysMeasure.
	self assert: june numberOfDays = 30 daysMeasure.
	self assert: july numberOfDays = 31 daysMeasure.
	self assert: august numberOfDays = 31 daysMeasure.
	self assert: september numberOfDays = 30 daysMeasure.
	self assert: october numberOfDays = 31 daysMeasure.
	self assert: november numberOfDays = 30 daysMeasure.
	self assert: december numberOfDays = 31 daysMeasure
]

{ #category : #'test accessing' }
JulianMonthTest >> testNumberOfDaysFromBeginningOfYearIn [
	| leapYear nonleapYear |
	leapYear := 2008 asJulianYear.
	nonleapYear := 2007 asJulianYear.
	self assert: (january numberOfDaysFromBeginningOfYearIn: leapYear) = 0 daysMeasure.
	self assert: (january numberOfDaysFromBeginningOfYearIn: nonleapYear) = 0 daysMeasure.
	self assert: (february numberOfDaysFromBeginningOfYearIn: leapYear) = 31 daysMeasure.
	self assert: (february numberOfDaysFromBeginningOfYearIn: nonleapYear) = 31 daysMeasure.
	self assert: (march numberOfDaysFromBeginningOfYearIn: leapYear) = 60 daysMeasure.
	self assert: (march numberOfDaysFromBeginningOfYearIn: nonleapYear) = 59 daysMeasure.
	self assert: (april numberOfDaysFromBeginningOfYearIn: leapYear) = 91 daysMeasure.
	self assert: (april numberOfDaysFromBeginningOfYearIn: nonleapYear) = 90 daysMeasure.
	self assert: (may numberOfDaysFromBeginningOfYearIn: leapYear) = 121 daysMeasure.
	self assert: (may numberOfDaysFromBeginningOfYearIn: nonleapYear) = 120 daysMeasure.
	self assert: (june numberOfDaysFromBeginningOfYearIn: leapYear) = 152 daysMeasure.
	self assert: (june numberOfDaysFromBeginningOfYearIn: nonleapYear) = 151 daysMeasure.
	self assert: (july numberOfDaysFromBeginningOfYearIn: leapYear) = 182 daysMeasure.
	self assert: (july numberOfDaysFromBeginningOfYearIn: nonleapYear) = 181 daysMeasure.
	self assert: (august numberOfDaysFromBeginningOfYearIn: leapYear) = 213 daysMeasure.
	self assert: (august numberOfDaysFromBeginningOfYearIn: nonleapYear) = 212 daysMeasure.
	self assert: (september numberOfDaysFromBeginningOfYearIn: leapYear) = 244 daysMeasure.
	self assert: (september numberOfDaysFromBeginningOfYearIn: nonleapYear) = 243 daysMeasure.
	self assert: (october numberOfDaysFromBeginningOfYearIn: leapYear) = 274 daysMeasure.
	self assert: (october numberOfDaysFromBeginningOfYearIn: nonleapYear) = 273 daysMeasure.
	self assert: (november numberOfDaysFromBeginningOfYearIn: leapYear) = 305 daysMeasure.
	self assert: (november numberOfDaysFromBeginningOfYearIn: nonleapYear) = 304 daysMeasure.
	self assert: (december numberOfDaysFromBeginningOfYearIn: leapYear) = 335 daysMeasure.
	self assert: (december numberOfDaysFromBeginningOfYearIn: nonleapYear) = 334 daysMeasure
]

{ #category : #'test accessing' }
JulianMonthTest >> testNumberOfDaysIn [
	| leapYear nonleapYear |
	leapYear := 2008 asJulianYear.
	nonleapYear := 2007 asJulianYear.
	self assert: (january numberOfDaysIn: leapYear) = 31 daysMeasure.
	self assert: (january numberOfDaysIn: nonleapYear) = 31 daysMeasure.
	self assert: (february numberOfDaysIn: leapYear) = 29 daysMeasure.
	self assert: (february numberOfDaysIn: nonleapYear) = 28 daysMeasure.
	self assert: (march numberOfDaysIn: leapYear) = 31 daysMeasure.
	self assert: (march numberOfDaysIn: nonleapYear) = 31 daysMeasure.
	self assert: (april numberOfDaysIn: leapYear) = 30 daysMeasure.
	self assert: (april numberOfDaysIn: nonleapYear) = 30 daysMeasure.
	self assert: (may numberOfDaysIn: leapYear) = 31 daysMeasure.
	self assert: (may numberOfDaysIn: nonleapYear) = 31 daysMeasure.
	self assert: (june numberOfDaysIn: leapYear) = 30 daysMeasure.
	self assert: (june numberOfDaysIn: nonleapYear) = 30 daysMeasure.
	self assert: (july numberOfDaysIn: leapYear) = 31 daysMeasure.
	self assert: (july numberOfDaysIn: nonleapYear) = 31 daysMeasure.
	self assert: (august numberOfDaysIn: leapYear) = 31 daysMeasure.
	self assert: (august numberOfDaysIn: nonleapYear) = 31 daysMeasure.
	self assert: (september numberOfDaysIn: leapYear) = 30 daysMeasure.
	self assert: (september numberOfDaysIn: nonleapYear) = 30 daysMeasure.
	self assert: (october numberOfDaysIn: leapYear) = 31 daysMeasure.
	self assert: (october numberOfDaysIn: nonleapYear) = 31 daysMeasure.
	self assert: (november numberOfDaysIn: leapYear) = 30 daysMeasure.
	self assert: (november numberOfDaysIn: nonleapYear) = 30 daysMeasure.
	self assert: (december numberOfDaysIn: leapYear) = 31 daysMeasure.
	self assert: (december numberOfDaysIn: nonleapYear) = 31 daysMeasure
]

{ #category : #'test accessing' }
JulianMonthTest >> testOctober [

	self
		assert: october number = 10;
		assert: (calendar monthNamed: october name) = october
]

{ #category : #'test month of year creation' }
JulianMonthTest >> testOf [

	self assert: (february of: 2003) = (MonthOfYear yearNumber: 2003 monthNumber: 2 calendar: calendar)
]

{ #category : #'test month of year creation' }
JulianMonthTest >> testOfYear [
	self assert: (february ofYear: 2003 asJulianYear) = (MonthOfYear yearNumber: 2003 monthNumber: 2 calendar: calendar)
]

{ #category : #'test enumerating' }
JulianMonthTest >> testPrevious [

	self assert: january previous = december.
	self assert: february previous = january.
	self assert: december previous = november
]

{ #category : #'test enumerating' }
JulianMonthTest >> testPreviousInANumberOfMonths [

	self assert: (january previous: oneMonth) = december.
	self assert: (january previous: twelveMonths) = january.
	self assert: (february previous: twoMonths) = december
]

{ #category : #'test printing' }
JulianMonthTest >> testPrintString [

	self assert: january printString = 'January'.
	self assert: february printString = 'February'.
	self assert: march printString = 'March'.
	self assert: april printString = 'April'.
	self assert: may printString = 'May'.
	self assert: june printString = 'June'.
	self assert: july printString = 'July'.
	self assert: august printString = 'August'.
	self assert: september printString = 'September'.
	self assert: october printString = 'October'.
	self assert: november printString = 'November'.
	self assert: december printString = 'December'
]

{ #category : #'test accessing' }
JulianMonthTest >> testSeptember [

	self
		assert: september number = 9;
		assert: (calendar monthNamed: september name) = september
]

{ #category : #'test interval protocol' }
JulianMonthTest >> testTo [

	| interval |

	interval := january to: december.

	self assert: interval from = january.
	self assert: interval to = december.
	self assert: interval by = oneMonth
]

{ #category : #'test interval protocol' }
JulianMonthTest >> testToBy [

	| interval |

	interval := january to: december by: twoMonths.

	self assert: interval from = january.
	self assert: interval to = december.
	self assert: interval by = twoMonths
]

{ #category : #'test interval protocol' }
JulianMonthTest >> testToByDo [

	| number |

	number := 1.
	(january to: december by: twoMonths) do: [:month |
		self assert: month number = number.
		number := number + 2].

	self assert: number = 13.

	number := 7.
	(july to: june by: oneMonth) do: [:month |
		self assert: month number = number.
		number := (number + 1) rem: 12.
		number = 0 ifTrue: [number := 12]].

	self assert: number = 7
]

{ #category : #'test interval protocol' }
JulianMonthTest >> testToNegativeByDo [

	| number |

	number := 12.
	(december to: january by: oneMonth negated) do: [:month |
		self assert: month number = number.
		number := number - 1].

	self assert: number = 0
]

{ #category : #'test interval protocol' }
JulianMonthTest >> testToReverse [

	| coll number |

	coll := (january to: november by: twoMonths) reverse.
	number := 11.
	coll do: [:month |
		self assert: month number = number.
		number := number - 2].

	self assert: number = -1
]
