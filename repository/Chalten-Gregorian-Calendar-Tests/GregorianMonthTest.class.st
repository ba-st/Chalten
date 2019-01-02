Class {
	#name : #GregorianMonthTest,
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
	#category : #'Chalten-Gregorian-Calendar-Tests'
}

{ #category : #accessing }
GregorianMonthTest class >> classUnderTest [

	^ChaltenMonth
]

{ #category : #initialization }
GregorianMonthTest >> setUp [
	calendar := GregorianCalendar.
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

{ #category : #'test accessing' }
GregorianMonthTest >> testApril [

	self
		assert: april number = 4;
		assert: (calendar monthNamed: april name) = april
]

{ #category : #'test accessing' }
GregorianMonthTest >> testAugust [

	self
		assert: august number = 8;
		assert: (calendar monthNamed: august name) = august
]

{ #category : #'test month of year creation' }
GregorianMonthTest >> testComma [

	self assert: (february , 2003) = (MonthOfYear yearNumber: 2003 monthNumber: 2 calendar: calendar)
]

{ #category : #'test accessing' }
GregorianMonthTest >> testCurrent [

	self assert: calendar currentMonth = calendar today month
]

{ #category : #'test day of month creation' }
GregorianMonthTest >> testDayOfMonthCreation [

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
GregorianMonthTest >> testDecember [

	self
		assert: december number = 12;
		assert: (calendar monthNamed: december name) = december
]

{ #category : #'test comparing' }
GregorianMonthTest >> testEqual [

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
GregorianMonthTest >> testFebruary [

	self
		assert: february number = 2;
		assert: (calendar monthNamed: february name) = february
]

{ #category : #'test accessing' }
GregorianMonthTest >> testFirstDayOfMonth [

	self assert: january firstDayOfMonth = January first.
	self assert: february firstDayOfMonth = February first.
	self assert: march firstDayOfMonth = March first.
	self assert: april firstDayOfMonth = April first.
	self assert: may firstDayOfMonth = May first.
	self assert: june firstDayOfMonth = June first.
	self assert: july firstDayOfMonth = July first.
	self assert: august firstDayOfMonth = August first.
	self assert: september firstDayOfMonth = September first.
	self assert: october firstDayOfMonth = October first.
	self assert: november firstDayOfMonth = November first.
	self assert: december firstDayOfMonth = December first
]

{ #category : #'test comparing' }
GregorianMonthTest >> testGreaterThan [

	self assert: february > january.
	self assert: december > january.

	self deny: january > february.
	self deny: january > december.
	
	self should: [ january > Monday ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: Monday class
				with: Monday
				with: january class
				with: january) ].
	
	self should: [ january >= March first ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: january class
				with: january
				with: March first class
				with: March first) ]
]

{ #category : #'test comparing' }
GregorianMonthTest >> testHash [

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
GregorianMonthTest >> testIdentity [

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
GregorianMonthTest >> testIs [

	self assert: (January is: january).
	self assert: (February is: february).
	self assert: (March is: march).
	self assert: (April is: april).
	self assert: (May is: may).
	self assert: (June is: june).
	self assert: (July is: july).
	self assert: (August is: august).
	self assert: (September is: september).
	self assert: (October is: october).
	self assert: (November is: november).
	self assert: (December is: december)
]

{ #category : #'test accessing' }
GregorianMonthTest >> testJanuary [

	self
		assert: january number = 1;
		assert: (calendar monthNamed: january name) = january
]

{ #category : #'test accessing' }
GregorianMonthTest >> testJuly [

	self
		assert: july number = 7;
		assert: (calendar monthNamed: july name) = july
]

{ #category : #'test accessing' }
GregorianMonthTest >> testJune [

	self
		assert: june number = 6;
		assert: (calendar monthNamed: june name) = june
]

{ #category : #'test accessing' }
GregorianMonthTest >> testLastDayOfMonth [

	self assert: january lastDayOfMonth = January thirtyfirst.
	self assert: february lastDayOfMonth = February twentyninth.
	self assert: march lastDayOfMonth = March thirtyfirst.
	self assert: april lastDayOfMonth = April thirtieth.
	self assert: may lastDayOfMonth = May thirtyfirst.
	self assert: june lastDayOfMonth = June thirtieth.
	self assert: july lastDayOfMonth = July thirtyfirst.
	self assert: august lastDayOfMonth = August thirtyfirst.
	self assert: september lastDayOfMonth = September thirtieth.
	self assert: october lastDayOfMonth = October thirtyfirst.
	self assert: november lastDayOfMonth = November thirtieth.
	self assert: december lastDayOfMonth = December thirtyfirst
]

{ #category : #'test comparing' }
GregorianMonthTest >> testLessThan [

	self assert: january < february.
	self assert: january < december.

	self deny: february < january.
	self deny: december < january.
	
	self should: [ january <= Monday ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: Monday class
				with: Monday
				with: january class
				with: january) ].
	
	self should: [ january < March first ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: january class
				with: january
				with: March first class
				with: March first) ]
]

{ #category : #'test accessing' }
GregorianMonthTest >> testMarch [

	self
		assert: march number = 3;
		assert: (calendar monthNamed: march name) = march
]

{ #category : #'test accessing' }
GregorianMonthTest >> testMay [

	self
		assert: may number = 5;
		assert: (calendar monthNamed: may name) = may
]

{ #category : #'test creation' }
GregorianMonthTest >> testMonthCreation [

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
GregorianMonthTest >> testMonthsFrom [

	self assert: (january distanceFrom: january) = zeroMonths.
	self assert: (january distanceFrom: february) = elevenMonths.
	self assert: (january distanceFrom: december) = oneMonth.

	self assert: (december distanceFrom: january) = elevenMonths.
	self assert: (december distanceFrom: november) = oneMonth
]

{ #category : #'test querying' }
GregorianMonthTest >> testMonthsTo [

	self assert: (january distanceTo: january) = zeroMonths.
	self assert: (january distanceTo: february) = oneMonth.
	self assert: (january distanceTo: december) = elevenMonths.

	self assert: (december distanceTo: january) = oneMonth.
	self assert: (december distanceTo: november) = elevenMonths
]

{ #category : #'test enumerating' }
GregorianMonthTest >> testNext [

	self assert: december next = january.
	self assert: january next = february.
	self assert: february next = march
]

{ #category : #'test enumerating' }
GregorianMonthTest >> testNextInANumberOfMonths [

	self assert: (december next: oneMonth) = january.
	self assert: (december next: twelveMonths) = december
]

{ #category : #'test accessing' }
GregorianMonthTest >> testNovember [

	self
		assert: november number = 11;
		assert: (calendar monthNamed: november name) = november
]

{ #category : #'test accessing' }
GregorianMonthTest >> testNumberOfDays [
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
GregorianMonthTest >> testNumberOfDaysFromBeginningOfYearIn [
	| leapYear nonleapYear |
	leapYear := 2008 asGregorianYear.
	nonleapYear := 2007 asGregorianYear.
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
GregorianMonthTest >> testNumberOfDaysIn [
	| leapYear nonleapYear |
	leapYear := 2008 asGregorianYear.
	nonleapYear := 2007 asGregorianYear.
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
GregorianMonthTest >> testNumberOfDaysInLeapYear [

	self assert: january numberOfDaysInLeapYear = 31 daysMeasure.
	self assert: february numberOfDaysInLeapYear = 29 daysMeasure.
	self assert: march numberOfDaysInLeapYear = 31 daysMeasure.
	self assert: april numberOfDaysInLeapYear = 30 daysMeasure.
	self assert: may numberOfDaysInLeapYear = 31 daysMeasure.
	self assert: june numberOfDaysInLeapYear = 30 daysMeasure.
	self assert: july numberOfDaysInLeapYear = 31 daysMeasure.
	self assert: august numberOfDaysInLeapYear = 31 daysMeasure.
	self assert: september numberOfDaysInLeapYear = 30 daysMeasure.
	self assert: october numberOfDaysInLeapYear = 31 daysMeasure.
	self assert: november numberOfDaysInLeapYear = 30 daysMeasure.
	self assert: december numberOfDaysInLeapYear = 31 daysMeasure
]

{ #category : #'test accessing' }
GregorianMonthTest >> testNumberOfDaysInNonleapYear [

	self assert: january numberOfDaysInNonleapYear = 31 daysMeasure.
	self assert: february numberOfDaysInNonleapYear = 28 daysMeasure.
	self assert: march numberOfDaysInNonleapYear = 31 daysMeasure.
	self assert: april numberOfDaysInNonleapYear = 30 daysMeasure.
	self assert: may numberOfDaysInNonleapYear = 31 daysMeasure.
	self assert: june numberOfDaysInNonleapYear = 30 daysMeasure.
	self assert: july numberOfDaysInNonleapYear = 31 daysMeasure.
	self assert: august numberOfDaysInNonleapYear = 31 daysMeasure.
	self assert: september numberOfDaysInNonleapYear = 30 daysMeasure.
	self assert: october numberOfDaysInNonleapYear = 31 daysMeasure.
	self assert: november numberOfDaysInNonleapYear = 30 daysMeasure.
	self assert: december numberOfDaysInNonleapYear = 31 daysMeasure
]

{ #category : #'test accessing' }
GregorianMonthTest >> testOctober [

	self
		assert: october number = 10;
		assert: (calendar monthNamed: october name) = october
]

{ #category : #'test month of year creation' }
GregorianMonthTest >> testOf [

	self assert: (february of: 2003) = (MonthOfYear yearNumber: 2003 monthNumber: 2 calendar: calendar)
]

{ #category : #'test month of year creation' }
GregorianMonthTest >> testOfYear [
	self assert: (february ofYear: 2003 asGregorianYear) = (MonthOfYear yearNumber: 2003 monthNumber: 2 calendar: calendar)
]

{ #category : #'test enumerating' }
GregorianMonthTest >> testPrevious [

	self assert: january previous = december.
	self assert: february previous = january.
	self assert: december previous = november
]

{ #category : #'test enumerating' }
GregorianMonthTest >> testPreviousInANumberOfMonths [

	self assert: (january previous: oneMonth) = december.
	self assert: (january previous: twelveMonths) = january.
	self assert: (february previous: twoMonths) = december
]

{ #category : #'test printing' }
GregorianMonthTest >> testPrintString [

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
GregorianMonthTest >> testSeptember [

	self
		assert: september number = 9;
		assert: (calendar monthNamed: september name) = september
]

{ #category : #'test interval protocol' }
GregorianMonthTest >> testTo [

	| interval |

	interval := january to: december.

	self assert: interval from = january.
	self assert: interval to = december.
	self assert: interval by = oneMonth
]

{ #category : #'test interval protocol' }
GregorianMonthTest >> testToBy [

	| interval |

	interval := january to: december by: twoMonths.

	self assert: interval from = january.
	self assert: interval to = december.
	self assert: interval by = twoMonths
]

{ #category : #'test interval protocol' }
GregorianMonthTest >> testToByDo [

	| number |

	number := 1.
	(january to: december by: twoMonths) do: [:aMonthDefinition |
		self assert: aMonthDefinition number = number.
		number := number + 2].

	self assert: number = 13.

	number := 7.
	(july to: june by: oneMonth) do: [:aMonthDefinition |
		self assert: aMonthDefinition number = number.
		number := (number + 1) rem: 12.
		number = 0 ifTrue: [number := 12]].

	self assert: number = 7
]

{ #category : #'test interval protocol' }
GregorianMonthTest >> testToNegativeByDo [

	| number |

	number := 12.
	(december to: january by: oneMonth negated) do: [:aMonthDefinition |
		self assert: aMonthDefinition number = number.
		number := number - 1].

	self assert: number = 0
]

{ #category : #'test interval protocol' }
GregorianMonthTest >> testToReverse [

	| coll number |

	coll := (january to: november by: twoMonths) reverse.
	number := 11.
	coll do: [:aMonthDefinition |
		self assert: aMonthDefinition number = number.
		number := number - 2].

	self assert: number = -1
]
