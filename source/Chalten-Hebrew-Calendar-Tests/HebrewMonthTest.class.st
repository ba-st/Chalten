Class {
	#name : 'HebrewMonthTest',
	#superclass : 'TestCase',
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
	#category : 'Chalten-Hebrew-Calendar-Tests',
	#package : 'Chalten-Hebrew-Calendar-Tests'
}

{ #category : 'accessing' }
HebrewMonthTest class >> classUnderTest [

	^ChaltenMonth
]

{ #category : 'initialization' }
HebrewMonthTest >> setUp [
	calendar := ChaltenEnvironment calendarNamed: #HebrewCalendar.
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

{ #category : 'test accessing' }
HebrewMonthTest >> testAdarI [

	self assert: adarI name equals: 'Adar I'.
	self assert: adarI number equals: 12
]

{ #category : 'test accessing' }
HebrewMonthTest >> testAdarII [

	self assert: adarII name equals: 'Adar II'.
	self assert: adarII number equals: 13
]

{ #category : 'test accessing' }
HebrewMonthTest >> testAv [

	self assert: av name equals: 'Av'.
	self assert: av number equals: 5
]

{ #category : 'test month of year creation' }
HebrewMonthTest >> testComma [

	self
		assert: iyyar , 2003
		equals:
		(MonthOfYear yearNumber: 2003 monthNumber: 2 calendar: calendar)
]

{ #category : 'test day of month creation' }
HebrewMonthTest >> testDayOfMonthCreation [

	self
		assert: kislev first
		equals: (DayOfMonth monthNumber: 9 dayNumber: 1 calendar: calendar).
	self
		assert: kislev second
		equals: (DayOfMonth monthNumber: 9 dayNumber: 2 calendar: calendar).
	self
		assert: kislev third
		equals: (DayOfMonth monthNumber: 9 dayNumber: 3 calendar: calendar).
	self
		assert: kislev fourth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 4 calendar: calendar).
	self
		assert: kislev fifth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 5 calendar: calendar).
	self
		assert: kislev sixth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 6 calendar: calendar).
	self
		assert: kislev seventh
		equals: (DayOfMonth monthNumber: 9 dayNumber: 7 calendar: calendar).
	self
		assert: kislev eighth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 8 calendar: calendar).
	self
		assert: kislev ninth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 9 calendar: calendar).
	self
		assert: kislev tenth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 10 calendar: calendar).
	self
		assert: kislev eleventh
		equals: (DayOfMonth monthNumber: 9 dayNumber: 11 calendar: calendar).
	self
		assert: kislev twelfth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 12 calendar: calendar).
	self
		assert: kislev thirteenth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 13 calendar: calendar).
	self
		assert: kislev fourteenth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 14 calendar: calendar).
	self
		assert: kislev fifteenth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 15 calendar: calendar).
	self
		assert: kislev sixteenth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 16 calendar: calendar).
	self
		assert: kislev seventeenth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 17 calendar: calendar).
	self
		assert: kislev eighteenth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 18 calendar: calendar).
	self
		assert: kislev nineteenth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 19 calendar: calendar).
	self
		assert: kislev twentieth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 20 calendar: calendar).
	self
		assert: kislev twentyfirst
		equals: (DayOfMonth monthNumber: 9 dayNumber: 21 calendar: calendar).
	self
		assert: kislev twentysecond
		equals: (DayOfMonth monthNumber: 9 dayNumber: 22 calendar: calendar).
	self
		assert: kislev twentythird
		equals: (DayOfMonth monthNumber: 9 dayNumber: 23 calendar: calendar).
	self
		assert: kislev twentyfourth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 24 calendar: calendar).
	self
		assert: kislev twentyfifth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 25 calendar: calendar).
	self
		assert: kislev twentysixth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 26 calendar: calendar).
	self
		assert: kislev twentyseventh
		equals: (DayOfMonth monthNumber: 9 dayNumber: 27 calendar: calendar).
	self
		assert: kislev twentyeighth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 28 calendar: calendar).
	self
		assert: kislev twentyninth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 29 calendar: calendar).
	self
		assert: kislev thirtieth
		equals: (DayOfMonth monthNumber: 9 dayNumber: 30 calendar: calendar)
]

