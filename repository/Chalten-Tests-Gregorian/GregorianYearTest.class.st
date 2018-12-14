Class {
	#name : #GregorianYearTest,
	#superclass : #TestCase,
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
	#category : #'Chalten-Tests-Gregorian'
}

{ #category : #accessing }
GregorianYearTest class >> classUnderTest [

	^ChaltenYear
]

{ #category : #initialization }
GregorianYearTest >> setUp [
	calendar := GregorianCalendar.
	zeroYears := 0 yearsMeasure.
	oneYear := 1 yearMeasure.
	twoYears := 2 yearsMeasure.
	tenYears := 10 yearsMeasure.
	sixMonths := 6 monthsMeasure.
	thirteenMonths := 13 monthsMeasure.
	twentyEightDays := 28 daysMeasure.
	twentyNineDays := 29 daysMeasure
]

{ #category : #'test accessing' }
GregorianYearTest >> testDates [
	self assert: 2007 asGregorianYear dates first = (January first , 2007).
	self assert: 2007 asGregorianYear dates last = (December thirtyfirst , 2007).
	self assert: 2003 asGregorianYear dates first = (January first , 2003).
	self assert: 2003 asGregorianYear dates last = (December thirtyfirst , 2003)
]

{ #category : #'test interval protocol' }
GregorianYearTest >> testDistanceTo [
	| absoluteDistance |
	absoluteDistance := 2007 asGregorianYear absoluteDistanceTo: 2010 asGregorianYear.
	self assert: absoluteDistance = 3 yearsMeasure
]

{ #category : #'test comparing' }
GregorianYearTest >> testEqual [
	self assert: 2007 asGregorianYear = 2007 asGregorianYear.
	self deny: 2007 asGregorianYear = 2008 asGregorianYear
]

{ #category : #'test accessing' }
GregorianYearTest >> testFirstDate [
	self assert: 2008 asGregorianYear firstDate = (January first , 2008).
	self assert: 2007 asGregorianYear firstDate = (January first , 2007)
]

{ #category : #'test accessing' }
GregorianYearTest >> testFirstDay [
	self assert: 2008 asGregorianYear firstDay = (January first , 2008) day.
	self assert: 2007 asGregorianYear firstDay = (January first , 2007) day
]

{ #category : #'test accessing' }
GregorianYearTest >> testFirstMonth [
	self assert: 2008 asGregorianYear firstMonth = (January , 2008).
	self assert: 2007 asGregorianYear firstMonth = (January , 2007)
]

{ #category : #'test comparing' }
GregorianYearTest >> testGreaterThan [

	self assert: 2008 asGregorianYear > 2007 asGregorianYear.
	self deny: 2008 asGregorianYear > 2008 asGregorianYear.
	
	self should: [ 2012 asGregorianYear > Wednesday ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: Wednesday class
				with: Wednesday
				with: 2012 asGregorianYear class
				with: 2012 asGregorianYear) ].
	
	self should: [ 2012 asGregorianYear >= April third ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: 2012 asGregorianYear class
				with: 2012 asGregorianYear
				with: April third class
				with: April third) ]
]

{ #category : #'test comparing' }
GregorianYearTest >> testHash [
	self assert: 2007 asGregorianYear hash = 2007 asGregorianYear hash.
	self deny: 2007 asGregorianYear hash = 2008 asGregorianYear hash
]

{ #category : #'test includes' }
GregorianYearTest >> testIncludesDate [
	self assert: (2007 asGregorianYear includes: January first , 2007).
	self assert: (2007 asGregorianYear includes: December thirtyfirst , 2007).
	self deny: (2007 asGregorianYear includes: January first , 2008).
	self deny: (2007 asGregorianYear includes: December thirtyfirst , 2006)
]

{ #category : #'test includes' }
GregorianYearTest >> testIncludesDateTime [
	self assert: (2007 asGregorianYear includes: (January first , 2007) atMidnight).
	self assert: (2007 asGregorianYear includes: (December thirtyfirst , 2007) atLastTimeOfDay).
	self deny: (2007 asGregorianYear includes: (January first , 2008) atMidnight).
	self deny: (2007 asGregorianYear includes: (December thirtyfirst , 2006) atLastTimeOfDay)
]

{ #category : #'test includes' }
GregorianYearTest >> testIncludesMonthOfYear [
	self assert: (2007 asGregorianYear includes: January , 2007).
	self assert: (2007 asGregorianYear includes: December , 2007).
	self deny: (2007 asGregorianYear includes: January , 2008).
	self deny: (2007 asGregorianYear includes: December , 2006)
]

{ #category : #'test includes' }
GregorianYearTest >> testIncludesYear [
	self should: [ 2007 asGregorianYear includes: 2007 asGregorianYear ] raise: Exception
]

{ #category : #'test querying' }
GregorianYearTest >> testInvalidNextANumberOfYears [
	| anyUnit |
	anyUnit := BaseUnit named: 'Any Unit'.
	self should: [ 2007 asGregorianYear next: 1 ] raise: CanNotConvertMeasureException.
	self should: [ 2007 asGregorianYear next: (anyUnit with: 1) ] raise: CanNotConvertMeasureException
]

{ #category : #'test querying' }
GregorianYearTest >> testInvalidPreviousANumberOfYears [
	| anyUnit |
	anyUnit := BaseUnit named: 'Any Unit'.
	self should: [ 2007 asGregorianYear previous: 1 ] raise: CanNotConvertMeasureException.
	self should: [ 2007 asGregorianYear previous: (anyUnit with: 1) ] raise: CanNotConvertMeasureException
]

{ #category : #'test instance creation' }
GregorianYearTest >> testInvalidYear [
	self
		should: [ 1.5 asGregorianYear ]
		raise: InvalidYearNumberException
		withExceptionDo: [ :anException | self assert: anException description = '1.5 is an invalid number for a year in the Gregorian Calendar' ]
]

{ #category : #'test querying' }
GregorianYearTest >> testIsLeap [
	self assert: 2004 asGregorianYear isLeap.
	self assert: 2000 asGregorianYear isLeap.
	self assert: 2400 asGregorianYear isLeap.
	self deny: 1900 asGregorianYear isLeap.
	self deny: 2003 asGregorianYear isLeap.
	self deny: 2101 asGregorianYear isLeap
]

{ #category : #'test accessing' }
GregorianYearTest >> testLastDate [
	self assert: 2008 asGregorianYear lastDate = (December thirtyfirst , 2008).
	self assert: 2007 asGregorianYear lastDate = (December thirtyfirst , 2007)
]

{ #category : #'test accessing' }
GregorianYearTest >> testLastDay [
	self assert: 2008 asGregorianYear lastDay = (December thirtyfirst , 2008) day.
	self assert: 2007 asGregorianYear lastDay = (December thirtyfirst , 2007) day
]

{ #category : #'test accessing' }
GregorianYearTest >> testLastMonth [
	self assert: 2008 asGregorianYear lastMonth = (December , 2008).
	self assert: 2007 asGregorianYear lastMonth = (December , 2007)
]

{ #category : #'test comparing' }
GregorianYearTest >> testLessThan [

	self assert: 2007 asGregorianYear < 2008 asGregorianYear.
	self deny: 2007 asGregorianYear < 2007 asGregorianYear.
	
	self should: [ 2012 asGregorianYear <= Wednesday ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: Wednesday class
				with: Wednesday
				with: 2012 asGregorianYear class
				with: 2012 asGregorianYear) ].
	
	self should: [ 2012 asGregorianYear < April third ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: 2012 asGregorianYear class
				with: 2012 asGregorianYear
				with: April third class
				with: April third) ]
]

{ #category : #'test month of year creation' }
GregorianYearTest >> testMonth [

	| year |
	year := 2014 asGregorianYear.
	self assert: May, 2014 = (year month: May)
]

{ #category : #'test accessing' }
GregorianYearTest >> testMonths [
	self assert: 2008 asGregorianYear months size = 12.
	self assert: 2008 asGregorianYear months first = (January , 2008).
	self assert: 2008 asGregorianYear months last = (December , 2008)
]

{ #category : #'test months of year' }
GregorianYearTest >> testMonthsOfYearsAccessing [

	| currentYear |

	currentYear := calendar currentYear.
	self assert: currentYear january = (January ofYear: currentYear).
	self assert: currentYear february = (February ofYear: currentYear).
	self assert: currentYear march = (March ofYear: currentYear).
	self assert: currentYear april = (April ofYear: currentYear).
	self assert: currentYear may = (May ofYear: currentYear).
	self assert: currentYear june = (June ofYear: currentYear).
	self assert: currentYear july = (July ofYear: currentYear).
	self assert: currentYear august = (August ofYear: currentYear).
	self assert: currentYear september = (September ofYear: currentYear).
	self assert: currentYear october = (October ofYear: currentYear).
	self assert: currentYear november = (November ofYear: currentYear).
	self assert: currentYear december = (December ofYear: currentYear)
]

{ #category : #'test querying' }
GregorianYearTest >> testNext [
	self assert: 2007 asGregorianYear next = 2008 asGregorianYear.
	self assert: -1 asGregorianYear next = 0 asGregorianYear
]

{ #category : #'test querying' }
GregorianYearTest >> testNextANumberOfYears [
	self assert: (2007 asGregorianYear next: zeroYears) = 2007 asGregorianYear.
	self assert: (2007 asGregorianYear next: oneYear) = 2008 asGregorianYear.
	self assert: (2007 asGregorianYear next: tenYears) = 2017 asGregorianYear.
	self assert: (-1 asGregorianYear next: oneYear) = 0 asGregorianYear.
	self should: [ 2007 asGregorianYear next: thirteenMonths ] raise: CanNotConvertMeasureException.
	self should: [ 2007 asGregorianYear next: sixMonths ] raise: CanNotConvertMeasureException
]

{ #category : #'test querying' }
GregorianYearTest >> testNextLeapYear [
	self assert: 2003 asGregorianYear nextLeapYear = 2004 asGregorianYear.
	self assert: 2004 asGregorianYear nextLeapYear = 2008 asGregorianYear.
	self assert: 1899 asGregorianYear nextLeapYear = 1904 asGregorianYear
]

{ #category : #'test accessing' }
GregorianYearTest >> testNumber [
	self assert: 2007 asGregorianYear number = 2007.
	self assert: 2008 asGregorianYear number = 2008
]

{ #category : #'test accessing' }
GregorianYearTest >> testNumberOfDays [
	self assert: 2008 asGregorianYear numberOfDays = 366 daysMeasure.
	self assert: 2007 asGregorianYear numberOfDays = 365 daysMeasure
]

{ #category : #'test accessing months' }
GregorianYearTest >> testNumberOfMonths [

	| leapYear nonleapYear |
	leapYear := 2016 asGregorianYear.
	nonleapYear := 2015 asGregorianYear.
	
	self assert: leapYear numberOfMonths = 12 monthsMeasure.
	self assert: nonleapYear numberOfMonths = 12 monthsMeasure
]

{ #category : #'test querying' }
GregorianYearTest >> testPrevious [
	self assert: 2007 asGregorianYear previous = 2006 asGregorianYear.
	self assert: 1 asGregorianYear previous = 0 asGregorianYear
]

{ #category : #'test querying' }
GregorianYearTest >> testPreviousANumberOfYears [
	self assert: (2007 asGregorianYear previous: zeroYears) = 2007 asGregorianYear.
	self assert: (2007 asGregorianYear previous: oneYear) = 2006 asGregorianYear.
	self assert: (2007 asGregorianYear previous: tenYears) = 1997 asGregorianYear.
	self assert: (1 asGregorianYear previous: oneYear) = 0 asGregorianYear.
	self should: [ 2007 asGregorianYear previous: thirteenMonths ] raise: CanNotConvertMeasureException.
	self should: [ 2007 asGregorianYear previous: sixMonths ] raise: CanNotConvertMeasureException
]

{ #category : #'test querying' }
GregorianYearTest >> testPreviousLeapYear [
	self assert: 2008 asGregorianYear previousLeapYear = 2004 asGregorianYear.
	self assert: 2003 asGregorianYear previousLeapYear = 2000 asGregorianYear.
	self assert: 1901 asGregorianYear previousLeapYear = 1896 asGregorianYear
]

{ #category : #'test printing' }
GregorianYearTest >> testPrintString [
	self assert: 2007 asGregorianYear printString = 'Year 2007'
]

{ #category : #'test interval protocol' }
GregorianYearTest >> testTo [
	| interval |
	interval := 2007 asGregorianYear to: 2010 asGregorianYear.
	self assert: interval from = 2007 asGregorianYear.
	self assert: interval to = 2010 asGregorianYear.
	self assert: interval by = oneYear
]

{ #category : #'test interval protocol' }
GregorianYearTest >> testToBy [
	| interval |
	interval := 2007 asGregorianYear to: 2010 asGregorianYear by: twoYears.
	self assert: interval from = 2007 asGregorianYear.
	self assert: interval to = 2010 asGregorianYear.
	self assert: interval by = twoYears
]

{ #category : #'test interval protocol' }
GregorianYearTest >> testToByDo [
	| number |
	number := 2004.
	(2004 asGregorianYear to: 2010 asGregorianYear by: twoYears)
		do: [ :year | 
			self assert: year number = number.
			number := number + 2 ].
	self assert: number = 2012
]

{ #category : #'test interval protocol' }
GregorianYearTest >> testToByReverse [
	| coll number |
	coll := (2004 asGregorianYear to: 2011 asGregorianYear by: twoYears) reverse.
	number := 2010.
	coll
		do: [ :year | 
			self assert: year number = number.
			number := number - 2 ].
	self assert: number = 2002
]

{ #category : #'test interval protocol' }
GregorianYearTest >> testToNegativeBy [
	| interval number |
	interval := 2011 asGregorianYear to: 2004 asGregorianYear by: twoYears negated.
	number := 2011.
	interval
		do: [ :year | 
			self assert: year number = number.
			number := number - 2 ].
	self assert: number = 2003
]

{ #category : #'test instance creation' }
GregorianYearTest >> testValidYear [
	self shouldnt: [ 2007 asGregorianYear ] raise: InvalidYearNumberException
]

{ #category : #'test querying' }
GregorianYearTest >> testYearsFrom [
	self assert: (2007 asGregorianYear distanceFrom: 2006 asGregorianYear) = oneYear.
	self assert: (2007 asGregorianYear distanceFrom: 2008 asGregorianYear) = oneYear negated.
	self assert: (2007 asGregorianYear distanceFrom: 2007 asGregorianYear) = zeroYears.
	self assert: (-1 asGregorianYear distanceFrom: 0 asGregorianYear) = oneYear negated.
	self assert: (1 asGregorianYear distanceFrom: 0 asGregorianYear) = oneYear
]

{ #category : #'test querying' }
GregorianYearTest >> testYearsTo [
	self assert: (2007 asGregorianYear distanceTo: 2008 asGregorianYear) = oneYear.
	self assert: (2007 asGregorianYear distanceTo: 2006 asGregorianYear) = oneYear negated.
	self assert: (2007 asGregorianYear distanceTo: 2007 asGregorianYear) = zeroYears.
	self assert: (-1 asGregorianYear distanceTo: 0 asGregorianYear) = oneYear.
	self assert: (1 asGregorianYear distanceTo: 0 asGregorianYear) = oneYear negated.
	self assert: (1 asGregorianYear distanceTo: -9 asGregorianYear) = tenYears negated
]
