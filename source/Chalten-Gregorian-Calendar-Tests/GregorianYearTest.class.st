Class {
	#name : 'GregorianYearTest',
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
	#category : 'Chalten-Gregorian-Calendar-Tests',
	#package : 'Chalten-Gregorian-Calendar-Tests'
}

{ #category : 'accessing' }
GregorianYearTest class >> classUnderTest [

	^ChaltenYear
]

{ #category : 'initialization' }
GregorianYearTest >> setUp [
	calendar := ChaltenEnvironment calendarNamed: #GregorianCalendar.
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
GregorianYearTest >> testDates [

	self
		assert: 2007 asGregorianYear dates first
		equals: January first , 2007.
	self
		assert: 2007 asGregorianYear dates last
		equals: December thirtyfirst , 2007.
	self
		assert: 2003 asGregorianYear dates first
		equals: January first , 2003.
	self
		assert: 2003 asGregorianYear dates last
		equals: December thirtyfirst , 2003
]

{ #category : 'test interval protocol' }
GregorianYearTest >> testDistanceTo [

	| absoluteDistance |
	absoluteDistance := 2007 asGregorianYear absoluteDistanceTo:
		                    2010 asGregorianYear.
	self assert: absoluteDistance equals: 3 yearsMeasure
]

{ #category : 'test comparing' }
GregorianYearTest >> testEqual [

	self assert: 2007 asGregorianYear equals: 2007 asGregorianYear.
	self deny: 2007 asGregorianYear = 2008 asGregorianYear
]

{ #category : 'test accessing' }
GregorianYearTest >> testFirstDate [

	self
		assert: 2008 asGregorianYear firstDate
		equals: January first , 2008.
	self
		assert: 2007 asGregorianYear firstDate
		equals: January first , 2007
]

{ #category : 'test accessing' }
GregorianYearTest >> testFirstDay [

	self
		assert: 2008 asGregorianYear firstDay
		equals: (January first , 2008) day.
	self
		assert: 2007 asGregorianYear firstDay
		equals: (January first , 2007) day
]

{ #category : 'test accessing' }
GregorianYearTest >> testFirstMonth [

	self assert: 2008 asGregorianYear firstMonth equals: January , 2008.
	self assert: 2007 asGregorianYear firstMonth equals: January , 2007
]

{ #category : 'test comparing' }
GregorianYearTest >> testGreaterThan [

	self assert: 2008 asGregorianYear > 2007 asGregorianYear.
	self deny: 2008 asGregorianYear > 2008 asGregorianYear.

	self
		should: [ 2012 asGregorianYear > Wednesday ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: Wednesday class
						 with: Wednesday
						 with: 2012 asGregorianYear class
						 with: 2012 asGregorianYear) ].

	self
		should: [ 2012 asGregorianYear >= April third ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: 2012 asGregorianYear class
						 with: 2012 asGregorianYear
						 with: April third class
						 with: April third) ]
]

{ #category : 'test comparing' }
GregorianYearTest >> testHash [

	self
		assert: 2007 asGregorianYear hash
		equals: 2007 asGregorianYear hash.
	self deny: 2007 asGregorianYear hash = 2008 asGregorianYear hash
]

{ #category : 'test includes' }
GregorianYearTest >> testIncludesDate [
	self assert: (2007 asGregorianYear includes: January first , 2007).
	self assert: (2007 asGregorianYear includes: December thirtyfirst , 2007).
	self deny: (2007 asGregorianYear includes: January first , 2008).
	self deny: (2007 asGregorianYear includes: December thirtyfirst , 2006)
]

{ #category : 'test includes' }
GregorianYearTest >> testIncludesDateTime [
	self assert: (2007 asGregorianYear includes: (January first , 2007) atMidnight).
	self assert: (2007 asGregorianYear includes: (December thirtyfirst , 2007) atLastTimeOfDay).
	self deny: (2007 asGregorianYear includes: (January first , 2008) atMidnight).
	self deny: (2007 asGregorianYear includes: (December thirtyfirst , 2006) atLastTimeOfDay)
]

{ #category : 'test includes' }
GregorianYearTest >> testIncludesMonthOfYear [
	self assert: (2007 asGregorianYear includes: January , 2007).
	self assert: (2007 asGregorianYear includes: December , 2007).
	self deny: (2007 asGregorianYear includes: January , 2008).
	self deny: (2007 asGregorianYear includes: December , 2006)
]

{ #category : 'test includes' }
GregorianYearTest >> testIncludesYear [
	self should: [ 2007 asGregorianYear includes: 2007 asGregorianYear ] raise: Exception
]

{ #category : 'test querying' }
GregorianYearTest >> testInvalidNextANumberOfYears [
	| anyUnit |
	anyUnit := BaseUnit named: 'Any Unit'.
	self should: [ 2007 asGregorianYear next: 1 ] raise: CanNotConvertMeasureException.
	self should: [ 2007 asGregorianYear next: (anyUnit with: 1) ] raise: CanNotConvertMeasureException
]

{ #category : 'test querying' }
GregorianYearTest >> testInvalidPreviousANumberOfYears [
	| anyUnit |
	anyUnit := BaseUnit named: 'Any Unit'.
	self should: [ 2007 asGregorianYear previous: 1 ] raise: CanNotConvertMeasureException.
	self should: [ 2007 asGregorianYear previous: (anyUnit with: 1) ] raise: CanNotConvertMeasureException
]

{ #category : 'test instance creation' }
GregorianYearTest >> testInvalidYear [

	self
		should: [ 1.5 asGregorianYear ]
		raise: InvalidYearNumberException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'1.5 is an invalid number for a year in the Gregorian Calendar' ]
]

{ #category : 'test querying' }
GregorianYearTest >> testIsLeap [
	self assert: 2004 asGregorianYear isLeap.
	self assert: 2000 asGregorianYear isLeap.
	self assert: 2400 asGregorianYear isLeap.
	self deny: 1900 asGregorianYear isLeap.
	self deny: 2003 asGregorianYear isLeap.
	self deny: 2101 asGregorianYear isLeap
]

{ #category : 'test accessing' }
GregorianYearTest >> testLastDate [

	self
		assert: 2008 asGregorianYear lastDate
		equals: December thirtyfirst , 2008.
	self
		assert: 2007 asGregorianYear lastDate
		equals: December thirtyfirst , 2007
]

{ #category : 'test accessing' }
GregorianYearTest >> testLastDay [

	self
		assert: 2008 asGregorianYear lastDay
		equals: (December thirtyfirst , 2008) day.
	self
		assert: 2007 asGregorianYear lastDay
		equals: (December thirtyfirst , 2007) day
]

{ #category : 'test accessing' }
GregorianYearTest >> testLastMonth [

	self assert: 2008 asGregorianYear lastMonth equals: December , 2008.
	self assert: 2007 asGregorianYear lastMonth equals: December , 2007
]

{ #category : 'test comparing' }
GregorianYearTest >> testLessThan [

	self assert: 2007 asGregorianYear < 2008 asGregorianYear.
	self deny: 2007 asGregorianYear < 2007 asGregorianYear.

	self
		should: [ 2012 asGregorianYear <= Wednesday ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: Wednesday class
						 with: Wednesday
						 with: 2012 asGregorianYear class
						 with: 2012 asGregorianYear) ].

	self
		should: [ 2012 asGregorianYear < April third ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: 2012 asGregorianYear class
						 with: 2012 asGregorianYear
						 with: April third class
						 with: April third) ]
]

{ #category : 'test month of year creation' }
GregorianYearTest >> testMonth [

	| year |
	year := 2014 asGregorianYear.
	self assert: May , 2014 equals: (year month: May)
]

{ #category : 'test accessing' }
GregorianYearTest >> testMonths [

	self assert: 2008 asGregorianYear months size equals: 12.
	self assert: 2008 asGregorianYear months first equals: January , 2008.
	self assert: 2008 asGregorianYear months last equals: December , 2008
]

{ #category : 'test months of year' }
GregorianYearTest >> testMonthsOfYearsAccessing [

	| currentYear |
	currentYear := calendar currentYear.
	self
		assert: currentYear january
		equals: (January ofYear: currentYear).
	self
		assert: currentYear february
		equals: (February ofYear: currentYear).
	self assert: currentYear march equals: (March ofYear: currentYear).
	self assert: currentYear april equals: (April ofYear: currentYear).
	self assert: currentYear may equals: (May ofYear: currentYear).
	self assert: currentYear june equals: (June ofYear: currentYear).
	self assert: currentYear july equals: (July ofYear: currentYear).
	self assert: currentYear august equals: (August ofYear: currentYear).
	self
		assert: currentYear september
		equals: (September ofYear: currentYear).
	self
		assert: currentYear october
		equals: (October ofYear: currentYear).
	self
		assert: currentYear november
		equals: (November ofYear: currentYear).
	self
		assert: currentYear december
		equals: (December ofYear: currentYear)
]

{ #category : 'test querying' }
GregorianYearTest >> testNext [

	self assert: 2007 asGregorianYear next equals: 2008 asGregorianYear.
	self assert: -1 asGregorianYear next equals: 0 asGregorianYear
]

{ #category : 'test querying' }
GregorianYearTest >> testNextANumberOfYears [

	self
		assert: (2007 asGregorianYear next: zeroYears)
		equals: 2007 asGregorianYear.
	self
		assert: (2007 asGregorianYear next: oneYear)
		equals: 2008 asGregorianYear.
	self
		assert: (2007 asGregorianYear next: tenYears)
		equals: 2017 asGregorianYear.
	self
		assert: (-1 asGregorianYear next: oneYear)
		equals: 0 asGregorianYear.
	self
		should: [ 2007 asGregorianYear next: thirteenMonths ]
		raise: CanNotConvertMeasureException.
	self
		should: [ 2007 asGregorianYear next: sixMonths ]
		raise: CanNotConvertMeasureException
]

{ #category : 'test querying' }
GregorianYearTest >> testNextLeapYear [

	self
		assert: 2003 asGregorianYear nextLeapYear
		equals: 2004 asGregorianYear.
	self
		assert: 2004 asGregorianYear nextLeapYear
		equals: 2008 asGregorianYear.
	self
		assert: 1899 asGregorianYear nextLeapYear
		equals: 1904 asGregorianYear
]

{ #category : 'test accessing' }
GregorianYearTest >> testNumber [

	self assert: 2007 asGregorianYear number equals: 2007.
	self assert: 2008 asGregorianYear number equals: 2008
]

{ #category : 'test accessing' }
GregorianYearTest >> testNumberOfDays [

	self
		assert: 2008 asGregorianYear numberOfDays
		equals: 366 daysMeasure.
	self
		assert: 2007 asGregorianYear numberOfDays
		equals: 365 daysMeasure
]

{ #category : 'test accessing months' }
GregorianYearTest >> testNumberOfMonths [

	| leapYear nonleapYear |
	leapYear := 2016 asGregorianYear.
	nonleapYear := 2015 asGregorianYear.
	self assert: leapYear numberOfMonths equals: 12 monthsMeasure.
	self assert: nonleapYear numberOfMonths equals: 12 monthsMeasure
]

{ #category : 'test querying' }
GregorianYearTest >> testPrevious [

	self
		assert: 2007 asGregorianYear previous
		equals: 2006 asGregorianYear.
	self assert: 1 asGregorianYear previous equals: 0 asGregorianYear
]

{ #category : 'test querying' }
GregorianYearTest >> testPreviousANumberOfYears [

	self
		assert: (2007 asGregorianYear previous: zeroYears)
		equals: 2007 asGregorianYear.
	self
		assert: (2007 asGregorianYear previous: oneYear)
		equals: 2006 asGregorianYear.
	self
		assert: (2007 asGregorianYear previous: tenYears)
		equals: 1997 asGregorianYear.
	self
		assert: (1 asGregorianYear previous: oneYear)
		equals: 0 asGregorianYear.
	self
		should: [ 2007 asGregorianYear previous: thirteenMonths ]
		raise: CanNotConvertMeasureException.
	self
		should: [ 2007 asGregorianYear previous: sixMonths ]
		raise: CanNotConvertMeasureException
]

{ #category : 'test querying' }
GregorianYearTest >> testPreviousLeapYear [

	self
		assert: 2008 asGregorianYear previousLeapYear
		equals: 2004 asGregorianYear.
	self
		assert: 2003 asGregorianYear previousLeapYear
		equals: 2000 asGregorianYear.
	self
		assert: 1901 asGregorianYear previousLeapYear
		equals: 1896 asGregorianYear
]

{ #category : 'test printing' }
GregorianYearTest >> testPrintString [

	self assert: 2007 asGregorianYear printString equals: 'Year 2007'
]

{ #category : 'test interval protocol' }
GregorianYearTest >> testTo [

	| interval |
	interval := 2007 asGregorianYear to: 2010 asGregorianYear.
	self assert: interval from equals: 2007 asGregorianYear.
	self assert: interval to equals: 2010 asGregorianYear.
	self assert: interval by equals: oneYear
]

{ #category : 'test interval protocol' }
GregorianYearTest >> testToBy [

	| interval |
	interval := 2007 asGregorianYear to: 2010 asGregorianYear by:
	            twoYears.
	self assert: interval from equals: 2007 asGregorianYear.
	self assert: interval to equals: 2010 asGregorianYear.
	self assert: interval by equals: twoYears
]

{ #category : 'test interval protocol' }
GregorianYearTest >> testToByDo [

	| number |
	number := 2004.
	(2004 asGregorianYear to: 2010 asGregorianYear by: twoYears) do: [
		:year |
		self assert: year number equals: number.
		number := number + 2 ].
	self assert: number equals: 2012
]

{ #category : 'test interval protocol' }
GregorianYearTest >> testToByReverse [

	| coll number |
	coll := (2004 asGregorianYear to: 2011 asGregorianYear by: twoYears)
		        reverse.
	number := 2010.
	coll do: [ :year |
		self assert: year number equals: number.
		number := number - 2 ].
	self assert: number equals: 2002
]

{ #category : 'test interval protocol' }
GregorianYearTest >> testToNegativeBy [

	| interval number |
	interval := 2011 asGregorianYear to: 2004 asGregorianYear by:
	            twoYears negated.
	number := 2011.
	interval do: [ :year |
		self assert: year number equals: number.
		number := number - 2 ].
	self assert: number equals: 2003
]

{ #category : 'test instance creation' }
GregorianYearTest >> testValidYear [
	self shouldnt: [ 2007 asGregorianYear ] raise: InvalidYearNumberException
]

{ #category : 'test querying' }
GregorianYearTest >> testYearsFrom [

	self
		assert: (2007 asGregorianYear distanceFrom: 2006 asGregorianYear)
		equals: oneYear.
	self
		assert: (2007 asGregorianYear distanceFrom: 2008 asGregorianYear)
		equals: oneYear negated.
	self
		assert: (2007 asGregorianYear distanceFrom: 2007 asGregorianYear)
		equals: zeroYears.
	self
		assert: (-1 asGregorianYear distanceFrom: 0 asGregorianYear)
		equals: oneYear negated.
	self
		assert: (1 asGregorianYear distanceFrom: 0 asGregorianYear)
		equals: oneYear
]

{ #category : 'test querying' }
GregorianYearTest >> testYearsTo [

	self
		assert: (2007 asGregorianYear distanceTo: 2008 asGregorianYear)
		equals: oneYear.
	self
		assert: (2007 asGregorianYear distanceTo: 2006 asGregorianYear)
		equals: oneYear negated.
	self
		assert: (2007 asGregorianYear distanceTo: 2007 asGregorianYear)
		equals: zeroYears.
	self
		assert: (-1 asGregorianYear distanceTo: 0 asGregorianYear)
		equals: oneYear.
	self
		assert: (1 asGregorianYear distanceTo: 0 asGregorianYear)
		equals: oneYear negated.
	self
		assert: (1 asGregorianYear distanceTo: -9 asGregorianYear)
		equals: tenYears negated
]
