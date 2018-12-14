Class {
	#name : #HebrewMonthOfYearTest,
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
	#category : #'Chalten-Tests-Hebrew'
}

{ #category : #accessing }
HebrewMonthOfYearTest class >> classUnderTest [

	^MonthOfYear
]

{ #category : #initialization }
HebrewMonthOfYearTest >> setUp [
	calendar := HebrewCalendar.
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
HebrewMonthOfYearTest >> testComparing [

	self assert: (Iyyar of: 5774) > (Tishri of: 5774).
	self assert: (Kislev of: 5774) < (Marheshvan of: 5775).
	self deny: (Tishri of: 5774) > (Shevat of: 5774).
	
	self should: [ (Iyyar of: 5774) > Marheshvan second ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: Marheshvan second class
				with: Marheshvan second
				with: (Iyyar of: 5774) class
				with: (Iyyar of: 5774)) ].
	
	self should: [ (Iyyar of: 5774) < Marheshvan ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self assert: ex description = ('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
				expandMacrosWith: (Iyyar of: 5774) class
				with: (Iyyar of: 5774)
				with: Marheshvan class
				with: Marheshvan) ]
]

{ #category : #'test instance creation' }
HebrewMonthOfYearTest >> testCreation [
	self assert: (MonthOfYear yearNumber: 5768 monthNumber: 1 calendar: calendar) year = 5768 asHebrewYear.
	self assert: (MonthOfYear yearNumber: 5768 monthNumber: 1 calendar: calendar) monthNumber = 1.
	self assert: (MonthOfYear yearNumber: 5768 month: calendar nisan) year = 5768 asHebrewYear.
	self assert: (MonthOfYear yearNumber: 5768 month: calendar nisan) monthNumber = 1.
	self assert: (MonthOfYear year: 5768 asHebrewYear monthNumber: 1) year = 5768 asHebrewYear.
	self assert: (MonthOfYear year: 5768 asHebrewYear monthNumber: 1) monthNumber = 1.
	self assert: (MonthOfYear nisanOf: 5768 asHebrewYear) year = 5768 asHebrewYear.
	self assert: (MonthOfYear nisanOf: 5768 asHebrewYear) monthNumber = 1.
	self assert: (MonthOfYear iyyarOf: 5768 asHebrewYear) year = 5768 asHebrewYear.
	self assert: (MonthOfYear iyyarOf: 5768 asHebrewYear) monthNumber = 2.
	self assert: (MonthOfYear sivanOf: 5768 asHebrewYear) year = 5768 asHebrewYear.
	self assert: (MonthOfYear sivanOf: 5768 asHebrewYear) monthNumber = 3.
	self assert: (MonthOfYear tammuzOf: 5768 asHebrewYear) year = 5768 asHebrewYear.
	self assert: (MonthOfYear tammuzOf: 5768 asHebrewYear) monthNumber = 4.
	self assert: (MonthOfYear avOf: 5768 asHebrewYear) year = 5768 asHebrewYear.
	self assert: (MonthOfYear avOf: 5768 asHebrewYear) monthNumber = 5.
	self assert: (MonthOfYear elulOf: 5768 asHebrewYear) year = 5768 asHebrewYear.
	self assert: (MonthOfYear elulOf: 5768 asHebrewYear) monthNumber = 6.
	self assert: (MonthOfYear tishriOf: 5768 asHebrewYear) year = 5768 asHebrewYear.
	self assert: (MonthOfYear tishriOf: 5768 asHebrewYear) monthNumber = 7.
	self assert: (MonthOfYear marheshvanOf: 5768 asHebrewYear) year = 5768 asHebrewYear.
	self assert: (MonthOfYear marheshvanOf: 5768 asHebrewYear) monthNumber = 8.
	self assert: (MonthOfYear kislevOf: 5768 asHebrewYear) year = 5768 asHebrewYear.
	self assert: (MonthOfYear kislevOf: 5768 asHebrewYear) monthNumber = 9.
	self assert: (MonthOfYear tevetOf: 5768 asHebrewYear) year = 5768 asHebrewYear.
	self assert: (MonthOfYear tevetOf: 5768 asHebrewYear) monthNumber = 10.
	self assert: (MonthOfYear shevatOf: 5768 asHebrewYear) year = 5768 asHebrewYear.
	self assert: (MonthOfYear shevatOf: 5768 asHebrewYear) monthNumber = 11.
	self assert: (MonthOfYear adarIOf: 5768 asHebrewYear) year = 5768 asHebrewYear.
	self assert: (MonthOfYear adarIOf: 5768 asHebrewYear) monthNumber = 12.
	self assert: (MonthOfYear adarIIOf: 5768 asHebrewYear) year = 5768 asHebrewYear.
	self assert: (MonthOfYear adarIIOf: 5768 asHebrewYear) monthNumber = 13
]

{ #category : #'test accessing' }
HebrewMonthOfYearTest >> testDates [
	self
		assert:
			(MonthOfYear nisanOf: 5767 asHebrewYear) dates first
				=
					(FixedDate
						yearNumber: 5767
						monthNumber: 1
						dayNumber: 1
						calendar: calendar).
	self
		assert:
			(MonthOfYear nisanOf: 5767 asHebrewYear) dates last
				=
					(FixedDate
						yearNumber: 5767
						monthNumber: 1
						dayNumber: 30
						calendar: calendar)
]

{ #category : #'test comparing' }
HebrewMonthOfYearTest >> testEqual [
	self assert: (MonthOfYear nisanOf: 5768 asHebrewYear) = (MonthOfYear nisanOf: 5768 asHebrewYear).
	self assert: (MonthOfYear nisanOf: 5767 asHebrewYear) = (MonthOfYear nisanOf: 5767 asHebrewYear)
]

{ #category : #'test accessing' }
HebrewMonthOfYearTest >> testFirstDate [
	self assert: (MonthOfYear nisanOf: 5767 asHebrewYear) firstDate = (Nisan first , 5767)
]

{ #category : #'test accessing' }
HebrewMonthOfYearTest >> testFirstDay [
	self assert: (MonthOfYear nisanOf: 5767 asHebrewYear) firstDay = calendar yomShelishi
]

{ #category : #'test comparing' }
HebrewMonthOfYearTest >> testHash [
	self assert: (MonthOfYear nisanOf: 5768 asHebrewYear) hash = (MonthOfYear nisanOf: 5768 asHebrewYear) hash.
	self assert: (MonthOfYear nisanOf: 5767 asHebrewYear) hash = (MonthOfYear nisanOf: 5767 asHebrewYear) hash
]

{ #category : #'test querying' }
HebrewMonthOfYearTest >> testIncludesDate [
	self 
		assert: (Nisan , 5767 includes: (FixedDate 
						yearNumber: 5767
						monthNumber: 1
						dayNumber: 1
						calendar: calendar)).
	self 
		assert: (Nisan , 5767 includes: (FixedDate 
						yearNumber: 5767
						monthNumber: 1
						dayNumber: 30
						calendar: calendar)).
	self 
		deny: (Nisan , 5767 includes: (FixedDate 
						yearNumber: 5767
						monthNumber: 2
						dayNumber: 1
						calendar: calendar)).
	self 
		deny: (Nisan , 5767 includes: (FixedDate 
						yearNumber: 5768
						monthNumber: 12
						dayNumber: 29
						calendar: calendar))
]

{ #category : #'test querying' }
HebrewMonthOfYearTest >> testIncludesDateTime [
	self assert: (Nisan , 5767 
				includes: (FixedDate 
						yearNumber: 5767
						monthNumber: 1
						dayNumber: 1
						calendar: calendar) atMidnight).
	self assert: (Nisan , 5767 
				includes: (FixedDate 
						yearNumber: 5767
						monthNumber: 1
						dayNumber: 30
						calendar: calendar) atLastTimeOfDay).
	self deny: (Nisan , 5767 
				includes: (FixedDate 
						yearNumber: 5767
						monthNumber: 2
						dayNumber: 1
						calendar: calendar) atMidnight).
	self deny: (Nisan , 5767 
				includes: (FixedDate 
						yearNumber: 5768
						monthNumber: 12
						dayNumber: 29
						calendar: calendar) atLastTimeOfDay)
]

{ #category : #'test querying' }
HebrewMonthOfYearTest >> testIncludesMonthOfYear [

	self
		should: [(MonthOfYear yearNumber: 5767 monthNumber: 1) includes: Nisan, 5767]
		raise: Exception
]

{ #category : #'test querying' }
HebrewMonthOfYearTest >> testIncludesYear [
	self should: [ (MonthOfYear yearNumber: 5767 monthNumber: 1) includes: 5767 asHebrewYear ] raise: Exception
]

{ #category : #'test instance creation' }
HebrewMonthOfYearTest >> testInvalidCreation [

	self 
		should: [AdarII, 5767]
		raise: InvalidMonthForNonleapYearsException
		withExceptionDo: [:anException | 
			self assert: anException description = 'Adar II is an invalid month for nonleap Year 5767'].
	self 
		should: [AdarI, 5767]
		raise: InvalidMonthForNonleapYearsException
		withExceptionDo: [:anException | 
			self assert: anException description = 'Adar I is an invalid month for nonleap Year 5767'].
	self 
		should: [Adar, 5768]
		raise: InvalidMonthForLeapYearsException
		withExceptionDo: [:anException | 
			self assert: anException description = 'Adar is an invalid month for leap Year 5768'].
	self 
		should: [MonthOfYear yearNumber: 5768 monthNumber: 14 calendar: calendar]
		raise: InvalidMonthNumberException
		withExceptionDo: [:anException | 
			self assert: anException description = '14 is an invalid number for a month'].
	self 
		should: [MonthOfYear yearNumber: 1 monthNumber: 0 calendar: calendar]
		raise: InvalidMonthNumberException
		withExceptionDo: [:anException | 
			self assert: anException description = '0 is an invalid number for a month']
]

{ #category : #'test accessing' }
HebrewMonthOfYearTest >> testLastDate [
	self assert: (MonthOfYear nisanOf: 5767 asHebrewYear) lastDate = (Nisan thirtieth , 5767).
	self assert: (MonthOfYear adarOf: 5767 asHebrewYear) lastDate = (Adar twentyninth , 5767).
	self assert: (MonthOfYear adarIIOf: 5768 asHebrewYear) lastDate = (AdarII twentyninth , 5768)
]

{ #category : #'test accessing' }
HebrewMonthOfYearTest >> testLastDay [
	self assert: (MonthOfYear nisanOf: 5767 asHebrewYear) lastDay = calendar yomRevii.
	self assert: (MonthOfYear adarOf: 5767 asHebrewYear) lastDay = calendar yomSheni.
	self assert: (MonthOfYear adarIIOf: 5768 asHebrewYear) lastDay = calendar yomShabbat
]

{ #category : #'test accessing' }
HebrewMonthOfYearTest >> testLastDayNumber [
	self assert: (MonthOfYear nisanOf: 5768 asHebrewYear) lastDayNumber = (Nisan , 5768) numberOfDays amount.
	self assert: (MonthOfYear iyyarOf: 5768 asHebrewYear) lastDayNumber = (Iyyar , 5768) numberOfDays amount.
	self assert: (MonthOfYear sivanOf: 5768 asHebrewYear) lastDayNumber = (Sivan , 5768) numberOfDays amount.
	self assert: (MonthOfYear tammuzOf: 5768 asHebrewYear) lastDayNumber = (Tammuz , 5768) numberOfDays amount.
	self assert: (MonthOfYear avOf: 5768 asHebrewYear) lastDayNumber = (Av , 5768) numberOfDays amount.
	self assert: (MonthOfYear elulOf: 5768 asHebrewYear) lastDayNumber = (Elul , 5768) numberOfDays amount.
	self assert: (MonthOfYear tishriOf: 5768 asHebrewYear) lastDayNumber = (Tishri , 5768) numberOfDays amount.
	self assert: (MonthOfYear marheshvanOf: 5768 asHebrewYear) lastDayNumber = (Marheshvan , 5768) numberOfDays amount.
	self assert: (MonthOfYear kislevOf: 5768 asHebrewYear) lastDayNumber = (Kislev , 5768) numberOfDays amount.
	self assert: (MonthOfYear tevetOf: 5768 asHebrewYear) lastDayNumber = (Tevet , 5768) numberOfDays amount.
	self assert: (MonthOfYear shevatOf: 5768 asHebrewYear) lastDayNumber = (Shevat , 5768) numberOfDays amount.
	self assert: (MonthOfYear adarIOf: 5768 asHebrewYear) lastDayNumber = (AdarI , 5768) numberOfDays amount.
	self assert: (MonthOfYear adarIIOf: 5768 asHebrewYear) lastDayNumber = (AdarII , 5768) numberOfDays amount.
	self assert: (MonthOfYear adarOf: 5769 asHebrewYear) lastDayNumber = (Adar , 5769) numberOfDays amount
]

{ #category : #'test querying' }
HebrewMonthOfYearTest >> testMonthsFrom [
	self assert: (Nisan , 5768 distanceFrom: AdarII , 5768) = oneMonth.
	self assert: (Nisan , 5768 distanceFrom: Adar , 5767) = 14 monthsMeasure.
	self assert: (Nisan , 5768 distanceFrom: Nisan , 5768) = zeroMonths.
	self assert: (Nisan , 5768 distanceFrom: Nisan , 5767) = thirteenMonths
]

{ #category : #'test querying' }
HebrewMonthOfYearTest >> testMonthsTo [
	self assert: (Tishri , 5768 distanceTo: AdarII , 5768) = 6 monthsMeasure.
	self assert: (Nisan , 5768 distanceTo: AdarII , 5768) = oneMonth negated.
	self assert: (Nisan , 5768 distanceTo: Adar , 5767) = 14 monthsMeasure negated.
	self assert: (Nisan , 5768 distanceTo: Nisan , 5768) = zeroMonths.
	self assert: (Nisan , 5768 distanceTo: Nisan , 5769) = twelveMonths
]

{ #category : #'test accessing' }
HebrewMonthOfYearTest >> testName [
	self assert: (MonthOfYear nisanOf: 5768 asHebrewYear) name = 'Nisan'.
	self assert: (MonthOfYear iyyarOf: 5768 asHebrewYear) name = 'Iyyar'.
	self assert: (MonthOfYear sivanOf: 5768 asHebrewYear) name = 'Sivan'.
	self assert: (MonthOfYear tammuzOf: 5768 asHebrewYear) name = 'Tammuz'.
	self assert: (MonthOfYear avOf: 5768 asHebrewYear) name = 'Av'.
	self assert: (MonthOfYear elulOf: 5768 asHebrewYear) name = 'Elul'.
	self assert: (MonthOfYear tishriOf: 5768 asHebrewYear) name = 'Tishri'.
	self assert: (MonthOfYear marheshvanOf: 5768 asHebrewYear) name = 'Marheshvan'.
	self assert: (MonthOfYear kislevOf: 5768 asHebrewYear) name = 'Kislev'.
	self assert: (MonthOfYear tevetOf: 5768 asHebrewYear) name = 'Tevet'.
	self assert: (MonthOfYear shevatOf: 5768 asHebrewYear) name = 'Shevat'.
	self assert: (MonthOfYear adarOf: 5767 asHebrewYear) name = 'Adar'.
	self assert: (MonthOfYear adarIOf: 5768 asHebrewYear) name = 'Adar I'.
	self assert: (MonthOfYear adarIIOf: 5768 asHebrewYear) name = 'Adar II'
]

{ #category : #'test querying' }
HebrewMonthOfYearTest >> testNext [

	self assert: (Nisan, 5767) next = (Iyyar, 5767).
	self assert: (Elul, 5767) next = (Tishri, 5768)
]

{ #category : #'test querying' }
HebrewMonthOfYearTest >> testNextANumberOfMonths [
	self assert: (Nisan , 5768 next: oneMonth) = (Iyyar , 5768).
	self assert: (Nisan , 5768 next: elevenMonths) = (Adar , 5769).
	self assert: (Nisan , 5768 next: twelveMonths) = (Nisan , 5769).
	self assert: (Nisan , 5768 next: thirteenMonths) = (Iyyar , 5769).
	self assert: (Nisan , 5768 next: zeroMonths) = (Nisan , 5768).
	self assert: (Nisan , 5768 next: oneYear) = (Nisan , 5769).
	self assert: (Sivan , 5768 next: oneYear) = (Sivan , 5769).
	self assert: (Nisan , 5768 next: 0.5 monthsMeasure) = (Nisan , 5768).
	self assert: (Nisan , 5768 next: 1.5 monthsMeasure) = (Iyyar , 5768)
]

{ #category : #'test querying' }
HebrewMonthOfYearTest >> testNextMonth [

	| monthOfYear |
	
	monthOfYear := Nisan, 5768.
	self assert: (monthOfYear nextMonth: calendar nisan) = (Nisan , 5769).
	self assert: (monthOfYear nextMonth: Nisan in: twoYears) = (Nisan , 5770).
	self assert: (monthOfYear nextMonth: calendar iyyar) = (Iyyar , 5768).
	self assert: (monthOfYear nextMonth: Kislev in: twoYears) = (Kislev , 5770).
	
	monthOfYear := Sivan, 5768.
	self assert: (monthOfYear nextMonth: Nisan) = (Nisan , 5769).
	self assert: (monthOfYear nextMonth: calendar nisan in: twoYears) = (Nisan , 5770).

	monthOfYear := Nisan, -1.
	self assert: (monthOfYear nextMonth: calendar nisan) = (Nisan , 0).
	self assert: (monthOfYear nextMonth: calendar adar) = (Adar , -1)
]

{ #category : #'test accessing' }
HebrewMonthOfYearTest >> testNumberOfDays [
	self assert: (MonthOfYear nisanOf: 5768 asHebrewYear) numberOfDays = 30 daysMeasure.
	self assert: (MonthOfYear iyyarOf: 5768 asHebrewYear) numberOfDays = 29 daysMeasure.
	self assert: (MonthOfYear sivanOf: 5768 asHebrewYear) numberOfDays = 30 daysMeasure.
	self assert: (MonthOfYear tammuzOf: 5768 asHebrewYear) numberOfDays = 29 daysMeasure.
	self assert: (MonthOfYear avOf: 5768 asHebrewYear) numberOfDays = 30 daysMeasure.
	self assert: (MonthOfYear elulOf: 5768 asHebrewYear) numberOfDays = 29 daysMeasure.
	self assert: (MonthOfYear tishriOf: 5768 asHebrewYear) numberOfDays = 30 daysMeasure.
	self assert: (MonthOfYear marheshvanOf: 5768 asHebrewYear) numberOfDays = 29 daysMeasure.
	self assert: (MonthOfYear kislevOf: 5768 asHebrewYear) numberOfDays = 29 daysMeasure.
	self assert: (MonthOfYear tevetOf: 5768 asHebrewYear) numberOfDays = 29 daysMeasure.
	self assert: (MonthOfYear shevatOf: 5768 asHebrewYear) numberOfDays = 30 daysMeasure.
	self assert: (MonthOfYear adarOf: 5767 asHebrewYear) numberOfDays = 29 daysMeasure.
	self assert: (MonthOfYear adarIOf: 5768 asHebrewYear) numberOfDays = 30 daysMeasure.
	self assert: (MonthOfYear adarIIOf: 5768 asHebrewYear) numberOfDays = 29 daysMeasure
]

{ #category : #'test accessing' }
HebrewMonthOfYearTest >> testNumberOfDaysFromEpoch [
	self assert: (MonthOfYear nisanOf: 1 asHebrewYear) numberOfDaysFromEpoch = -1373250 daysMeasure.
	self assert: (MonthOfYear nisanOf: 2 asHebrewYear) numberOfDaysFromEpoch = -1372895 daysMeasure.
	self assert: (MonthOfYear nisanOf: 5767 asHebrewYear) numberOfDaysFromEpoch = 732754 daysMeasure
]

{ #category : #'test accessing' }
HebrewMonthOfYearTest >> testOrdinalDay [
	"To obtain a certain day of the month, for example the second yom revi`i."

	| monthOfYear |
	monthOfYear := MonthOfYear nisanOf: 5767 asHebrewYear.
	self assert: (monthOfYear ordinal: 2 day: calendar yomRevii) = (Nisan ninth , 5767)
]

{ #category : #'test querying' }
HebrewMonthOfYearTest >> testPrevious [

	self assert: (Tishri, 5768) previous = (Elul, 5767).
	self assert: (AdarII, 5768) previous = (AdarI, 5768)
]

{ #category : #'test querying' }
HebrewMonthOfYearTest >> testPreviousANumberOfMonths [

	self assert: ((Nisan, 5768) previous: oneMonth) = (AdarII, 5768).
	self assert: ((Nisan, 5768) previous: elevenMonths) = (Sivan, 5767).
	self assert: ((Nisan, 5768) previous: twelveMonths) = (Iyyar, 5767).
	self assert: ((Iyyar, 5768) previous: thirteenMonths) = (Iyyar, 5767).
	self assert: ((Nisan, 5768) previous: thirteenMonths) = (Nisan, 5767).
	self assert: ((Nisan, 5768) previous: zeroMonths) = (Nisan, 5768).
	self assert: ((Nisan, 5768) previous: oneYear) = (Nisan, 5767).
	self assert: ((Tishri, 5768) previous: oneYear) = (Tishri, 5767).
	self assert: ((Tishri, 5768) previous: oneMonth) = (Elul, 5767).
	self assert: ((Elul, 5768) previous: elevenMonths) = (Marheshvan, 5768).
	self assert: ((Elul, 5768) previous: twelveMonths) = (Tishri, 5768)
]

{ #category : #'test querying' }
HebrewMonthOfYearTest >> testPreviousMonth [

	| monthOfYear |
	
	monthOfYear := Nisan, 5768.
	self assert: (monthOfYear previousMonth: calendar nisan) = (Nisan , 5767).
	self assert: (monthOfYear previousMonth: Nisan in: twoYears) = (Nisan , 5766).
	
	monthOfYear := Av, 5768.
	self assert: (monthOfYear previousMonth: calendar tammuz) = (Tammuz , 5768).
	self assert: (monthOfYear previousMonth: calendar tammuz in: twoYears) = (Tammuz , 5766).

	monthOfYear := Elul, 5768.
	self assert: (monthOfYear previousMonth: calendar nisan) = (Nisan , 5768).
	self assert: (monthOfYear previousMonth: Nisan in: twoYears) = (Nisan , 5766).
	
	monthOfYear := Nisan, 1.
	self assert: (monthOfYear previousMonth: calendar nisan) = (Nisan , 0).
	self assert: (monthOfYear previousMonth: Adar) = (AdarI , 0)
]

{ #category : #'test printing' }
HebrewMonthOfYearTest >> testPrintString [
	| year |
	year := 5768 asHebrewYear.
	self assert: (MonthOfYear nisanOf: year) printString = (calendar nisan printString , ' of ' , year printString)
]

{ #category : #'test interval protocol' }
HebrewMonthOfYearTest >> testTo [

	| interval |

	interval := Nisan, 5768 to: Iyyar, 5768.

	self assert: interval from = (Nisan, 5768).
	self assert: interval to = (Iyyar, 5768).
	self assert: interval by = oneMonth
]

{ #category : #'test interval protocol' }
HebrewMonthOfYearTest >> testToBy [

	| interval |

	interval := Nisan, 5768 to: Tammuz, 5768 by: twoMonths.

	self assert: interval from = (Nisan, 5768).
	self assert: interval to = (Tammuz, 5768).
	self assert: interval by = twoMonths
]

{ #category : #'test interval protocol' }
HebrewMonthOfYearTest >> testToByDo [

	| number |

	number := 7.
	(Tishri, 5767 to: Elul, 5767 by: twoMonths) do: [:month |
		self assert: month monthNumber = number.
		number := number + 2.
		number = 13 ifTrue: [number := 1]].
	self assert: number = 7
]

{ #category : #'test interval protocol' }
HebrewMonthOfYearTest >> testToByYearsDo [

	| yearNumber |

	yearNumber := 5768.
	(Nisan, 5768 to: AdarII, 5774 by: twelveMonths) do: [:month |
		self assert: (month monthNumber = 1 or: [ month monthNumber = 12 or: [ month monthNumber = 13 ]]).
		self assert: month year number = yearNumber.
		yearNumber := yearNumber + 1].
	self assert: yearNumber = 5775
]

{ #category : #'test interval protocol' }
HebrewMonthOfYearTest >> testToNegativeBy [
	| interval number |
	interval := Elul , 5768 to: Tishri , 5768 by: -2 monthsMeasure.
	number := 6.
	interval
		do: [ :monthOfYear | 
			number = 0
				ifTrue: [ number := 13 ].
			self assert: monthOfYear monthNumber = number.
			number := number - 2 ].
	self assert: number = 5.
	interval := Elul , 5767 to: Tishri , 5767 by: -2 monthsMeasure.
	number := 6.
	interval
		do: [ :monthOfYear | 
			number = 0
				ifTrue: [ number := 12 ].
			self assert: monthOfYear monthNumber = number.
			number := number - 2 ].
	self assert: number = 6
]

{ #category : #'test interval protocol' }
HebrewMonthOfYearTest >> testToReverse [
	| coll number |
	coll := (Tishri , 5768 to: Elul , 5768 by: 2 monthsMeasure) reverse.
	number := 6.
	coll
		do: [ :monthOfYear | 
			number = 0
				ifTrue: [ number := 13 ].
			self assert: monthOfYear monthNumber = number.
			number := number - 2 ].
	self assert: number = 5.
	coll := (Tishri , 5767 to: Elul , 5767 by: 2 monthsMeasure) reverse.
	number := 5.
	coll
		do: [ :monthOfYear | 
			number < 0
				ifTrue: [ number := 11 ].
			self assert: monthOfYear monthNumber = number.
			number := number - 2 ].
	self assert: number = 5
]
