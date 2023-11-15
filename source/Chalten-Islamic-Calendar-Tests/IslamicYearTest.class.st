Class {
	#name : 'IslamicYearTest',
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
		'thirtyDays'
	],
	#category : 'Chalten-Islamic-Calendar-Tests',
	#package : 'Chalten-Islamic-Calendar-Tests'
}

{ #category : 'accessing' }
IslamicYearTest class >> classUnderTest [

	^ChaltenYear
]

{ #category : 'initialization' }
IslamicYearTest >> setUp [
	calendar := ChaltenEnvironment calendarNamed: #IslamicCalendar.
	zeroYears := 0 yearsMeasure.
	oneYear := 1 yearMeasure.
	twoYears := 2 yearsMeasure.
	tenYears := 10 yearsMeasure.
	sixMonths := 6 monthsMeasure.
	thirteenMonths := 13 monthsMeasure.
	twentyNineDays := 29 daysMeasure.
	thirtyDays := 30 daysMeasure
]

{ #category : 'test accessing' }
IslamicYearTest >> testDates [

	self
		assert: 1428 asIslamicYear dates first
		equals: Muharram first , 1428.
	self
		assert: 1428 asIslamicYear dates last
		equals: DhuAlHijja thirtieth , 1428.
	self
		assert: 1427 asIslamicYear dates first
		equals: Muharram first , 1427.
	self
		assert: 1427 asIslamicYear dates last
		equals: DhuAlHijja twentyninth , 1427
]

{ #category : 'test interval protocol' }
IslamicYearTest >> testDistanceTo [

	self
		assert: (2005 asIslamicYear absoluteDistanceTo: 2008 asIslamicYear)
		equals: 3 yearsMeasure
]

{ #category : 'test comparing' }
IslamicYearTest >> testEqual [

	self assert: 2004 asIslamicYear equals: 2004 asIslamicYear.
	self deny: 2004 asIslamicYear = 2003 asIslamicYear
]

{ #category : 'test accessing' }
IslamicYearTest >> testFirstDate [

	self
		assert: 1428 asIslamicYear firstDate
		equals: Muharram first , 1428.
	self
		assert: 1427 asIslamicYear firstDate
		equals: Muharram first , 1427
]

{ #category : 'test accessing' }
IslamicYearTest >> testFirstDay [

	self
		assert: 1428 asIslamicYear firstDay
		equals: (Muharram first , 1428) day.
	self
		assert: 1427 asIslamicYear firstDay
		equals: (Muharram first , 1427) day
]

{ #category : 'test accessing' }
IslamicYearTest >> testFirstMonth [

	self assert: 1428 asIslamicYear firstMonth equals: Muharram , 1428.
	self assert: 1427 asIslamicYear firstMonth equals: Muharram , 1427
]

{ #category : 'test comparing' }
IslamicYearTest >> testGreaterThan [

	self assert: 2004 asIslamicYear > 2003 asIslamicYear.
	self deny: 2004 asIslamicYear > 2004 asIslamicYear.

	self
		should: [ 2004 asIslamicYear > YaumAlJuma ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: YaumAlJuma class
						 with: YaumAlJuma
						 with: 2004 asIslamicYear class
						 with: 2004 asIslamicYear) ].

	self
		should: [ 2004 asIslamicYear >= Ramadan third ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: 2004 asIslamicYear class
						 with: 2004 asIslamicYear
						 with: Ramadan third class
						 with: Ramadan third) ]
]

{ #category : 'test comparing' }
IslamicYearTest >> testHash [

	self assert: 2004 asIslamicYear hash equals: 2004 asIslamicYear hash.
	self deny: 2004 asIslamicYear hash = 2003 asIslamicYear hash
]

{ #category : 'test includes' }
IslamicYearTest >> testIncludesDate [
	self assert: (1429 asIslamicYear includes: Muharram first , 1429).
	self assert: (1429 asIslamicYear includes: DhuAlHijja twentyninth , 1429).
	self assert: (1428 asIslamicYear includes: Muharram first , 1428).
	self assert: (1428 asIslamicYear includes: DhuAlHijja thirtieth , 1428).
	self deny: (1428 asIslamicYear includes: Muharram first , 1429).
	self deny: (1428 asIslamicYear includes: DhuAlHijja twentyninth , 1427)
]

{ #category : 'test includes' }
IslamicYearTest >> testIncludesDateTime [
	self assert: (1429 asIslamicYear includes: (Muharram first , 1429) atMidnight).
	self assert: (1429 asIslamicYear includes: (DhuAlHijja twentyninth , 1429) atLastTimeOfDay).
	self assert: (1428 asIslamicYear includes: (Muharram first , 1428) atMidnight).
	self assert: (1428 asIslamicYear includes: (DhuAlHijja thirtieth , 1428) atLastTimeOfDay).
	self deny: (1428 asIslamicYear includes: (Muharram first , 1429) atMidnight).
	self deny: (1428 asIslamicYear includes: (DhuAlHijja twentyninth , 1427) atLastTimeOfDay)
]

{ #category : 'test includes' }
IslamicYearTest >> testIncludesMonthOfYear [
	self assert: (1429 asIslamicYear includes: Muharram , 1429).
	self assert: (1429 asIslamicYear includes: DhuAlHijja , 1429).
	self assert: (1428 asIslamicYear includes: Muharram , 1428).
	self assert: (1428 asIslamicYear includes: DhuAlHijja , 1428).
	self deny: (1428 asIslamicYear includes: Muharram , 1429).
	self deny: (1428 asIslamicYear includes: DhuAlHijja , 1427)
]

{ #category : 'test includes' }
IslamicYearTest >> testIncludesYear [
	self should: [ 2005 asIslamicYear includes: 2005 asIslamicYear ] raise: Exception
]

{ #category : 'test querying' }
IslamicYearTest >> testInvalidNextANumberOfYears [
	| anyUnit |
	anyUnit := BaseUnit named: 'Any Unit'.
	self should: [ 2004 asIslamicYear next: 1 ] raise: CanNotConvertMeasureException.
	self should: [ 2004 asIslamicYear next: (anyUnit with: 1) ] raise: CanNotConvertMeasureException
]

{ #category : 'test querying' }
IslamicYearTest >> testInvalidPreviousANumberOfYears [
	| anyUnit |
	anyUnit := BaseUnit named: 'Any Unit'.
	self should: [ 2004 asIslamicYear previous: 1 ] raise: CanNotConvertMeasureException.
	self should: [ 2004 asIslamicYear previous: (anyUnit with: 1) ] raise: CanNotConvertMeasureException
]

{ #category : 'test instance creation' }
IslamicYearTest >> testInvalidYear [

	self
		should: [ 1.5 asIslamicYear ]
		raise: InvalidYearNumberException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'1.5 is an invalid number for a year in the Islamic Calendar' ]
]

{ #category : 'test querying' }
IslamicYearTest >> testIsLeap [
	self assert: 2 asIslamicYear isLeap.
	self assert: 5 asIslamicYear isLeap.
	self assert: 7 asIslamicYear isLeap.
	self assert: 10 asIslamicYear isLeap.
	self assert: 13 asIslamicYear isLeap.
	self assert: 16 asIslamicYear isLeap.
	self assert: 18 asIslamicYear isLeap.
	self assert: 21 asIslamicYear isLeap.
	self assert: 24 asIslamicYear isLeap.
	self assert: 26 asIslamicYear isLeap.
	self assert: 29 asIslamicYear isLeap.
	self assert: 2001 asIslamicYear isLeap.
	self assert: 2004 asIslamicYear isLeap.
	self deny: 1 asIslamicYear isLeap.
	self deny: 3 asIslamicYear isLeap.
	self deny: 4 asIslamicYear isLeap.
	self deny: 22 asIslamicYear isLeap.
	self deny: 2000 asIslamicYear isLeap.
	self deny: 2007 asIslamicYear isLeap
]

{ #category : 'test accessing' }
IslamicYearTest >> testLastDate [

	self
		assert: 1428 asIslamicYear lastDate
		equals: DhuAlHijja thirtieth , 1428.
	self
		assert: 1427 asIslamicYear lastDate
		equals: DhuAlHijja twentyninth , 1427
]

{ #category : 'test accessing' }
IslamicYearTest >> testLastDay [

	self
		assert: 1428 asIslamicYear lastDay
		equals: (DhuAlHijja thirtieth , 1428) day.
	self
		assert: 1427 asIslamicYear lastDay
		equals: (DhuAlHijja twentyninth , 1427) day
]

{ #category : 'test accessing' }
IslamicYearTest >> testLastMonth [

	self assert: 1428 asIslamicYear lastMonth equals: DhuAlHijja , 1428.
	self assert: 1427 asIslamicYear lastMonth equals: DhuAlHijja , 1427
]

{ #category : 'test comparing' }
IslamicYearTest >> testLessThan [

	self assert: 2004 asIslamicYear < 2005 asIslamicYear.
	self deny: 2004 asIslamicYear < 2004 asIslamicYear.

	self
		should: [ 2004 asIslamicYear <= YaumAlJuma ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: YaumAlJuma class
						 with: YaumAlJuma
						 with: 2004 asIslamicYear class
						 with: 2004 asIslamicYear) ].

	self
		should: [ 2004 asIslamicYear < Ramadan third ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: 2004 asIslamicYear class
						 with: 2004 asIslamicYear
						 with: Ramadan third class
						 with: Ramadan third) ]
]

{ #category : 'test month of year creation' }
IslamicYearTest >> testMonth [

	| year |
	year := 1535 asIslamicYear.
	self assert: Muharram , 1535 equals: (year month: Muharram)
]

{ #category : 'test accessing' }
IslamicYearTest >> testMonths [

	self assert: 1428 asIslamicYear months size equals: 12.
	self assert: 1428 asIslamicYear months first equals: Muharram , 1428.
	self assert: 1428 asIslamicYear months last equals: DhuAlHijja , 1428
]

{ #category : 'test month of year' }
IslamicYearTest >> testMonthsOfYearsAccessing [

	| currentYear |
	currentYear := calendar currentYear.
	self
		assert: currentYear muharram
		equals: (Muharram ofYear: currentYear).
	self assert: currentYear safar equals: (Safar ofYear: currentYear).
	self assert: currentYear rabiI equals: (RabiI ofYear: currentYear).
	self assert: currentYear rabiII equals: (RabiII ofYear: currentYear).
	self
		assert: currentYear jumadaI
		equals: (JumadaI ofYear: currentYear).
	self
		assert: currentYear jumadaII
		equals: (JumadaII ofYear: currentYear).
	self assert: currentYear rajab equals: (Rajab ofYear: currentYear).
	self assert: currentYear shaban equals: (Shaban ofYear: currentYear).
	self
		assert: currentYear ramadan
		equals: (Ramadan ofYear: currentYear).
	self
		assert: currentYear shawwal
		equals: (Shawwal ofYear: currentYear).
	self
		assert: currentYear dhuAlQada
		equals: (DhuAlQada ofYear: currentYear).
	self
		assert: currentYear dhuAlHijja
		equals: (DhuAlHijja ofYear: currentYear)
]

{ #category : 'test querying' }
IslamicYearTest >> testNext [

	self assert: 2004 asIslamicYear next equals: 2005 asIslamicYear.
	self assert: -1 asIslamicYear next equals: 0 asIslamicYear
]

{ #category : 'test querying' }
IslamicYearTest >> testNextANumberOfYears [

	self
		assert: (2004 asIslamicYear next: zeroYears)
		equals: 2004 asIslamicYear.
	self
		assert: (2004 asIslamicYear next: oneYear)
		equals: 2005 asIslamicYear.
	self
		assert: (2004 asIslamicYear next: tenYears)
		equals: 2014 asIslamicYear.
	self assert: (-1 asIslamicYear next: oneYear) equals: 0 asIslamicYear.
	self
		should: [ 2004 asIslamicYear next: thirteenMonths ]
		raise: CanNotConvertMeasureException.
	self
		should: [ 2004 asIslamicYear next: sixMonths ]
		raise: CanNotConvertMeasureException
]

{ #category : 'test querying' }
IslamicYearTest >> testNextLeapYear [

	self
		assert: 2003 asIslamicYear nextLeapYear
		equals: 2004 asIslamicYear.
	self
		assert: 2004 asIslamicYear nextLeapYear
		equals: 2006 asIslamicYear.
	self
		assert: 1899 asIslamicYear nextLeapYear
		equals: 1900 asIslamicYear
]

{ #category : 'test accessing' }
IslamicYearTest >> testNumber [

	self assert: 2004 asIslamicYear number equals: 2004.
	self assert: 2003 asIslamicYear number equals: 2003
]

{ #category : 'test accessing' }
IslamicYearTest >> testNumberOfDays [

	self assert: 2004 asIslamicYear numberOfDays equals: 355 daysMeasure.
	self assert: 2003 asIslamicYear numberOfDays equals: 354 daysMeasure
]

{ #category : 'test accessing months' }
IslamicYearTest >> testNumberOfMonths [

	| leapYear nonleapYear |
	leapYear := 1535 asIslamicYear.
	nonleapYear := 1536 asIslamicYear.
	self assert: leapYear numberOfMonths equals: 12 monthsMeasure.
	self assert: nonleapYear numberOfMonths equals: 12 monthsMeasure
]

{ #category : 'test querying' }
IslamicYearTest >> testPrevious [

	self assert: 2004 asIslamicYear previous equals: 2003 asIslamicYear.
	self assert: 1 asIslamicYear previous equals: 0 asIslamicYear
]

{ #category : 'test querying' }
IslamicYearTest >> testPreviousANumberOfYears [

	self
		assert: (2004 asIslamicYear previous: zeroYears)
		equals: 2004 asIslamicYear.
	self
		assert: (2004 asIslamicYear previous: oneYear)
		equals: 2003 asIslamicYear.
	self
		assert: (2004 asIslamicYear previous: tenYears)
		equals: 1994 asIslamicYear.
	self
		assert: (1 asIslamicYear previous: oneYear)
		equals: 0 asIslamicYear.
	self
		should: [ 2004 asIslamicYear previous: thirteenMonths ]
		raise: CanNotConvertMeasureException.
	self
		should: [ 2004 asIslamicYear previous: sixMonths ]
		raise: CanNotConvertMeasureException
]

{ #category : 'test querying' }
IslamicYearTest >> testPreviousLeapYear [

	self
		assert: 2005 asIslamicYear previousLeapYear
		equals: 2004 asIslamicYear.
	self
		assert: 2004 asIslamicYear previousLeapYear
		equals: 2001 asIslamicYear.
	self
		assert: 1901 asIslamicYear previousLeapYear
		equals: 1900 asIslamicYear
]

{ #category : 'test printing' }
IslamicYearTest >> testPrintString [

	self assert: 2004 asIslamicYear printString equals: 'Year 2004'
]

{ #category : 'test interval protocol' }
IslamicYearTest >> testTo [

	self
		assert: (2004 asIslamicYear to: 2010 asIslamicYear) from
		equals: 2004 asIslamicYear.
	self
		assert: (2004 asIslamicYear to: 2010 asIslamicYear) to
		equals: 2010 asIslamicYear.
	self
		assert: (2004 asIslamicYear to: 2010 asIslamicYear) by
		equals: oneYear
]

{ #category : 'test interval protocol' }
IslamicYearTest >> testToBy [

	self
		assert:
		(2004 asIslamicYear to: 2010 asIslamicYear by: twoYears) from
		equals: 2004 asIslamicYear.
	self
		assert: (2004 asIslamicYear to: 2010 asIslamicYear by: twoYears) to
		equals: 2010 asIslamicYear.
	self
		assert: (2004 asIslamicYear to: 2010 asIslamicYear by: twoYears) by
		equals: twoYears
]

{ #category : 'test interval protocol' }
IslamicYearTest >> testToByDo [

	| number |
	number := 2004.
	(2004 asIslamicYear to: 2010 asIslamicYear by: twoYears) do: [ :aYear |
		self assert: aYear number equals: number.
		number := number + 2 ].
	self assert: number equals: 2012
]

{ #category : 'test interval protocol' }
IslamicYearTest >> testToByReverse [

	| coll number |
	coll := (2004 asIslamicYear to: 2011 asIslamicYear by: twoYears)
		        reverse.
	number := 2010.
	coll do: [ :aYear |
		self assert: aYear number equals: number.
		number := number - 2 ].
	self assert: number equals: 2002
]

{ #category : 'test interval protocol' }
IslamicYearTest >> testToNegativeBy [

	| interval number |
	interval := 2011 asIslamicYear to: 2004 asIslamicYear by:
	            twoYears negated.
	number := 2011.
	interval do: [ :aYear |
		self assert: aYear number equals: number.
		number := number - 2 ].
	self assert: number equals: 2003
]

{ #category : 'test instance creation' }
IslamicYearTest >> testValidYear [
	self shouldnt: [ 2000 asIslamicYear ] raise: InvalidYearNumberException
]

{ #category : 'test querying' }
IslamicYearTest >> testYearsFrom [

	self
		assert: (2004 asIslamicYear distanceFrom: 2003 asIslamicYear)
		equals: oneYear.
	self
		assert: (2004 asIslamicYear distanceFrom: 2005 asIslamicYear)
		equals: oneYear negated.
	self
		assert: (2005 asIslamicYear distanceFrom: 2005 asIslamicYear)
		equals: zeroYears.
	self
		assert: (-1 asIslamicYear distanceFrom: 0 asIslamicYear)
		equals: oneYear negated.
	self
		assert: (1 asIslamicYear distanceFrom: 0 asIslamicYear)
		equals: oneYear
]

{ #category : 'test querying' }
IslamicYearTest >> testYearsTo [

	self
		assert: (2004 asIslamicYear distanceTo: 2005 asIslamicYear)
		equals: oneYear.
	self
		assert: (2005 asIslamicYear distanceTo: 2004 asIslamicYear)
		equals: oneYear negated.
	self
		assert: (2005 asIslamicYear distanceTo: 2005 asIslamicYear)
		equals: zeroYears.
	self
		assert: (-1 asIslamicYear distanceTo: 0 asIslamicYear)
		equals: oneYear.
	self
		assert: (1 asIslamicYear distanceTo: 0 asIslamicYear)
		equals: oneYear negated.
	self
		assert: (1 asIslamicYear distanceTo: -9 asIslamicYear)
		equals: tenYears negated
]
