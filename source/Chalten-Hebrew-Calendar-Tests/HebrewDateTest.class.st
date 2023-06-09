Class {
	#name : #HebrewDateTest,
	#superclass : #TestCase,
	#instVars : [
		'calendar'
	],
	#category : #'Chalten-Hebrew-Calendar-Tests'
}

{ #category : #accessing }
HebrewDateTest class >> classUnderTest [

	^FixedDate
]

{ #category : #'test support' }
HebrewDateTest >> nisan [

	^calendar nisan
]

{ #category : #'test support' }
HebrewDateTest >> oneDay [
	^ 1 dayMeasure
]

{ #category : #initialization }
HebrewDateTest >> setUp [

	calendar := HebrewCalendar
]

{ #category : #'test support' }
HebrewDateTest >> tenDays [
	^ 10 daysMeasure
]

{ #category : #'test interval protocol' }
HebrewDateTest >> test30OfAdarIToEveryDayOfMonth [

	| dates |

	dates := AdarI thirtieth, 5768 to: Tishri first, 5775 everyDayOfMonth: AdarI thirtieth.

	self assert: dates size = 3.
	self assert: (dates includes: AdarI thirtieth, 5768).
	self assert: (dates includes: AdarI thirtieth, 5771).
	self assert: (dates includes: AdarI thirtieth, 5774)
]

{ #category : #'test converting' }
HebrewDateTest >> testAsGregorianDate [

	self assert: (Nisan first, 5767) asGregorian = (March twentieth, 2007).
	self assert: (Sivan first, 5768) asGregorian = (June fourth, 2008).
	self assert: (Kislev fifth, 5768) asGregorian = (November fifteenth, 2007).
	self assert: (Shevat twelfth, 5772) asGregorian = (February fifth, 2012).
	self assert: (Elul second, 5775) asGregorian = (August seventeenth, 2015)
]

{ #category : #'test converting' }
HebrewDateTest >> testAsHebrewDate [

	self assert: (Nisan first, 5767) = (March twentieth, 2007) asHebrew.
	self assert: (Sivan first, 5768) = (June fourth, 2008) asHebrew.
	self assert: (Kislev fifth, 5768) = (November fifteenth, 2007) asHebrew.
	self assert: (Shevat twelfth, 5772) = (February fifth, 2012) asHebrew.
	self assert: (Elul second, 5775) = (August seventeenth, 2015) asHebrew
]

{ #category : #'test converting' }
HebrewDateTest >> testAsSmalltalkDate [

	| hebrewDate gregorianDate date |

	hebrewDate := Tammuz fourth, 5768.
	gregorianDate := hebrewDate asGregorian.
	date := hebrewDate asSmalltalkDate.

	self assert: gregorianDate year number = date year.
	self assert: gregorianDate month number = date monthIndex.
	self assert: gregorianDate dayNumber = date dayOfMonth
]

{ #category : #'test accessing' }
HebrewDateTest >> testAtMidnight [

	self assert: (Tevet first, 5767) atMidnight = (DateTime date: (Tevet first, 5767) timeOfDay: (TimeOfDay hours: 00))
]

{ #category : #'test accessing' }
HebrewDateTest >> testAtNoon [

	self assert: (Tevet first, 5767) atNoon = (DateTime date: (Tevet first, 5767) timeOfDay: (TimeOfDay hours: 12))
]

{ #category : #'test accessing' }
HebrewDateTest >> testAtTimeOfDay [

	self assert: ((Tevet first, 5767) atTimeOfDay: (TimeOfDay hours: 10)) = (DateTime date: (Tevet first, 5767) timeOfDay: (TimeOfDay hours: 10))
]

{ #category : #'test instance creation' }
HebrewDateTest >> testCreation [
	| year5767 nisanOf5767 |
	year5767 := 5767 asHebrewYear.
	nisanOf5767 := MonthOfYear nisanOf: year5767.
	self
		assert:
			(FixedDate
				yearNumber: 5767
				monthNumber: 1
				dayNumber: 1
				calendar: calendar) monthOfYear = nisanOf5767.
	self
		assert:
			(FixedDate
				yearNumber: 5767
				monthNumber: 1
				dayNumber: 1
				calendar: calendar) dayNumber = 1.
	self assert: (FixedDate monthOfYear: (MonthOfYear nisanOf: year5767) dayNumber: 1) monthOfYear = nisanOf5767.
	self assert: (FixedDate monthOfYear: (MonthOfYear nisanOf: year5767) dayNumber: 1) dayNumber = 1.
	self assert: (FixedDate year: year5767 month: self nisan dayNumber: 1) monthOfYear = nisanOf5767.
	self assert: (FixedDate year: year5767 month: self nisan dayNumber: 1) dayNumber = 1.
	self assert: (FixedDate yearNumber: 5767 month: self nisan dayNumber: 1) monthOfYear = nisanOf5767.
	self assert: (FixedDate yearNumber: 5767 month: self nisan dayNumber: 1) dayNumber = 1
]

{ #category : #'test accessing' }
HebrewDateTest >> testDay [

	self assert: (Tishri first, 5767) day = YomShabbat.
	self assert: (Tishri second, 5767) day = YomRishon.
	self assert: (Tishri third, 5767) day = YomSheni.
	self assert: (Tishri fourth, 5767) day = YomShelishi.
	self assert: (Tishri fifth, 5767) day = YomRevii.
	self assert: (Tishri sixth, 5767) day = YomHamishi.
	self assert: (Tishri seventh, 5767) day = YomShishi.
	self assert: (Tishri eighth, 5767) day = YomShabbat
]

{ #category : #'test accessing' }
HebrewDateTest >> testDayNumber [

	self assert: (Tishri first, 5767) dayNumber = 1
]

{ #category : #'test accessing' }
HebrewDateTest >> testDayOfMonth [

	self assert: (Tevet first, 1) dayOfMonth = (DayOfMonth monthNumber: 10 dayNumber: 1 calendar: calendar)
]

{ #category : #'test querying' }
HebrewDateTest >> testDaysFrom [
	self assert: (Nisan first , 5767 distanceFrom: Nisan first , 5767) = self zeroDays.
	self assert: (Iyyar first , 5767 distanceFrom: Nisan first , 5767) = self thirtyDays.
	self assert: (Sivan first , 5767 distanceFrom: Nisan first , 5767) = (30 + 29) daysMeasure.
	self assert: (Nisan first , 5768 distanceFrom: Nisan first , 5767) = 383 daysMeasure.
	self assert: (Nisan first , 5767 distanceFrom: Nisan first , 5766) = 355 daysMeasure.
	self assert: (Nisan first , 5766 distanceFrom: Nisan first , 5767) = -355 daysMeasure.
	self assert: (Nisan first , 5767 distanceFrom: Nisan first , 5768) = -383 daysMeasure.
	self assert: (TheBeginningOfTime distanceFrom: Nisan first , 5768) = MinusInfinity daysMeasure.
	self assert: (TheEndOfTime distanceFrom: Nisan first , 5768) = Infinity daysMeasure
]

{ #category : #'test querying' }
HebrewDateTest >> testDaysTo [
	self assert: (Nisan first , 5767 distanceTo: Nisan first , 5767) = self zeroDays.
	self assert: (Nisan first , 5767 distanceTo: Iyyar first , 5767) = self thirtyDays.
	self assert: (Nisan first , 5767 distanceTo: Sivan first , 5767) = (30 + 29) daysMeasure.
	self assert: (Nisan first , 5767 distanceTo: Nisan first , 5768) = 383 daysMeasure.
	self assert: (Nisan first , 5766 distanceTo: Nisan first , 5767) = 355 daysMeasure.
	self assert: (Nisan first , 5767 distanceTo: Nisan first , 5766) = -355 daysMeasure.
	self assert: (Nisan first , 5768 distanceTo: Nisan first , 5767) = -383 daysMeasure.
	self assert: (Nisan first , 5768 distanceTo: TheBeginningOfTime) = MinusInfinity daysMeasure.
	self assert: (Nisan first , 5768 distanceTo: TheEndOfTime) = Infinity daysMeasure
]

{ #category : #'test comparing' }
HebrewDateTest >> testEqual [
	self 
		assert: (Nisan first , 5767) = (FixedDate 
						yearNumber: 5767
						monthNumber: 1
						dayNumber: 1
						calendar: calendar).
	self 
		deny: (Nisan first , 5767) = (FixedDate 
						yearNumber: 5767
						monthNumber: 1
						dayNumber: 2
						calendar: calendar)
]

{ #category : #'test comparing' }
HebrewDateTest >> testGreaterThan [

	self assert: (Iyyar first, 5767) > (Nisan thirtieth, 5767).
	self assert: (Iyyar first, 5767) > (Nisan first, 1).
	self assert: (Iyyar first, 5767) > (Elul twentyninth, 5766).
	
	self should: [ (Iyyar first, 2007) > YomHamishi ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: YomHamishi class
				with: YomHamishi
				with: (Iyyar first, 2007) class
				with: (Iyyar first, 2007)) ].
	
	self should: [ (Nisan thirtieth, 2007) >= Elul ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: (Nisan thirtieth, 2007) class
				with: (Nisan thirtieth, 2007)
				with: Elul class
				with: Elul) ]
]

{ #category : #'test comparing' }
HebrewDateTest >> testHash [
	self assert: (Nisan first , 5767) hash 
				= (FixedDate 
						yearNumber: 5767
						monthNumber: 1
						dayNumber: 1
						calendar: calendar) hash.
	self deny: (Nisan first , 5767) hash 
				= (FixedDate 
						yearNumber: 5767
						monthNumber: 1
						dayNumber: 2
						calendar: calendar) hash
]

{ #category : #'test includes' }
HebrewDateTest >> testIncludesDate [

	self
		should: [ Nisan first, 5767 includes: Nisan first, 5767]
		raise: Exception
]

{ #category : #'test includes' }
HebrewDateTest >> testIncludesDateTime [

	self assert: (Nisan first, 5767 includes: (Nisan first, 5767) atMidnight).
	self assert: (Nisan first, 5767 includes: (Nisan first, 5767) atLastTimeOfDay).

	self deny: (Nisan first, 5767 includes: (Iyyar first, 5767) atMidnight).
	self deny: (Nisan first, 5767 includes: (Adar twentieth, 5767) atLastTimeOfDay)
]

{ #category : #'test includes' }
HebrewDateTest >> testIncludesMonthOfYear [

	self
		should: [ Nisan first, 5767 includes: Nisan, 5767 ]
		raise: Exception
]

{ #category : #'test includes' }
HebrewDateTest >> testIncludesYear [
	self should: [ Nisan first , 5767 includes: 5767 asHebrewYear ] raise: Exception
]

{ #category : #'test instance creation' }
HebrewDateTest >> testInvalidCreation [
	self 
		should: 
			[FixedDate 
				yearNumber: 5767
				monthNumber: 1
				dayNumber: 31
				calendar: calendar]
		raise: InvalidDateException
		withExceptionDo: 
			[:exception | 
			self assert: exception description 
						= 'The day 31 is invalid for the month Nisan of Year 5767'].
	self 
		should: 
			[FixedDate 
				yearNumber: 5767
				monthNumber: 2
				dayNumber: 30
				calendar: calendar]
		raise: InvalidDateException
		withExceptionDo: 
			[:exception | 
			self assert: exception description 
						= 'The day 30 is invalid for the month Iyyar of Year 5767'].
	self 
		should: 
			[FixedDate 
				yearNumber: 5767
				monthNumber: 3
				dayNumber: 31
				calendar: calendar]
		raise: InvalidDateException
		withExceptionDo: 
			[:exception | 
			self assert: exception description 
						= 'The day 31 is invalid for the month Sivan of Year 5767'].
	self 
		should: 
			[FixedDate 
				yearNumber: 5767
				monthNumber: 4
				dayNumber: 30
				calendar: calendar]
		raise: InvalidDateException
		withExceptionDo: 
			[:exception | 
			self assert: exception description 
						= 'The day 30 is invalid for the month Tammuz of Year 5767'].
	self 
		should: 
			[FixedDate 
				yearNumber: 5767
				monthNumber: 5
				dayNumber: 31
				calendar: calendar]
		raise: InvalidDateException
		withExceptionDo: 
			[:exception | 
			self assert: exception description 
						= 'The day 31 is invalid for the month Av of Year 5767'].
	self 
		should: 
			[FixedDate 
				yearNumber: 5767
				monthNumber: 6
				dayNumber: 30
				calendar: calendar]
		raise: InvalidDateException
		withExceptionDo: 
			[:exception | 
			self assert: exception description 
						= 'The day 30 is invalid for the month Elul of Year 5767'].
	self 
		should: 
			[FixedDate 
				yearNumber: 5767
				monthNumber: 7
				dayNumber: 31
				calendar: calendar]
		raise: InvalidDateException
		withExceptionDo: 
			[:exception | 
			self assert: exception description 
						= 'The day 31 is invalid for the month Tishri of Year 5767'].
	self 
		should: 
			[FixedDate 
				yearNumber: 5767
				monthNumber: 8
				dayNumber: 31
				calendar: calendar]
		raise: InvalidDateException
		withExceptionDo: 
			[:exception | 
			self assert: exception description 
						= 'The day 31 is invalid for the month Marheshvan of Year 5767'].
	self 
		should: 
			[FixedDate 
				yearNumber: 5767
				monthNumber: 9
				dayNumber: 31
				calendar: calendar]
		raise: InvalidDateException
		withExceptionDo: 
			[:exception | 
			self assert: exception description 
						= 'The day 31 is invalid for the month Kislev of Year 5767'].
	self 
		should: 
			[FixedDate 
				yearNumber: 5767
				monthNumber: 10
				dayNumber: 30
				calendar: calendar]
		raise: InvalidDateException
		withExceptionDo: 
			[:exception | 
			self assert: exception description 
						= 'The day 30 is invalid for the month Tevet of Year 5767'].
	self 
		should: 
			[FixedDate 
				yearNumber: 5767
				monthNumber: 11
				dayNumber: 31
				calendar: calendar]
		raise: InvalidDateException
		withExceptionDo: 
			[:exception | 
			self assert: exception description 
						= 'The day 31 is invalid for the month Shevat of Year 5767'].
	self 
		should: 
			[FixedDate 
				yearNumber: 5768
				monthNumber: 12
				dayNumber: 31
				calendar: calendar]
		raise: InvalidDateException
		withExceptionDo: 
			[:exception | 
			self assert: exception description 
						= 'The day 31 is invalid for the month Adar I of Year 5768'].
	self 
		should: 
			[FixedDate 
				yearNumber: 5767
				monthNumber: 14
				dayNumber: 1
				calendar: calendar]
		raise: InvalidMonthNumberException
		withExceptionDo: 
			[:exception | 
			self assert: exception description = '14 is an invalid number for a month'].
	self 
		should: 
			[FixedDate 
				yearNumber: 5767
				monthNumber: 0
				dayNumber: 1
				calendar: calendar]
		raise: InvalidMonthNumberException
		withExceptionDo: 
			[:exception | 
			self assert: exception description = '0 is an invalid number for a month'].
	self 
		should: 
			[FixedDate 
				yearNumber: 5767
				monthNumber: -1
				dayNumber: 1
				calendar: calendar]
		raise: InvalidMonthNumberException
		withExceptionDo: 
			[:exception | 
			self assert: exception description = '-1 is an invalid number for a month'].
	self 
		should: 
			[FixedDate 
				yearNumber: 5767
				monthNumber: 1
				dayNumber: 0
				calendar: calendar]
		raise: InvalidDateException
		withExceptionDo: 
			[:exception | 
			self assert: exception description 
						= 'The day 0 is invalid for the month Nisan of Year 5767'].
	self 
		should: 
			[FixedDate 
				yearNumber: 5767
				monthNumber: 1
				dayNumber: -1
				calendar: calendar]
		raise: InvalidDateException
		withExceptionDo: 
			[:exception | 
			self assert: exception description 
						= 'The day -1 is invalid for the month Nisan of Year 5767'].
	self 
		should: 
			[FixedDate 
				yearNumber: 5768
				monthNumber: 13
				dayNumber: 30
				calendar: calendar]
		raise: InvalidDateException
		withExceptionDo: 
			[:exception | 
			self assert: exception description 
						= 'The day 30 is invalid for the month Adar II of Year 5768']
]

{ #category : #'test testing days' }
HebrewDateTest >> testIs [

	self assert: (Tammuz first, 5767 is: YomRishon).
	self assert: (Tammuz second, 5767 is: YomSheni).
	self assert: (Tammuz third, 5767 is: YomShelishi).
	self assert: (Tammuz fourth, 5767 is: YomRevii).
	self assert: (Tammuz fifth, 5767 is: YomHamishi).
	self assert: (Tammuz sixth, 5767 is: YomShishi).
	self assert: (Tammuz seventh, 5767 is: YomShabbat)
]

{ #category : #'test testing' }
HebrewDateTest >> testIsFirstDayOfMonth [

	self assert: (Nisan first, 5767) isFirstDayOfMonth.
	self deny: (Nisan second, 5767) isFirstDayOfMonth
]

{ #category : #'test testing' }
HebrewDateTest >> testIsFirstDayOfYear [

	self assert: (Tishri first, 5767) isFirstDayOfYear.
	self deny: (Nisan first, 5767) isFirstDayOfYear
]

{ #category : #'test testing' }
HebrewDateTest >> testIsFirstMonthOfYear [

	self assert: (Tishri first, 5767) isFirstMonthOfYear.
	self assert: (Tishri second, 5767) isFirstMonthOfYear.
	
	self deny: (Nisan third, 5767) isFirstMonthOfYear.
	self deny: (Iyyar fifteenth, 5767) isFirstMonthOfYear
]

{ #category : #'test testing months' }
HebrewDateTest >> testIsIn [

	self assert: (Nisan seventh, 5767 isIn: Nisan).
	self assert: (Iyyar seventh, 5767 isIn: Iyyar).
	self assert: (Sivan seventh, 5767 isIn: Sivan).
	self assert: (Tammuz seventh, 5767 isIn: Tammuz).
	self assert: (Av seventh, 5767 isIn: Av).
	self assert: (Elul seventh, 5767 isIn: Elul).
	self assert: (Tishri seventh, 5767 isIn: Tishri).
	self assert: (Marheshvan seventh, 5767 isIn: Marheshvan).
	self assert: (Kislev seventh, 5767 isIn: Kislev).
	self assert: (Tevet seventh, 5767 isIn: Tevet).
	self assert: (Shevat seventh, 5767 isIn: Shevat).
	self assert: (Adar seventh, 5767 isIn: Adar).
	self assert: (AdarI seventh, 5768 isIn: AdarI).
	self assert: (AdarII seventh, 5768 isIn: AdarII)
]

{ #category : #'test testing' }
HebrewDateTest >> testIsLastDayOfMonth [

	self assert: (Nisan thirtieth, 5767) isLastDayOfMonth.
	self assert: (Iyyar twentyninth, 5767) isLastDayOfMonth.
	self assert: (Sivan thirtieth, 5767) isLastDayOfMonth.
	self assert: (Tammuz twentyninth, 5767) isLastDayOfMonth.
	self assert: (Av thirtieth, 5767) isLastDayOfMonth.
	self assert: (Elul twentyninth, 5767) isLastDayOfMonth.
	self assert: (Tishri thirtieth, 5767) isLastDayOfMonth.
	self assert: (Marheshvan thirtieth, 5767) isLastDayOfMonth.
	self assert: (Kislev thirtieth, 5767) isLastDayOfMonth.
	self assert: (Tevet twentyninth, 5767) isLastDayOfMonth.
	self assert: (Shevat thirtieth, 5767) isLastDayOfMonth.
	self assert: (Adar twentyninth, 5767) isLastDayOfMonth.
	self assert: (AdarI thirtieth, 5768) isLastDayOfMonth.
	self assert: (AdarII twentyninth, 5768) isLastDayOfMonth


]

{ #category : #'test testing' }
HebrewDateTest >> testIsLastDayOfYear [

	self assert: (Elul twentyninth, 5767) isLastDayOfYear.
	self assert: (Elul twentyninth, 5766) isLastDayOfYear.

	self deny: (Elul twentyeighth, 5767) isLastDayOfYear.
	self deny: (Adar twentyninth, 5767) isLastDayOfYear.
	self deny: (Kislev twentyninth, 5767) isLastDayOfYear
]

{ #category : #'test comparing' }
HebrewDateTest >> testLessThan [

	self assert: (Nisan first, 5767) < (Nisan second, 5767).
	self assert: (Nisan first, 5767) < (Iyyar first, 5767).
	self assert: (Nisan first, 5767) < (Nisan first, 5768).
	
	self should: [ (Iyyar first, 2007) <= YomHamishi ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: YomHamishi class
				with: YomHamishi
				with: (Iyyar first, 2007) class
				with: (Iyyar first, 2007)) ].
	
	self should: [ (Nisan thirtieth, 2007) < Elul ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: (Nisan thirtieth, 2007) class
				with: (Nisan thirtieth, 2007)
				with: Elul class
				with: Elul) ]
]

{ #category : #'test accessing' }
HebrewDateTest >> testMonth [

	self assert: (Tishri first, 5767) month = Tishri
]

{ #category : #'test accessing' }
HebrewDateTest >> testMonthNumber [

	self assert: (Tishri first, 5767) monthNumber = 7
]

{ #category : #'test accessing' }
HebrewDateTest >> testMonthOfYear [

	self assert: (Tevet first, 5767) monthOfYear = (Tevet, 5767)
]

{ #category : #'test enumerating' }
HebrewDateTest >> testNext [

	| date |

	date := Nisan first, 5767.
	self assert: date next = (Nisan second, 5767).
	
	date := Iyyar twentyeighth, 5767.
	self assert: date next = (Iyyar twentyninth, 5767).
	self assert: date next next = (Sivan first, 5767).
	
	date := Elul twentyninth, 5767.
	self assert: date next = (Tishri first, 5768)
]

{ #category : #'test enumerating' }
HebrewDateTest >> testNextDay [

	| yomRishon |

	yomRishon := Nisan sixth, 5767.
	self assert: (yomRishon nextDay: calendar yomRishon) = (Nisan thirteenth, 5767).
	self assert: (yomRishon nextDay: calendar yomSheni) = (Nisan seventh, 5767).
	self assert: (yomRishon nextDay: calendar yomShelishi) = (Nisan eighth, 5767).
	self assert: (yomRishon nextDay: calendar yomRevii) = (Nisan ninth, 5767).
	self assert: (yomRishon nextDay: calendar yomHamishi) = (Nisan tenth, 5767).
	self assert: (yomRishon nextDay: calendar yomShishi) = (Nisan eleventh, 5767).
	self assert: (yomRishon nextDay: calendar yomShabbat) = (Nisan twelfth, 5767)
]

{ #category : #'test enumerating' }
HebrewDateTest >> testNextDayOfMonth [

	| date |

	date := Nisan first, 5767.

	self assert: (date nextDayOfMonth: Sivan third) = (Sivan third, 5767).
	self assert: ((date nextDayOfMonth: Sivan third) nextDayOfMonth: Tammuz fourth) = (Tammuz fourth, 5767).
	
	date := Sivan third, 5767.
	
	self assert: (date nextDayOfMonth: Iyyar third) = (Iyyar third, 5768).
	self assert: ((date nextDayOfMonth: Iyyar third) nextDayOfMonth: Nisan fourth) = (Nisan fourth, 5769)
]

{ #category : #'test enumerating' }
HebrewDateTest >> testNextInNumberOfDays [
	self assert: (Nisan first , 1 next: self tenDays) = (Nisan eleventh , 1).
	self assert: (Nisan first , 5767 next: self twentyNineDays) = (Nisan thirtieth , 5767).
	self assert: (Nisan first , 5767 next: self thirtyDays) = (Iyyar first , 5767).
	self assert: (Nisan first , 5767 next: 353 daysMeasure) = (AdarI thirtieth , 5768).
	self assert: (Nisan first , 5766 next: 355 daysMeasure) = (Nisan first , 5767).
	self assert: (Nisan first , 5767 next: 0 daysMeasure) = (Nisan first , 5767)
]

{ #category : #'test enumerating' }
HebrewDateTest >> testNextInWeeks [
	self assert: (Nisan first , 5767 next: 1 hebrewWeek) equals: (Nisan first , 5767 next: 7 daysMeasure).
	self assert: (Nisan first , 5767 next: 2 hebrewWeek) equals: (Nisan first , 5767 next: 14 daysMeasure)
]

{ #category : #'test enumerating' }
HebrewDateTest >> testNextMonth [
	| day |
	day := Nisan first , 5767.
	self assert: (day nextMonth: 1 hebrewMonth) = (Iyyar first , 5767).
	self assert: (day nextMonth: 2 hebrewMonth) = (Sivan first , 5767).
	self assert: (day nextMonth: 3 hebrewMonth) = (Tammuz first , 5767).
	self assert: (day nextMonth: 4 hebrewMonth) = (Av first , 5767).
	self assert: (day nextMonth: 5 hebrewMonth) = (Elul first , 5767).
	self assert: (day nextMonth: 6 hebrewMonth) = (Tishri first , 5768).
	self assert: (day nextMonth: 7 hebrewMonth) = (Marheshvan first , 5768).
	self assert: (day nextMonth: 8 hebrewMonth) = (Kislev first , 5768).
	self assert: (day nextMonth: 9 hebrewMonth) = (Tevet first , 5768).
	self assert: (day nextMonth: 10 hebrewMonth) = (Shevat first , 5768).
	self assert: (day nextMonth: 11 hebrewMonth) = (AdarI first , 5768).
	self assert: (day nextMonth: 12 hebrewMonth) = (AdarII first , 5768).
	self assert: (day nextMonth: 13 hebrewMonth) = (Nisan first , 5768)
]

{ #category : #'test accessing' }
HebrewDateTest >> testNumberOfDaysFromBeginnigOfYear [
	self assert: (Tishri first , 5767) numberOfDaysFromBeginningOfYear = 0 daysMeasure.
	self assert: (Tishri thirtieth , 5767) numberOfDaysFromBeginningOfYear = 29 daysMeasure.
	self assert: (Elul twentyninth , 5767) numberOfDaysFromBeginningOfYear = 354 daysMeasure.
	self assert: (Elul twentyninth , 5768) numberOfDaysFromBeginningOfYear = 382 daysMeasure
]

{ #category : #'test accessing' }
HebrewDateTest >> testNumberOfDaysFromBeginningOfMonth [
	self assert: (Nisan first , 1) numberOfDaysFromBeginningOfMonth = 0 daysMeasure.
	self assert: (Nisan thirtieth , 5767) numberOfDaysFromBeginningOfMonth = 29 daysMeasure.
	self assert: (Iyyar twentyninth , 5767) numberOfDaysFromBeginningOfMonth = 28 daysMeasure
]

{ #category : #'test accessing' }
HebrewDateTest >> testNumberOfDaysFromEpoch [
	self assert: (Tishri first , 1) numberOfDaysFromEpoch = -1373428 daysMeasure.
	self assert: (Elul twentyninth , 1300) numberOfDaysFromEpoch = -898607 daysMeasure.
	self assert: (Nisan first , 5767) numberOfDaysFromEpoch = 732754 daysMeasure
]

{ #category : #'test accessing' }
HebrewDateTest >> testNumberOfDaysToEndOfMonth [
	self assert: (Tishri first , 5767) numberOfDaysToEndOfMonth = 29 daysMeasure.
	self assert: (Tishri thirtieth , 5767) numberOfDaysToEndOfMonth = 0 daysMeasure.
	self assert: (Iyyar twentyeighth , 5767) numberOfDaysToEndOfMonth = 1 dayMeasure
]

{ #category : #'test accessing' }
HebrewDateTest >> testNumberOfDaysToEndOfYear [
	self assert: (Tishri first , 5767) numberOfDaysToEndOfYear = 354 daysMeasure.
	self assert: (Elul twentyninth , 5767) numberOfDaysToEndOfYear = 0 daysMeasure
]

{ #category : #'test enumerating' }
HebrewDateTest >> testPrevious [

	| day |

	day := Nisan first, 5767.
	self assert: day previous = (Adar twentyninth, 5767).

	day := Sivan first, 5767.
	self assert: day previous = (Iyyar twentyninth, 5767)
]

{ #category : #'test enumerating' }
HebrewDateTest >> testPreviousDay [

	| yomRishon |

	yomRishon := Nisan sixth, 5767.
	self assert: (yomRishon previousDay: calendar yomSheni) = (Adar twentyninth, 5767).
	self assert: (yomRishon previousDay: calendar yomShelishi) = (Nisan first, 5767).
	self assert: (yomRishon previousDay: calendar yomRevii) = (Nisan second, 5767).
	self assert: (yomRishon previousDay: calendar yomHamishi) = (Nisan third, 5767).
	self assert: (yomRishon previousDay: calendar yomShishi) = (Nisan fourth, 5767).
	self assert: (yomRishon previousDay: calendar yomShabbat) = (Nisan fifth, 5767).
	self assert: (yomRishon previousDay: calendar yomRishon) = (Adar twentyeighth, 5767)
]

{ #category : #'test enumerating' }
HebrewDateTest >> testPreviousDayOfMonth [

	| day |

	day := Nisan first, 5767.

	self assert: (day previousDayOfMonth: Sivan third) = (Sivan third, 5766).
	self assert: ((day previousDayOfMonth: Sivan third) previousDayOfMonth: Tammuz fourth) = (Tammuz fourth, 5765)
]

{ #category : #'test enumerating' }
HebrewDateTest >> testPreviousInNumberOfDays [
	self assert: (Nisan first , 1 previous: self tenDays) = (Adar twentieth , 1).
	self assert: (Nisan first , 5767 previous: self twentyNineDays) = (Adar first , 5767).
	self assert: (Nisan first , 5767 previous: self thirtyDays) = (Shevat thirtieth , 5767).
	self assert: (Nisan first , 5767 previous: 356 daysMeasure) = (Adar twentyninth , 5766).
	self assert: (Nisan first , 5766 previous: 356 daysMeasure) = (AdarII twentyeighth , 5765).
	self assert: (Nisan first , 5767 previous: 0 daysMeasure) = (Nisan first , 5767)
]

{ #category : #'test enumerating' }
HebrewDateTest >> testPreviousInWeeks [
	self assert: (Nisan first , 5767 previous: 1 hebrewWeek) equals: (Nisan first , 5767 previous: 7 hebrewDay).
	self assert: (Nisan first , 5767 previous: 2 hebrewWeek) equals: (Nisan first , 5767 previous: 14 hebrewDay)
]

{ #category : #'test printing' }
HebrewDateTest >> testPrintString [

	| date |

	date := Tevet first, 5767.
	self assert: date printString = 'Tevet 1, 5767'
]

{ #category : #'test interval protocol' }
HebrewDateTest >> testTo [

	| interval |

	interval := Nisan first, 5767 to: Nisan tenth, 5767.

	self assert: interval from = (Nisan first, 5767).
	self assert: interval to = (Nisan tenth, 5767).
	self assert: interval by = self oneDay
]

{ #category : #'test interval protocol' }
HebrewDateTest >> testToBy [

	| interval |

	interval := Nisan first, 5767 to: Nisan tenth, 5767 by: self twoDays.

	self assert: interval from = (Nisan first, 5767).
	self assert: interval to = (Nisan tenth, 5767).
	self assert: interval by = self twoDays
]

{ #category : #'test interval protocol' }
HebrewDateTest >> testToByDo [

	| daysTo nisanFirst5767 |

	daysTo := 0.
	nisanFirst5767 := Nisan first, 5767.
	(nisanFirst5767 to: Nisan first, 5768 by: self twoDays) do: [:date |
		self assert: (nisanFirst5767 distanceTo: date) amount = daysTo.
		daysTo := daysTo + 2].
	self assert: daysTo = 384
]

{ #category : #'test interval protocol' }
HebrewDateTest >> testToByReverse [

	| coll number |

	coll := (Nisan first, 5767 to: Nisan thirtieth, 5767 by: self twoDays) reverse.
	number := 29.
	coll do: [:date |
		self assert: date dayNumber = number.
		number := number - 2].
	self assert: number = -1
]

{ #category : #'test interval protocol' }
HebrewDateTest >> testToEveryBeginningDifferentDay [

	| yomSheni expectedDayNumbers interval |

	yomSheni := Nisan seventh, 5767.
	interval := yomSheni
		to: (yomSheni nextDay: calendar yomSheni) next
		every: (Array with: calendar yomShelishi with: calendar yomRevii with: calendar yomShishi).
	
	self assert: interval first = yomSheni next.
	self assert: interval last = (yomSheni nextDay: calendar yomSheni) next.
	self assert: interval size = 4.
	expectedDayNumbers := #(8 9 11 15).
	interval inject: 1 into: [:index :date |
		self assert: date dayNumber = (expectedDayNumbers at: index).
		index + 1]
]

{ #category : #'test interval protocol' }
HebrewDateTest >> testToEveryBeginningSameDay [

	| yomSheni expectedDayNumbers interval |

	yomSheni := Nisan seventh, 5767.
	interval := yomSheni
		to: (yomSheni nextDay: calendar yomSheni)
		every: (Array with: calendar yomSheni with: calendar yomRevii with: calendar yomShishi).
	
	self assert: interval first = yomSheni.
	self assert: interval last = (yomSheni nextDay: calendar yomSheni).
	self assert: interval size = 4.
	expectedDayNumbers := #(7 9 11 14).
	interval inject: 1 into: [:index :date |
		self assert: date dayNumber = (expectedDayNumbers at: index).
		index + 1]
]

{ #category : #'test interval protocol' }
HebrewDateTest >> testToEveryDayBeginningDifferentDay [

	| yomSheni expectedDayNumbers interval |

	yomSheni := Nisan seventh, 5767.
	interval := yomSheni to: (yomSheni nextDay: calendar yomSheni) next everyDay: calendar yomShelishi.

	self assert: interval first = yomSheni next.
	self assert: interval last = (yomSheni nextDay: calendar yomSheni) next.
	self assert: interval size = 2.
	expectedDayNumbers := #(8 15).
	interval inject: 1 into: [:index :date |
		self assert: date dayNumber = (expectedDayNumbers at: index).
		index + 1]
]

{ #category : #'test interval protocol' }
HebrewDateTest >> testToEveryDayBeginningSameDay [

	| yomSheni expectedDayNumbers interval |

	yomSheni := Nisan seventh, 5767.
	interval := yomSheni to: (yomSheni nextDay: calendar yomSheni) everyDay: calendar yomSheni.

	self assert: interval first = yomSheni.
	self assert: interval last = (yomSheni nextDay: calendar yomSheni).
	self assert: interval size = 2.
	expectedDayNumbers := #(7 14).
	interval inject: 1 into: [:index :date |
		self assert: date dayNumber = (expectedDayNumbers at: index).
		index + 1]
]

{ #category : #'test interval protocol' }
HebrewDateTest >> testToEveryDayNumber [
	| expectedMonths interval |
	interval := Tishri first , 5767 to: Elul twentyninth , 5767 everyDayNumber: 30.
	self assert: interval first = (Tishri thirtieth , 5767).
	self assert: interval last = (Av thirtieth , 5767).
	self assert: interval size = 7.
	expectedMonths := calendar months select: [ :month | (month lastDayNumberIn: 5767 asHebrewYear) = 30 ].
	interval
		inject: 4
		into: [ :index :date | 
			self assert: date month = (expectedMonths at: index).
			self assert: date dayNumber = 30.
			index = expectedMonths size
				ifTrue: [ index - expectedMonths size + 1 ]
				ifFalse: [ index + 1 ] ]
]

{ #category : #'test interval protocol' }
HebrewDateTest >> testToEveryDayNumbers [

	| expectedDayNumbers interval |

	interval := Tishri first, 5767 to: Elul twentyninth, 5767 everyDayNumbers: (Array with: 5 with: 20 with: 30 with: 1).

	self assert: interval first = (Tishri first, 5767).
	self assert: interval last = (Elul twentieth, 5767).
	self assert: interval size = 43.
	expectedDayNumbers :=  #(1 5 20 30 1 5 20 30 1 5 20 30 1 5 20 1 5 20 30 1 5 20 1 5 20 30 1 5 20 1 5 20 30 1 5 20 1 5 20 30 1 5 20).
	interval inject: 1 into: [:index :date |
		self assert: date dayNumber = (expectedDayNumbers at: index).
		index + 1]
]

{ #category : #'test interval protocol' }
HebrewDateTest >> testToEveryDayOfMonth [

	| dates |

	dates := Nisan tenth, 5767 to: Nisan ninth, 5769 everyDayOfMonth: Nisan tenth.

	self assert: dates size = 2.
	self assert: (dates includes: Nisan tenth, 5767).
	self assert: (dates includes: Nisan tenth, 5768).

	dates := Nisan tenth, 5767 to: Nisan tenth, 5769 everyDayOfMonth: Nisan tenth.

	self assert: dates size = 3.
	self assert: (dates includes: Nisan tenth, 5767).
	self assert: (dates includes: Nisan tenth, 5768).
	self assert: (dates includes: Nisan tenth, 5769)
]

{ #category : #'test interval protocol' }
HebrewDateTest >> testToNegativeBy [

	| interval number |

	interval := Nisan thirtieth, 5767 to: Nisan first, 5767 by: self twoDays negated.
	number := 30.
	interval do: [:date |
		self assert: date dayNumber = number.
		number := number - 2].
	self assert: number = 0
]

{ #category : #'test days accessing' }
HebrewDateTest >> testToday [

	| tomorrow yesterday |

	tomorrow := calendar tomorrow.
	yesterday := calendar yesterday.

	self assert: calendar today = yesterday next.
	self assert: calendar today = tomorrow previous
]

{ #category : #'test days accessing' }
HebrewDateTest >> testTomorrow [

	| today |

	today := calendar today.
	self assert: calendar tomorrow = today next
]

{ #category : #'test accessing' }
HebrewDateTest >> testYearNumber [

	self assert: (Tishri first, 5767) yearNumber = 5767
]

{ #category : #'test days accessing' }
HebrewDateTest >> testYesterday [

	| today |

	today := calendar today.
	self assert: calendar yesterday = today previous
]

{ #category : #'test support' }
HebrewDateTest >> thirtyDays [
	^ 30 daysMeasure
]

{ #category : #'test support' }
HebrewDateTest >> twentyNineDays [
	^ 29 daysMeasure
]

{ #category : #'test support' }
HebrewDateTest >> twoDays [
	^ 2 daysMeasure
]

{ #category : #'test support' }
HebrewDateTest >> zeroDays [
	^ 0 daysMeasure
]
