Class {
	#name : #IslamicMonthOfYearTest,
	#superclass : #TestCase,
	#instVars : [
		'calendar',
		'zeroMonths',
		'oneMonth',
		'twoMonths',
		'elevenMonths',
		'twelveMonths',
		'thirteenMonths',
		'oneYear',
		'twoYears'
	],
	#category : #'Chalten-Islamic-Calendar-Tests'
}

{ #category : #accessing }
IslamicMonthOfYearTest class >> classUnderTest [

	^MonthOfYear
]

{ #category : #initialization }
IslamicMonthOfYearTest >> setUp [
	calendar := IslamicCalendar.
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
IslamicMonthOfYearTest >> testComparing [

	self assert: (Rajab of: 5774) > (Muharram of: 5774).
	self assert: (Ramadan of: 5774) < (RabiI of: 5775).
	self deny: (Shaban of: 5774) < (RabiII of: 5774).
	
	self should: [ (Ramadan of: 5774) > DhuAlHijja second ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: DhuAlHijja second class
				with: DhuAlHijja second
				with: (Ramadan of: 5774) class
				with: (Ramadan of: 5774)) ].
	
	self should: [ (Ramadan of: 5774) < DhuAlHijja ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: (Ramadan of: 5774) class
				with: (Ramadan of: 5774)
				with: DhuAlHijja class
				with: DhuAlHijja) ]
]

{ #category : #'test instance creation' }
IslamicMonthOfYearTest >> testCreation [
	self assert: (MonthOfYear yearNumber: 2004 monthNumber: 1 calendar: calendar) year = 2004 asIslamicYear.
	self assert: (MonthOfYear yearNumber: 2004 monthNumber: 1 calendar: calendar) monthNumber = 1.
	self assert: (MonthOfYear yearNumber: 2004 month: calendar muharram) year = 2004 asIslamicYear.
	self assert: (MonthOfYear yearNumber: 2004 month: calendar muharram) monthNumber = 1.
	self assert: (MonthOfYear year: 2004 asIslamicYear monthNumber: 1) year = 2004 asIslamicYear.
	self assert: (MonthOfYear year: 2004 asIslamicYear monthNumber: 1) monthNumber = 1.
	self assert: (MonthOfYear muharramOf: 2004 asIslamicYear) year = 2004 asIslamicYear.
	self assert: (MonthOfYear muharramOf: 2004 asIslamicYear) monthNumber = 1.
	self assert: (MonthOfYear safarOf: 2004 asIslamicYear) year = 2004 asIslamicYear.
	self assert: (MonthOfYear safarOf: 2004 asIslamicYear) monthNumber = 2.
	self assert: (MonthOfYear rabiIOf: 2004 asIslamicYear) year = 2004 asIslamicYear.
	self assert: (MonthOfYear rabiIOf: 2004 asIslamicYear) monthNumber = 3.
	self assert: (MonthOfYear rabiIIOf: 2004 asIslamicYear) year = 2004 asIslamicYear.
	self assert: (MonthOfYear rabiIIOf: 2004 asIslamicYear) monthNumber = 4.
	self assert: (MonthOfYear jumadaIOf: 2004 asIslamicYear) year = 2004 asIslamicYear.
	self assert: (MonthOfYear jumadaIOf: 2004 asIslamicYear) monthNumber = 5.
	self assert: (MonthOfYear jumadaIIOf: 2004 asIslamicYear) year = 2004 asIslamicYear.
	self assert: (MonthOfYear jumadaIIOf: 2004 asIslamicYear) monthNumber = 6.
	self assert: (MonthOfYear rajabOf: 2004 asIslamicYear) year = 2004 asIslamicYear.
	self assert: (MonthOfYear rajabOf: 2004 asIslamicYear) monthNumber = 7.
	self assert: (MonthOfYear shabanOf: 2004 asIslamicYear) year = 2004 asIslamicYear.
	self assert: (MonthOfYear shabanOf: 2004 asIslamicYear) monthNumber = 8.
	self assert: (MonthOfYear ramadanOf: 2004 asIslamicYear) year = 2004 asIslamicYear.
	self assert: (MonthOfYear ramadanOf: 2004 asIslamicYear) monthNumber = 9.
	self assert: (MonthOfYear shawwalOf: 2004 asIslamicYear) year = 2004 asIslamicYear.
	self assert: (MonthOfYear shawwalOf: 2004 asIslamicYear) monthNumber = 10.
	self assert: (MonthOfYear dhuAlQadaOf: 2004 asIslamicYear) year = 2004 asIslamicYear.
	self assert: (MonthOfYear dhuAlQadaOf: 2004 asIslamicYear) monthNumber = 11.
	self assert: (MonthOfYear dhuAlHijjaOf: 2004 asIslamicYear) year = 2004 asIslamicYear.
	self assert: (MonthOfYear dhuAlHijjaOf: 2004 asIslamicYear) monthNumber = 12
]

{ #category : #'test accessing' }
IslamicMonthOfYearTest >> testDates [
	self
		assert:
			(MonthOfYear muharramOf: 2004 asIslamicYear) dates first
				=
					(FixedDate
						yearNumber: 2004
						monthNumber: 1
						dayNumber: 1
						calendar: calendar).
	self
		assert:
			(MonthOfYear muharramOf: 2004 asIslamicYear) dates last
				=
					(FixedDate
						yearNumber: 2004
						monthNumber: 1
						dayNumber: 30
						calendar: calendar)
]

{ #category : #'test comparing' }
IslamicMonthOfYearTest >> testEqual [
	self assert: (MonthOfYear muharramOf: 2004 asIslamicYear) = (MonthOfYear muharramOf: 2004 asIslamicYear).
	self assert: (MonthOfYear muharramOf: 2003 asIslamicYear) = (MonthOfYear muharramOf: 2003 asIslamicYear)
]

{ #category : #'test accessing' }
IslamicMonthOfYearTest >> testFirstDate [
	self assert: (MonthOfYear muharramOf: 1428 asIslamicYear) firstDate = (Muharram first , 1428)
]

{ #category : #'test accessing' }
IslamicMonthOfYearTest >> testFirstDay [
	self assert: (MonthOfYear muharramOf: 1428 asIslamicYear) firstDay = calendar yaumAsSabt
]

{ #category : #'test comparing' }
IslamicMonthOfYearTest >> testHash [
	self assert: (MonthOfYear muharramOf: 2004 asIslamicYear) hash = (MonthOfYear muharramOf: 2004 asIslamicYear) hash.
	self assert: (MonthOfYear muharramOf: 2003 asIslamicYear) hash = (MonthOfYear muharramOf: 2003 asIslamicYear) hash
]

{ #category : #'test querying' }
IslamicMonthOfYearTest >> testIncludesDate [
	self 
		assert: (Muharram , 2005 includes: (FixedDate 
						yearNumber: 2005
						monthNumber: 1
						dayNumber: 1
						calendar: calendar)).
	self 
		assert: (Muharram , 2005 includes: (FixedDate 
						yearNumber: 2005
						monthNumber: 1
						dayNumber: 30
						calendar: calendar)).
	self 
		deny: (Muharram , 2005 includes: (FixedDate 
						yearNumber: 2005
						monthNumber: 2
						dayNumber: 1
						calendar: calendar)).
	self 
		deny: (Muharram , 2005 includes: (FixedDate 
						yearNumber: 2004
						monthNumber: 12
						dayNumber: 30
						calendar: calendar))
]

{ #category : #'test querying' }
IslamicMonthOfYearTest >> testIncludesDateTime [
	self assert: (Muharram , 2005 
				includes: (FixedDate 
						yearNumber: 2005
						monthNumber: 1
						dayNumber: 1
						calendar: calendar) atMidnight).
	self assert: (Muharram , 2005 
				includes: (FixedDate 
						yearNumber: 2005
						monthNumber: 1
						dayNumber: 30
						calendar: calendar) atLastTimeOfDay).
	self deny: (Muharram , 2005 
				includes: (FixedDate 
						yearNumber: 2005
						monthNumber: 2
						dayNumber: 1
						calendar: calendar) atMidnight).
	self deny: (Muharram , 2005 
				includes: (FixedDate 
						yearNumber: 2004
						monthNumber: 12
						dayNumber: 30
						calendar: calendar) atLastTimeOfDay)
]

{ #category : #'test querying' }
IslamicMonthOfYearTest >> testIncludesMonthOfYear [

	self
		should: [(MonthOfYear yearNumber: 2005 monthNumber: 1) includes: (MonthOfYear yearNumber: 2005 monthNumber: 1)]
		raise: Exception
]

{ #category : #'test querying' }
IslamicMonthOfYearTest >> testIncludesYear [
	self should: [ (MonthOfYear yearNumber: 2005 monthNumber: 1) includes: 2005 asIslamicYear ] raise: Exception
]

{ #category : #'test instance creation' }
IslamicMonthOfYearTest >> testInvalidCreation [

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

{ #category : #'test accessing' }
IslamicMonthOfYearTest >> testLastDate [
	self assert: (MonthOfYear muharramOf: 1428 asIslamicYear) lastDate = (Muharram thirtieth , 1428).
	self assert: (MonthOfYear dhuAlHijjaOf: 1428 asIslamicYear) lastDate = (DhuAlHijja thirtieth , 1428).
	self assert: (MonthOfYear dhuAlHijjaOf: 1427 asIslamicYear) lastDate = (DhuAlHijja twentyninth , 1427)
]

{ #category : #'test accessing' }
IslamicMonthOfYearTest >> testLastDay [
	self assert: (MonthOfYear muharramOf: 1428 asIslamicYear) lastDay = calendar yaumAlAhad.
	self assert: (MonthOfYear dhuAlHijjaOf: 1428 asIslamicYear) lastDay = calendar yaumAlArbaa.
	self assert: (MonthOfYear dhuAlHijjaOf: 1427 asIslamicYear) lastDay = calendar yaumAlJuma
]

{ #category : #'test accessing' }
IslamicMonthOfYearTest >> testLastDayNumber [
	self
		assert:
			(MonthOfYear muharramOf: 2004 asIslamicYear) lastDayNumber
				= (MonthOfYear muharramOf: 2004 asIslamicYear) numberOfDays amount.
	self
		assert:
			(MonthOfYear safarOf: 2004 asIslamicYear) lastDayNumber
				= (MonthOfYear safarOf: 2004 asIslamicYear) numberOfDays amount.
	self
		assert:
			(MonthOfYear rabiIOf: 2004 asIslamicYear) lastDayNumber
				= (MonthOfYear rabiIOf: 2004 asIslamicYear) numberOfDays amount.
	self
		assert:
			(MonthOfYear rabiIIOf: 2004 asIslamicYear) lastDayNumber
				= (MonthOfYear rabiIIOf: 2004 asIslamicYear) numberOfDays amount.
	self
		assert:
			(MonthOfYear jumadaIOf: 2004 asIslamicYear) lastDayNumber
				= (MonthOfYear jumadaIOf: 2004 asIslamicYear) numberOfDays amount.
	self
		assert:
			(MonthOfYear jumadaIIOf: 2004 asIslamicYear) lastDayNumber
				= (MonthOfYear jumadaIIOf: 2004 asIslamicYear) numberOfDays amount.
	self
		assert:
			(MonthOfYear rajabOf: 2004 asIslamicYear) lastDayNumber
				= (MonthOfYear rajabOf: 2004 asIslamicYear) numberOfDays amount.
	self
		assert:
			(MonthOfYear shabanOf: 2004 asIslamicYear) lastDayNumber
				= (MonthOfYear shabanOf: 2004 asIslamicYear) numberOfDays amount.
	self
		assert:
			(MonthOfYear ramadanOf: 2004 asIslamicYear) lastDayNumber
				= (MonthOfYear ramadanOf: 2004 asIslamicYear) numberOfDays amount.
	self
		assert:
			(MonthOfYear shawwalOf: 2004 asIslamicYear) lastDayNumber
				= (MonthOfYear shawwalOf: 2004 asIslamicYear) numberOfDays amount.
	self
		assert:
			(MonthOfYear dhuAlQadaOf: 2004 asIslamicYear) lastDayNumber
				= (MonthOfYear dhuAlQadaOf: 2004 asIslamicYear) numberOfDays amount.
	self
		assert:
			(MonthOfYear dhuAlHijjaOf: 2004 asIslamicYear) lastDayNumber
				= (MonthOfYear dhuAlHijjaOf: 2004 asIslamicYear) numberOfDays amount.
	self
		assert:
			(MonthOfYear dhuAlHijjaOf: 2003 asIslamicYear) lastDayNumber
				= (MonthOfYear dhuAlHijjaOf: 2003 asIslamicYear) numberOfDays amount
]

{ #category : #'test querying' }
IslamicMonthOfYearTest >> testMonthsFrom [

	self assert: (Muharram, 2004 distanceFrom: DhuAlHijja, 2003) = oneMonth.
	self assert: (Muharram, 2004 distanceFrom: DhuAlHijja, 2004) = elevenMonths negated.
	self assert: (Muharram, 2004 distanceFrom: Muharram, 2004) = zeroMonths.
	self assert: (Muharram, 2004 distanceFrom: Muharram, 2003) = twelveMonths
]

{ #category : #'test querying' }
IslamicMonthOfYearTest >> testMonthsTo [

	self assert: (Muharram, 2004 distanceTo: DhuAlHijja, 2003) = oneMonth negated.
	self assert: (Muharram, 2004 distanceTo: DhuAlHijja, 2004) = elevenMonths.
	self assert: (Muharram, 2004 distanceTo: Muharram, 2004) = zeroMonths.
	self assert: (Muharram, 2004 distanceTo: Muharram, 2005) = twelveMonths
]

{ #category : #'test accessing' }
IslamicMonthOfYearTest >> testName [
	self assert: (MonthOfYear muharramOf: 2004 asIslamicYear) name = 'Muharram'.
	self assert: (MonthOfYear safarOf: 2004 asIslamicYear) name = 'Safar'.
	self assert: (MonthOfYear rabiIOf: 2004 asIslamicYear) name = 'Rabi` I (Rabi` al-Awwal)'.
	self assert: (MonthOfYear rabiIIOf: 2004 asIslamicYear) name = 'Rabi` II (Rabi` al-Ahir)'.
	self assert: (MonthOfYear jumadaIOf: 2004 asIslamicYear) name = 'Jumada I (Jumada al-Ula)'.
	self assert: (MonthOfYear jumadaIIOf: 2004 asIslamicYear) name = 'Jumada II (Jumada al-Ahira)'.
	self assert: (MonthOfYear rajabOf: 2004 asIslamicYear) name = 'Rajab'.
	self assert: (MonthOfYear shabanOf: 2004 asIslamicYear) name = 'Sha`ban'.
	self assert: (MonthOfYear ramadanOf: 2004 asIslamicYear) name = 'Ramadan'.
	self assert: (MonthOfYear shawwalOf: 2004 asIslamicYear) name = 'Shawwal'.
	self assert: (MonthOfYear dhuAlQadaOf: 2004 asIslamicYear) name = 'Dhu al-Qa`da'.
	self assert: (MonthOfYear dhuAlHijjaOf: 2004 asIslamicYear) name = 'Dhu al-Hijja'
]

{ #category : #'test querying' }
IslamicMonthOfYearTest >> testNext [

	self assert: (Muharram, 2004) next = (Safar, 2004).
	self assert: (DhuAlHijja, 2004) next = (Muharram, 2005)
]

{ #category : #'test querying' }
IslamicMonthOfYearTest >> testNextANumberOfMonths [
	self assert: (Muharram , 2004 next: oneMonth) = (Safar , 2004).
	self assert: (Muharram , 2004 next: elevenMonths) = (DhuAlHijja , 2004).
	self assert: (Muharram , 2004 next: twelveMonths) = (Muharram , 2005).
	self assert: (Muharram , 2004 next: thirteenMonths) = (Safar , 2005).
	self assert: (Muharram , 2004 next: zeroMonths) = (Muharram , 2004).
	self assert: (Muharram , 2004 next: oneYear) = (Muharram , 2005).
	self assert: (RabiII , 2004 next: oneYear) = (RabiII , 2005).
	self assert: (Muharram , 2004 next: 0.5 monthsMeasure) = (Muharram , 2004).
	self assert: (Muharram , 2004 next: 1.5 monthsMeasure) = (Safar , 2004)
]

{ #category : #'test querying' }
IslamicMonthOfYearTest >> testNextMonth [

	| monthOfYear |

	monthOfYear := Muharram, 2004.
	self assert: (monthOfYear nextMonth: calendar muharram) = (Muharram , 2005).
	self assert: (monthOfYear nextMonth: Muharram in: twoYears) = (Muharram , 2006).
	self assert: (monthOfYear nextMonth: calendar safar) = (Safar , 2004).
	self assert: (monthOfYear nextMonth: Safar in: twoYears) = (Safar , 2006).
	
	monthOfYear := Rajab, 2004.
	self assert: (monthOfYear nextMonth: Muharram) = (Muharram , 2005).
	self assert: (monthOfYear nextMonth: calendar muharram in: twoYears) = (Muharram , 2006).

	monthOfYear := Muharram, -1.
	self assert: (monthOfYear nextMonth: calendar muharram) = (Muharram , 0).
	self assert: (monthOfYear nextMonth: calendar dhuAlHijja) = (DhuAlHijja , -1)
]

{ #category : #'test accessing' }
IslamicMonthOfYearTest >> testNumberOfDays [
	self assert: (MonthOfYear muharramOf: 2004 asIslamicYear) numberOfDays = 30 daysMeasure.
	self assert: (MonthOfYear safarOf: 2004 asIslamicYear) numberOfDays = 29 daysMeasure.
	self assert: (MonthOfYear rabiIOf: 2004 asIslamicYear) numberOfDays = 30 daysMeasure.
	self assert: (MonthOfYear rabiIIOf: 2004 asIslamicYear) numberOfDays = 29 daysMeasure.
	self assert: (MonthOfYear jumadaIOf: 2004 asIslamicYear) numberOfDays = 30 daysMeasure.
	self assert: (MonthOfYear jumadaIIOf: 2004 asIslamicYear) numberOfDays = 29 daysMeasure.
	self assert: (MonthOfYear rajabOf: 2004 asIslamicYear) numberOfDays = 30 daysMeasure.
	self assert: (MonthOfYear shabanOf: 2004 asIslamicYear) numberOfDays = 29 daysMeasure.
	self assert: (MonthOfYear ramadanOf: 2004 asIslamicYear) numberOfDays = 30 daysMeasure.
	self assert: (MonthOfYear shawwalOf: 2004 asIslamicYear) numberOfDays = 29 daysMeasure.
	self assert: (MonthOfYear dhuAlQadaOf: 2004 asIslamicYear) numberOfDays = 30 daysMeasure.
	self assert: (MonthOfYear dhuAlHijjaOf: 2004 asIslamicYear) numberOfDays = 30 daysMeasure
]

{ #category : #'test accessing' }
IslamicMonthOfYearTest >> testNumberOfDaysFromEpoch [
	self assert: (MonthOfYear muharramOf: 1 asIslamicYear) numberOfDaysFromEpoch = 227014 daysMeasure.
	self assert: (MonthOfYear muharramOf: 2 asIslamicYear) numberOfDaysFromEpoch = 227368 daysMeasure.
	self assert: (MonthOfYear muharramOf: 1428 asIslamicYear) numberOfDaysFromEpoch = 732695 daysMeasure
]

{ #category : #'test accessing' }
IslamicMonthOfYearTest >> testOrdinalDay [
	"To obtain a certain day of the month, for example the second yaum al-arba`a`."

	| monthOfYear |
	monthOfYear := MonthOfYear muharramOf: 1428 asIslamicYear.
	self assert: (monthOfYear ordinal: 2 day: calendar yaumAlArbaa) = (Muharram twelfth , 1428)
]

{ #category : #'test querying' }
IslamicMonthOfYearTest >> testPrevious [

	self assert: (Muharram, 2004) previous = (DhuAlHijja, 2003).
	self assert: (DhuAlHijja, 2004) previous = (DhuAlQada, 2004)
]

{ #category : #'test querying' }
IslamicMonthOfYearTest >> testPreviousANumberOfMonths [

	self assert: ((Muharram, 2004) previous: oneMonth) = (DhuAlHijja, 2003).
	self assert: ((Muharram, 2004) previous: elevenMonths) = (Safar, 2003).
	self assert: ((Muharram, 2004) previous: twelveMonths) = (Muharram, 2003).
	self assert: ((Safar, 2004) previous: thirteenMonths) = (Muharram, 2003).
	self assert: ((Muharram, 2004) previous: thirteenMonths) = (DhuAlHijja, 2002).
	self assert: ((Muharram, 2004) previous: zeroMonths) = (Muharram, 2004).
	self assert: ((Muharram, 2004) previous: oneYear) = (Muharram, 2003).
	self assert: ((Rajab, 2004) previous: oneYear) = (Rajab, 2003).
	self assert: ((RabiII, 2004) previous: oneMonth) = (RabiI, 2004).
	self assert: ((Rajab, 2004) previous: elevenMonths) = (Shaban, 2003).
	self assert: ((Rajab, 2004) previous: twelveMonths) = (Rajab, 2003)
]

{ #category : #'test querying' }
IslamicMonthOfYearTest >> testPreviousMonth [

	| monthOfYear |

	monthOfYear := Muharram, 2004.
	self assert: (monthOfYear previousMonth: calendar muharram) = (Muharram , 2003).
	self assert: (monthOfYear previousMonth: Muharram in: twoYears) = (Muharram , 2002).

	monthOfYear := RabiII, 2004.
	self assert: (monthOfYear previousMonth: calendar safar) = (Safar , 2004).
	self assert: (monthOfYear previousMonth: calendar safar in: twoYears) = (Safar , 2002).

	monthOfYear := Rajab, 2004.
	self assert: (monthOfYear previousMonth: calendar muharram) = (Muharram , 2004).
	self assert: (monthOfYear previousMonth: Muharram in: twoYears) = (Muharram , 2002).

	monthOfYear := Muharram, 1.
	self assert: (monthOfYear previousMonth: calendar muharram) = (Muharram , 0).
	self assert: (monthOfYear previousMonth: DhuAlHijja) = (DhuAlHijja , 0)
]

{ #category : #'test printing' }
IslamicMonthOfYearTest >> testPrintString [
	| year |
	year := 2004 asIslamicYear.
	self assert: (MonthOfYear muharramOf: year) printString = (calendar muharram printString , ' of ' , year printString)
]

{ #category : #'test interval protocol' }
IslamicMonthOfYearTest >> testTo [
	| interval |
	interval := (MonthOfYear muharramOf: 2004 asIslamicYear) to: (MonthOfYear safarOf: 2004 asIslamicYear).
	self assert: interval from = (MonthOfYear muharramOf: 2004 asIslamicYear).
	self assert: interval to = (MonthOfYear safarOf: 2004 asIslamicYear).
	self assert: interval by = oneMonth
]

{ #category : #'test interval protocol' }
IslamicMonthOfYearTest >> testToBy [
	| interval |
	interval := (MonthOfYear muharramOf: 2004 asIslamicYear) to: (MonthOfYear rabiIOf: 2004 asIslamicYear) by:
		twoMonths.
	self assert: interval from = (MonthOfYear muharramOf: 2004 asIslamicYear).
	self assert: interval to = (MonthOfYear rabiIOf: 2004 asIslamicYear).
	self assert: interval by = twoMonths
]

{ #category : #'test interval protocol' }
IslamicMonthOfYearTest >> testToByDo [
	| number |
	number := 1.
	((MonthOfYear muharramOf: 2004 asIslamicYear) to: (MonthOfYear dhuAlHijjaOf: 2004 asIslamicYear) by: twoMonths)
		do: [ :month | 
			self assert: month monthNumber = number.
			number := number + 2 ].
	self assert: number = 13
]

{ #category : #'test interval protocol' }
IslamicMonthOfYearTest >> testToByYearsDo [

	| yearNumber |
	yearNumber := 2004.
	(Muharram, 2004 to: DhuAlHijja, 2010 by: twelveMonths) do: [:month |
		self assert: month monthNumber = 1.
		self assert: month year number = yearNumber.
		yearNumber := yearNumber + 1].
	self assert: yearNumber = 2011
]

{ #category : #'test interval protocol' }
IslamicMonthOfYearTest >> testToNegativeBy [
	| interval number |
	interval := DhuAlHijja , 2004 to: Muharram , 2004 by: -2 monthsMeasure.
	number := 12.
	interval
		do: [ :monthOfYear | 
			self assert: monthOfYear monthNumber = number.
			number := number - 2 ].
	self assert: number = 0
]

{ #category : #'test interval protocol' }
IslamicMonthOfYearTest >> testToReverse [
	| coll number |
	coll := (Muharram , 2004 to: DhuAlHijja , 2004 by: 2 monthsMeasure) reverse.
	number := 11.
	coll
		do: [ :monthOfYear | 
			self assert: monthOfYear monthNumber = number.
			number := number - 2 ].
	self assert: number = -1
]
