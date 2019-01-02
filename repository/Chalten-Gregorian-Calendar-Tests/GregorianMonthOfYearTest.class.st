Class {
	#name : #GregorianMonthOfYearTest,
	#superclass : #TestCase,
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
	#category : #'Chalten-Gregorian-Calendar-Tests'
}

{ #category : #accessing }
GregorianMonthOfYearTest class >> classUnderTest [

	^MonthOfYear
]

{ #category : #initialization }
GregorianMonthOfYearTest >> setUp [
	calendar := GregorianCalendar.
	zeroMonths := 0 monthsMeasure.
	oneMonth := 1 monthMeasure.
	twoMonths := 2 monthsMeasure.
	elevenMonths := 11 monthsMeasure.
	twelveMonths := 12 monthsMeasure.
	thirteenMonths := 13 monthsMeasure.
	oneYear := 1 yearMeasure.
	twoYears := 2 yearsMeasure
]

{ #category : #'test comparing' }
GregorianMonthOfYearTest >> testComparing [

	self assert: (February of: 2014) < (June of: 2014).
	self assert: (March of: 2014) < (February of: 2015).
	self deny: (April of: 2014) < (July of: 2013).
	
	self should: [ (February of: 2014) > February second ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: February second class
				with: February second
				with: (February of: 2014) class
				with: (February of: 2014)) ].
	
	self should: [ (February of: 2014) < March ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: (February of: 2014) class
				with: (February of: 2014)
				with: March class
				with: March) ]
]

{ #category : #'test instance creation' }
GregorianMonthOfYearTest >> testCreation [
	self assert: (MonthOfYear yearNumber: 2004 monthNumber: 1 calendar: calendar) year = 2004 asGregorianYear.
	self assert: (MonthOfYear yearNumber: 2004 monthNumber: 1 calendar: calendar) monthNumber = 1.
	self assert: (MonthOfYear yearNumber: 2004 month: calendar january) year = 2004 asGregorianYear.
	self assert: (MonthOfYear yearNumber: 2004 month: calendar january) monthNumber = 1.
	self assert: (MonthOfYear year: 2004 asGregorianYear monthNumber: 1) year = 2004 asGregorianYear.
	self assert: (MonthOfYear year: 2004 asGregorianYear monthNumber: 1) monthNumber = 1.
	self assert: (MonthOfYear januaryOf: 2004 asGregorianYear) year = 2004 asGregorianYear.
	self assert: (MonthOfYear januaryOf: 2004 asGregorianYear) monthNumber = 1.
	self assert: (MonthOfYear februaryOf: 2004 asGregorianYear) year = 2004 asGregorianYear.
	self assert: (MonthOfYear februaryOf: 2004 asGregorianYear) monthNumber = 2.
	self assert: (MonthOfYear marchOf: 2004 asGregorianYear) year = 2004 asGregorianYear.
	self assert: (MonthOfYear marchOf: 2004 asGregorianYear) monthNumber = 3.
	self assert: (MonthOfYear aprilOf: 2004 asGregorianYear) year = 2004 asGregorianYear.
	self assert: (MonthOfYear aprilOf: 2004 asGregorianYear) monthNumber = 4.
	self assert: (MonthOfYear mayOf: 2004 asGregorianYear) year = 2004 asGregorianYear.
	self assert: (MonthOfYear mayOf: 2004 asGregorianYear) monthNumber = 5.
	self assert: (MonthOfYear juneOf: 2004 asGregorianYear) year = 2004 asGregorianYear.
	self assert: (MonthOfYear juneOf: 2004 asGregorianYear) monthNumber = 6.
	self assert: (MonthOfYear julyOf: 2004 asGregorianYear) year = 2004 asGregorianYear.
	self assert: (MonthOfYear julyOf: 2004 asGregorianYear) monthNumber = 7.
	self assert: (MonthOfYear augustOf: 2004 asGregorianYear) year = 2004 asGregorianYear.
	self assert: (MonthOfYear augustOf: 2004 asGregorianYear) monthNumber = 8.
	self assert: (MonthOfYear septemberOf: 2004 asGregorianYear) year = 2004 asGregorianYear.
	self assert: (MonthOfYear septemberOf: 2004 asGregorianYear) monthNumber = 9.
	self assert: (MonthOfYear octoberOf: 2004 asGregorianYear) year = 2004 asGregorianYear.
	self assert: (MonthOfYear octoberOf: 2004 asGregorianYear) monthNumber = 10.
	self assert: (MonthOfYear novemberOf: 2004 asGregorianYear) year = 2004 asGregorianYear.
	self assert: (MonthOfYear novemberOf: 2004 asGregorianYear) monthNumber = 11.
	self assert: (MonthOfYear decemberOf: 2004 asGregorianYear) year = 2004 asGregorianYear.
	self assert: (MonthOfYear decemberOf: 2004 asGregorianYear) monthNumber = 12
]

{ #category : #'test accessing' }
GregorianMonthOfYearTest >> testDates [
	self assert: (MonthOfYear januaryOf: 2004 asGregorianYear) dates first = (January first , 2004).
	self assert: (MonthOfYear januaryOf: 2004 asGregorianYear) dates last = (January thirtyfirst , 2004)
]

{ #category : #'test comparing' }
GregorianMonthOfYearTest >> testEqual [
	self assert: (MonthOfYear januaryOf: 2004 asGregorianYear) = (January , 2004).
	self deny: (MonthOfYear januaryOf: 2004 asGregorianYear) = (January , 2005)
]

{ #category : #'test accessing' }
GregorianMonthOfYearTest >> testFirstDate [
	self assert: (MonthOfYear januaryOf: 2004 asGregorianYear) firstDate = (January first , 2004)
]

{ #category : #'test accessing' }
GregorianMonthOfYearTest >> testFirstDay [
	self assert: (MonthOfYear januaryOf: 2004 asGregorianYear) firstDay = calendar thursday
]

{ #category : #'test comparing' }
GregorianMonthOfYearTest >> testHash [
	self assert: (MonthOfYear januaryOf: 2004 asGregorianYear) hash = (January , 2004) hash.
	self deny: (MonthOfYear januaryOf: 2004 asGregorianYear) hash = (January , 2005) hash
]

{ #category : #'test querying' }
GregorianMonthOfYearTest >> testIncludesDate [

	self assert: ((MonthOfYear yearNumber: 2005 monthNumber: 1 calendar: calendar) includes: January first, 2005).
	self assert: ((MonthOfYear yearNumber: 2005 monthNumber: 1 calendar: calendar) includes: January thirtyfirst, 2005).

	self deny: ((MonthOfYear yearNumber: 2005 monthNumber: 1 calendar: calendar) includes: February first, 2005).
	self deny: ((MonthOfYear yearNumber: 2005 monthNumber: 1 calendar: calendar) includes: December thirtyfirst, 2004)
]

{ #category : #'test querying' }
GregorianMonthOfYearTest >> testIncludesDateTime [

	self assert: ((MonthOfYear yearNumber: 2005 monthNumber: 1 calendar: calendar) includes: (January first, 2005) atMidnight).
	self assert: ((MonthOfYear yearNumber: 2005 monthNumber: 1 calendar: calendar) includes: (January thirtyfirst, 2005) atLastTimeOfDay).

	self deny: ((MonthOfYear yearNumber: 2005 monthNumber: 1 calendar: calendar) includes: (February first, 2005) atMidnight).
	self deny: ((MonthOfYear yearNumber: 2005 monthNumber: 1 calendar: calendar) includes: (December thirtyfirst, 2004) atLastTimeOfDay)
]

{ #category : #'test querying' }
GregorianMonthOfYearTest >> testIncludesMonthOfYear [

	self
		should: [(MonthOfYear yearNumber: 2005 monthNumber: 1 calendar: calendar)
			includes: (MonthOfYear yearNumber: 2005 monthNumber: 1 calendar: calendar)]
		raise: Exception
]

{ #category : #'test querying' }
GregorianMonthOfYearTest >> testIncludesYear [
	self
		should: [ (MonthOfYear yearNumber: 2005 monthNumber: 1 calendar: calendar) includes: 2005 asGregorianYear ]
		raise: Exception
]

{ #category : #'test instance creation' }
GregorianMonthOfYearTest >> testInvalidCreation [

	self 
		should: [MonthOfYear yearNumber: 1 monthNumber: 13 calendar: calendar]
		raise: InvalidMonthNumberException
		withExceptionDo: [:anException | 
			self assert: anException description = '13 is an invalid number for a month'].
	self 
		should: [MonthOfYear yearNumber: 1 monthNumber: 0 calendar: calendar]
		raise: InvalidMonthNumberException
		withExceptionDo: [:anException | 
			self assert: anException description = '0 is an invalid number for a month']
]

{ #category : #'test testing' }
GregorianMonthOfYearTest >> testIs [

	self assert: (January, 2014 is: January).
	self deny: (May, 2014 is: April)
]

{ #category : #'test accessing' }
GregorianMonthOfYearTest >> testLastDate [
	self assert: (MonthOfYear januaryOf: 2004 asGregorianYear) lastDate = (January thirtyfirst , 2004).
	self assert: (MonthOfYear februaryOf: 2004 asGregorianYear) lastDate = (February twentyninth , 2004).
	self assert: (MonthOfYear februaryOf: 2005 asGregorianYear) lastDate = (February twentyeighth , 2005)
]

{ #category : #'test accessing' }
GregorianMonthOfYearTest >> testLastDay [
	self assert: (MonthOfYear januaryOf: 2004 asGregorianYear) lastDay = calendar saturday.
	self assert: (MonthOfYear februaryOf: 2004 asGregorianYear) lastDay = calendar sunday.
	self assert: (MonthOfYear februaryOf: 2005 asGregorianYear) lastDay = calendar monday
]

{ #category : #'test accessing' }
GregorianMonthOfYearTest >> testLastDayNumber [
	self assert: (MonthOfYear januaryOf: 2004 asGregorianYear) lastDayNumber = (January , 2004) numberOfDays amount.
	self assert: (MonthOfYear februaryOf: 2004 asGregorianYear) lastDayNumber = (February , 2004) numberOfDays amount.
	self assert: (MonthOfYear februaryOf: 2005 asGregorianYear) lastDayNumber = (February , 2005) numberOfDays amount.
	self assert: (MonthOfYear marchOf: 2004 asGregorianYear) lastDayNumber = (March , 2004) numberOfDays amount.
	self assert: (MonthOfYear aprilOf: 2004 asGregorianYear) lastDayNumber = (April , 2004) numberOfDays amount.
	self assert: (MonthOfYear mayOf: 2004 asGregorianYear) lastDayNumber = (May , 2004) numberOfDays amount.
	self assert: (MonthOfYear juneOf: 2004 asGregorianYear) lastDayNumber = (June , 2004) numberOfDays amount.
	self assert: (MonthOfYear julyOf: 2004 asGregorianYear) lastDayNumber = (July , 2004) numberOfDays amount.
	self assert: (MonthOfYear augustOf: 2004 asGregorianYear) lastDayNumber = (August , 2004) numberOfDays amount.
	self assert: (MonthOfYear septemberOf: 2004 asGregorianYear) lastDayNumber = (September , 2004) numberOfDays amount.
	self assert: (MonthOfYear octoberOf: 2004 asGregorianYear) lastDayNumber = (October , 2004) numberOfDays amount.
	self assert: (MonthOfYear novemberOf: 2004 asGregorianYear) lastDayNumber = (November , 2004) numberOfDays amount.
	self assert: (MonthOfYear decemberOf: 2004 asGregorianYear) lastDayNumber = (December , 2004) numberOfDays amount
]

{ #category : #'test querying' }
GregorianMonthOfYearTest >> testMonthsFrom [

	self assert: (January, 2004 distanceFrom: December, 2003) = oneMonth.
	self assert: (January, 2004 distanceFrom: December, 2004) = elevenMonths negated.
	self assert: (January, 2004 distanceFrom: January, 2004) = zeroMonths.
	self assert: (January, 2005 distanceFrom: January, 2004) = twelveMonths
]

{ #category : #'test querying' }
GregorianMonthOfYearTest >> testMonthsTo [

	self assert: (January, 2004 distanceTo: December, 2003) = oneMonth negated.
	self assert: (January, 2004 distanceTo: December, 2004) = elevenMonths.
	self assert: (January, 2004 distanceTo: January, 2004) = zeroMonths.
	self assert: (January, 2004 distanceTo: January, 2005) = twelveMonths
]

{ #category : #'test accessing' }
GregorianMonthOfYearTest >> testName [
	self assert: (MonthOfYear januaryOf: 2004 asGregorianYear) name = 'January'.
	self assert: (MonthOfYear februaryOf: 2004 asGregorianYear) name = 'February'.
	self assert: (MonthOfYear marchOf: 2004 asGregorianYear) name = 'March'.
	self assert: (MonthOfYear aprilOf: 2004 asGregorianYear) name = 'April'.
	self assert: (MonthOfYear mayOf: 2004 asGregorianYear) name = 'May'.
	self assert: (MonthOfYear juneOf: 2004 asGregorianYear) name = 'June'.
	self assert: (MonthOfYear julyOf: 2004 asGregorianYear) name = 'July'.
	self assert: (MonthOfYear augustOf: 2004 asGregorianYear) name = 'August'.
	self assert: (MonthOfYear septemberOf: 2004 asGregorianYear) name = 'September'.
	self assert: (MonthOfYear octoberOf: 2004 asGregorianYear) name = 'October'.
	self assert: (MonthOfYear novemberOf: 2004 asGregorianYear) name = 'November'.
	self assert: (MonthOfYear decemberOf: 2004 asGregorianYear) name = 'December'
]

{ #category : #'test querying' }
GregorianMonthOfYearTest >> testNext [
	self assert: (MonthOfYear januaryOf: 2004 asGregorianYear) next = (February , 2004).
	self assert: (MonthOfYear decemberOf: 2004 asGregorianYear) next = (January , 2005)
]

{ #category : #'test querying' }
GregorianMonthOfYearTest >> testNextANumberOfMonths [
	self assert: (January , 2004 next: oneMonth) = (February , 2004).
	self assert: (January , 2004 next: elevenMonths) = (December , 2004).
	self assert: (January , 2004 next: twelveMonths) = (January , 2005).
	self assert: (January , 2004 next: thirteenMonths) = (February , 2005).
	self assert: (January , 2004 next: zeroMonths) = (January , 2004).
	self assert: (January , 2004 next: oneYear) = (January , 2005).
	self assert: (April , 2004 next: oneYear) = (April , 2005).
	self assert: (January , 2004 next: 0.5 monthsMeasure) = (January , 2004).
	self assert: (January , 2004 next: 1.5 monthsMeasure) = (February , 2004)
]

{ #category : #'test querying' }
GregorianMonthOfYearTest >> testNextMonth [

	| monthOfYear |

	monthOfYear := January, 2004.
	self assert: (monthOfYear nextMonth: calendar january) = (January, 2005).
	self assert: (monthOfYear nextMonth: calendar january in: twoYears) = (January, 2006).
	self assert: (monthOfYear nextMonth: calendar february) = (February, 2004).
	self assert: (monthOfYear nextMonth: calendar february in: twoYears) = (February, 2006).

	monthOfYear := July, 2004.
	self assert: (monthOfYear nextMonth: calendar january) = (January, 2005).
	self assert: (monthOfYear nextMonth: calendar january in: twoYears) = (January, 2006).

	monthOfYear := January, -1.
	self assert: (monthOfYear nextMonth: calendar january) = (January, 0).
	self assert: (monthOfYear nextMonth: calendar december) = (December, -1)
]

{ #category : #'test accessing' }
GregorianMonthOfYearTest >> testNumberOfDays [
	self assert: (MonthOfYear januaryOf: 2004 asGregorianYear) numberOfDays = 31 daysMeasure.
	self assert: (MonthOfYear februaryOf: 2004 asGregorianYear) numberOfDays = 29 daysMeasure.
	self assert: (MonthOfYear februaryOf: 2005 asGregorianYear) numberOfDays = 28 daysMeasure.
	self assert: (MonthOfYear marchOf: 2004 asGregorianYear) numberOfDays = 31 daysMeasure.
	self assert: (MonthOfYear aprilOf: 2004 asGregorianYear) numberOfDays = 30 daysMeasure.
	self assert: (MonthOfYear mayOf: 2004 asGregorianYear) numberOfDays = 31 daysMeasure.
	self assert: (MonthOfYear juneOf: 2004 asGregorianYear) numberOfDays = 30 daysMeasure.
	self assert: (MonthOfYear julyOf: 2004 asGregorianYear) numberOfDays = 31 daysMeasure.
	self assert: (MonthOfYear augustOf: 2004 asGregorianYear) numberOfDays = 31 daysMeasure.
	self assert: (MonthOfYear septemberOf: 2004 asGregorianYear) numberOfDays = 30 daysMeasure.
	self assert: (MonthOfYear octoberOf: 2004 asGregorianYear) numberOfDays = 31 daysMeasure.
	self assert: (MonthOfYear novemberOf: 2004 asGregorianYear) numberOfDays = 30 daysMeasure.
	self assert: (MonthOfYear decemberOf: 2004 asGregorianYear) numberOfDays = 31 daysMeasure
]

{ #category : #'test accessing' }
GregorianMonthOfYearTest >> testNumberOfDaysFromEpoch [
	self assert: (MonthOfYear januaryOf: 1 asGregorianYear) numberOfDaysFromEpoch = 0 daysMeasure.
	self assert: (MonthOfYear januaryOf: 2 asGregorianYear) numberOfDaysFromEpoch = 365 daysMeasure.
	self assert: (MonthOfYear januaryOf: 2004 asGregorianYear) numberOfDaysFromEpoch = 731580 daysMeasure
]

{ #category : #'test accessing' }
GregorianMonthOfYearTest >> testOrdinalDay [
	"To obtain a certain day of the month, for example the second Wednesday."

	| monthOfYear |
	monthOfYear := MonthOfYear januaryOf: 2004 asGregorianYear.
	self assert: (monthOfYear ordinal: 2 day: calendar wednesday) = (January fourteenth , 2004)
]

{ #category : #'test querying' }
GregorianMonthOfYearTest >> testPrevious [

	self assert: (January, 2004) previous = (December, 2003).
	self assert: (December, 2004) previous = (November, 2004)
]

{ #category : #'test querying' }
GregorianMonthOfYearTest >> testPreviousANumberOfMonths [

	self assert: (January, 2004 previous: oneMonth) = (December, 2003).
	self assert: (January, 2004 previous: elevenMonths) = (February, 2003).
	self assert: (January, 2004 previous: twelveMonths) = (January, 2003).
	self assert: (February, 2004 previous: thirteenMonths) = (January, 2003).
	self assert: (January, 2004 previous: thirteenMonths) = (December, 2002).
	self assert: (January, 2004 previous: zeroMonths) = (January, 2004).
	self assert: (January, 2004 previous: oneYear) = (January, 2003).
	self assert: (April, 2004 previous: oneYear) = (April, 2003).
	self assert: (July, 2004 previous: oneMonth) = (June, 2004).
	self assert: (July, 2004 previous: elevenMonths) = (August, 2003).
	self assert: (July, 2004 previous: twelveMonths) = (July, 2003)
]

{ #category : #'test querying' }
GregorianMonthOfYearTest >> testPreviousMonth [

	| month |

	month := January, 2004.
	self assert: (month previousMonth: calendar january) = (January, 2003).
	self assert: (month previousMonth: calendar january in: twoYears) = (January, 2002).

	month := April, 2004.
	self assert: (month previousMonth: calendar february) = (February, 2004).
	self assert: (month previousMonth: calendar february in: twoYears) = (February, 2002).

	month := July, 2004.
	self assert: (month previousMonth: calendar january) = (January, 2004).
	self assert: (month previousMonth: calendar january in: twoYears) = (January, 2002).

	month := January, 1.
	self assert: (month previousMonth: calendar january) = (January, 0).
	self assert: (month previousMonth: calendar december) = (December, 0)
]

{ #category : #'test printing' }
GregorianMonthOfYearTest >> testPrintString [

	self assert: (January, 2004) printString = 'January of Year 2004'
]

{ #category : #'test interval protocol' }
GregorianMonthOfYearTest >> testTo [

	| interval |

	interval := (January, 2004 to: February, 2004).
	self assert: interval from = (January, 2004).
	self assert: interval to = (February, 2004).
	self assert: interval by = oneMonth
]

{ #category : #'test interval protocol' }
GregorianMonthOfYearTest >> testToBy [

	| interval |

	interval := January, 2004 to: March, 2004 by: twoMonths.
	self assert: interval from = (January, 2004).
	self assert: interval to = (March, 2004).
	self assert: interval by = twoMonths
]

{ #category : #'test interval protocol' }
GregorianMonthOfYearTest >> testToByDo [

	| number |

	number := 1.
	(January, 2004 to: December, 2004 by: twoMonths) do: [:month |
		self assert: month monthNumber = number.
		number := number + 2].
	self assert: number = 13
]

{ #category : #'test interval protocol' }
GregorianMonthOfYearTest >> testToByYearsDo [

	| yearNumber |

	yearNumber := 2004.
	(January, 2004 to: December, 2010 by: twelveMonths) do: [:month |
		self assert: month monthNumber = 1.
		self assert: month year number = yearNumber.
		yearNumber := yearNumber + 1].
	self assert: yearNumber = 2011
]

{ #category : #'test interval protocol' }
GregorianMonthOfYearTest >> testToNegativeBy [
	| interval number |
	interval := (MonthOfYear yearNumber: 2004 monthNumber: 12 calendar: calendar) to:
		(MonthOfYear yearNumber: 2004 monthNumber: 01 calendar: calendar) by: -2 monthsMeasure.
	number := 12.
	interval
		do: [ :monthOfYear | 
			self assert: monthOfYear monthNumber = number.
			number := number - 2 ].
	self assert: number = 0
]

{ #category : #'test interval protocol' }
GregorianMonthOfYearTest >> testToReverse [
	| coll number |
	coll := ((MonthOfYear yearNumber: 2004 monthNumber: 01 calendar: calendar) to:
		(MonthOfYear yearNumber: 2004 monthNumber: 12 calendar: calendar) by: 2 monthsMeasure) reverse.
	number := 11.
	coll
		do: [ :monthOfYear | 
			self assert: monthOfYear monthNumber = number.
			number := number - 2 ].
	self assert: number = -1
]
