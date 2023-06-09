Class {
	#name : #HebrewYearTest,
	#superclass : #TestCase,
	#instVars : [
		'calendar',
		'zeroYears',
		'oneYear',
		'twoYears',
		'tenYears',
		'sixMonths',
		'twentyNineDays',
		'thirtyDays',
		'fourteenMonths'
	],
	#category : #'Chalten-Hebrew-Calendar-Tests'
}

{ #category : #accessing }
HebrewYearTest class >> classUnderTest [

	^ChaltenYear
]

{ #category : #initialization }
HebrewYearTest >> setUp [
	calendar := HebrewCalendar.
	zeroYears := calendar yearUnit with: 0.
	oneYear := calendar yearUnit with: 1.
	twoYears := calendar yearUnit with: 2.
	tenYears := calendar yearUnit with: 10.
	sixMonths := calendar monthUnit with: 6.
	fourteenMonths := calendar monthUnit with: 14.
	twentyNineDays := calendar dayUnit with: 29.
	thirtyDays := calendar dayUnit with: 30
]

{ #category : #'test accessing' }
HebrewYearTest >> testDates [
	self assert: 5767 asHebrewYear dates first = (Tishri first , 5767).
	self assert: 5767 asHebrewYear dates last = (Elul twentyninth , 5767).
	self assert: 5765 asHebrewYear dates first = (Tishri first , 5765).
	self assert: 5765 asHebrewYear dates last = (Elul twentyninth , 5765)
]

{ #category : #'test interval protocol' }
HebrewYearTest >> testDistanceTo [
	self assert: (5767 asHebrewYear absoluteDistanceTo: 5770 asHebrewYear) = 3 hebrewYear
]

{ #category : #'test comparing' }
HebrewYearTest >> testEqual [
	self assert: 5767 asHebrewYear = 5767 asHebrewYear.
	self deny: 5767 asHebrewYear = 5768 asHebrewYear
]

{ #category : #'test accessing' }
HebrewYearTest >> testFirstDate [
	self assert: 5767 asHebrewYear firstDate = (Tishri first , 5767).
	self assert: 5765 asHebrewYear firstDate = (Tishri first , 5765)
]

{ #category : #'test accessing' }
HebrewYearTest >> testFirstDay [
	self assert: 5767 asHebrewYear firstDay = (Tishri first , 5767) day.
	self assert: 5765 asHebrewYear firstDay = (Tishri first , 5765) day
]

{ #category : #'test accessing' }
HebrewYearTest >> testFirstMonth [
	self assert: 5767 asHebrewYear firstMonth = (Tishri , 5767).
	self assert: 5765 asHebrewYear firstMonth = (Tishri , 5765)
]

{ #category : #'test comparing' }
HebrewYearTest >> testGreaterThan [

	self assert: 5767 asHebrewYear > 5766 asHebrewYear.
	self deny: 5767 asHebrewYear > 5767 asHebrewYear.
	
	self should: [ 5767 asHebrewYear > YomShelishi ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: YomShelishi class
				with: YomShelishi
				with: 5767 asHebrewYear class
				with: 5767 asHebrewYear) ].
	
	self should: [ 5767 asHebrewYear >= Tishri third ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: 5767 asHebrewYear class
				with: 5767 asHebrewYear
				with: Tishri third class
				with: Tishri third) ]
]

{ #category : #'test comparing' }
HebrewYearTest >> testHash [
	self assert: 5767 asHebrewYear hash = 5767 asHebrewYear hash.
	self deny: 5767 asHebrewYear hash = 5766 asHebrewYear hash
]

{ #category : #'test includes' }
HebrewYearTest >> testIncludesDate [
	self assert: (5767 asHebrewYear includes: Nisan first , 5767).
	self assert: (5767 asHebrewYear includes: Adar twentyninth , 5767).
	self assert: (5766 asHebrewYear includes: Nisan first , 5766).
	self assert: (5768 asHebrewYear includes: AdarII twentyninth , 5768).
	self deny: (5767 asHebrewYear includes: Nisan first , 5766).
	self deny: (5767 asHebrewYear includes: Adar twentyninth , 5769)
]

{ #category : #'test includes' }
HebrewYearTest >> testIncludesDateTime [
	self assert: (5767 asHebrewYear includes: (Nisan first , 5767) atMidnight).
	self assert: (5767 asHebrewYear includes: (Adar twentyninth , 5767) atLastTimeOfDay).
	self assert: (5766 asHebrewYear includes: (Nisan first , 5766) atMidnight).
	self assert: (5768 asHebrewYear includes: (AdarII twentyninth , 5768) atLastTimeOfDay).
	self deny: (5767 asHebrewYear includes: (Nisan first , 5766) atMidnight).
	self deny: (5767 asHebrewYear includes: (Adar twentyninth , 5769) atLastTimeOfDay)
]

{ #category : #'test includes' }
HebrewYearTest >> testIncludesMonthOfYear [
	self assert: (5767 asHebrewYear includes: Nisan , 5767).
	self assert: (5767 asHebrewYear includes: Adar , 5767).
	self assert: (5766 asHebrewYear includes: Nisan , 5766).
	self assert: (5766 asHebrewYear includes: Adar , 5766).
	self deny: (5766 asHebrewYear includes: Nisan , 5767).
	self deny: (5766 asHebrewYear includes: AdarI , 5765)
]

{ #category : #'test includes' }
HebrewYearTest >> testIncludesYear [
	self should: [ 5767 asHebrewYear includes: 5767 asHebrewYear ] raise: Exception
]

{ #category : #'test querying' }
HebrewYearTest >> testInvalidNextANumberOfYears [
	| anyUnit |
	anyUnit := BaseUnit named: 'Any Unit'.
	self should: [ 5767 asHebrewYear next: 1 ] raise: CanNotConvertMeasureException.
	self should: [ 5767 asHebrewYear next: (anyUnit with: 1) ] raise: CanNotConvertMeasureException
]

{ #category : #'test querying' }
HebrewYearTest >> testInvalidPreviousANumberOfYears [
	| anyUnit |
	anyUnit := BaseUnit named: 'Any Unit'.
	self should: [ 5767 asHebrewYear previous: 1 ] raise: CanNotConvertMeasureException.
	self should: [ 5767 asHebrewYear previous: (anyUnit with: 1) ] raise: CanNotConvertMeasureException
]

{ #category : #'test instance creation' }
HebrewYearTest >> testInvalidYear [
	self
		should: [ 1.5 asHebrewYear ]
		raise: InvalidYearNumberException
		withExceptionDo: [ :exception | self assert: exception description = '1.5 is an invalid number for a year in the Hebrew Calendar' ]
]

{ #category : #'test querying' }
HebrewYearTest >> testIsLeap [
	self assert: 3 asHebrewYear isLeap.
	self assert: 6 asHebrewYear isLeap.
	self assert: 8 asHebrewYear isLeap.
	self assert: 11 asHebrewYear isLeap.
	self assert: 14 asHebrewYear isLeap.
	self assert: 17 asHebrewYear isLeap.
	self assert: 19 asHebrewYear isLeap.
	self assert: 22 asHebrewYear isLeap.
	self assert: 25 asHebrewYear isLeap.
	self assert: 27 asHebrewYear isLeap.
	self assert: 30 asHebrewYear isLeap.
	self assert: 5765 asHebrewYear isLeap.
	self assert: 5768 asHebrewYear isLeap.
	self deny: 1 asHebrewYear isLeap.
	self deny: 2 asHebrewYear isLeap.
	self deny: 4 asHebrewYear isLeap.
	self deny: 23 asHebrewYear isLeap.
	self deny: 5766 asHebrewYear isLeap.
	self deny: 5769 asHebrewYear isLeap
]

{ #category : #'test accessing' }
HebrewYearTest >> testLastDate [
	self assert: 5767 asHebrewYear lastDate = (Elul twentyninth , 5767).
	self assert: 5765 asHebrewYear lastDate = (Elul twentyninth , 5765)
]

{ #category : #'test accessing' }
HebrewYearTest >> testLastDay [
	self assert: 5767 asHebrewYear lastDay = (Elul twentyninth , 5767) day.
	self assert: 5765 asHebrewYear lastDay = (Elul twentyninth , 5765) day
]

{ #category : #'test accessing' }
HebrewYearTest >> testLastMonth [
	self assert: 5767 asHebrewYear lastMonth = (Elul , 5767).
	self assert: 5765 asHebrewYear lastMonth = (Elul , 5765)
]

{ #category : #'test comparing' }
HebrewYearTest >> testLessThan [

	self assert: 5767 asHebrewYear < 5768 asHebrewYear.
	self deny: 5767 asHebrewYear < 5767 asHebrewYear.
	
	self should: [ 5767 asHebrewYear <= YomShelishi ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: YomShelishi class
				with: YomShelishi
				with: 5767 asHebrewYear class
				with: 5767 asHebrewYear) ].
	
	self should: [ 5767 asHebrewYear < Tishri third ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: 5767 asHebrewYear class
				with: 5767 asHebrewYear
				with: Tishri third class
				with: Tishri third) ]
]

{ #category : #'test month of year creation' }
HebrewYearTest >> testMonth [

	| year |
	year := 5775 asHebrewYear.
	self assert: Av, 5775 = (year month: Av)
]

{ #category : #'test accessing' }
HebrewYearTest >> testMonths [
	self assert: 5767 asHebrewYear months size = 12.
	self assert: 5767 asHebrewYear months first = (Tishri , 5767).
	self assert: 5767 asHebrewYear months last = (Elul , 5767).
	self assert: 5765 asHebrewYear months size = 13.
	self assert: 5765 asHebrewYear months first = (Tishri , 5765).
	self assert: 5765 asHebrewYear months last = (Elul , 5765)
]

{ #category : #'test month of year' }
HebrewYearTest >> testMonthsOfYearsAccessing [
	| nonleapYear leapYear |
	nonleapYear := 5767 asHebrewYear.
	leapYear := 5768 asHebrewYear.
	self assert: nonleapYear nisan = (Nisan ofYear: nonleapYear).
	self assert: nonleapYear iyyar = (Iyyar ofYear: nonleapYear).
	self assert: nonleapYear sivan = (Sivan ofYear: nonleapYear).
	self assert: nonleapYear tammuz = (Tammuz ofYear: nonleapYear).
	self assert: nonleapYear av = (Av ofYear: nonleapYear).
	self assert: nonleapYear elul = (Elul ofYear: nonleapYear).
	self assert: nonleapYear tishri = (Tishri ofYear: nonleapYear).
	self assert: nonleapYear marheshvan = (Marheshvan ofYear: nonleapYear).
	self assert: nonleapYear kislev = (Kislev ofYear: nonleapYear).
	self assert: nonleapYear tevet = (Tevet ofYear: nonleapYear).
	self assert: nonleapYear shevat = (Shevat ofYear: nonleapYear).
	self assert: nonleapYear adar = (Adar ofYear: nonleapYear).
	self assert: leapYear adarI = (AdarI ofYear: leapYear).
	self assert: leapYear adarII = (AdarII ofYear: leapYear)
]

{ #category : #'test querying' }
HebrewYearTest >> testNext [
	self assert: 5766 asHebrewYear next = 5767 asHebrewYear.
	self assert: -1 asHebrewYear next = 0 asHebrewYear
]

{ #category : #'test querying' }
HebrewYearTest >> testNextANumberOfYears [
	self assert: (5767 asHebrewYear next: zeroYears) = 5767 asHebrewYear.
	self assert: (5767 asHebrewYear next: oneYear) = 5768 asHebrewYear.
	self assert: (5767 asHebrewYear next: tenYears) = 5777 asHebrewYear.
	self assert: (-1 asHebrewYear next: oneYear) = 0 asHebrewYear.
	self should: [ 5767 asHebrewYear next: fourteenMonths ] raise: CanNotConvertMeasureException.
	self should: [ 5767 asHebrewYear next: sixMonths ] raise: CanNotConvertMeasureException
]

{ #category : #'test querying' }
HebrewYearTest >> testNextLeapYear [
	self assert: 5766 asHebrewYear nextLeapYear = 5768 asHebrewYear.
	self assert: 5768 asHebrewYear nextLeapYear = 5771 asHebrewYear.
	self assert: 5600 asHebrewYear nextLeapYear = 5603 asHebrewYear
]

{ #category : #'test accessing' }
HebrewYearTest >> testNumber [
	self assert: 5767 asHebrewYear number = 5767.
	self assert: 5765 asHebrewYear number = 5765
]

{ #category : #'test accessing' }
HebrewYearTest >> testNumberOfDays [
	self assert: 5761 asHebrewYear numberOfDays = 353 daysMeasure.
	self assert: 5762 asHebrewYear numberOfDays = 354 daysMeasure.
	self assert: 5763 asHebrewYear numberOfDays = 385 daysMeasure.
	self assert: 5764 asHebrewYear numberOfDays = 355 daysMeasure.
	self assert: 5765 asHebrewYear numberOfDays = 383 daysMeasure.
	self assert: 5766 asHebrewYear numberOfDays = 354 daysMeasure.
	self assert: 5767 asHebrewYear numberOfDays = 355 daysMeasure.
	self assert: 5768 asHebrewYear numberOfDays = 383 daysMeasure.
	self assert: 5769 asHebrewYear numberOfDays = 354 daysMeasure.
	self assert: 5770 asHebrewYear numberOfDays = 355 daysMeasure.
	self assert: 5771 asHebrewYear numberOfDays = 385 daysMeasure.
	self assert: 5772 asHebrewYear numberOfDays = 354 daysMeasure.
	self assert: 5773 asHebrewYear numberOfDays = 353 daysMeasure.
	self assert: 5774 asHebrewYear numberOfDays = 385 daysMeasure.
	self assert: 5775 asHebrewYear numberOfDays = 354 daysMeasure.
	self assert: 5776 asHebrewYear numberOfDays = 385 daysMeasure.
	self assert: 5777 asHebrewYear numberOfDays = 353 daysMeasure.
	self assert: 5778 asHebrewYear numberOfDays = 354 daysMeasure.
	self assert: 5779 asHebrewYear numberOfDays = 385 daysMeasure.
	self assert: 5780 asHebrewYear numberOfDays = 355 daysMeasure.
	self assert: 5781 asHebrewYear numberOfDays = 353 daysMeasure.
	self assert: 5782 asHebrewYear numberOfDays = 384 daysMeasure
]

{ #category : #'test accessing months' }
HebrewYearTest >> testNumberOfMonths [

	| leapYear nonleapYear |
	leapYear := 5776 asHebrewYear.
	nonleapYear := 5775 asHebrewYear.
	
	self assert: leapYear numberOfMonths = 13 hebrewMonth.
	self assert: nonleapYear numberOfMonths = 12 hebrewMonth
]

{ #category : #'test querying' }
HebrewYearTest >> testPrevious [
	self assert: 5767 asHebrewYear previous = 5766 asHebrewYear.
	self assert: 1 asHebrewYear previous = 0 asHebrewYear
]

{ #category : #'test querying' }
HebrewYearTest >> testPreviousANumberOfYears [
	self assert: (5767 asHebrewYear previous: zeroYears) = 5767 asHebrewYear.
	self assert: (5767 asHebrewYear previous: oneYear) = 5766 asHebrewYear.
	self assert: (5767 asHebrewYear previous: tenYears) = 5757 asHebrewYear.
	self assert: (1 asHebrewYear previous: oneYear) = 0 asHebrewYear.
	self should: [ 5767 asHebrewYear previous: fourteenMonths ] raise: CanNotConvertMeasureException.
	self should: [ 5767 asHebrewYear previous: sixMonths ] raise: CanNotConvertMeasureException
]

{ #category : #'test querying' }
HebrewYearTest >> testPreviousLeapYear [
	self assert: 5767 asHebrewYear previousLeapYear = 5765 asHebrewYear.
	self assert: 5766 asHebrewYear previousLeapYear = 5765 asHebrewYear.
	self assert: 5601 asHebrewYear previousLeapYear = 5600 asHebrewYear
]

{ #category : #'test printing' }
HebrewYearTest >> testPrintString [
	self assert: 5767 asHebrewYear printString = 'Year 5767'
]

{ #category : #'test interval protocol' }
HebrewYearTest >> testTo [
	| interval |
	interval := 5767 asHebrewYear to: 5770 asHebrewYear.
	self assert: interval from = 5767 asHebrewYear.
	self assert: interval to = 5770 asHebrewYear.
	self assert: interval by = oneYear
]

{ #category : #'test interval protocol' }
HebrewYearTest >> testToBy [
	| interval |
	interval := 5767 asHebrewYear to: 5770 asHebrewYear by: twoYears.
	self assert: interval from = 5767 asHebrewYear.
	self assert: interval to = 5770 asHebrewYear.
	self assert: interval by = twoYears
]

{ #category : #'test interval protocol' }
HebrewYearTest >> testToByDo [
	| number |
	number := 5767.
	(5767 asHebrewYear to: 5770 asHebrewYear by: twoYears)
		do: [ :year | 
			self assert: year number = number.
			number := number + 2 ].
	self assert: number = 5771
]

{ #category : #'test interval protocol' }
HebrewYearTest >> testToByReverse [
	| coll number |
	coll := (5767 asHebrewYear to: 5771 asHebrewYear by: twoYears) reverse.
	number := 5771.
	coll
		do: [ :year | 
			self assert: year number = number.
			number := number - 2 ].
	self assert: number = 5765
]

{ #category : #'test interval protocol' }
HebrewYearTest >> testToNegativeBy [
	| interval number |
	interval := 5771 asHebrewYear to: 5767 asHebrewYear by: twoYears negated.
	number := 5771.
	interval
		do: [ :year | 
			self assert: year number = number.
			number := number - 2 ].
	self assert: number = 5765
]

{ #category : #'test instance creation' }
HebrewYearTest >> testValidYear [
	self shouldnt: [ 5767 asHebrewYear ] raise: InvalidYearNumberException
]

{ #category : #'test querying' }
HebrewYearTest >> testYearsFrom [
	self assert: (5767 asHebrewYear distanceFrom: 5766 asHebrewYear) = oneYear.
	self assert: (5767 asHebrewYear distanceFrom: 5768 asHebrewYear) = oneYear negated.
	self assert: (5767 asHebrewYear distanceFrom: 5767 asHebrewYear) = zeroYears.
	self assert: (-1 asHebrewYear distanceFrom: 0 asHebrewYear) = oneYear negated.
	self assert: (1 asHebrewYear distanceFrom: 0 asHebrewYear) = oneYear
]

{ #category : #'test querying' }
HebrewYearTest >> testYearsTo [
	self assert: (5767 asHebrewYear distanceTo: 5768 asHebrewYear) = oneYear.
	self assert: (5767 asHebrewYear distanceTo: 5766 asHebrewYear) = oneYear negated.
	self assert: (5767 asHebrewYear distanceTo: 5767 asHebrewYear) = zeroYears.
	self assert: (-1 asHebrewYear distanceTo: 0 asHebrewYear) = oneYear.
	self assert: (1 asHebrewYear distanceTo: 0 asHebrewYear) = oneYear negated.
	self assert: (1 asHebrewYear distanceTo: -9 asHebrewYear) = tenYears negated
]