{ #category : 'test accessing' }
HebrewMonthTest >> testElul [

	self assert: elul name equals: 'Elul'.
	self assert: elul number equals: 6
]

{ #category : 'test comparing' }
HebrewMonthTest >> testEqual [

	self assert: nisan equals: nisan.
	self assert: iyyar equals: iyyar.
	self assert: sivan equals: sivan.
	self assert: tammuz equals: tammuz.
	self assert: av equals: av.
	self assert: elul equals: elul.
	self assert: tishri equals: tishri.
	self assert: marheshvan equals: marheshvan.
	self assert: kislev equals: kislev.
	self assert: tevet equals: tevet.
	self assert: shevat equals: shevat.
	self assert: adarI equals: adarI.
	self assert: adarII equals: adarII
]

{ #category : 'test accessing' }
HebrewMonthTest >> testFirstDayOfMonth [

	self assert: nisan firstDayOfMonth equals: Nisan first.
	self assert: iyyar firstDayOfMonth equals: Iyyar first.
	self assert: sivan firstDayOfMonth equals: Sivan first.
	self assert: tammuz firstDayOfMonth equals: Tammuz first.
	self assert: av firstDayOfMonth equals: Av first.
	self assert: elul firstDayOfMonth equals: Elul first.
	self assert: tishri firstDayOfMonth equals: Tishri first.
	self assert: marheshvan firstDayOfMonth equals: Marheshvan first.
	self assert: kislev firstDayOfMonth equals: Kislev first.
	self assert: tevet firstDayOfMonth equals: Tevet first.
	self assert: shevat firstDayOfMonth equals: Shevat first.
	self assert: adarI firstDayOfMonth equals: AdarI first.
	self assert: adarII firstDayOfMonth equals: AdarII first
]

{ #category : 'test comparing' }
HebrewMonthTest >> testGreatherThan [

	self assert: iyyar > nisan.
	self assert: adarII > nisan.

	self deny: nisan > iyyar.
	self deny: nisan > adarII.

	self
		should: [ nisan > YaumAlAhad ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: YaumAlAhad class
						 with: YaumAlAhad
						 with: nisan class
						 with: nisan) ].

	self
		should: [ nisan >= adarII first ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: nisan class
						 with: nisan
						 with: adarII first class
						 with: adarII first) ]
]

{ #category : 'test comparing' }
HebrewMonthTest >> testHash [

	self assert: nisan hash equals: nisan hash.
	self assert: iyyar hash equals: iyyar hash.
	self assert: sivan hash equals: sivan hash.
	self assert: tammuz hash equals: tammuz hash.
	self assert: av hash equals: av hash.
	self assert: elul hash equals: elul hash.
	self assert: tishri hash equals: tishri hash.
	self assert: marheshvan hash equals: marheshvan hash.
	self assert: kislev hash equals: kislev hash.
	self assert: tevet hash equals: tevet hash.
	self assert: shevat hash equals: shevat hash.
	self assert: adarI hash equals: adarI hash.
	self assert: adarII hash equals: adarII hash
]

{ #category : 'test comparing' }
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

{ #category : 'test testing' }
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

{ #category : 'test accessing' }
HebrewMonthTest >> testIyyar [

	self assert: iyyar name equals: 'Iyyar'.
	self assert: iyyar number equals: 2
]

{ #category : 'test accessing' }
HebrewMonthTest >> testKislev [

	self assert: kislev name equals: 'Kislev'.
	self assert: kislev number equals: 9
]

{ #category : 'test accessing' }
HebrewMonthTest >> testLastDayNumber [

	self assert: nisan lastDayNumber equals: 30.
	self assert: iyyar lastDayNumber equals: 29.
	self assert: sivan lastDayNumber equals: 30.
	self assert: tammuz lastDayNumber equals: 29.
	self assert: av lastDayNumber equals: 30.
	self assert: elul lastDayNumber equals: 29.
	self assert: tishri lastDayNumber equals: 30.
	self assert: marheshvan lastDayNumber equals: 30.
	self assert: kislev lastDayNumber equals: 30.
	self assert: tevet lastDayNumber equals: 29.
	self assert: shevat lastDayNumber equals: 30.
	self assert: adarI lastDayNumber equals: 30.
	self assert: adarII lastDayNumber equals: 29
]

{ #category : 'test accessing' }
HebrewMonthTest >> testLastDayNumberIn [

	| leapYear nonleapYear |
	leapYear := 1428 asHebrewYear.
	nonleapYear := 1427 asHebrewYear.
	self assert: (nisan lastDayNumberIn: leapYear) equals: 30.
	self assert: (nisan lastDayNumberIn: nonleapYear) equals: 30.
	self assert: (iyyar lastDayNumberIn: leapYear) equals: 29.
	self assert: (iyyar lastDayNumberIn: nonleapYear) equals: 29.
	self assert: (sivan lastDayNumberIn: leapYear) equals: 30.
	self assert: (sivan lastDayNumberIn: nonleapYear) equals: 30.
	self assert: (tammuz lastDayNumberIn: leapYear) equals: 29.
	self assert: (tammuz lastDayNumberIn: nonleapYear) equals: 29.
	self assert: (av lastDayNumberIn: leapYear) equals: 30.
	self assert: (av lastDayNumberIn: nonleapYear) equals: 30.
	self assert: (elul lastDayNumberIn: leapYear) equals: 29.
	self assert: (elul lastDayNumberIn: nonleapYear) equals: 29.
	self assert: (tishri lastDayNumberIn: leapYear) equals: 30.
	self assert: (tishri lastDayNumberIn: nonleapYear) equals: 30.
	self assert: (marheshvan lastDayNumberIn: leapYear) equals: 30.
	self assert: (marheshvan lastDayNumberIn: nonleapYear) equals: 29.
	self assert: (kislev lastDayNumberIn: leapYear) equals: 30.
	self assert: (kislev lastDayNumberIn: nonleapYear) equals: 30.
	self assert: (tevet lastDayNumberIn: leapYear) equals: 29.
	self assert: (tevet lastDayNumberIn: nonleapYear) equals: 29.
	self assert: (shevat lastDayNumberIn: leapYear) equals: 30.
	self assert: (shevat lastDayNumberIn: nonleapYear) equals: 30.
	self assert: (adar lastDayNumberIn: nonleapYear) equals: 29.
	self assert: (adar lastDayNumberIn: leapYear) equals: 0.
	self assert: (adarI lastDayNumberIn: leapYear) equals: 30.
	self assert: (adarI lastDayNumberIn: nonleapYear) equals: 0.
	self assert: (adarII lastDayNumberIn: leapYear) equals: 29.
	self assert: (adarII lastDayNumberIn: nonleapYear) equals: 0
]

{ #category : 'test accessing' }
HebrewMonthTest >> testLastDayOfMonth [

	self assert: nisan lastDayOfMonth equals: Nisan thirtieth.
	self assert: iyyar lastDayOfMonth equals: Iyyar twentyninth.
	self assert: sivan lastDayOfMonth equals: Sivan thirtieth.
	self assert: tammuz lastDayOfMonth equals: Tammuz twentyninth.
	self assert: av lastDayOfMonth equals: Av thirtieth.
	self assert: elul lastDayOfMonth equals: Elul twentyninth.
	self assert: tishri lastDayOfMonth equals: Tishri thirtieth.
	self assert: marheshvan lastDayOfMonth equals: Marheshvan thirtieth.
	self assert: kislev lastDayOfMonth equals: Kislev thirtieth.
	self assert: tevet lastDayOfMonth equals: Tevet twentyninth.
	self assert: shevat lastDayOfMonth equals: Shevat thirtieth.
	self assert: adarI lastDayOfMonth equals: AdarI thirtieth.
	self assert: adarII lastDayOfMonth equals: AdarII twentyninth
]

{ #category : 'test comparing' }
HebrewMonthTest >> testLessThan [

	self assert: nisan < iyyar.
	self assert: nisan < adarII.

	self deny: iyyar < nisan.
	self deny: adarII < nisan.

	self
		should: [ nisan <= YaumAlAhad ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: YaumAlAhad class
						 with: YaumAlAhad
						 with: nisan class
						 with: nisan) ].

	self
		should: [ nisan < adarII first ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: nisan class
						 with: nisan
						 with: adarII first class
						 with: adarII first) ]
]

{ #category : 'test accessing' }
HebrewMonthTest >> testMarheshvan [

	self assert: marheshvan name equals: 'Marheshvan'.
	self assert: marheshvan number equals: 8
]

{ #category : 'test creation' }
HebrewMonthTest >> testMonthCreation [

	| otherNisan otherIyyar otheSivan otherTammuz otherAv otherElul otherTishri otherMarheshvan otherKislev ohterTevet otherShevat otherAdarI otherAdarII |
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
	self assert: nisan name equals: otherNisan name.
	self assert: nisan number equals: otherNisan number.
	self assert: iyyar name equals: otherIyyar name.
	self assert: iyyar number equals: otherIyyar number.
	self assert: sivan name equals: otheSivan name.
	self assert: sivan number equals: otheSivan number.
	self assert: tammuz name equals: otherTammuz name.
	self assert: tammuz number equals: otherTammuz number.
	self assert: av name equals: otherAv name.
	self assert: av number equals: otherAv number.
	self assert: elul name equals: otherElul name.
	self assert: elul number equals: otherElul number.
	self assert: tishri name equals: otherTishri name.
	self assert: tishri number equals: otherTishri number.
	self assert: marheshvan name equals: otherMarheshvan name.
	self assert: marheshvan number equals: otherMarheshvan number.
	self assert: kislev name equals: otherKislev name.
	self assert: kislev number equals: otherKislev number.
	self assert: tevet name equals: ohterTevet name.
	self assert: tevet number equals: ohterTevet number.
	self assert: shevat name equals: otherShevat name.
	self assert: shevat number equals: otherShevat number.
	self assert: adarI name equals: otherAdarI name.
	self assert: adarI number equals: otherAdarI number.
	self assert: adarII name equals: otherAdarII name.
	self assert: adarII number equals: otherAdarII number
]

{ #category : 'test querying' }
HebrewMonthTest >> testMonthsFrom [

	self assert: (nisan distanceFrom: nisan) equals: zeroMonths.
	self assert: (nisan distanceFrom: iyyar) equals: elevenMonths.
	self assert: (nisan distanceFrom: adar) equals: oneMonth.
	self assert: (adar distanceFrom: nisan) equals: elevenMonths.
	self assert: (adar distanceFrom: shevat) equals: oneMonth
]

{ #category : 'test querying' }
HebrewMonthTest >> testMonthsTo [

	self assert: (nisan distanceTo: nisan) equals: zeroMonths.
	self assert: (nisan distanceTo: iyyar) equals: oneMonth.
	self assert: (nisan distanceTo: adar) equals: elevenMonths.
	self assert: (adar distanceTo: nisan) equals: oneMonth.
	self assert: (adar distanceTo: shevat) equals: elevenMonths
]

{ #category : 'test enumerating' }
HebrewMonthTest >> testNext [

	self assert: nisan next equals: iyyar.
	self assert: iyyar next equals: sivan.
	self assert: sivan next equals: tammuz.
	self assert: tammuz next equals: av.
	self assert: av next equals: elul.
	self assert: elul next equals: tishri.
	self assert: tishri next equals: marheshvan.
	self assert: marheshvan next equals: kislev.
	self assert: kislev next equals: tevet.
	self assert: tevet next equals: shevat.
	self assert: shevat next equals: adar.
	self assert: adar next equals: nisan
]

{ #category : 'test enumerating' }
HebrewMonthTest >> testNextInANumberOfMonths [

	self assert: (adar next: oneMonth) equals: nisan.
	self assert: (adar next: elevenMonths) equals: shevat.
	self assert: (adar next: twelveMonths) equals: adar
]

{ #category : 'test accessing' }
HebrewMonthTest >> testNisan [

	self assert: nisan name equals: 'Nisan'.
	self assert: nisan number equals: 1
]

{ #category : 'test accessing' }
HebrewMonthTest >> testNumberOfDays [

	self assert: nisan numberOfDays equals: 30 daysMeasure.
	self assert: iyyar numberOfDays equals: 29 daysMeasure.
	self assert: sivan numberOfDays equals: 30 daysMeasure.
	self assert: tammuz numberOfDays equals: 29 daysMeasure.
	self assert: av numberOfDays equals: 30 daysMeasure.
	self assert: elul numberOfDays equals: 29 daysMeasure.
	self assert: tishri numberOfDays equals: 30 daysMeasure.
	self assert: marheshvan numberOfDays equals: 30 daysMeasure.
	self assert: kislev numberOfDays equals: 30 daysMeasure.
	self assert: tevet numberOfDays equals: 29 daysMeasure.
	self assert: shevat numberOfDays equals: 30 daysMeasure.
	self assert: adarI numberOfDays equals: 30 daysMeasure.
	self assert: adarII numberOfDays equals: 29 daysMeasure
]

{ #category : 'test accessing' }
HebrewMonthTest >> testNumberOfDaysFromBeginningOfYearIn [

	| leapYear nonleapYear |
	leapYear := 5768 asHebrewYear.
	nonleapYear := 5767 asHebrewYear.
	self
		assert: (nisan numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 206 daysMeasure.
	self
		assert: (nisan numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 178 daysMeasure.
	self
		assert: (iyyar numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 236 daysMeasure.
	self
		assert: (iyyar numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 208 daysMeasure.
	self
		assert: (sivan numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 265 daysMeasure.
	self
		assert: (sivan numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 237 daysMeasure.
	self
		assert: (tammuz numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 295 daysMeasure.
	self
		assert: (tammuz numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 267 daysMeasure.
	self
		assert: (av numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 324 daysMeasure.
	self
		assert: (av numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 296 daysMeasure.
	self
		assert: (elul numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 354 daysMeasure.
	self
		assert: (elul numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 326 daysMeasure.
	self
		assert: (tishri numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 0 daysMeasure.
	self
		assert: (tishri numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 0 daysMeasure.
	self
		assert: (marheshvan numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 30 daysMeasure.
	self
		assert: (marheshvan numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 30 daysMeasure.
	self
		assert: (kislev numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 59 daysMeasure.
	self
		assert: (kislev numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 60 daysMeasure.
	self
		assert: (tevet numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 88 daysMeasure.
	self
		assert: (tevet numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 90 daysMeasure.
	self
		assert: (shevat numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 117 daysMeasure.
	self
		assert: (shevat numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 119 daysMeasure.
	self
		should: [ adar numberOfDaysFromBeginningOfYearIn: leapYear ]
		raise: InvalidMonthForLeapYearsException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals: 'Adar is an invalid month for leap Year 5768' ].
	self
		assert: (adar numberOfDaysFromBeginningOfYearIn: nonleapYear)
		equals: 149 daysMeasure.
	self
		assert: (adarI numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 147 daysMeasure.
	self
		should: [ adarI numberOfDaysFromBeginningOfYearIn: nonleapYear ]
		raise: InvalidMonthForNonleapYearsException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals: 'Adar I is an invalid month for nonleap Year 5767' ].
	self
		assert: (adarII numberOfDaysFromBeginningOfYearIn: leapYear)
		equals: 177 daysMeasure.
	self
		should: [ adarII numberOfDaysFromBeginningOfYearIn: nonleapYear ]
		raise: InvalidMonthForNonleapYearsException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals: 'Adar II is an invalid month for nonleap Year 5767' ]
]

{ #category : 'test accessing' }
HebrewMonthTest >> testNumberOfDaysIn [

	| leapYear nonleapYear |
	leapYear := 5768 asHebrewYear.
	nonleapYear := 5767 asHebrewYear.
	self assert: (nisan numberOfDaysIn: leapYear) equals: 30 daysMeasure.
	self
		assert: (nisan numberOfDaysIn: nonleapYear)
		equals: 30 daysMeasure.
	self assert: (iyyar numberOfDaysIn: leapYear) equals: 29 daysMeasure.
	self
		assert: (iyyar numberOfDaysIn: nonleapYear)
		equals: 29 daysMeasure.
	self assert: (sivan numberOfDaysIn: leapYear) equals: 30 daysMeasure.
	self
		assert: (sivan numberOfDaysIn: nonleapYear)
		equals: 30 daysMeasure.
	self assert: (tammuz numberOfDaysIn: leapYear) equals: 29 daysMeasure.
	self
		assert: (tammuz numberOfDaysIn: nonleapYear)
		equals: 29 daysMeasure.
	self assert: (av numberOfDaysIn: leapYear) equals: 30 daysMeasure.
	self assert: (av numberOfDaysIn: nonleapYear) equals: 30 daysMeasure.
	self assert: (elul numberOfDaysIn: leapYear) equals: 29 daysMeasure.
	self
		assert: (elul numberOfDaysIn: nonleapYear)
		equals: 29 daysMeasure.
	self assert: (tishri numberOfDaysIn: leapYear) equals: 30 daysMeasure.
	self
		assert: (tishri numberOfDaysIn: nonleapYear)
		equals: 30 daysMeasure.
	self
		assert: (marheshvan numberOfDaysIn: leapYear)
		equals: 29 daysMeasure.
	self
		assert: (marheshvan numberOfDaysIn: nonleapYear)
		equals: 30 daysMeasure.
	self assert: (kislev numberOfDaysIn: leapYear) equals: 29 daysMeasure.
	self
		assert: (kislev numberOfDaysIn: nonleapYear)
		equals: 30 daysMeasure.
	self assert: (tevet numberOfDaysIn: leapYear) equals: 29 daysMeasure.
	self
		assert: (tevet numberOfDaysIn: nonleapYear)
		equals: 29 daysMeasure.
	self assert: (shevat numberOfDaysIn: leapYear) equals: 30 daysMeasure.
	self
		assert: (shevat numberOfDaysIn: nonleapYear)
		equals: 30 daysMeasure.
	self assert: (adar numberOfDaysIn: leapYear) equals: 0 daysMeasure.
	self
		assert: (adar numberOfDaysIn: nonleapYear)
		equals: 29 daysMeasure.
	self assert: (adarI numberOfDaysIn: leapYear) equals: 30 daysMeasure.
	self
		assert: (adarI numberOfDaysIn: nonleapYear)
		equals: 0 daysMeasure.
	self assert: (adarII numberOfDaysIn: leapYear) equals: 29 daysMeasure.
	self
		assert: (adarII numberOfDaysIn: nonleapYear)
		equals: 0 daysMeasure
]

{ #category : 'test month of year creation' }
HebrewMonthTest >> testOf [

	self
		assert: (iyyar of: 2003)
		equals:
		(MonthOfYear yearNumber: 2003 monthNumber: 2 calendar: calendar)
]

{ #category : 'test month of year creation' }
HebrewMonthTest >> testOfYear [

	self
		assert: (iyyar ofYear: 2003 asHebrewYear)
		equals:
		(MonthOfYear yearNumber: 2003 monthNumber: 2 calendar: calendar)
]

{ #category : 'test enumerating' }
HebrewMonthTest >> testPrevious [

	self assert: nisan previous equals: adar.
	self assert: iyyar previous equals: nisan.
	self assert: sivan previous equals: iyyar.
	self assert: tammuz previous equals: sivan.
	self assert: av previous equals: tammuz.
	self assert: elul previous equals: av.
	self assert: tishri previous equals: elul.
	self assert: marheshvan previous equals: tishri.
	self assert: kislev previous equals: marheshvan.
	self assert: tevet previous equals: kislev.
	self assert: shevat previous equals: tevet.
	self assert: adar previous equals: shevat
]

{ #category : 'test enumerating' }
HebrewMonthTest >> testPreviousInANumberOfMonths [

	self assert: (nisan previous: oneMonth) equals: adar.
	self assert: (nisan previous: elevenMonths) equals: iyyar.
	self assert: (nisan previous: twelveMonths) equals: nisan
]

{ #category : 'test printing' }
HebrewMonthTest >> testPrintString [

	self assert: nisan printString equals: 'Nisan'.
	self assert: iyyar printString equals: 'Iyyar'.
	self assert: sivan printString equals: 'Sivan'.
	self assert: tammuz printString equals: 'Tammuz'.
	self assert: av printString equals: 'Av'.
	self assert: elul printString equals: 'Elul'.
	self assert: tishri printString equals: 'Tishri'.
	self assert: marheshvan printString equals: 'Marheshvan'.
	self assert: kislev printString equals: 'Kislev'.
	self assert: tevet printString equals: 'Tevet'.
	self assert: shevat printString equals: 'Shevat'.
	self assert: adarI printString equals: 'Adar I'.
	self assert: adarII printString equals: 'Adar II'
]

{ #category : 'test accessing' }
HebrewMonthTest >> testShevat [

	self assert: shevat name equals: 'Shevat'.
	self assert: shevat number equals: 11
]

{ #category : 'test accessing' }
HebrewMonthTest >> testSivan [

	self assert: sivan name equals: 'Sivan'.
	self assert: sivan number equals: 3
]

{ #category : 'test accessing' }
HebrewMonthTest >> testTammuz [

	self assert: tammuz name equals: 'Tammuz'.
	self assert: tammuz number equals: 4
]

{ #category : 'test accessing' }
HebrewMonthTest >> testTevet [

	self assert: tevet name equals: 'Tevet'.
	self assert: tevet number equals: 10
]

{ #category : 'test accessing' }
HebrewMonthTest >> testTishri [

	self assert: tishri name equals: 'Tishri'.
	self assert: tishri number equals: 7
]

{ #category : 'test interval protocol' }
HebrewMonthTest >> testTo [

	| interval |
	interval := nisan to: adarII.
	self assert: interval from equals: nisan.
	self assert: interval to equals: adarII.
	self assert: interval by equals: oneMonth
]

{ #category : 'test interval protocol' }
HebrewMonthTest >> testToBy [

	| interval |
	interval := nisan to: adarII by: twoMonths.
	self assert: interval from equals: nisan.
	self assert: interval to equals: adarII.
	self assert: interval by equals: twoMonths
]

{ #category : 'test interval protocol' }
HebrewMonthTest >> testToByDo [

	| number |
	number := 1.
	(nisan to: adar by: twoMonths) do: [ :month |
		self assert: month number equals: number.
		number := number + 2 ].
	self assert: number equals: 13.

	number := 7.
	(tishri to: elul by: oneMonth) do: [ :month |
		self assert: month number equals: number.
		number := number + 1 rem: 12.
		number = 0 ifTrue: [ number := 12 ] ].
	self assert: number equals: 7
]

{ #category : 'test interval protocol' }
HebrewMonthTest >> testToNegativeByDo [

	| number |
	number := 12.
	(adar to: nisan by: oneMonth negated) do: [ :month |
		self assert: month number equals: number.
		number := number - 1 ].
	self assert: number equals: 0
]

{ #category : 'test interval protocol' }
HebrewMonthTest >> testToReverse [

	| coll number |
	coll := (nisan to: adar by: twoMonths) reverse.
	number := 11.
	coll do: [ :month |
		self assert: month number equals: number.
		number := number - 2 ].
	self assert: number equals: -1
]
