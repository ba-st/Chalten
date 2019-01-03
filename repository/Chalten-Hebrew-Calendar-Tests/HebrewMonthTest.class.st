Class {
	#name : #HebrewMonthTest,
	#superclass : #TestCase,
	#instVars : [
		'calendar',
		'nisan',
		'iyyar',
		'sivan',
		'tammuz',
		'av',
		'elul',
		'tishri',
		'marheshvan',
		'kislev',
		'tevet',
		'shevat',
		'adarI',
		'adarII',
		'zeroMonths',
		'oneMonth',
		'twoMonths',
		'elevenMonths',
		'twelveMonths',
		'adar'
	],
	#category : #'Chalten-Hebrew-Calendar-Tests'
}

{ #category : #accessing }
HebrewMonthTest class >> classUnderTest [

	^ChaltenMonth
]

{ #category : #initialization }
HebrewMonthTest >> setUp [
	calendar := HebrewCalendar.
	nisan := calendar nisan.
	iyyar := calendar iyyar.
	sivan := calendar sivan.
	tammuz := calendar tammuz.
	av := calendar av.
	elul := calendar elul.
	tishri := calendar tishri.
	marheshvan := calendar marheshvan.
	kislev := calendar kislev.
	tevet := calendar tevet.
	shevat := calendar shevat.
	adar := calendar adar.
	adarI := calendar adarI.
	adarII := calendar adarII.
	zeroMonths := 0 monthsMeasure.
	oneMonth := 1 monthMeasure.
	twoMonths := 2 monthsMeasure.
	elevenMonths := 11 monthsMeasure.
	twelveMonths := 12 monthsMeasure
]

{ #category : #'test accessing' }
HebrewMonthTest >> testAdarI [

	self assert: adarI name = 'Adar I'.
	self assert: adarI number = 12
]

{ #category : #'test accessing' }
HebrewMonthTest >> testAdarII [

	self assert: adarII name = 'Adar II'.
	self assert: adarII number = 13
]

{ #category : #'test accessing' }
HebrewMonthTest >> testAv [

	self assert: av name = 'Av'.
	self assert: av number = 5
]

{ #category : #'test month of year creation' }
HebrewMonthTest >> testComma [

	self assert: (iyyar, 2003) = (MonthOfYear yearNumber: 2003 monthNumber: 2 calendar: calendar)
]

{ #category : #'test day of month creation' }
HebrewMonthTest >> testDayOfMonthCreation [

	self assert: kislev first = (DayOfMonth monthNumber: 9 dayNumber: 1 calendar: calendar).
	self assert: kislev second = (DayOfMonth monthNumber: 9 dayNumber: 2 calendar: calendar).
	self assert: kislev third = (DayOfMonth monthNumber: 9 dayNumber: 3 calendar: calendar).
	self assert: kislev fourth = (DayOfMonth monthNumber: 9 dayNumber: 4 calendar: calendar).
	self assert: kislev fifth = (DayOfMonth monthNumber: 9 dayNumber: 5 calendar: calendar).
	self assert: kislev sixth = (DayOfMonth monthNumber: 9 dayNumber: 6 calendar: calendar).
	self assert: kislev seventh = (DayOfMonth monthNumber: 9 dayNumber: 7 calendar: calendar).
	self assert: kislev eighth = (DayOfMonth monthNumber: 9 dayNumber: 8 calendar: calendar).
	self assert: kislev ninth = (DayOfMonth monthNumber: 9 dayNumber: 9 calendar: calendar).
	self assert: kislev tenth = (DayOfMonth monthNumber: 9 dayNumber: 10 calendar: calendar).
	self assert: kislev eleventh = (DayOfMonth monthNumber: 9 dayNumber: 11 calendar: calendar).
	self assert: kislev twelfth = (DayOfMonth monthNumber: 9 dayNumber: 12 calendar: calendar).
	self assert: kislev thirteenth = (DayOfMonth monthNumber: 9 dayNumber: 13 calendar: calendar).
	self assert: kislev fourteenth = (DayOfMonth monthNumber: 9 dayNumber: 14 calendar: calendar).
	self assert: kislev fifteenth = (DayOfMonth monthNumber: 9 dayNumber: 15 calendar: calendar).
	self assert: kislev sixteenth = (DayOfMonth monthNumber: 9 dayNumber: 16 calendar: calendar).
	self assert: kislev seventeenth = (DayOfMonth monthNumber: 9 dayNumber: 17 calendar: calendar).
	self assert: kislev eighteenth = (DayOfMonth monthNumber: 9 dayNumber: 18 calendar: calendar).
	self assert: kislev nineteenth = (DayOfMonth monthNumber: 9 dayNumber: 19 calendar: calendar).
	self assert: kislev twentieth = (DayOfMonth monthNumber: 9 dayNumber: 20 calendar: calendar).
	self assert: kislev twentyfirst = (DayOfMonth monthNumber: 9 dayNumber: 21 calendar: calendar).
	self assert: kislev twentysecond = (DayOfMonth monthNumber: 9 dayNumber: 22 calendar: calendar).
	self assert: kislev twentythird = (DayOfMonth monthNumber: 9 dayNumber: 23 calendar: calendar).
	self assert: kislev twentyfourth = (DayOfMonth monthNumber: 9 dayNumber: 24 calendar: calendar).
	self assert: kislev twentyfifth = (DayOfMonth monthNumber: 9 dayNumber: 25 calendar: calendar).
	self assert: kislev twentysixth = (DayOfMonth monthNumber: 9 dayNumber: 26 calendar: calendar).
	self assert: kislev twentyseventh = (DayOfMonth monthNumber: 9 dayNumber: 27 calendar: calendar).
	self assert: kislev twentyeighth = (DayOfMonth monthNumber: 9 dayNumber: 28 calendar: calendar).
	self assert: kislev twentyninth = (DayOfMonth monthNumber: 9 dayNumber: 29 calendar: calendar).
	self assert: kislev thirtieth = (DayOfMonth monthNumber: 9 dayNumber: 30 calendar: calendar)
]

{ #category : #'test accessing' }
HebrewMonthTest >> testElul [

	self assert: elul name = 'Elul'.
	self assert: elul number = 6
]

{ #category : #'test comparing' }
HebrewMonthTest >> testEqual [

	self assert: nisan = nisan.
	self assert: iyyar = iyyar.
	self assert: sivan = sivan.
	self assert: tammuz = tammuz.
	self assert: av = av.
	self assert: elul = elul.
	self assert: tishri = tishri.
	self assert: marheshvan = marheshvan.
	self assert: kislev = kislev.
	self assert: tevet = tevet.
	self assert: shevat = shevat.
	self assert: adarI = adarI.
	self assert: adarII = adarII
]

{ #category : #'test accessing' }
HebrewMonthTest >> testFirstDayOfMonth [

	self assert: nisan firstDayOfMonth = Nisan first.
	self assert: iyyar firstDayOfMonth = Iyyar first.
	self assert: sivan firstDayOfMonth = Sivan first.
	self assert: tammuz firstDayOfMonth = Tammuz first.
	self assert: av firstDayOfMonth = Av first.
	self assert: elul firstDayOfMonth = Elul first.
	self assert: tishri firstDayOfMonth = Tishri first.
	self assert: marheshvan firstDayOfMonth = Marheshvan first.
	self assert: kislev firstDayOfMonth = Kislev first.
	self assert: tevet firstDayOfMonth = Tevet first.
	self assert: shevat firstDayOfMonth = Shevat first.
	self assert: adarI firstDayOfMonth = AdarI first.
	self assert: adarII firstDayOfMonth = AdarII first
]

{ #category : #'test comparing' }
HebrewMonthTest >> testGreatherThan [

	self assert: iyyar > nisan.
	self assert: adarII > nisan.
	
	self deny: nisan > iyyar.
	self deny: nisan > adarII.
	
	self should: [ nisan > YaumAlAhad ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: YaumAlAhad class
				with: YaumAlAhad
				with: nisan class
				with: nisan) ].
	
	self should: [ nisan >= adarII first ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: nisan class
				with: nisan
				with: adarII first class
				with: adarII first) ]
]

{ #category : #'test comparing' }
HebrewMonthTest >> testHash [

	self assert: nisan hash = nisan hash.
	self assert: iyyar hash = iyyar hash.
	self assert: sivan hash = sivan hash.
	self assert: tammuz hash = tammuz hash.
	self assert: av hash = av hash.
	self assert: elul hash = elul hash.
	self assert: tishri hash = tishri hash.
	self assert: marheshvan hash = marheshvan hash.
	self assert: kislev hash = kislev hash.
	self assert: tevet hash = tevet hash.
	self assert: shevat hash = shevat hash.
	self assert: adarI hash = adarI hash.
	self assert: adarII hash = adarII hash
]

{ #category : #'test comparing' }
HebrewMonthTest >> testIdentity [

	self assert: nisan == nisan.
	self assert: iyyar == iyyar.
	self assert: sivan == sivan.
	self assert: tammuz == tammuz.
	self assert: av == av.
	self assert: elul == elul.
	self assert: tishri == tishri.
	self assert: marheshvan == marheshvan.
	self assert: kislev == kislev.
	self assert: tevet == tevet.
	self assert: shevat == shevat.
	self assert: adarI == adarI.
	self assert: adarII == adarII.

	self deny: nisan == iyyar.
	self deny: iyyar == sivan.
	self deny: sivan == tammuz.
	self deny: tammuz == av.
	self deny: av == elul.
	self deny: elul == tishri.
	self deny: tishri == marheshvan.
	self deny: marheshvan == kislev.
	self deny: kislev == tevet.
	self deny: tevet == shevat.
	self deny: shevat == adarI.
	self deny: adarI == adarII.
	self deny: adarII == nisan
]

{ #category : #'test testing' }
HebrewMonthTest >> testIs [

	self assert: (Nisan is: nisan).
	self assert: (Iyyar is: iyyar).
	self assert: (Sivan is: sivan).
	self assert: (Tammuz is: tammuz).
	self assert: (Av is: av).
	self assert: (Elul is: elul).
	self assert: (Tishri is: tishri).
	self assert: (Marheshvan is: marheshvan).
	self assert: (Kislev is: kislev).
	self assert: (Tevet is: tevet).
	self assert: (Shevat is: shevat).
	self assert: (Adar is: adar).
	self assert: (AdarI is: adarI).
	self assert: (AdarII is: adarII)
]

{ #category : #'test accessing' }
HebrewMonthTest >> testIyyar [

	self assert: iyyar name = 'Iyyar'.
	self assert: iyyar number = 2
]

{ #category : #'test accessing' }
HebrewMonthTest >> testKislev [

	self assert: kislev name = 'Kislev'.
	self assert: kislev number = 9
]

{ #category : #'test accessing' }
HebrewMonthTest >> testLastDayNumber [

	self assert: nisan lastDayNumber = 30.
	self assert: iyyar lastDayNumber = 29.
	self assert: sivan lastDayNumber = 30.
	self assert: tammuz lastDayNumber = 29.
	self assert: av lastDayNumber = 30.
	self assert: elul lastDayNumber = 29.
	self assert: tishri lastDayNumber = 30.
	self assert: marheshvan lastDayNumber = 30.
	self assert: kislev lastDayNumber = 30.
	self assert: tevet lastDayNumber = 29.
	self assert: shevat lastDayNumber = 30.
	self assert: adarI lastDayNumber = 30.
	self assert: adarII lastDayNumber = 29
]

{ #category : #'test accessing' }
HebrewMonthTest >> testLastDayNumberIn [
	| leapYear nonleapYear |
	leapYear := 1428 asHebrewYear.
	nonleapYear := 1427 asHebrewYear.
	self assert: (nisan lastDayNumberIn: leapYear) = 30.
	self assert: (nisan lastDayNumberIn: nonleapYear) = 30.
	self assert: (iyyar lastDayNumberIn: leapYear) = 29.
	self assert: (iyyar lastDayNumberIn: nonleapYear) = 29.
	self assert: (sivan lastDayNumberIn: leapYear) = 30.
	self assert: (sivan lastDayNumberIn: nonleapYear) = 30.
	self assert: (tammuz lastDayNumberIn: leapYear) = 29.
	self assert: (tammuz lastDayNumberIn: nonleapYear) = 29.
	self assert: (av lastDayNumberIn: leapYear) = 30.
	self assert: (av lastDayNumberIn: nonleapYear) = 30.
	self assert: (elul lastDayNumberIn: leapYear) = 29.
	self assert: (elul lastDayNumberIn: nonleapYear) = 29.
	self assert: (tishri lastDayNumberIn: leapYear) = 30.
	self assert: (tishri lastDayNumberIn: nonleapYear) = 30.
	self assert: (marheshvan lastDayNumberIn: leapYear) = 30.
	self assert: (marheshvan lastDayNumberIn: nonleapYear) = 29.
	self assert: (kislev lastDayNumberIn: leapYear) = 30.
	self assert: (kislev lastDayNumberIn: nonleapYear) = 30.
	self assert: (tevet lastDayNumberIn: leapYear) = 29.
	self assert: (tevet lastDayNumberIn: nonleapYear) = 29.
	self assert: (shevat lastDayNumberIn: leapYear) = 30.
	self assert: (shevat lastDayNumberIn: nonleapYear) = 30.
	self assert: (adar lastDayNumberIn: nonleapYear) = 29.
	self assert: (adar lastDayNumberIn: leapYear) = 0.
	self assert: (adarI lastDayNumberIn: leapYear) = 30.
	self assert: (adarI lastDayNumberIn: nonleapYear) = 0.
	self assert: (adarII lastDayNumberIn: leapYear) = 29.
	self assert: (adarII lastDayNumberIn: nonleapYear) = 0
]

{ #category : #'test accessing' }
HebrewMonthTest >> testLastDayOfMonth [

	self assert: nisan lastDayOfMonth = Nisan thirtieth.
	self assert: iyyar lastDayOfMonth = Iyyar twentyninth.
	self assert: sivan lastDayOfMonth = Sivan thirtieth.
	self assert: tammuz lastDayOfMonth = Tammuz twentyninth.
	self assert: av lastDayOfMonth = Av thirtieth.
	self assert: elul lastDayOfMonth = Elul twentyninth.
	self assert: tishri lastDayOfMonth = Tishri thirtieth.
	self assert: marheshvan lastDayOfMonth = Marheshvan thirtieth.
	self assert: kislev lastDayOfMonth = Kislev thirtieth.
	self assert: tevet lastDayOfMonth = Tevet twentyninth.
	self assert: shevat lastDayOfMonth = Shevat thirtieth.
	self assert: adarI lastDayOfMonth = AdarI thirtieth.
	self assert: adarII lastDayOfMonth = AdarII twentyninth
]

{ #category : #'test comparing' }
HebrewMonthTest >> testLessThan [

	self assert: nisan < iyyar.
	self assert: nisan < adarII.
	
	self deny: iyyar < nisan.
	self deny: adarII < nisan.
	
	self should: [ nisan <= YaumAlAhad ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: YaumAlAhad class
				with: YaumAlAhad
				with: nisan class
				with: nisan) ].
	
	self should: [ nisan < adarII first ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: nisan class
				with: nisan
				with: adarII first class
				with: adarII first) ]
]

{ #category : #'test accessing' }
HebrewMonthTest >> testMarheshvan [

	self assert: marheshvan name = 'Marheshvan'.
	self assert: marheshvan number = 8
]

{ #category : #'test creation' }
HebrewMonthTest >> testMonthCreation [

	| otherNisan otherIyyar otheSivan otherTammuz otherAv otherElul otherTishri otherMarheshvan
	  otherKislev ohterTevet otherShevat otherAdarI otherAdarII |

	otherNisan := calendar createNisan.
	otherIyyar := calendar createIyyar.
	otheSivan := calendar createSivan.
	otherTammuz := calendar createTammuz.
	otherAv := calendar createAv.
	otherElul := calendar createElul.
	otherTishri := calendar createTishri.
	otherMarheshvan := calendar createMarheshvan.
	otherKislev := calendar createKislev.
	ohterTevet := calendar createTevet.
	otherShevat := calendar createShevat.
	otherAdarI := calendar createAdarI.
	otherAdarII := calendar createAdarII.

	self assert: nisan name = otherNisan name.
	self assert: nisan number = otherNisan number.
	self assert: iyyar name = otherIyyar name.
	self assert: iyyar number = otherIyyar number.
	self assert: sivan name = otheSivan name.
	self assert: sivan number = otheSivan number.
	self assert: tammuz name = otherTammuz name.
	self assert: tammuz number = otherTammuz number.
	self assert: av name = otherAv name.
	self assert: av number = otherAv number.
	self assert: elul name = otherElul name.
	self assert: elul number = otherElul number.
	self assert: tishri name = otherTishri name.
	self assert: tishri number = otherTishri number.
	self assert: marheshvan name = otherMarheshvan name.
	self assert: marheshvan number = otherMarheshvan number.
	self assert: kislev name = otherKislev name.
	self assert: kislev number = otherKislev number.
	self assert: tevet name = ohterTevet name.
	self assert: tevet number = ohterTevet number.
	self assert: shevat name = otherShevat name.
	self assert: shevat number = otherShevat number.
	self assert: adarI name = otherAdarI name.
	self assert: adarI number = otherAdarI number.
	self assert: adarII name = otherAdarII name.
	self assert: adarII number = otherAdarII number
]

{ #category : #'test querying' }
HebrewMonthTest >> testMonthsFrom [

	self assert: (nisan distanceFrom: nisan) = zeroMonths.
	self assert: (nisan distanceFrom: iyyar) = elevenMonths.
	self assert: (nisan distanceFrom: adar) = oneMonth.

	self assert: (adar distanceFrom: nisan) = elevenMonths.
	self assert: (adar distanceFrom: shevat) = oneMonth
]

{ #category : #'test querying' }
HebrewMonthTest >> testMonthsTo [

	self assert: (nisan distanceTo: nisan) = zeroMonths.
	self assert: (nisan distanceTo: iyyar) = oneMonth.
	self assert: (nisan distanceTo: adar) = elevenMonths.

	self assert: (adar distanceTo: nisan) = oneMonth.
	self assert: (adar distanceTo: shevat) = elevenMonths
]

{ #category : #'test enumerating' }
HebrewMonthTest >> testNext [

	self assert: nisan next = iyyar.
	self assert: iyyar next = sivan.
	self assert: sivan next = tammuz.
	self assert: tammuz next = av.
	self assert: av next = elul.
	self assert: elul next = tishri.
	self assert: tishri next = marheshvan.
	self assert: marheshvan next = kislev.
	self assert: kislev next = tevet.
	self assert: tevet next = shevat.
	self assert: shevat next = adar.
	self assert: adar next = nisan
]

{ #category : #'test enumerating' }
HebrewMonthTest >> testNextInANumberOfMonths [

	self assert: (adar next: oneMonth) = nisan.
	self assert: (adar next: elevenMonths) = shevat.
	self assert: (adar next: twelveMonths) = adar
]

{ #category : #'test accessing' }
HebrewMonthTest >> testNisan [

	self assert: nisan name = 'Nisan'.
	self assert: nisan number = 1
]

{ #category : #'test accessing' }
HebrewMonthTest >> testNumberOfDays [
	self assert: nisan numberOfDays = 30 daysMeasure.
	self assert: iyyar numberOfDays = 29 daysMeasure.
	self assert: sivan numberOfDays = 30 daysMeasure.
	self assert: tammuz numberOfDays = 29 daysMeasure.
	self assert: av numberOfDays = 30 daysMeasure.
	self assert: elul numberOfDays = 29 daysMeasure.
	self assert: tishri numberOfDays = 30 daysMeasure.
	self assert: marheshvan numberOfDays = 30 daysMeasure.
	self assert: kislev numberOfDays = 30 daysMeasure.
	self assert: tevet numberOfDays = 29 daysMeasure.
	self assert: shevat numberOfDays = 30 daysMeasure.
	self assert: adarI numberOfDays = 30 daysMeasure.
	self assert: adarII numberOfDays = 29 daysMeasure
]

{ #category : #'test accessing' }
HebrewMonthTest >> testNumberOfDaysFromBeginningOfYearIn [
	| leapYear nonleapYear |
	leapYear := 5768 asHebrewYear.
	nonleapYear := 5767 asHebrewYear.
	self assert: (nisan numberOfDaysFromBeginningOfYearIn: leapYear) = 206 daysMeasure.
	self assert: (nisan numberOfDaysFromBeginningOfYearIn: nonleapYear) = 178 daysMeasure.
	self assert: (iyyar numberOfDaysFromBeginningOfYearIn: leapYear) = 236 daysMeasure.
	self assert: (iyyar numberOfDaysFromBeginningOfYearIn: nonleapYear) = 208 daysMeasure.
	self assert: (sivan numberOfDaysFromBeginningOfYearIn: leapYear) = 265 daysMeasure.
	self assert: (sivan numberOfDaysFromBeginningOfYearIn: nonleapYear) = 237 daysMeasure.
	self assert: (tammuz numberOfDaysFromBeginningOfYearIn: leapYear) = 295 daysMeasure.
	self assert: (tammuz numberOfDaysFromBeginningOfYearIn: nonleapYear) = 267 daysMeasure.
	self assert: (av numberOfDaysFromBeginningOfYearIn: leapYear) = 324 daysMeasure.
	self assert: (av numberOfDaysFromBeginningOfYearIn: nonleapYear) = 296 daysMeasure.
	self assert: (elul numberOfDaysFromBeginningOfYearIn: leapYear) = 354 daysMeasure.
	self assert: (elul numberOfDaysFromBeginningOfYearIn: nonleapYear) = 326 daysMeasure.
	self assert: (tishri numberOfDaysFromBeginningOfYearIn: leapYear) = 0 daysMeasure.
	self assert: (tishri numberOfDaysFromBeginningOfYearIn: nonleapYear) = 0 daysMeasure.
	self assert: (marheshvan numberOfDaysFromBeginningOfYearIn: leapYear) = 30 daysMeasure.
	self assert: (marheshvan numberOfDaysFromBeginningOfYearIn: nonleapYear) = 30 daysMeasure.
	self assert: (kislev numberOfDaysFromBeginningOfYearIn: leapYear) = 59 daysMeasure.
	self assert: (kislev numberOfDaysFromBeginningOfYearIn: nonleapYear) = 60 daysMeasure.
	self assert: (tevet numberOfDaysFromBeginningOfYearIn: leapYear) = 88 daysMeasure.
	self assert: (tevet numberOfDaysFromBeginningOfYearIn: nonleapYear) = 90 daysMeasure.
	self assert: (shevat numberOfDaysFromBeginningOfYearIn: leapYear) = 117 daysMeasure.
	self assert: (shevat numberOfDaysFromBeginningOfYearIn: nonleapYear) = 119 daysMeasure.
	self
		should: [ adar numberOfDaysFromBeginningOfYearIn: leapYear ]
		raise: InvalidMonthForLeapYearsException
		withExceptionDo: [ :exception | self assert: exception description = 'Adar is an invalid month for leap Year 5768' ].
	self assert: (adar numberOfDaysFromBeginningOfYearIn: nonleapYear) = 149 daysMeasure.
	self assert: (adarI numberOfDaysFromBeginningOfYearIn: leapYear) = 147 daysMeasure.
	self
		should: [ adarI numberOfDaysFromBeginningOfYearIn: nonleapYear ]
		raise: InvalidMonthForNonleapYearsException
		withExceptionDo: [ :exception | self assert: exception description = 'Adar I is an invalid month for nonleap Year 5767' ].
	self assert: (adarII numberOfDaysFromBeginningOfYearIn: leapYear) = 177 daysMeasure.
	self
		should: [ adarII numberOfDaysFromBeginningOfYearIn: nonleapYear ]
		raise: InvalidMonthForNonleapYearsException
		withExceptionDo: [ :exception | self assert: exception description = 'Adar II is an invalid month for nonleap Year 5767' ]
]

{ #category : #'test accessing' }
HebrewMonthTest >> testNumberOfDaysIn [
	| leapYear nonleapYear |
	leapYear := 5768 asHebrewYear.
	nonleapYear := 5767 asHebrewYear.
	self assert: (nisan numberOfDaysIn: leapYear) = 30 daysMeasure.
	self assert: (nisan numberOfDaysIn: nonleapYear) = 30 daysMeasure.
	self assert: (iyyar numberOfDaysIn: leapYear) = 29 daysMeasure.
	self assert: (iyyar numberOfDaysIn: nonleapYear) = 29 daysMeasure.
	self assert: (sivan numberOfDaysIn: leapYear) = 30 daysMeasure.
	self assert: (sivan numberOfDaysIn: nonleapYear) = 30 daysMeasure.
	self assert: (tammuz numberOfDaysIn: leapYear) = 29 daysMeasure.
	self assert: (tammuz numberOfDaysIn: nonleapYear) = 29 daysMeasure.
	self assert: (av numberOfDaysIn: leapYear) = 30 daysMeasure.
	self assert: (av numberOfDaysIn: nonleapYear) = 30 daysMeasure.
	self assert: (elul numberOfDaysIn: leapYear) = 29 daysMeasure.
	self assert: (elul numberOfDaysIn: nonleapYear) = 29 daysMeasure.
	self assert: (tishri numberOfDaysIn: leapYear) = 30 daysMeasure.
	self assert: (tishri numberOfDaysIn: nonleapYear) = 30 daysMeasure.
	self assert: (marheshvan numberOfDaysIn: leapYear) = 29 daysMeasure.
	self assert: (marheshvan numberOfDaysIn: nonleapYear) = 30 daysMeasure.
	self assert: (kislev numberOfDaysIn: leapYear) = 29 daysMeasure.
	self assert: (kislev numberOfDaysIn: nonleapYear) = 30 daysMeasure.
	self assert: (tevet numberOfDaysIn: leapYear) = 29 daysMeasure.
	self assert: (tevet numberOfDaysIn: nonleapYear) = 29 daysMeasure.
	self assert: (shevat numberOfDaysIn: leapYear) = 30 daysMeasure.
	self assert: (shevat numberOfDaysIn: nonleapYear) = 30 daysMeasure.
	self assert: (adar numberOfDaysIn: leapYear) = 0 daysMeasure.
	self assert: (adar numberOfDaysIn: nonleapYear) = 29 daysMeasure.
	self assert: (adarI numberOfDaysIn: leapYear) = 30 daysMeasure.
	self assert: (adarI numberOfDaysIn: nonleapYear) = 0 daysMeasure.
	self assert: (adarII numberOfDaysIn: leapYear) = 29 daysMeasure.
	self assert: (adarII numberOfDaysIn: nonleapYear) = 0 daysMeasure
]

{ #category : #'test month of year creation' }
HebrewMonthTest >> testOf [

	self assert: (iyyar of: 2003) = (MonthOfYear yearNumber: 2003 monthNumber: 2 calendar: calendar)
]

{ #category : #'test month of year creation' }
HebrewMonthTest >> testOfYear [
	self assert: (iyyar ofYear: 2003 asHebrewYear) = (MonthOfYear yearNumber: 2003 monthNumber: 2 calendar: calendar)
]

{ #category : #'test enumerating' }
HebrewMonthTest >> testPrevious [

	self assert: nisan previous = adar.
	self assert: iyyar previous = nisan.
	self assert: sivan previous = iyyar.
	self assert: tammuz previous = sivan.
	self assert: av previous = tammuz.
	self assert: elul previous = av.
	self assert: tishri previous = elul.
	self assert: marheshvan previous = tishri.
	self assert: kislev previous = marheshvan.
	self assert: tevet previous = kislev.
	self assert: shevat previous = tevet.
	self assert: adar previous = shevat
]

{ #category : #'test enumerating' }
HebrewMonthTest >> testPreviousInANumberOfMonths [

	self assert: (nisan previous: oneMonth) = adar.
	self assert: (nisan previous: elevenMonths) = iyyar.
	self assert: (nisan previous: twelveMonths) = nisan
]

{ #category : #'test printing' }
HebrewMonthTest >> testPrintString [

	self assert: nisan printString = 'Nisan'.
	self assert: iyyar printString = 'Iyyar'.
	self assert: sivan printString = 'Sivan'.
	self assert: tammuz printString = 'Tammuz'.
	self assert: av printString = 'Av'.
	self assert: elul printString = 'Elul'.
	self assert: tishri printString = 'Tishri'.
	self assert: marheshvan printString = 'Marheshvan'.
	self assert: kislev printString = 'Kislev'.
	self assert: tevet printString = 'Tevet'.
	self assert: shevat printString = 'Shevat'.
	self assert: adarI printString = 'Adar I'.
	self assert: adarII printString = 'Adar II'
]

{ #category : #'test accessing' }
HebrewMonthTest >> testShevat [

	self assert: shevat name = 'Shevat'.
	self assert: shevat number = 11
]

{ #category : #'test accessing' }
HebrewMonthTest >> testSivan [

	self assert: sivan name = 'Sivan'.
	self assert: sivan number = 3
]

{ #category : #'test accessing' }
HebrewMonthTest >> testTammuz [

	self assert: tammuz name = 'Tammuz'.
	self assert: tammuz number = 4
]

{ #category : #'test accessing' }
HebrewMonthTest >> testTevet [

	self assert: tevet name = 'Tevet'.
	self assert: tevet number = 10
]

{ #category : #'test accessing' }
HebrewMonthTest >> testTishri [

	self assert: tishri name = 'Tishri'.
	self assert: tishri number = 7
]

{ #category : #'test interval protocol' }
HebrewMonthTest >> testTo [

	| interval |

	interval := nisan to: adarII.

	self assert: interval from = nisan.
	self assert: interval to = adarII.
	self assert: interval by = oneMonth
]

{ #category : #'test interval protocol' }
HebrewMonthTest >> testToBy [

	| interval |

	interval := nisan to: adarII by: twoMonths.

	self assert: interval from = nisan.
	self assert: interval to = adarII.
	self assert: interval by = twoMonths
]

{ #category : #'test interval protocol' }
HebrewMonthTest >> testToByDo [

	| number |

	number := 1.
	(nisan to: adar by: twoMonths) do: [:month |
		self assert: month number = number.
		number := number + 2].

	self assert: number = 13.

	number := 7.
	(tishri to: elul by: oneMonth) do: [:month |
		self assert: month number = number.
		number := (number + 1) rem: 12.
		number = 0 ifTrue: [number := 12]].

	self assert: number = 7
]

{ #category : #'test interval protocol' }
HebrewMonthTest >> testToNegativeByDo [

	| number |

	number := 12.
	(adar to: nisan by: oneMonth negated) do: [:month |
		self assert: month number = number.
		number := number - 1].

	self assert: number = 0
]

{ #category : #'test interval protocol' }
HebrewMonthTest >> testToReverse [

	| coll number |

	coll := (nisan to: adar by: twoMonths) reverse.
	number := 11.
	coll do: [:month |
		self assert: month number = number.
		number := number - 2].

	self assert: number = -1
]
