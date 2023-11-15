Class {
	#name : 'JulianMonthOfYearTest',
	#superclass : 'TestCase',
	#instVars : [
		'calendar',
		'oneMonth',
		'twoMonths',
		'oneYear',
		'elevenMonths',
		'zeroMonths',
		'twelveMonths',
		'thirteenMonths',
		'twoYears'
	],
	#category : 'Chalten-Julian-Calendar-Tests',
	#package : 'Chalten-Julian-Calendar-Tests'
}

{ #category : 'accessing' }
JulianMonthOfYearTest class >> classUnderTest [

	^MonthOfYear
]

{ #category : 'initialization' }
JulianMonthOfYearTest >> setUp [
	calendar := ChaltenEnvironment calendarNamed: #JulianCalendar.
	zeroMonths := 0 monthsMeasure.
	oneMonth := 1 monthMeasure.
	twoMonths := 2 monthsMeasure.
	elevenMonths := 11 monthsMeasure.
	twelveMonths := 12 monthsMeasure.
	thirteenMonths := 13 monthsMeasure.
	oneYear := 1 yearMeasure.
	twoYears := 2 yearsMeasure
]

{ #category : 'test comparing' }
JulianMonthOfYearTest >> testComparing [

	self assert: (JulianFebruary of: 2014) < (JulianJune of: 2014).
	self assert: (JulianMarch of: 2014) < (JulianFebruary of: 2015).
	self deny: (JulianApril of: 2014) < (JulianJuly of: 2013).

	self
		should: [ (JulianFebruary of: 2014) > JulianFebruary second ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: JulianFebruary second class
						 with: JulianFebruary second
						 with: (JulianFebruary of: 2014) class
						 with: (JulianFebruary of: 2014)) ].

	self
		should: [ (JulianFebruary of: 2014) < JulianMarch ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: (JulianFebruary of: 2014) class
						 with: (JulianFebruary of: 2014)
						 with: JulianMarch class
						 with: JulianMarch) ]
]

{ #category : 'test instance creation' }
JulianMonthOfYearTest >> testCreation [

	self
		assert:
		(MonthOfYear yearNumber: 2004 monthNumber: 1 calendar: calendar)
			year
		equals: 2004 asJulianYear.
	self
		assert:
			(MonthOfYear yearNumber: 2004 monthNumber: 1 calendar: calendar)
				monthNumber
		equals: 1.
	self
		assert: (MonthOfYear yearNumber: 2004 month: calendar january) year
		equals: 2004 asJulianYear.
	self
		assert:
		(MonthOfYear yearNumber: 2004 month: calendar january) monthNumber
		equals: 1.
	self
		assert: (MonthOfYear year: 2004 asJulianYear monthNumber: 1) year
		equals: 2004 asJulianYear.
	self
		assert:
		(MonthOfYear year: 2004 asJulianYear monthNumber: 1) monthNumber
		equals: 1.
	self
		assert: (MonthOfYear januaryOf: 2004 asJulianYear) year
		equals: 2004 asJulianYear.
	self
		assert: (MonthOfYear januaryOf: 2004 asJulianYear) monthNumber
		equals: 1.
	self
		assert: (MonthOfYear februaryOf: 2004 asJulianYear) year
		equals: 2004 asJulianYear.
	self
		assert: (MonthOfYear februaryOf: 2004 asJulianYear) monthNumber
		equals: 2.
	self
		assert: (MonthOfYear marchOf: 2004 asJulianYear) year
		equals: 2004 asJulianYear.
	self
		assert: (MonthOfYear marchOf: 2004 asJulianYear) monthNumber
		equals: 3.
	self
		assert: (MonthOfYear aprilOf: 2004 asJulianYear) year
		equals: 2004 asJulianYear.
	self
		assert: (MonthOfYear aprilOf: 2004 asJulianYear) monthNumber
		equals: 4.
	self
		assert: (MonthOfYear mayOf: 2004 asJulianYear) year
		equals: 2004 asJulianYear.
	self
		assert: (MonthOfYear mayOf: 2004 asJulianYear) monthNumber
		equals: 5.
	self
		assert: (MonthOfYear juneOf: 2004 asJulianYear) year
		equals: 2004 asJulianYear.
	self
		assert: (MonthOfYear juneOf: 2004 asJulianYear) monthNumber
		equals: 6.
	self
		assert: (MonthOfYear julyOf: 2004 asJulianYear) year
		equals: 2004 asJulianYear.
	self
		assert: (MonthOfYear julyOf: 2004 asJulianYear) monthNumber
		equals: 7.
	self
		assert: (MonthOfYear augustOf: 2004 asJulianYear) year
		equals: 2004 asJulianYear.
	self
		assert: (MonthOfYear augustOf: 2004 asJulianYear) monthNumber
		equals: 8.
	self
		assert: (MonthOfYear septemberOf: 2004 asJulianYear) year
		equals: 2004 asJulianYear.
	self
		assert: (MonthOfYear septemberOf: 2004 asJulianYear) monthNumber
		equals: 9.
	self
		assert: (MonthOfYear octoberOf: 2004 asJulianYear) year
		equals: 2004 asJulianYear.
	self
		assert: (MonthOfYear octoberOf: 2004 asJulianYear) monthNumber
		equals: 10.
	self
		assert: (MonthOfYear novemberOf: 2004 asJulianYear) year
		equals: 2004 asJulianYear.
	self
		assert: (MonthOfYear novemberOf: 2004 asJulianYear) monthNumber
		equals: 11.
	self
		assert: (MonthOfYear decemberOf: 2004 asJulianYear) year
		equals: 2004 asJulianYear.
	self
		assert: (MonthOfYear decemberOf: 2004 asJulianYear) monthNumber
		equals: 12
]

{ #category : 'test accessing' }
JulianMonthOfYearTest >> testDates [

	self
		assert: (MonthOfYear januaryOf: 2004 asJulianYear) dates first
		equals: JulianJanuary first , 2004.
	self
		assert: (MonthOfYear januaryOf: 2004 asJulianYear) dates last
		equals: JulianJanuary thirtyfirst , 2004
]

{ #category : 'test comparing' }
JulianMonthOfYearTest >> testEqual [

	self
		assert: (MonthOfYear januaryOf: 2004 asJulianYear)
		equals: JulianJanuary , 2004.
	self deny:
		(MonthOfYear januaryOf: 2004 asJulianYear) = (JulianJanuary , 2005)
]

{ #category : 'test accessing' }
JulianMonthOfYearTest >> testFirstDate [

	self
		assert: (MonthOfYear januaryOf: 2004 asJulianYear) firstDate
		equals: JulianJanuary first , 2004
]

{ #category : 'test accessing' }
JulianMonthOfYearTest >> testFirstDay [

	self
		assert: (MonthOfYear januaryOf: 2004 asJulianYear) firstDay
		equals: calendar wednesday
]

{ #category : 'test comparing' }
JulianMonthOfYearTest >> testHash [

	self
		assert: (MonthOfYear januaryOf: 2004 asJulianYear) hash
		equals: (JulianJanuary , 2004) hash.
	self deny: (MonthOfYear januaryOf: 2004 asJulianYear) hash
		= (JulianJanuary , 2005) hash
]

{ #category : 'test querying' }
JulianMonthOfYearTest >> testIncludesDate [

	self assert: ((MonthOfYear yearNumber: 2005 monthNumber: 1 calendar: calendar) includes: JulianJanuary first, 2005).
	self assert: ((MonthOfYear yearNumber: 2005 monthNumber: 1 calendar: calendar) includes: JulianJanuary thirtyfirst, 2005).

	self deny: ((MonthOfYear yearNumber: 2005 monthNumber: 1 calendar: calendar) includes: JulianFebruary first, 2005).
	self deny: ((MonthOfYear yearNumber: 2005 monthNumber: 1 calendar: calendar) includes: JulianDecember thirtyfirst, 2004)
]

{ #category : 'test querying' }
JulianMonthOfYearTest >> testIncludesDateTime [

	self assert: ((MonthOfYear yearNumber: 2005 monthNumber: 1 calendar: calendar) includes: (JulianJanuary first, 2005) atMidnight).
	self assert: ((MonthOfYear yearNumber: 2005 monthNumber: 1 calendar: calendar) includes: (JulianJanuary thirtyfirst, 2005) atLastTimeOfDay).

	self deny: ((MonthOfYear yearNumber: 2005 monthNumber: 1 calendar: calendar) includes: (JulianFebruary first, 2005) atMidnight).
	self deny: ((MonthOfYear yearNumber: 2005 monthNumber: 1 calendar: calendar) includes: (JulianDecember thirtyfirst, 2004) atLastTimeOfDay)
]

{ #category : 'test querying' }
JulianMonthOfYearTest >> testIncludesMonthOfYear [

	self
		should: [(MonthOfYear yearNumber: 2005 monthNumber: 1 calendar: calendar)
			includes: (MonthOfYear yearNumber: 2005 monthNumber: 1 calendar: calendar)]
		raise: Exception
]

{ #category : 'test querying' }
JulianMonthOfYearTest >> testIncludesYear [
	self
		should: [ (MonthOfYear yearNumber: 2005 monthNumber: 1 calendar: calendar) includes: 2005 asJulianYear ]
		raise: Exception
]

{ #category : 'test instance creation' }
JulianMonthOfYearTest >> testInvalidCreation [

	self
		should: [
		MonthOfYear yearNumber: 1 monthNumber: 13 calendar: calendar ]
		raise: InvalidMonthNumberException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals: '13 is an invalid number for a month' ].
	self
		should: [
		MonthOfYear yearNumber: 1 monthNumber: 0 calendar: calendar ]
		raise: InvalidMonthNumberException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals: '0 is an invalid number for a month' ]
]

{ #category : 'test accessing' }
JulianMonthOfYearTest >> testLastDate [

	self
		assert: (MonthOfYear januaryOf: 2004 asJulianYear) lastDate
		equals: JulianJanuary thirtyfirst , 2004.
	self
		assert: (MonthOfYear februaryOf: 2004 asJulianYear) lastDate
		equals: JulianFebruary twentyninth , 2004.
	self
		assert: (MonthOfYear februaryOf: 2005 asJulianYear) lastDate
		equals: JulianFebruary twentyeighth , 2005
]

{ #category : 'test accessing' }
JulianMonthOfYearTest >> testLastDay [

	self
		assert: (MonthOfYear januaryOf: 2004 asJulianYear) lastDay
		equals: calendar friday.
	self
		assert: (MonthOfYear februaryOf: 2004 asJulianYear) lastDay
		equals: calendar saturday.
	self
		assert: (MonthOfYear februaryOf: 2005 asJulianYear) lastDay
		equals: calendar sunday
]

{ #category : 'test accessing' }
JulianMonthOfYearTest >> testLastDayNumber [

	self
		assert: (MonthOfYear januaryOf: 2004 asJulianYear) lastDayNumber
		equals: (JulianJanuary , 2004) numberOfDays amount.
	self
		assert: (MonthOfYear februaryOf: 2004 asJulianYear) lastDayNumber
		equals: (JulianFebruary , 2004) numberOfDays amount.
	self
		assert: (MonthOfYear februaryOf: 2005 asJulianYear) lastDayNumber
		equals: (JulianFebruary , 2005) numberOfDays amount.
	self
		assert: (MonthOfYear marchOf: 2004 asJulianYear) lastDayNumber
		equals: (JulianMarch , 2004) numberOfDays amount.
	self
		assert: (MonthOfYear aprilOf: 2004 asJulianYear) lastDayNumber
		equals: (JulianApril , 2004) numberOfDays amount.
	self
		assert: (MonthOfYear mayOf: 2004 asJulianYear) lastDayNumber
		equals: (JulianMay , 2004) numberOfDays amount.
	self
		assert: (MonthOfYear juneOf: 2004 asJulianYear) lastDayNumber
		equals: (JulianJune , 2004) numberOfDays amount.
	self
		assert: (MonthOfYear julyOf: 2004 asJulianYear) lastDayNumber
		equals: (JulianJuly , 2004) numberOfDays amount.
	self
		assert: (MonthOfYear augustOf: 2004 asJulianYear) lastDayNumber
		equals: (JulianAugust , 2004) numberOfDays amount.
	self
		assert: (MonthOfYear septemberOf: 2004 asJulianYear) lastDayNumber
		equals: (JulianSeptember , 2004) numberOfDays amount.
	self
		assert: (MonthOfYear octoberOf: 2004 asJulianYear) lastDayNumber
		equals: (JulianOctober , 2004) numberOfDays amount.
	self
		assert: (MonthOfYear novemberOf: 2004 asJulianYear) lastDayNumber
		equals: (JulianNovember , 2004) numberOfDays amount.
	self
		assert: (MonthOfYear decemberOf: 2004 asJulianYear) lastDayNumber
		equals: (JulianDecember , 2004) numberOfDays amount
]

{ #category : 'test querying' }
JulianMonthOfYearTest >> testMonthsFrom [

	self
		assert: (JulianJanuary , 2004 distanceFrom: JulianDecember , 2003)
		equals: oneMonth.
	self
		assert: (JulianJanuary , 2004 distanceFrom: JulianDecember , 2004)
		equals: elevenMonths negated.
	self
		assert: (JulianJanuary , 2004 distanceFrom: JulianJanuary , 2004)
		equals: zeroMonths.
	self
		assert: (JulianJanuary , 2005 distanceFrom: JulianJanuary , 2004)
		equals: twelveMonths
]

{ #category : 'test querying' }
JulianMonthOfYearTest >> testMonthsTo [

	self
		assert: (JulianJanuary , 2004 distanceTo: JulianDecember , 2003)
		equals: oneMonth negated.
	self
		assert: (JulianJanuary , 2004 distanceTo: JulianDecember , 2004)
		equals: elevenMonths.
	self
		assert: (JulianJanuary , 2004 distanceTo: JulianJanuary , 2004)
		equals: zeroMonths.
	self
		assert: (JulianJanuary , 2004 distanceTo: JulianJanuary , 2005)
		equals: twelveMonths
]

{ #category : 'test accessing' }
JulianMonthOfYearTest >> testName [

	self
		assert: (MonthOfYear januaryOf: 2004 asJulianYear) name
		equals: 'January'.
	self
		assert: (MonthOfYear februaryOf: 2004 asJulianYear) name
		equals: 'February'.
	self
		assert: (MonthOfYear marchOf: 2004 asJulianYear) name
		equals: 'March'.
	self
		assert: (MonthOfYear aprilOf: 2004 asJulianYear) name
		equals: 'April'.
	self
		assert: (MonthOfYear mayOf: 2004 asJulianYear) name
		equals: 'May'.
	self
		assert: (MonthOfYear juneOf: 2004 asJulianYear) name
		equals: 'June'.
	self
		assert: (MonthOfYear julyOf: 2004 asJulianYear) name
		equals: 'July'.
	self
		assert: (MonthOfYear augustOf: 2004 asJulianYear) name
		equals: 'August'.
	self
		assert: (MonthOfYear septemberOf: 2004 asJulianYear) name
		equals: 'September'.
	self
		assert: (MonthOfYear octoberOf: 2004 asJulianYear) name
		equals: 'October'.
	self
		assert: (MonthOfYear novemberOf: 2004 asJulianYear) name
		equals: 'November'.
	self
		assert: (MonthOfYear decemberOf: 2004 asJulianYear) name
		equals: 'December'
]

{ #category : 'test querying' }
JulianMonthOfYearTest >> testNext [

	self
		assert: (MonthOfYear januaryOf: 2004 asJulianYear) next
		equals: JulianFebruary , 2004.
	self
		assert: (MonthOfYear decemberOf: 2004 asJulianYear) next
		equals: JulianJanuary , 2005
]

{ #category : 'test querying' }
JulianMonthOfYearTest >> testNextANumberOfMonths [

	self
		assert: (JulianJanuary , 2004 next: oneMonth)
		equals: JulianFebruary , 2004.
	self
		assert: (JulianJanuary , 2004 next: elevenMonths)
		equals: JulianDecember , 2004.
	self
		assert: (JulianJanuary , 2004 next: twelveMonths)
		equals: JulianJanuary , 2005.
	self
		assert: (JulianJanuary , 2004 next: thirteenMonths)
		equals: JulianFebruary , 2005.
	self
		assert: (JulianJanuary , 2004 next: zeroMonths)
		equals: JulianJanuary , 2004.
	self
		assert: (JulianJanuary , 2004 next: oneYear)
		equals: JulianJanuary , 2005.
	self
		assert: (JulianApril , 2004 next: oneYear)
		equals: JulianApril , 2005.
	self
		assert: (JulianJanuary , 2004 next: 0.5 monthsMeasure)
		equals: JulianJanuary , 2004.
	self
		assert: (JulianJanuary , 2004 next: 1.5 monthsMeasure)
		equals: JulianFebruary , 2004
]

{ #category : 'test querying' }
JulianMonthOfYearTest >> testNextMonth [

	| monthOfYear |
	monthOfYear := JulianJanuary , 2004.
	self
		assert: (monthOfYear nextMonth: calendar january)
		equals: JulianJanuary , 2005.
	self
		assert: (monthOfYear nextMonth: calendar january in: twoYears)
		equals: JulianJanuary , 2006.
	self
		assert: (monthOfYear nextMonth: calendar february)
		equals: JulianFebruary , 2004.
	self
		assert: (monthOfYear nextMonth: calendar february in: twoYears)
		equals: JulianFebruary , 2006.

	monthOfYear := JulianJuly , 2004.
	self
		assert: (monthOfYear nextMonth: calendar january)
		equals: JulianJanuary , 2005.
	self
		assert: (monthOfYear nextMonth: calendar january in: twoYears)
		equals: JulianJanuary , 2006.

	monthOfYear := JulianJanuary , -1.
	self
		assert: (monthOfYear nextMonth: calendar january)
		equals: JulianJanuary , 1.
	self
		assert: (monthOfYear nextMonth: calendar december)
		equals: JulianDecember , -1
]

{ #category : 'test accessing' }
JulianMonthOfYearTest >> testNumberOfDays [

	self
		assert: (MonthOfYear januaryOf: 2004 asJulianYear) numberOfDays
		equals: 31 daysMeasure.
	self
		assert: (MonthOfYear februaryOf: 2004 asJulianYear) numberOfDays
		equals: 29 daysMeasure.
	self
		assert: (MonthOfYear februaryOf: 2005 asJulianYear) numberOfDays
		equals: 28 daysMeasure.
	self
		assert: (MonthOfYear marchOf: 2004 asJulianYear) numberOfDays
		equals: 31 daysMeasure.
	self
		assert: (MonthOfYear aprilOf: 2004 asJulianYear) numberOfDays
		equals: 30 daysMeasure.
	self
		assert: (MonthOfYear mayOf: 2004 asJulianYear) numberOfDays
		equals: 31 daysMeasure.
	self
		assert: (MonthOfYear juneOf: 2004 asJulianYear) numberOfDays
		equals: 30 daysMeasure.
	self
		assert: (MonthOfYear julyOf: 2004 asJulianYear) numberOfDays
		equals: 31 daysMeasure.
	self
		assert: (MonthOfYear augustOf: 2004 asJulianYear) numberOfDays
		equals: 31 daysMeasure.
	self
		assert: (MonthOfYear septemberOf: 2004 asJulianYear) numberOfDays
		equals: 30 daysMeasure.
	self
		assert: (MonthOfYear octoberOf: 2004 asJulianYear) numberOfDays
		equals: 31 daysMeasure.
	self
		assert: (MonthOfYear novemberOf: 2004 asJulianYear) numberOfDays
		equals: 30 daysMeasure.
	self
		assert: (MonthOfYear decemberOf: 2004 asJulianYear) numberOfDays
		equals: 31 daysMeasure
]

{ #category : 'test accessing' }
JulianMonthOfYearTest >> testNumberOfDaysFromEpoch [

	self
		assert:
		(MonthOfYear januaryOf: 1 asJulianYear) numberOfDaysFromEpoch
		equals: -2 daysMeasure.
	self
		assert:
		(MonthOfYear januaryOf: 2 asJulianYear) numberOfDaysFromEpoch
		equals: 363 daysMeasure.
	self
		assert:
		(MonthOfYear januaryOf: 2004 asJulianYear) numberOfDaysFromEpoch
		equals: 731593 daysMeasure
]

{ #category : 'test accessing' }
JulianMonthOfYearTest >> testOrdinalDay [
	"To obtain a certain day of the month, for example the second Wednesday."

	| monthOfYear |
	monthOfYear := MonthOfYear januaryOf: 2004 asJulianYear.
	self
		assert: (monthOfYear ordinal: 2 day: calendar wednesday)
		equals: JulianJanuary eighth , 2004
]

{ #category : 'test querying' }
JulianMonthOfYearTest >> testPrevious [

	self
		assert: (JulianJanuary , 2004) previous
		equals: JulianDecember , 2003.
	self
		assert: (JulianDecember , 2004) previous
		equals: JulianNovember , 2004
]

{ #category : 'test querying' }
JulianMonthOfYearTest >> testPreviousANumberOfMonths [

	self
		assert: (JulianJanuary , 2004 previous: oneMonth)
		equals: JulianDecember , 2003.
	self
		assert: (JulianJanuary , 2004 previous: elevenMonths)
		equals: JulianFebruary , 2003.
	self
		assert: (JulianJanuary , 2004 previous: twelveMonths)
		equals: JulianJanuary , 2003.
	self
		assert: (JulianFebruary , 2004 previous: thirteenMonths)
		equals: JulianJanuary , 2003.
	self
		assert: (JulianJanuary , 2004 previous: thirteenMonths)
		equals: JulianDecember , 2002.
	self
		assert: (JulianJanuary , 2004 previous: zeroMonths)
		equals: JulianJanuary , 2004.
	self
		assert: (JulianJanuary , 2004 previous: oneYear)
		equals: JulianJanuary , 2003.
	self
		assert: (JulianApril , 2004 previous: oneYear)
		equals: JulianApril , 2003.
	self
		assert: (JulianJuly , 2004 previous: oneMonth)
		equals: JulianJune , 2004.
	self
		assert: (JulianJuly , 2004 previous: elevenMonths)
		equals: JulianAugust , 2003.
	self
		assert: (JulianJuly , 2004 previous: twelveMonths)
		equals: JulianJuly , 2003
]

{ #category : 'test querying' }
JulianMonthOfYearTest >> testPreviousMonth [

	| month |
	month := JulianJanuary , 2004.
	self
		assert: (month previousMonth: calendar january)
		equals: JulianJanuary , 2003.
	self
		assert: (month previousMonth: calendar january in: twoYears)
		equals: JulianJanuary , 2002.

	month := JulianApril , 2004.
	self
		assert: (month previousMonth: calendar february)
		equals: JulianFebruary , 2004.
	self
		assert: (month previousMonth: calendar february in: twoYears)
		equals: JulianFebruary , 2002.

	month := JulianJuly , 2004.
	self
		assert: (month previousMonth: calendar january)
		equals: JulianJanuary , 2004.
	self
		assert: (month previousMonth: calendar january in: twoYears)
		equals: JulianJanuary , 2002.

	month := JulianJanuary , 1.
	self
		assert: (month previousMonth: calendar january)
		equals: JulianJanuary , -1.
	self
		assert: (month previousMonth: calendar december)
		equals: JulianDecember , -1
]

{ #category : 'test printing' }
JulianMonthOfYearTest >> testPrintString [

	self
		assert: (JulianJanuary , 2004) printString
		equals: 'January of Year 2004'
]

{ #category : 'test interval protocol' }
JulianMonthOfYearTest >> testTo [

	| interval |
	interval := JulianJanuary , 2004 to: JulianFebruary , 2004.
	self assert: interval from equals: JulianJanuary , 2004.
	self assert: interval to equals: JulianFebruary , 2004.
	self assert: interval by equals: oneMonth
]

{ #category : 'test interval protocol' }
JulianMonthOfYearTest >> testToBy [

	| interval |
	interval := JulianJanuary , 2004 to: JulianMarch , 2004 by: twoMonths.
	self assert: interval from equals: JulianJanuary , 2004.
	self assert: interval to equals: JulianMarch , 2004.
	self assert: interval by equals: twoMonths
]

{ #category : 'test interval protocol' }
JulianMonthOfYearTest >> testToByDo [

	| number |
	number := 1.
	(JulianJanuary , 2004 to: JulianDecember , 2004 by: twoMonths) do: [
		:month |
		self assert: month monthNumber equals: number.
		number := number + 2 ].
	self assert: number equals: 13
]

{ #category : 'test interval protocol' }
JulianMonthOfYearTest >> testToByYearsDo [

	| yearNumber |
	yearNumber := 2004.
	(JulianJanuary , 2004 to: JulianDecember , 2010 by: twelveMonths)
		do: [ :month |
			self assert: month monthNumber equals: 1.
			self assert: month year number equals: yearNumber.
			yearNumber := yearNumber + 1 ].
	self assert: yearNumber equals: 2011
]

{ #category : 'test interval protocol' }
JulianMonthOfYearTest >> testToNegativeBy [

	| interval number |
	interval := (MonthOfYear
		             yearNumber: 2004
		             monthNumber: 12
		             calendar: calendar) to:
	            (MonthOfYear
		             yearNumber: 2004
		             monthNumber: 01
		             calendar: calendar) by: -2 monthsMeasure.
	number := 12.
	interval do: [ :monthOfYear |
		self assert: monthOfYear monthNumber equals: number.
		number := number - 2 ].
	self assert: number equals: 0
]

{ #category : 'test interval protocol' }
JulianMonthOfYearTest >> testToReverse [

	| coll number |
	coll := ((MonthOfYear
		          yearNumber: 2004
		          monthNumber: 01
		          calendar: calendar) to:
	         (MonthOfYear
		          yearNumber: 2004
		          monthNumber: 12
		          calendar: calendar) by: 2 monthsMeasure) reverse.
	number := 11.
	coll do: [ :monthOfYear |
		self assert: monthOfYear monthNumber equals: number.
		number := number - 2 ].
	self assert: number equals: -1
]
