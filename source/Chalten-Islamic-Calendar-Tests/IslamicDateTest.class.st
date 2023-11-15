Class {
	#name : 'IslamicDateTest',
	#superclass : 'TestCase',
	#instVars : [
		'calendar'
	],
	#category : 'Chalten-Islamic-Calendar-Tests',
	#package : 'Chalten-Islamic-Calendar-Tests'
}

{ #category : 'accessing' }
IslamicDateTest class >> classUnderTest [

	^FixedDate
]

{ #category : 'test support' }
IslamicDateTest >> muharram [

	^calendar muharram
]

{ #category : 'test support' }
IslamicDateTest >> oneDay [
	^ 1 dayMeasure
]

{ #category : 'initialization' }
IslamicDateTest >> setUp [

	calendar := ChaltenEnvironment calendarNamed: #IslamicCalendar
]

{ #category : 'test support' }
IslamicDateTest >> tenDays [
	^ 10 daysMeasure
]

{ #category : 'test interval protocol' }
IslamicDateTest >> test30OfDhuAlHijjaToEveryDayOfMonth [

	| dates |
	dates := DhuAlHijja thirtieth , 1428
		         to: Muharram first , 1435
		         everyDayOfMonth: DhuAlHijja thirtieth.
	self assert: dates size equals: 3.
	self assert: (dates includes: DhuAlHijja thirtieth , 1428).
	self assert: (dates includes: DhuAlHijja thirtieth , 1431).
	self assert: (dates includes: DhuAlHijja thirtieth , 1434)
]

{ #category : 'test converting' }
IslamicDateTest >> testAsGregorianDate [

	self
		assert: (Muharram first , 1429) asGregorian
		equals: January tenth , 2008.
	self
		assert: (RabiI first , 1429) asGregorian
		equals: March ninth , 2008.
	self
		assert: (Ramadan fifth , 1420) asGregorian
		equals: December thirteenth , 1999.
	self
		assert: (Shawwal twelfth , 1435) asGregorian
		equals: August ninth , 2014.
	self
		assert: (DhuAlHijja second , 1440) asGregorian
		equals: August fourth , 2019
]

{ #category : 'test converting' }
IslamicDateTest >> testAsIslamicDate [

	self
		assert: Muharram first , 1429
		equals: (January tenth , 2008) asIslamic.
	self
		assert: RabiI first , 1429
		equals: (March ninth , 2008) asIslamic.
	self
		assert: Ramadan fifth , 1420
		equals: (December thirteenth , 1999) asIslamic.
	self
		assert: Shawwal twelfth , 1435
		equals: (August ninth , 2014) asIslamic.
	self
		assert: DhuAlHijja second , 1440
		equals: (August fourth , 2019) asIslamic
]

{ #category : 'test converting' }
IslamicDateTest >> testAsSmalltalkDate [

	| islamicDate gregorianDate date |
	islamicDate := JumadaI fourth , 1429.
	gregorianDate := islamicDate asGregorian.
	date := islamicDate asSmalltalkDate.
	self assert: gregorianDate year number equals: date year.
	self assert: gregorianDate month number equals: date monthIndex.
	self assert: gregorianDate dayNumber equals: date dayOfMonth
]

{ #category : 'test accessing' }
IslamicDateTest >> testAtMidnight [

	self
		assert: (Shawwal first , 1428) atMidnight
		equals:
		(ChaltenDateTime
			 date: Shawwal first , 1428
			 timeOfDay: (TimeOfDay hours: 00))
]

{ #category : 'test accessing' }
IslamicDateTest >> testAtNoon [

	self
		assert: (Shawwal first , 1428) atNoon
		equals:
		(ChaltenDateTime
			 date: Shawwal first , 1428
			 timeOfDay: (TimeOfDay hours: 12))
]

{ #category : 'test accessing' }
IslamicDateTest >> testAtTimeOfDay [

	self
		assert: (Shawwal first , 1428 atTimeOfDay: (TimeOfDay hours: 10))
		equals:
		(ChaltenDateTime
			 date: Shawwal first , 1428
			 timeOfDay: (TimeOfDay hours: 10))
]

{ #category : 'test instance creation' }
IslamicDateTest >> testCreation [

	| year1428 muharramOf1428 |
	year1428 := 1428 asIslamicYear.
	muharramOf1428 := MonthOfYear muharramOf: year1428.
	self
		assert: (FixedDate
				 yearNumber: 1428
				 monthNumber: 1
				 dayNumber: 1
				 calendar: calendar) monthOfYear
		equals: muharramOf1428.
	self
		assert: (FixedDate
				 yearNumber: 1428
				 monthNumber: 1
				 dayNumber: 1
				 calendar: calendar) dayNumber
		equals: 1.
	self
		assert: (FixedDate
				 monthOfYear: (MonthOfYear muharramOf: year1428)
				 dayNumber: 1) monthOfYear
		equals: muharramOf1428.
	self
		assert: (FixedDate
				 monthOfYear: (MonthOfYear muharramOf: year1428)
				 dayNumber: 1) dayNumber
		equals: 1.
	self
		assert:
			(FixedDate year: year1428 month: self muharram dayNumber: 1)
				monthOfYear
		equals: muharramOf1428.
	self
		assert:
		(FixedDate year: year1428 month: self muharram dayNumber: 1)
			dayNumber
		equals: 1.
	self
		assert:
			(FixedDate yearNumber: 1428 month: self muharram dayNumber: 1)
				monthOfYear
		equals: muharramOf1428.
	self
		assert:
			(FixedDate yearNumber: 1428 month: self muharram dayNumber: 1)
				dayNumber
		equals: 1
]

{ #category : 'test accessing' }
IslamicDateTest >> testDay [

	self assert: (Rajab first , 1428) day equals: YaumAlIthnayna.
	self assert: (Rajab second , 1428) day equals: YaumAthThalatha.
	self assert: (Rajab third , 1428) day equals: YaumAlArbaa.
	self assert: (Rajab fourth , 1428) day equals: YaumAlHamis.
	self assert: (Rajab fifth , 1428) day equals: YaumAlJuma.
	self assert: (Rajab sixth , 1428) day equals: YaumAsSabt.
	self assert: (Rajab seventh , 1428) day equals: YaumAlAhad.
	self assert: (Rajab eighth , 1428) day equals: YaumAlIthnayna
]

{ #category : 'test accessing' }
IslamicDateTest >> testDayNumber [

	self assert: (Rajab first , 1428) dayNumber equals: 1
]

{ #category : 'test accessing' }
IslamicDateTest >> testDayOfMonth [

	self
		assert: (Shawwal first , 1) dayOfMonth
		equals: (DayOfMonth monthNumber: 10 dayNumber: 1 calendar: calendar)
]

{ #category : 'test querying' }
IslamicDateTest >> testDaysFrom [

	self
		assert: (Muharram first , 1428 distanceFrom: Muharram first , 1428)
		equals: self zeroDays.
	self
		assert: (Safar first , 1428 distanceFrom: Muharram first , 1428)
		equals: self thirtyDays.
	self
		assert: (RabiI first , 1428 distanceFrom: Muharram first , 1428)
		equals: (30 + 29) daysMeasure.
	self
		assert: (Muharram first , 1429 distanceFrom: Muharram first , 1428)
		equals: 355 daysMeasure.
	self
		assert: (Muharram first , 1428 distanceFrom: Muharram first , 1427)
		equals: 354 daysMeasure.
	self
		assert: (Muharram first , 1427 distanceFrom: Muharram first , 1428)
		equals: -354 daysMeasure.
	self
		assert: (Muharram first , 1428 distanceFrom: Muharram first , 1429)
		equals: -355 daysMeasure.
	self
		assert: (TheBeginningOfTime distanceFrom: Muharram first , 1429)
		equals: ArithmeticObject minusInfinity daysMeasure.
	self
		assert: (TheEndOfTime distanceFrom: Muharram first , 1429)
		equals: ArithmeticObject infinity daysMeasure
]

{ #category : 'test querying' }
IslamicDateTest >> testDaysTo [

	self
		assert: (Muharram first , 1428 distanceTo: Muharram first , 1428)
		equals: self zeroDays.
	self
		assert: (Muharram first , 1428 distanceTo: Safar first , 1428)
		equals: self thirtyDays.
	self
		assert: (Muharram first , 1428 distanceTo: RabiI first , 1428)
		equals: (30 + 29) daysMeasure.
	self
		assert: (Muharram first , 1428 distanceTo: Muharram first , 1429)
		equals: 355 daysMeasure.
	self
		assert: (Muharram first , 1427 distanceTo: Muharram first , 1428)
		equals: 354 daysMeasure.
	self
		assert: (Muharram first , 1428 distanceTo: Muharram first , 1427)
		equals: -354 daysMeasure.
	self
		assert: (Muharram first , 1429 distanceTo: Muharram first , 1428)
		equals: -355 daysMeasure.
	self
		assert: (Muharram first , 1429 distanceTo: TheBeginningOfTime)
		equals: ArithmeticObject minusInfinity daysMeasure.
	self
		assert: (Muharram first , 1429 distanceTo: TheEndOfTime)
		equals: ArithmeticObject infinity daysMeasure
]

{ #category : 'test comparing' }
IslamicDateTest >> testEqual [

	self assert: Muharram first , 1428 equals: (FixedDate
			 yearNumber: 1428
			 monthNumber: 1
			 dayNumber: 1
			 calendar: calendar).
	self deny: Muharram first , 1 = (FixedDate
			 yearNumber: 1428
			 monthNumber: 1
			 dayNumber: 2
			 calendar: calendar)
]

{ #category : 'test comparing' }
IslamicDateTest >> testGreaterThan [

	self assert: Safar first , 1428 > (Muharram thirtieth , 1428).
	self assert: Safar first , 1428 > (Muharram first , 1).
	self assert: Safar first , 1428 > (DhuAlHijja twentyninth , 1427).

	self
		should: [ Muharram first , 2007 > YaumAlAhad ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: YaumAlAhad class
						 with: YaumAlAhad
						 with: (Muharram first , 2007) class
						 with: Muharram first , 2007) ].

	self
		should: [ Muharram thirtieth , 2007 >= Safar ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: (Muharram thirtieth , 2007) class
						 with: Muharram thirtieth , 2007
						 with: Safar class
						 with: Safar) ]
]

{ #category : 'test comparing' }
IslamicDateTest >> testHash [

	self assert: (Muharram first , 1428) hash equals: (FixedDate
			 yearNumber: 1428
			 monthNumber: 1
			 dayNumber: 1
			 calendar: calendar) hash.
	self deny: (Muharram first , 1) hash = (FixedDate
			 yearNumber: 1428
			 monthNumber: 1
			 dayNumber: 2
			 calendar: calendar) hash
]

{ #category : 'test includes' }
IslamicDateTest >> testIncludesDate [

	self
		should: [ Muharram first, 1428 includes: Muharram first, 1428]
		raise: Exception
]

{ #category : 'test includes' }
IslamicDateTest >> testIncludesDateTime [

	self assert: (Muharram first, 1428 includes: (Muharram first, 1428) atMidnight).
	self assert: (Muharram first, 1428 includes: (Muharram first, 1428) atLastTimeOfDay).

	self deny: (Muharram first, 1428 includes: (Safar first, 1428) atMidnight).
	self deny: (Muharram first, 1428 includes: (DhuAlHijja thirtieth, 1428) atLastTimeOfDay)
]

{ #category : 'test includes' }
IslamicDateTest >> testIncludesMonthOfYear [

	self
		should: [ Muharram first, 1428 includes: Muharram, 1428 ]
		raise: Exception
]

{ #category : 'test includes' }
IslamicDateTest >> testIncludesYear [
	self should: [ Muharram first , 1428 includes: 1428 asIslamicYear ] raise: Exception
]

{ #category : 'test instance creation' }
IslamicDateTest >> testInvalidCreation [

	self
		should: [
			FixedDate
				yearNumber: 1428
				monthNumber: 1
				dayNumber: 31
				calendar: calendar ]
		raise: InvalidDateException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals:
				'The day 31 is invalid for the month Muharram of Year 1428' ].
	self
		should: [
			FixedDate
				yearNumber: 1428
				monthNumber: 2
				dayNumber: 30
				calendar: calendar ]
		raise: InvalidDateException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals: 'The day 30 is invalid for the month Safar of Year 1428' ].
	self
		should: [
			FixedDate
				yearNumber: 1428
				monthNumber: 3
				dayNumber: 31
				calendar: calendar ]
		raise: InvalidDateException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals:
				'The day 31 is invalid for the month Rabi` I (Rabi` al-Awwal) of Year 1428' ].
	self
		should: [
			FixedDate
				yearNumber: 1428
				monthNumber: 4
				dayNumber: 30
				calendar: calendar ]
		raise: InvalidDateException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals:
				'The day 30 is invalid for the month Rabi` II (Rabi` al-Ahir) of Year 1428' ].
	self
		should: [
			FixedDate
				yearNumber: 1428
				monthNumber: 5
				dayNumber: 31
				calendar: calendar ]
		raise: InvalidDateException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals:
				'The day 31 is invalid for the month Jumada I (Jumada al-Ula) of Year 1428' ].
	self
		should: [
			FixedDate
				yearNumber: 1428
				monthNumber: 6
				dayNumber: 30
				calendar: calendar ]
		raise: InvalidDateException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals:
				'The day 30 is invalid for the month Jumada II (Jumada al-Ahira) of Year 1428' ].
	self
		should: [
			FixedDate
				yearNumber: 1428
				monthNumber: 7
				dayNumber: 31
				calendar: calendar ]
		raise: InvalidDateException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals: 'The day 31 is invalid for the month Rajab of Year 1428' ].
	self
		should: [
			FixedDate
				yearNumber: 1428
				monthNumber: 8
				dayNumber: 30
				calendar: calendar ]
		raise: InvalidDateException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals: 'The day 30 is invalid for the month Sha`ban of Year 1428' ].
	self
		should: [
			FixedDate
				yearNumber: 1428
				monthNumber: 9
				dayNumber: 31
				calendar: calendar ]
		raise: InvalidDateException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals: 'The day 31 is invalid for the month Ramadan of Year 1428' ].
	self
		should: [
			FixedDate
				yearNumber: 1428
				monthNumber: 10
				dayNumber: 30
				calendar: calendar ]
		raise: InvalidDateException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals: 'The day 30 is invalid for the month Shawwal of Year 1428' ].
	self
		should: [
			FixedDate
				yearNumber: 1428
				monthNumber: 11
				dayNumber: 31
				calendar: calendar ]
		raise: InvalidDateException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals:
				'The day 31 is invalid for the month Dhu al-Qa`da of Year 1428' ].
	self
		should: [
			FixedDate
				yearNumber: 1427
				monthNumber: 12
				dayNumber: 30
				calendar: calendar ]
		raise: InvalidDateException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals:
				'The day 30 is invalid for the month Dhu al-Hijja of Year 1427' ].
	self
		should: [
			FixedDate
				yearNumber: 1428
				monthNumber: 12
				dayNumber: 31
				calendar: calendar ]
		raise: InvalidDateException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals:
				'The day 31 is invalid for the month Dhu al-Hijja of Year 1428' ].
	self
		should: [
			FixedDate
				yearNumber: 1428
				monthNumber: 13
				dayNumber: 1
				calendar: calendar ]
		raise: InvalidMonthNumberException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals: '13 is an invalid number for a month' ].
	self
		should: [
			FixedDate
				yearNumber: 1428
				monthNumber: 0
				dayNumber: 1
				calendar: calendar ]
		raise: InvalidMonthNumberException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals: '0 is an invalid number for a month' ].
	self
		should: [
			FixedDate
				yearNumber: 1428
				monthNumber: -1
				dayNumber: 1
				calendar: calendar ]
		raise: InvalidMonthNumberException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals: '-1 is an invalid number for a month' ].
	self
		should: [
			FixedDate
				yearNumber: 1428
				monthNumber: 1
				dayNumber: 0
				calendar: calendar ]
		raise: InvalidDateException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals: 'The day 0 is invalid for the month Muharram of Year 1428' ].
	self
		should: [
			FixedDate
				yearNumber: 1428
				monthNumber: 1
				dayNumber: -1
				calendar: calendar ]
		raise: InvalidDateException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals:
				'The day -1 is invalid for the month Muharram of Year 1428' ]
]

{ #category : 'test testing days' }
IslamicDateTest >> testIs [

	self assert: (Ramadan ninth, 1428 is: YaumAlJuma).
	self assert: (Ramadan tenth, 1428 is: YaumAsSabt).
	self assert: (Ramadan eleventh, 1428 is: YaumAlAhad).
	self assert: (Ramadan twelfth, 1428 is: YaumAlIthnayna).
	self assert: (Ramadan thirteenth, 1428 is: YaumAthThalatha).
	self assert: (Ramadan fourteenth, 1428 is: YaumAlArbaa).
	self assert: (Ramadan fifteenth, 1428 is: YaumAlHamis)
]

{ #category : 'test testing' }
IslamicDateTest >> testIsFirstDayOfMonth [

	self assert: (Muharram first, 1428) isFirstDayOfMonth.
	self deny: (Muharram second, 1428) isFirstDayOfMonth
]

{ #category : 'test testing' }
IslamicDateTest >> testIsFirstDayOfYear [

	self assert: (Muharram first, 1428) isFirstDayOfYear.
	self deny: (Muharram second, 1428) isFirstDayOfYear
]

{ #category : 'test testing' }
IslamicDateTest >> testIsFirstMonthOfYear [

	self assert: (Muharram first, 1428) isFirstMonthOfYear.
	self assert: (Muharram second, 1428) isFirstMonthOfYear.
	
	self deny: (Safar third, 1428) isFirstMonthOfYear.
	self deny: (DhuAlHijja fifteenth, 1428) isFirstMonthOfYear
]

{ #category : 'test testing months' }
IslamicDateTest >> testIsIn [

	self assert: (Muharram first, 1428 isIn: Muharram).
	self assert: (Safar first, 1428 isIn: Safar).
	self assert: (RabiI first, 1428 isIn: RabiI).
	self assert: (RabiII first, 1428 isIn: RabiII).
	self assert: (JumadaI first, 1428 isIn: JumadaI).
	self assert: (JumadaII first, 1428 isIn: JumadaII).
	self assert: (Rajab first, 1428 isIn: Rajab).
	self assert: (Shaban first, 1428 isIn: Shaban).
	self assert: (Ramadan first, 1428 isIn: Ramadan).
	self assert: (Shawwal first, 1428 isIn: Shawwal).
	self assert: (DhuAlQada first, 1428 isIn: DhuAlQada).
	self assert: (DhuAlHijja first, 1428 isIn: DhuAlHijja)
]

{ #category : 'test testing' }
IslamicDateTest >> testIsLastDayOfMonth [

	self assert: (Muharram thirtieth, 1428) isLastDayOfMonth.
	self assert: (Safar twentyninth, 1428) isLastDayOfMonth.
	self assert: (RabiI thirtieth, 1428) isLastDayOfMonth.
	self assert: (RabiII twentyninth, 1428) isLastDayOfMonth.
	self assert: (JumadaI thirtieth, 1428) isLastDayOfMonth.
	self assert: (JumadaII twentyninth, 1428) isLastDayOfMonth.
	self assert: (Rajab thirtieth, 1428) isLastDayOfMonth.
	self assert: (Shaban twentyninth, 1428) isLastDayOfMonth.
	self assert: (Ramadan thirtieth, 1428) isLastDayOfMonth.
	self assert: (Shawwal twentyninth, 1428) isLastDayOfMonth.
	self assert: (DhuAlQada thirtieth, 1428) isLastDayOfMonth.
	self assert: (DhuAlHijja twentyninth, 1427) isLastDayOfMonth.
	self assert: (DhuAlHijja thirtieth, 1428) isLastDayOfMonth


]

{ #category : 'test testing' }
IslamicDateTest >> testIsLastDayOfYear [

	self assert: (DhuAlHijja thirtieth, 1428) isLastDayOfYear.
	self assert: (DhuAlHijja twentyninth, 1427) isLastDayOfYear.

	self deny: (DhuAlHijja twentyninth, 1428) isLastDayOfYear.
	self deny: (DhuAlQada thirtieth, 1428) isLastDayOfYear.
	self deny: (Ramadan twentyninth, 1428) isLastDayOfYear
]

{ #category : 'test comparing' }
IslamicDateTest >> testLessThan [

	self assert: Muharram first , 2004 < (Muharram second , 2004).
	self assert: Muharram first , 2004 < (Safar first , 2004).
	self assert: Muharram first , 2004 < (Muharram first , 2005).

	self
		should: [ Muharram first , 2007 <= YaumAlAhad ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: YaumAlAhad class
						 with: YaumAlAhad
						 with: (Muharram first , 2007) class
						 with: Muharram first , 2007) ].

	self
		should: [ Muharram thirtieth , 2007 < Safar ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: (Muharram thirtieth , 2007) class
						 with: Muharram thirtieth , 2007
						 with: Safar class
						 with: Safar) ]
]

{ #category : 'test accessing' }
IslamicDateTest >> testMonth [

	self assert: (Rajab first , 1428) month equals: Rajab
]

{ #category : 'test accessing' }
IslamicDateTest >> testMonthNumber [

	self assert: (Rajab first , 1428) monthNumber equals: 7
]

{ #category : 'test accessing' }
IslamicDateTest >> testMonthOfYear [

	self
		assert: (Shawwal first , 1428) monthOfYear
		equals: Shawwal , 1428
]

{ #category : 'test enumerating' }
IslamicDateTest >> testNext [

	| date |
	date := Muharram first , 1428.
	self assert: date next equals: Muharram second , 1428.

	date := Safar twentyeighth , 1428.
	self assert: date next equals: Safar twentyninth , 1428.
	self assert: date next next equals: RabiI first , 1428.

	date := DhuAlHijja thirtieth , 1428.
	self assert: date next equals: Muharram first , 1429
]

{ #category : 'test enumerating' }
IslamicDateTest >> testNextDay [

	| yaumAlAhad |
	yaumAlAhad := Muharram second , 1428.
	self
		assert: (yaumAlAhad nextDay: calendar yaumAlAhad)
		equals: Muharram ninth , 1428.
	self
		assert: (yaumAlAhad nextDay: calendar yaumAlIthnayna)
		equals: Muharram third , 1428.
	self
		assert: (yaumAlAhad nextDay: calendar yaumAthThalatha)
		equals: Muharram fourth , 1428.
	self
		assert: (yaumAlAhad nextDay: calendar yaumAlArbaa)
		equals: Muharram fifth , 1428.
	self
		assert: (yaumAlAhad nextDay: calendar yaumAlHamis)
		equals: Muharram sixth , 1428.
	self
		assert: (yaumAlAhad nextDay: calendar yaumAlJuma)
		equals: Muharram seventh , 1428.
	self
		assert: (yaumAlAhad nextDay: calendar yaumAsSabt)
		equals: Muharram eighth , 1428
]

{ #category : 'test enumerating' }
IslamicDateTest >> testNextDayOfMonth [

	| date |
	date := Muharram first , 1428.
	self
		assert: (date nextDayOfMonth: RabiI third)
		equals: RabiI third , 1428.
	self
		assert:
		((date nextDayOfMonth: RabiI third) nextDayOfMonth: RabiII fourth)
		equals: RabiII fourth , 1428.

	date := Safar first , 1428.
	self
		assert: (date nextDayOfMonth: Muharram third)
		equals: Muharram third , 1429.
	self
		assert:
		((date nextDayOfMonth: Muharram third) nextDayOfMonth: RabiI fourth)
		equals: RabiI fourth , 1429
]

{ #category : 'test enumerating' }
IslamicDateTest >> testNextInNumberOfDays [

	self
		assert: (Muharram first , 1 next: self tenDays)
		equals: Muharram eleventh , 1.
	self
		assert: (Muharram first , 1428 next: self twentyNineDays)
		equals: Muharram thirtieth , 1428.
	self
		assert: (Muharram first , 1428 next: self thirtyDays)
		equals: Safar first , 1428.
	self
		assert: (Muharram first , 1428 next: 355 daysMeasure)
		equals: Muharram first , 1429.
	self
		assert: (Muharram first , 1427 next: 354 daysMeasure)
		equals: Muharram first , 1428.
	self
		assert: (Muharram first , 1428 next: 0 daysMeasure)
		equals: Muharram first , 1428
]

{ #category : 'test enumerating' }
IslamicDateTest >> testNextInWeeks [

	self
		assert: (Muharram first , 1428 next: 1 weekMeasure)
		equals: (Muharram first , 1428 next: 7 daysMeasure).
	self
		assert: (Muharram first , 1428 next: 2 weeksMeasure)
		equals: (Muharram first , 1428 next: 14 daysMeasure)
]

{ #category : 'test enumerating' }
IslamicDateTest >> testNextMonth [

	| day |
	day := Muharram first , 1428.
	self
		assert: (day nextMonth: 1 monthMeasure)
		equals: Safar first , 1428.
	self
		assert: (day nextMonth: 2 monthsMeasure)
		equals: RabiI first , 1428.
	self
		assert: (day nextMonth: 3 monthsMeasure)
		equals: RabiII first , 1428.
	self
		assert: (day nextMonth: 4 monthsMeasure)
		equals: JumadaI first , 1428.
	self
		assert: (day nextMonth: 5 monthsMeasure)
		equals: JumadaII first , 1428.
	self
		assert: (day nextMonth: 6 monthsMeasure)
		equals: Rajab first , 1428.
	self
		assert: (day nextMonth: 7 monthsMeasure)
		equals: Shaban first , 1428.
	self
		assert: (day nextMonth: 8 monthsMeasure)
		equals: Ramadan first , 1428.
	self
		assert: (day nextMonth: 9 monthsMeasure)
		equals: Shawwal first , 1428.
	self
		assert: (day nextMonth: 10 monthsMeasure)
		equals: DhuAlQada first , 1428.
	self
		assert: (day nextMonth: 11 monthsMeasure)
		equals: DhuAlHijja first , 1428.
	self
		assert: (day nextMonth: 12 monthsMeasure)
		equals: Muharram first , 1429
]

{ #category : 'test accessing' }
IslamicDateTest >> testNumberOfDaysFromBeginnigOfYear [

	self
		assert: (Muharram first , 1428) numberOfDaysFromBeginningOfYear
		equals: 0 daysMeasure.
	self
		assert: (Muharram thirtieth , 1428) numberOfDaysFromBeginningOfYear
		equals: 29 daysMeasure.
	self
		assert:
		(DhuAlHijja twentyninth , 1427) numberOfDaysFromBeginningOfYear
		equals: 353 daysMeasure.
	self
		assert:
		(DhuAlHijja thirtieth , 1428) numberOfDaysFromBeginningOfYear
		equals: 354 daysMeasure
]

{ #category : 'test accessing' }
IslamicDateTest >> testNumberOfDaysFromBeginningOfMonth [

	self
		assert: (Muharram first , 1) numberOfDaysFromBeginningOfMonth
		equals: 0 daysMeasure.
	self
		assert: (Muharram thirtieth , 1428) numberOfDaysFromBeginningOfMonth
		equals: 29 daysMeasure.
	self
		assert: (Safar twentyninth , 1428) numberOfDaysFromBeginningOfMonth
		equals: 28 daysMeasure
]

{ #category : 'test accessing' }
IslamicDateTest >> testNumberOfDaysFromEpoch [

	self
		assert: (Muharram first , 1) numberOfDaysFromEpoch
		equals: 227014 daysMeasure.
	self
		assert: (DhuAlHijja thirtieth , 1300) numberOfDaysFromEpoch
		equals: 687690 daysMeasure.
	self
		assert: (Muharram first , 1428) numberOfDaysFromEpoch
		equals: 732695 daysMeasure
]

{ #category : 'test accessing' }
IslamicDateTest >> testNumberOfDaysToEndOfMonth [

	self
		assert: (Muharram first , 1428) numberOfDaysToEndOfMonth
		equals: 29 daysMeasure.
	self
		assert: (Muharram thirtieth , 1428) numberOfDaysToEndOfMonth
		equals: 0 daysMeasure.
	self
		assert: Safar twentyeighth numberOfDaysToEndOfMonth
		equals: 1 dayMeasure
]

{ #category : 'test accessing' }
IslamicDateTest >> testNumberOfDaysToEndOfYear [

	self
		assert: (Muharram first , 1428) numberOfDaysToEndOfYear
		equals: 354 daysMeasure.
	self
		assert: (DhuAlHijja thirtieth , 1428) numberOfDaysToEndOfYear
		equals: 0 daysMeasure
]

{ #category : 'test enumerating' }
IslamicDateTest >> testPrevious [

	| day |
	day := Muharram first , 1428.
	self assert: day previous equals: DhuAlHijja twentyninth , 1427.

	day := RabiI first , 1428.
	self assert: day previous equals: Safar twentyninth , 1428
]

{ #category : 'test enumerating' }
IslamicDateTest >> testPreviousDay [

	| yaumAlAhad |
	yaumAlAhad := Muharram second , 1428.
	self
		assert: (yaumAlAhad previousDay: calendar yaumAlAhad)
		equals: DhuAlHijja twentyfourth , 1427.
	self
		assert: (yaumAlAhad previousDay: calendar yaumAlIthnayna)
		equals: DhuAlHijja twentyfifth , 1427.
	self
		assert: (yaumAlAhad previousDay: calendar yaumAthThalatha)
		equals: DhuAlHijja twentysixth , 1427.
	self
		assert: (yaumAlAhad previousDay: calendar yaumAlArbaa)
		equals: DhuAlHijja twentyseventh , 1427.
	self
		assert: (yaumAlAhad previousDay: calendar yaumAlHamis)
		equals: DhuAlHijja twentyeighth , 1427.
	self
		assert: (yaumAlAhad previousDay: calendar yaumAlJuma)
		equals: DhuAlHijja twentyninth , 1427.
	self
		assert: (yaumAlAhad previousDay: calendar yaumAsSabt)
		equals: Muharram first , 1428
]

{ #category : 'test enumerating' }
IslamicDateTest >> testPreviousDayOfMonth [

	| day |
	day := Muharram first , 1428.
	self
		assert: (day previousDayOfMonth: RabiI third)
		equals: RabiI third , 1427.
	self
		assert: ((day previousDayOfMonth: RabiI third) previousDayOfMonth:
				 RabiII fourth)
		equals: RabiII fourth , 1426
]

{ #category : 'test enumerating' }
IslamicDateTest >> testPreviousInNumberOfDays [

	self
		assert: (Muharram first , 1 previous: self tenDays)
		equals: DhuAlHijja twentieth , 0.
	self
		assert: (Muharram first , 1428 previous: self twentyNineDays)
		equals: DhuAlHijja first , 1427.
	self
		assert: (Muharram first , 1428 previous: self thirtyDays)
		equals: DhuAlQada thirtieth , 1427.
	self
		assert: (Muharram first , 1428 previous: 355 daysMeasure)
		equals: DhuAlHijja thirtieth , 1426.
	self
		assert: (Muharram first , 1427 previous: 355 daysMeasure)
		equals: Muharram first , 1426.
	self
		assert: (Muharram first , 1428 previous: 0 daysMeasure)
		equals: Muharram first , 1428
]

{ #category : 'test enumerating' }
IslamicDateTest >> testPreviousInWeeks [

	self
		assert: (Muharram first , 1428 previous: 1 weekMeasure)
		equals: (Muharram first , 1428 previous: 7 daysMeasure).
	self
		assert: (Muharram first , 1428 previous: 2 weeksMeasure)
		equals: (Muharram first , 1428 previous: 14 daysMeasure)
]

{ #category : 'test printing' }
IslamicDateTest >> testPrintString [

	| date |
	date := Shawwal first , 1428.
	self assert: date printString equals: 'Shawwal 1, 1428'
]

{ #category : 'test interval protocol' }
IslamicDateTest >> testTo [

	| interval |
	interval := Muharram first , 1428 to: Muharram tenth , 1428.
	self assert: interval from equals: Muharram first , 1428.
	self assert: interval to equals: Muharram tenth , 1428.
	self assert: interval by equals: self oneDay
]

{ #category : 'test interval protocol' }
IslamicDateTest >> testToBy [

	| interval |
	interval := Muharram first , 1428 to: Muharram tenth , 1428 by:
	            self twoDays.
	self assert: interval from equals: Muharram first , 1428.
	self assert: interval to equals: Muharram tenth , 1428.
	self assert: interval by equals: self twoDays
]

{ #category : 'test interval protocol' }
IslamicDateTest >> testToByDo [

	| daysTo muharramFirst1428 |
	daysTo := 0.
	muharramFirst1428 := Muharram first , 1428.
	(muharramFirst1428 to: Muharram first , 1429 by: self twoDays) do: [
		:date |
		self
			assert: (muharramFirst1428 distanceTo: date) amount
			equals: daysTo.
		daysTo := daysTo + 2 ].
	self assert: daysTo equals: 356
]

{ #category : 'test interval protocol' }
IslamicDateTest >> testToByReverse [

	| coll number |
	coll := (Muharram first , 1428 to: Muharram thirtieth , 1428 by:
	         self twoDays) reverse.
	number := 29.
	coll do: [ :date |
		self assert: date dayNumber equals: number.
		number := number - 2 ].
	self assert: number equals: -1
]

{ #category : 'test interval protocol' }
IslamicDateTest >> testToEveryBeginningDifferentDay [

	| yaumAlIthnayna expectedDayNumbers interval |
	yaumAlIthnayna := Muharram third , 1428.
	interval := yaumAlIthnayna
		            to:
		            (yaumAlIthnayna nextDay: calendar yaumAlIthnayna) next
		            every: (Array
				             with: calendar yaumAthThalatha
				             with: calendar yaumAlArbaa
				             with: calendar yaumAlJuma).
	self assert: interval first equals: yaumAlIthnayna next.
	self
		assert: interval last
		equals: (yaumAlIthnayna nextDay: calendar yaumAlIthnayna) next.
	self assert: interval size equals: 4.
	expectedDayNumbers := #( 4 5 7 11 ).
	interval inject: 1 into: [ :index :date |
		self assert: date dayNumber equals: (expectedDayNumbers at: index).
		index + 1 ]
]

{ #category : 'test interval protocol' }
IslamicDateTest >> testToEveryBeginningSameDay [

	| yaumAlIthnayna expectedDayNumbers interval |
	yaumAlIthnayna := Muharram third , 1428.
	interval := yaumAlIthnayna
		            to: (yaumAlIthnayna nextDay: calendar yaumAlIthnayna)
		            every: (Array
				             with: calendar yaumAlIthnayna
				             with: calendar yaumAlArbaa
				             with: calendar yaumAlJuma).
	self assert: interval first equals: yaumAlIthnayna.
	self
		assert: interval last
		equals: (yaumAlIthnayna nextDay: calendar yaumAlIthnayna).
	self assert: interval size equals: 4.
	expectedDayNumbers := #( 3 5 7 10 ).
	interval inject: 1 into: [ :index :date |
		self assert: date dayNumber equals: (expectedDayNumbers at: index).
		index + 1 ]
]

{ #category : 'test interval protocol' }
IslamicDateTest >> testToEveryDayBeginningDifferentDay [

	| yaumAlIthnayna expectedDayNumbers interval |
	yaumAlIthnayna := Muharram third , 1428.
	interval := yaumAlIthnayna
		            to:
		            (yaumAlIthnayna nextDay: calendar yaumAlIthnayna) next
		            everyDay: calendar yaumAthThalatha.
	self assert: interval first equals: yaumAlIthnayna next.
	self
		assert: interval last
		equals: (yaumAlIthnayna nextDay: calendar yaumAlIthnayna) next.
	self assert: interval size equals: 2.
	expectedDayNumbers := #( 4 11 ).
	interval inject: 1 into: [ :index :date |
		self assert: date dayNumber equals: (expectedDayNumbers at: index).
		index + 1 ]
]

{ #category : 'test interval protocol' }
IslamicDateTest >> testToEveryDayBeginningSameDay [

	| yaumAlIthnayna expectedDayNumbers interval |
	yaumAlIthnayna := Muharram third , 1428.
	interval := yaumAlIthnayna
		            to: (yaumAlIthnayna nextDay: calendar yaumAlIthnayna)
		            everyDay: calendar yaumAlIthnayna.
	self assert: interval first equals: yaumAlIthnayna.
	self
		assert: interval last
		equals: (yaumAlIthnayna nextDay: calendar yaumAlIthnayna).
	self assert: interval size equals: 2.
	expectedDayNumbers := #( 3 10 ).
	interval inject: 1 into: [ :index :date |
		self assert: date dayNumber equals: (expectedDayNumbers at: index).
		index + 1 ]
]

{ #category : 'test interval protocol' }
IslamicDateTest >> testToEveryDayNumber [

	| expectedMonths interval |
	interval := Muharram first , 1428
		            to: DhuAlHijja thirtieth , 1428
		            everyDayNumber: 30.
	self assert: interval first equals: Muharram thirtieth , 1428.
	self assert: interval last equals: DhuAlHijja thirtieth , 1428.
	self assert: interval size equals: 7.
	expectedMonths := calendar months select: [ :month |
		                  (month lastDayNumberIn: 2004 asIslamicYear) = 30 ].
	interval inject: 1 into: [ :index :date |
		self assert: date month equals: (expectedMonths at: index).
		self assert: date dayNumber equals: 30.
		index + 1 ]
]

{ #category : 'test interval protocol' }
IslamicDateTest >> testToEveryDayNumbers [

	| expectedDayNumbers interval |
	interval := Muharram first , 1428
		            to: DhuAlHijja thirtieth , 1428
		            everyDayNumbers: (Array
				             with: 5
				             with: 20
				             with: 30
				             with: 1).
	self assert: interval first equals: Muharram first , 1428.
	self assert: interval last equals: DhuAlHijja thirtieth , 1428.
	self assert: interval size equals: 43.
	expectedDayNumbers := #( 1 5 20 30 1 5 20 1 5 20 30 1 5 20 1 5 20 30
	                         1 5 20 1 5 20 30 1 5 20 1 5 20 30 1 5 20 1 5
	                         20 30 1 5 20 30 ).
	interval inject: 1 into: [ :index :date |
		self assert: date dayNumber equals: (expectedDayNumbers at: index).
		index + 1 ]
]

{ #category : 'test interval protocol' }
IslamicDateTest >> testToEveryDayOfMonth [

	| dates |
	dates := Muharram tenth , 1428
		         to: Muharram ninth , 1430
		         everyDayOfMonth: Muharram tenth.
	self assert: dates size equals: 2.
	self assert: (dates includes: Muharram tenth , 1428).
	self assert: (dates includes: Muharram tenth , 1429).

	dates := Muharram tenth , 1428
		         to: Muharram tenth , 1430
		         everyDayOfMonth: Muharram tenth.
	self assert: dates size equals: 3.
	self assert: (dates includes: Muharram tenth , 1428).
	self assert: (dates includes: Muharram tenth , 1429).
	self assert: (dates includes: Muharram tenth , 1430)
]

{ #category : 'test interval protocol' }
IslamicDateTest >> testToNegativeBy [

	| interval number |
	interval := Muharram thirtieth , 1428 to: Muharram first , 1428 by:
	            self twoDays negated.
	number := 30.
	interval do: [ :date |
		self assert: date dayNumber equals: number.
		number := number - 2 ].
	self assert: number equals: 0
]

{ #category : 'test days accessing' }
IslamicDateTest >> testToday [

	| tomorrow yesterday |
	tomorrow := calendar tomorrow.
	yesterday := calendar yesterday.
	self assert: calendar today equals: yesterday next.
	self assert: calendar today equals: tomorrow previous
]

{ #category : 'test days accessing' }
IslamicDateTest >> testTomorrow [

	| today |
	today := calendar today.
	self assert: calendar tomorrow equals: today next
]

{ #category : 'test accessing' }
IslamicDateTest >> testYearNumber [

	self assert: (Rajab first , 1428) yearNumber equals: 1428
]

{ #category : 'test days accessing' }
IslamicDateTest >> testYesterday [

	| today |
	today := calendar today.
	self assert: calendar yesterday equals: today previous
]

{ #category : 'test support' }
IslamicDateTest >> thirtyDays [
	^ 30 daysMeasure
]

{ #category : 'test support' }
IslamicDateTest >> twentyNineDays [
	^ 29 daysMeasure
]

{ #category : 'test support' }
IslamicDateTest >> twoDays [
	^ 2 daysMeasure
]

{ #category : 'test support' }
IslamicDateTest >> zeroDays [
	^ 0 daysMeasure
]
