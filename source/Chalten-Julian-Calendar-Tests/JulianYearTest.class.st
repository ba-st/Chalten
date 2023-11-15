Class {
	#name : 'JulianYearTest',
	#superclass : 'TestCase',
	#instVars : [
		'calendar',
		'zeroYears',
		'oneYear',
		'twoYears',
		'tenYears',
		'sixMonths',
		'thirteenMonths',
		'twentyNineDays',
		'twentyEightDays'
	],
	#category : 'Chalten-Julian-Calendar-Tests',
	#package : 'Chalten-Julian-Calendar-Tests'
}

{ #category : 'accessing' }
JulianYearTest class >> classUnderTest [

	^ChaltenYear
]

{ #category : 'initialization' }
JulianYearTest >> setUp [
	calendar := ChaltenEnvironment calendarNamed: #JulianCalendar.
	zeroYears := 0 yearsMeasure.
	oneYear := 1 yearMeasure.
	twoYears := 2 yearsMeasure.
	tenYears := 10 yearsMeasure.
	sixMonths := 6 monthsMeasure.
	thirteenMonths := 13 monthsMeasure.
	twentyEightDays := 28 daysMeasure.
	twentyNineDays := 29 daysMeasure
]

{ #category : 'test accessing' }
JulianYearTest >> testDates [

	self
		assert: 2007 asJulianYear dates first
		equals: JulianJanuary first , 2007.
	self
		assert: 2007 asJulianYear dates last
		equals: JulianDecember thirtyfirst , 2007.
	self
		assert: 2003 asJulianYear dates first
		equals: JulianJanuary first , 2003.
	self
		assert: 2003 asJulianYear dates last
		equals: JulianDecember thirtyfirst , 2003
]

{ #category : 'test interval protocol' }
JulianYearTest >> testDistanceTo [

	| absoluteDistance |
	absoluteDistance := 2007 asJulianYear absoluteDistanceTo:
		                    2010 asJulianYear.
	self assert: absoluteDistance equals: 3 yearsMeasure
]

{ #category : 'test comparing' }
JulianYearTest >> testEqual [

	self assert: 2007 asJulianYear equals: 2007 asJulianYear.
	self deny: 2007 asJulianYear = 2008 asJulianYear
]

{ #category : 'test accessing' }
JulianYearTest >> testFirstDate [

	self
		assert: 2008 asJulianYear firstDate
		equals: JulianJanuary first , 2008.
	self
		assert: 2007 asJulianYear firstDate
		equals: JulianJanuary first , 2007
]

{ #category : 'test accessing' }
JulianYearTest >> testFirstDay [

	self
		assert: 2008 asJulianYear firstDay
		equals: (JulianJanuary first , 2008) day.
	self
		assert: 2007 asJulianYear firstDay
		equals: (JulianJanuary first , 2007) day
]

{ #category : 'test accessing' }
JulianYearTest >> testFirstMonth [

	self
		assert: 2008 asJulianYear firstMonth
		equals: JulianJanuary , 2008.
	self
		assert: 2007 asJulianYear firstMonth
		equals: JulianJanuary , 2007
]

{ #category : 'test comparing' }
JulianYearTest >> testGreaterThan [

	self assert: 2008 asJulianYear > 2007 asJulianYear.
	self deny: 2008 asJulianYear > 2008 asJulianYear.

	self
		should: [ 2012 asJulianYear > JulianWednesday ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: JulianWednesday class
						 with: JulianWednesday
						 with: 2012 asJulianYear class
						 with: 2012 asJulianYear) ].

	self
		should: [ 2012 asJulianYear >= JulianApril third ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: 2012 asJulianYear class
						 with: 2012 asJulianYear
						 with: JulianApril third class
						 with: JulianApril third) ]
]

{ #category : 'test comparing' }
JulianYearTest >> testHash [

	self assert: 2007 asJulianYear hash equals: 2007 asJulianYear hash.
	self deny: 2007 asJulianYear hash = 2008 asJulianYear hash
]

{ #category : 'test includes' }
JulianYearTest >> testIncludesDate [
	self assert: (2007 asJulianYear includes: JulianJanuary first , 2007).
	self assert: (2007 asJulianYear includes: JulianDecember thirtyfirst , 2007).
	self deny: (2007 asJulianYear includes: JulianJanuary first , 2008).
	self deny: (2007 asJulianYear includes: JulianDecember thirtyfirst , 2006)
]

{ #category : 'test includes' }
JulianYearTest >> testIncludesDateTime [
	self assert: (2007 asJulianYear includes: (JulianJanuary first , 2007) atMidnight).
	self assert: (2007 asJulianYear includes: (JulianDecember thirtyfirst , 2007) atLastTimeOfDay).
	self deny: (2007 asJulianYear includes: (JulianJanuary first , 2008) atMidnight).
	self deny: (2007 asJulianYear includes: (JulianDecember thirtyfirst , 2006) atLastTimeOfDay)
]

{ #category : 'test includes' }
JulianYearTest >> testIncludesMonthOfYear [
	self assert: (2007 asJulianYear includes: JulianJanuary , 2007).
	self assert: (2007 asJulianYear includes: JulianDecember , 2007).
	self deny: (2007 asJulianYear includes: JulianJanuary , 2008).
	self deny: (2007 asJulianYear includes: JulianDecember , 2006)
]

{ #category : 'test includes' }
JulianYearTest >> testIncludesYear [
	self should: [ 2007 asJulianYear includes: 2007 asJulianYear ] raise: Exception
]

{ #category : 'test querying' }
JulianYearTest >> testInvalidNextANumberOfYears [
	| anyUnit |
	anyUnit := BaseUnit named: 'Any Unit'.
	self should: [ 2007 asJulianYear next: 1 ] raise: CanNotConvertMeasureException.
	self should: [ 2007 asJulianYear next: (anyUnit with: 1) ] raise: CanNotConvertMeasureException
]

{ #category : 'test querying' }
JulianYearTest >> testInvalidPreviousANumberOfYears [
	| anyUnit |
	anyUnit := BaseUnit named: 'Any Unit'.
	self should: [ 2007 asJulianYear previous: 1 ] raise: CanNotConvertMeasureException.
	self should: [ 2007 asJulianYear previous: (anyUnit with: 1) ] raise: CanNotConvertMeasureException
]

{ #category : 'test instance creation' }
JulianYearTest >> testInvalidYear [

	self
		should: [ 1.5 asJulianYear ]
		raise: InvalidYearNumberException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'1.5 is an invalid number for a year in the Julian Calendar' ]
]

{ #category : 'test querying' }
JulianYearTest >> testIsLeap [
	self assert: 2004 asJulianYear isLeap.
	self assert: 2000 asJulianYear isLeap.
	self assert: 2400 asJulianYear isLeap.
	self assert: 1900 asJulianYear isLeap.
	self deny: 2003 asJulianYear isLeap.
	self deny: 2101 asJulianYear isLeap
]

{ #category : 'test accessing' }
JulianYearTest >> testLastDate [

	self
		assert: 2008 asJulianYear lastDate
		equals: JulianDecember thirtyfirst , 2008.
	self
		assert: 2007 asJulianYear lastDate
		equals: JulianDecember thirtyfirst , 2007
]

{ #category : 'test accessing' }
JulianYearTest >> testLastDay [

	self
		assert: 2008 asJulianYear lastDay
		equals: (JulianDecember thirtyfirst , 2008) day.
	self
		assert: 2007 asJulianYear lastDay
		equals: (JulianDecember thirtyfirst , 2007) day
]

{ #category : 'test accessing' }
JulianYearTest >> testLastMonth [

	self
		assert: 2008 asJulianYear lastMonth
		equals: JulianDecember , 2008.
	self
		assert: 2007 asJulianYear lastMonth
		equals: JulianDecember , 2007
]

{ #category : 'test comparing' }
JulianYearTest >> testLessThan [

	self assert: 2007 asJulianYear < 2008 asJulianYear.
	self deny: 2007 asJulianYear < 2007 asJulianYear.

	self
		should: [ 2012 asJulianYear <= JulianWednesday ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: JulianWednesday class
						 with: JulianWednesday
						 with: 2012 asJulianYear class
						 with: 2012 asJulianYear) ].

	self
		should: [ 2012 asJulianYear < JulianApril third ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: 2012 asJulianYear class
						 with: 2012 asJulianYear
						 with: JulianApril third class
						 with: JulianApril third) ]
]

{ #category : 'test month of year creation' }
JulianYearTest >> testMonth [

	| year |
	year := 2014 asJulianYear.
	self assert: JulianMay , 2014 equals: (year month: JulianMay)
]

{ #category : 'test accessing' }
JulianYearTest >> testMonths [

	self assert: 2008 asJulianYear months size equals: 12.
	self
		assert: 2008 asJulianYear months first
		equals: JulianJanuary , 2008.
	self
		assert: 2008 asJulianYear months last
		equals: JulianDecember , 2008
]

{ #category : 'test months of year' }
JulianYearTest >> testMonthsOfYearsAccessing [

	| currentYear |
	currentYear := calendar currentYear.
	self
		assert: currentYear january
		equals: (JulianJanuary ofYear: currentYear).
	self
		assert: currentYear february
		equals: (JulianFebruary ofYear: currentYear).
	self
		assert: currentYear march
		equals: (JulianMarch ofYear: currentYear).
	self
		assert: currentYear april
		equals: (JulianApril ofYear: currentYear).
	self assert: currentYear may equals: (JulianMay ofYear: currentYear).
	self
		assert: currentYear june
		equals: (JulianJune ofYear: currentYear).
	self
		assert: currentYear july
		equals: (JulianJuly ofYear: currentYear).
	self
		assert: currentYear august
		equals: (JulianAugust ofYear: currentYear).
	self
		assert: currentYear september
		equals: (JulianSeptember ofYear: currentYear).
	self
		assert: currentYear october
		equals: (JulianOctober ofYear: currentYear).
	self
		assert: currentYear november
		equals: (JulianNovember ofYear: currentYear).
	self
		assert: currentYear december
		equals: (JulianDecember ofYear: currentYear)
]

{ #category : 'test querying' }
JulianYearTest >> testNext [

	self assert: 2007 asJulianYear next equals: 2008 asJulianYear.
	self assert: -1 asJulianYear next equals: 1 asJulianYear
]

{ #category : 'test querying' }
JulianYearTest >> testNextANumberOfYears [

	self
		assert: (2007 asJulianYear next: zeroYears)
		equals: 2007 asJulianYear.
	self
		assert: (2007 asJulianYear next: oneYear)
		equals: 2008 asJulianYear.
	self
		assert: (2007 asJulianYear next: tenYears)
		equals: 2017 asJulianYear.
	self assert: (-1 asJulianYear next: oneYear) equals: 1 asJulianYear.
	self
		should: [ 2007 asJulianYear next: thirteenMonths ]
		raise: CanNotConvertMeasureException.
	self
		should: [ 2007 asJulianYear next: sixMonths ]
		raise: CanNotConvertMeasureException
]

{ #category : 'test querying' }
JulianYearTest >> testNextLeapYear [

	self assert: 2003 asJulianYear nextLeapYear equals: 2004 asJulianYear.
	self assert: 2004 asJulianYear nextLeapYear equals: 2008 asJulianYear.
	self assert: 1899 asJulianYear nextLeapYear equals: 1900 asJulianYear
]

{ #category : 'test accessing' }
JulianYearTest >> testNumber [

	self assert: 2007 asJulianYear number equals: 2007.
	self assert: 2008 asJulianYear number equals: 2008
]

{ #category : 'test accessing' }
JulianYearTest >> testNumberOfDays [

	self assert: 2008 asJulianYear numberOfDays equals: 366 daysMeasure.
	self assert: 2007 asJulianYear numberOfDays equals: 365 daysMeasure
]

{ #category : 'test accessing months' }
JulianYearTest >> testNumberOfMonths [

	| leapYear nonleapYear |
	leapYear := 2012 asJulianYear.
	nonleapYear := 2014 asJulianYear.
	self assert: leapYear numberOfMonths equals: 12 monthsMeasure.
	self assert: nonleapYear numberOfMonths equals: 12 monthsMeasure
]

{ #category : 'test querying' }
JulianYearTest >> testPrevious [

	self assert: 2007 asJulianYear previous equals: 2006 asJulianYear.
	self assert: 1 asJulianYear previous equals: -1 asJulianYear
]

{ #category : 'test querying' }
JulianYearTest >> testPreviousANumberOfYears [

	self
		assert: (2007 asJulianYear previous: zeroYears)
		equals: 2007 asJulianYear.
	self
		assert: (2007 asJulianYear previous: oneYear)
		equals: 2006 asJulianYear.
	self
		assert: (2007 asJulianYear previous: tenYears)
		equals: 1997 asJulianYear.
	self
		assert: (1 asJulianYear previous: oneYear)
		equals: -1 asJulianYear.
	self
		should: [ 2007 asJulianYear previous: thirteenMonths ]
		raise: CanNotConvertMeasureException.
	self
		should: [ 2007 asJulianYear previous: sixMonths ]
		raise: CanNotConvertMeasureException
]

{ #category : 'test querying' }
JulianYearTest >> testPreviousLeapYear [

	self
		assert: 2008 asJulianYear previousLeapYear
		equals: 2004 asJulianYear.
	self
		assert: 2003 asJulianYear previousLeapYear
		equals: 2000 asJulianYear.
	self
		assert: 1901 asJulianYear previousLeapYear
		equals: 1900 asJulianYear
]

{ #category : 'test printing' }
JulianYearTest >> testPrintString [

	self assert: 2007 asJulianYear printString equals: 'Year 2007'
]

{ #category : 'test interval protocol' }
JulianYearTest >> testTo [

	| interval |
	interval := 2007 asJulianYear to: 2010 asJulianYear.
	self assert: interval from equals: 2007 asJulianYear.
	self assert: interval to equals: 2010 asJulianYear.
	self assert: interval by equals: oneYear
]

{ #category : 'test interval protocol' }
JulianYearTest >> testToBy [

	| interval |
	interval := 2007 asJulianYear to: 2010 asJulianYear by: twoYears.
	self assert: interval from equals: 2007 asJulianYear.
	self assert: interval to equals: 2010 asJulianYear.
	self assert: interval by equals: twoYears
]

{ #category : 'test interval protocol' }
JulianYearTest >> testToByDo [

	| number |
	number := 2004.
	(2004 asJulianYear to: 2010 asJulianYear by: twoYears) do: [ :year |
		self assert: year number equals: number.
		number := number + 2 ].
	self assert: number equals: 2012
]

{ #category : 'test interval protocol' }
JulianYearTest >> testToByReverse [

	| coll number |
	coll := (2004 asJulianYear to: 2011 asJulianYear by: twoYears)
		        reverse.
	number := 2010.
	coll do: [ :year |
		self assert: year number equals: number.
		number := number - 2 ].
	self assert: number equals: 2002
]

{ #category : 'test interval protocol' }
JulianYearTest >> testToNegativeBy [

	| interval number |
	interval := 2011 asJulianYear to: 2004 asJulianYear by:
	            twoYears negated.
	number := 2011.
	interval do: [ :year |
		self assert: year number equals: number.
		number := number - 2 ].
	self assert: number equals: 2003
]

{ #category : 'test instance creation' }
JulianYearTest >> testValidYear [
	self shouldnt: [ 2007 asJulianYear ] raise: InvalidYearNumberException
]

{ #category : 'test querying' }
JulianYearTest >> testYearsFrom [

	self
		assert: (2007 asJulianYear distanceFrom: 2006 asJulianYear)
		equals: oneYear.
	self
		assert: (2007 asJulianYear distanceFrom: 2008 asJulianYear)
		equals: oneYear negated.
	self
		assert: (2007 asJulianYear distanceFrom: 2007 asJulianYear)
		equals: zeroYears.
	self
		assert: (1 asJulianYear distanceFrom: -1 asJulianYear)
		equals: oneYear.
	self
		assert: (-1 asJulianYear distanceFrom: 1 asJulianYear)
		equals: oneYear negated
]

{ #category : 'test querying' }
JulianYearTest >> testYearsTo [

	self
		assert: (2007 asJulianYear distanceTo: 2008 asJulianYear)
		equals: oneYear.
	self
		assert: (2007 asJulianYear distanceTo: 2006 asJulianYear)
		equals: oneYear negated.
	self
		assert: (2007 asJulianYear distanceTo: 2007 asJulianYear)
		equals: zeroYears.
	self
		assert: (-1 asJulianYear distanceTo: 1 asJulianYear)
		equals: oneYear.
	self
		assert: (1 asJulianYear distanceTo: -1 asJulianYear)
		equals: oneYear negated.
	self
		assert: (1 asJulianYear distanceTo: -10 asJulianYear)
		equals: tenYears negated
]
