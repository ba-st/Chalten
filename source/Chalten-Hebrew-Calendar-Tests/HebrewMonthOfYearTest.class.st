Class {
	#name : 'HebrewMonthOfYearTest',
	#superclass : 'TestCase',
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
	#category : 'Chalten-Hebrew-Calendar-Tests',
	#package : 'Chalten-Hebrew-Calendar-Tests'
}

{ #category : 'accessing' }
HebrewMonthOfYearTest class >> classUnderTest [

	^MonthOfYear
]

{ #category : 'initialization' }
HebrewMonthOfYearTest >> setUp [
	calendar := ChaltenEnvironment calendarNamed: #HebrewCalendar.
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
HebrewMonthOfYearTest >> testComparing [

	self assert: (Iyyar of: 5774) > (Tishri of: 5774).
	self assert: (Kislev of: 5774) < (Marheshvan of: 5775).
	self deny: (Tishri of: 5774) > (Shevat of: 5774).

	self
		should: [ (Iyyar of: 5774) > Marheshvan second ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: Marheshvan second class
						 with: Marheshvan second
						 with: (Iyyar of: 5774) class
						 with: (Iyyar of: 5774)) ].

	self
		should: [ (Iyyar of: 5774) < Marheshvan ]
		raise: InvalidComparisonBetweenPointsInTimeException
		withExceptionDo: [ :ex |
			self
				assert: ex description
				equals:
					('The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
						 expandMacrosWith: (Iyyar of: 5774) class
						 with: (Iyyar of: 5774)
						 with: Marheshvan class
						 with: Marheshvan) ]
]

{ #category : 'test instance creation' }
HebrewMonthOfYearTest >> testCreation [

	self
		assert:
		(MonthOfYear yearNumber: 5768 monthNumber: 1 calendar: calendar)
			year
		equals: 5768 asHebrewYear.
	self
		assert:
			(MonthOfYear yearNumber: 5768 monthNumber: 1 calendar: calendar)
				monthNumber
		equals: 1.
	self
		assert: (MonthOfYear yearNumber: 5768 month: calendar nisan) year
		equals: 5768 asHebrewYear.
	self
		assert:
		(MonthOfYear yearNumber: 5768 month: calendar nisan) monthNumber
		equals: 1.
	self
		assert: (MonthOfYear year: 5768 asHebrewYear monthNumber: 1) year
		equals: 5768 asHebrewYear.
	self
		assert:
		(MonthOfYear year: 5768 asHebrewYear monthNumber: 1) monthNumber
		equals: 1.
	self
		assert: (MonthOfYear nisanOf: 5768 asHebrewYear) year
		equals: 5768 asHebrewYear.
	self
		assert: (MonthOfYear nisanOf: 5768 asHebrewYear) monthNumber
		equals: 1.
	self
		assert: (MonthOfYear iyyarOf: 5768 asHebrewYear) year
		equals: 5768 asHebrewYear.
	self
		assert: (MonthOfYear iyyarOf: 5768 asHebrewYear) monthNumber
		equals: 2.
	self
		assert: (MonthOfYear sivanOf: 5768 asHebrewYear) year
		equals: 5768 asHebrewYear.
	self
		assert: (MonthOfYear sivanOf: 5768 asHebrewYear) monthNumber
		equals: 3.
	self
		assert: (MonthOfYear tammuzOf: 5768 asHebrewYear) year
		equals: 5768 asHebrewYear.
	self
		assert: (MonthOfYear tammuzOf: 5768 asHebrewYear) monthNumber
		equals: 4.
	self
		assert: (MonthOfYear avOf: 5768 asHebrewYear) year
		equals: 5768 asHebrewYear.
	self
		assert: (MonthOfYear avOf: 5768 asHebrewYear) monthNumber
		equals: 5.
	self
		assert: (MonthOfYear elulOf: 5768 asHebrewYear) year
		equals: 5768 asHebrewYear.
	self
		assert: (MonthOfYear elulOf: 5768 asHebrewYear) monthNumber
		equals: 6.
	self
		assert: (MonthOfYear tishriOf: 5768 asHebrewYear) year
		equals: 5768 asHebrewYear.
	self
		assert: (MonthOfYear tishriOf: 5768 asHebrewYear) monthNumber
		equals: 7.
	self
		assert: (MonthOfYear marheshvanOf: 5768 asHebrewYear) year
		equals: 5768 asHebrewYear.
	self
		assert: (MonthOfYear marheshvanOf: 5768 asHebrewYear) monthNumber
		equals: 8.
	self
		assert: (MonthOfYear kislevOf: 5768 asHebrewYear) year
		equals: 5768 asHebrewYear.
	self
		assert: (MonthOfYear kislevOf: 5768 asHebrewYear) monthNumber
		equals: 9.
	self
		assert: (MonthOfYear tevetOf: 5768 asHebrewYear) year
		equals: 5768 asHebrewYear.
	self
		assert: (MonthOfYear tevetOf: 5768 asHebrewYear) monthNumber
		equals: 10.
	self
		assert: (MonthOfYear shevatOf: 5768 asHebrewYear) year
		equals: 5768 asHebrewYear.
	self
		assert: (MonthOfYear shevatOf: 5768 asHebrewYear) monthNumber
		equals: 11.
	self
		assert: (MonthOfYear adarIOf: 5768 asHebrewYear) year
		equals: 5768 asHebrewYear.
	self
		assert: (MonthOfYear adarIOf: 5768 asHebrewYear) monthNumber
		equals: 12.
	self
		assert: (MonthOfYear adarIIOf: 5768 asHebrewYear) year
		equals: 5768 asHebrewYear.
	self
		assert: (MonthOfYear adarIIOf: 5768 asHebrewYear) monthNumber
		equals: 13
]

{ #category : 'test accessing' }
HebrewMonthOfYearTest >> testDates [

	self
		assert: (MonthOfYear nisanOf: 5767 asHebrewYear) dates first
		equals: (FixedDate
				 yearNumber: 5767
				 monthNumber: 1
				 dayNumber: 1
				 calendar: calendar).
	self
		assert: (MonthOfYear nisanOf: 5767 asHebrewYear) dates last
		equals: (FixedDate
				 yearNumber: 5767
				 monthNumber: 1
				 dayNumber: 30
				 calendar: calendar)
]

{ #category : 'test comparing' }
HebrewMonthOfYearTest >> testEqual [

	self
		assert: (MonthOfYear nisanOf: 5768 asHebrewYear)
		equals: (MonthOfYear nisanOf: 5768 asHebrewYear).
	self
		assert: (MonthOfYear nisanOf: 5767 asHebrewYear)
		equals: (MonthOfYear nisanOf: 5767 asHebrewYear)
]

{ #category : 'test accessing' }
HebrewMonthOfYearTest >> testFirstDate [

	self
		assert: (MonthOfYear nisanOf: 5767 asHebrewYear) firstDate
		equals: Nisan first , 5767
]

{ #category : 'test accessing' }
HebrewMonthOfYearTest >> testFirstDay [

	self
		assert: (MonthOfYear nisanOf: 5767 asHebrewYear) firstDay
		equals: calendar yomShelishi
]

{ #category : 'test comparing' }
HebrewMonthOfYearTest >> testHash [

	self
		assert: (MonthOfYear nisanOf: 5768 asHebrewYear) hash
		equals: (MonthOfYear nisanOf: 5768 asHebrewYear) hash.
	self
		assert: (MonthOfYear nisanOf: 5767 asHebrewYear) hash
		equals: (MonthOfYear nisanOf: 5767 asHebrewYear) hash
]

{ #category : 'test querying' }
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

{ #category : 'test querying' }
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

{ #category : 'test querying' }
HebrewMonthOfYearTest >> testIncludesMonthOfYear [

	self
		should: [(MonthOfYear yearNumber: 5767 monthNumber: 1) includes: Nisan, 5767]
		raise: Exception
]

{ #category : 'test querying' }
HebrewMonthOfYearTest >> testIncludesYear [
	self should: [ (MonthOfYear yearNumber: 5767 monthNumber: 1) includes: 5767 asHebrewYear ] raise: Exception
]

{ #category : 'test instance creation' }
HebrewMonthOfYearTest >> testInvalidCreation [

	self
		should: [ AdarII , 5767 ]
		raise: InvalidMonthForNonleapYearsException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals: 'Adar II is an invalid month for nonleap Year 5767' ].
	self
		should: [ AdarI , 5767 ]
		raise: InvalidMonthForNonleapYearsException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals: 'Adar I is an invalid month for nonleap Year 5767' ].
	self
		should: [ Adar , 5768 ]
		raise: InvalidMonthForLeapYearsException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals: 'Adar is an invalid month for leap Year 5768' ].
	self
		should: [
		MonthOfYear yearNumber: 5768 monthNumber: 14 calendar: calendar ]
		raise: InvalidMonthNumberException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals: '14 is an invalid number for a month' ].
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
HebrewMonthOfYearTest >> testLastDate [

	self
		assert: (MonthOfYear nisanOf: 5767 asHebrewYear) lastDate
		equals: Nisan thirtieth , 5767.
	self
		assert: (MonthOfYear adarOf: 5767 asHebrewYear) lastDate
		equals: Adar twentyninth , 5767.
	self
		assert: (MonthOfYear adarIIOf: 5768 asHebrewYear) lastDate
		equals: AdarII twentyninth , 5768
]

{ #category : 'test accessing' }
HebrewMonthOfYearTest >> testLastDay [

	self
		assert: (MonthOfYear nisanOf: 5767 asHebrewYear) lastDay
		equals: calendar yomRevii.
	self
		assert: (MonthOfYear adarOf: 5767 asHebrewYear) lastDay
		equals: calendar yomSheni.
	self
		assert: (MonthOfYear adarIIOf: 5768 asHebrewYear) lastDay
		equals: calendar yomShabbat
]

{ #category : 'test accessing' }
HebrewMonthOfYearTest >> testLastDayNumber [

	self
		assert: (MonthOfYear nisanOf: 5768 asHebrewYear) lastDayNumber
		equals: (Nisan , 5768) numberOfDays amount.
	self
		assert: (MonthOfYear iyyarOf: 5768 asHebrewYear) lastDayNumber
		equals: (Iyyar , 5768) numberOfDays amount.
	self
		assert: (MonthOfYear sivanOf: 5768 asHebrewYear) lastDayNumber
		equals: (Sivan , 5768) numberOfDays amount.
	self
		assert: (MonthOfYear tammuzOf: 5768 asHebrewYear) lastDayNumber
		equals: (Tammuz , 5768) numberOfDays amount.
	self
		assert: (MonthOfYear avOf: 5768 asHebrewYear) lastDayNumber
		equals: (Av , 5768) numberOfDays amount.
	self
		assert: (MonthOfYear elulOf: 5768 asHebrewYear) lastDayNumber
		equals: (Elul , 5768) numberOfDays amount.
	self
		assert: (MonthOfYear tishriOf: 5768 asHebrewYear) lastDayNumber
		equals: (Tishri , 5768) numberOfDays amount.
	self
		assert: (MonthOfYear marheshvanOf: 5768 asHebrewYear) lastDayNumber
		equals: (Marheshvan , 5768) numberOfDays amount.
	self
		assert: (MonthOfYear kislevOf: 5768 asHebrewYear) lastDayNumber
		equals: (Kislev , 5768) numberOfDays amount.
	self
		assert: (MonthOfYear tevetOf: 5768 asHebrewYear) lastDayNumber
		equals: (Tevet , 5768) numberOfDays amount.
	self
		assert: (MonthOfYear shevatOf: 5768 asHebrewYear) lastDayNumber
		equals: (Shevat , 5768) numberOfDays amount.
	self
		assert: (MonthOfYear adarIOf: 5768 asHebrewYear) lastDayNumber
		equals: (AdarI , 5768) numberOfDays amount.
	self
		assert: (MonthOfYear adarIIOf: 5768 asHebrewYear) lastDayNumber
		equals: (AdarII , 5768) numberOfDays amount.
	self
		assert: (MonthOfYear adarOf: 5769 asHebrewYear) lastDayNumber
		equals: (Adar , 5769) numberOfDays amount
]

{ #category : 'test querying' }
HebrewMonthOfYearTest >> testMonthsFrom [

	self
		assert: (Nisan , 5768 distanceFrom: AdarII , 5768)
		equals: oneMonth.
	self
		assert: (Nisan , 5768 distanceFrom: Adar , 5767)
		equals: 14 monthsMeasure.
	self
		assert: (Nisan , 5768 distanceFrom: Nisan , 5768)
		equals: zeroMonths.
	self
		assert: (Nisan , 5768 distanceFrom: Nisan , 5767)
		equals: thirteenMonths
]

{ #category : 'test querying' }
HebrewMonthOfYearTest >> testMonthsTo [

	self
		assert: (Tishri , 5768 distanceTo: AdarII , 5768)
		equals: 6 monthsMeasure.
	self
		assert: (Nisan , 5768 distanceTo: AdarII , 5768)
		equals: oneMonth negated.
	self
		assert: (Nisan , 5768 distanceTo: Adar , 5767)
		equals: 14 monthsMeasure negated.
	self
		assert: (Nisan , 5768 distanceTo: Nisan , 5768)
		equals: zeroMonths.
	self
		assert: (Nisan , 5768 distanceTo: Nisan , 5769)
		equals: twelveMonths
]

{ #category : 'test accessing' }
HebrewMonthOfYearTest >> testName [

	self
		assert: (MonthOfYear nisanOf: 5768 asHebrewYear) name
		equals: 'Nisan'.
	self
		assert: (MonthOfYear iyyarOf: 5768 asHebrewYear) name
		equals: 'Iyyar'.
	self
		assert: (MonthOfYear sivanOf: 5768 asHebrewYear) name
		equals: 'Sivan'.
	self
		assert: (MonthOfYear tammuzOf: 5768 asHebrewYear) name
		equals: 'Tammuz'.
	self assert: (MonthOfYear avOf: 5768 asHebrewYear) name equals: 'Av'.
	self
		assert: (MonthOfYear elulOf: 5768 asHebrewYear) name
		equals: 'Elul'.
	self
		assert: (MonthOfYear tishriOf: 5768 asHebrewYear) name
		equals: 'Tishri'.
	self
		assert: (MonthOfYear marheshvanOf: 5768 asHebrewYear) name
		equals: 'Marheshvan'.
	self
		assert: (MonthOfYear kislevOf: 5768 asHebrewYear) name
		equals: 'Kislev'.
	self
		assert: (MonthOfYear tevetOf: 5768 asHebrewYear) name
		equals: 'Tevet'.
	self
		assert: (MonthOfYear shevatOf: 5768 asHebrewYear) name
		equals: 'Shevat'.
	self
		assert: (MonthOfYear adarOf: 5767 asHebrewYear) name
		equals: 'Adar'.
	self
		assert: (MonthOfYear adarIOf: 5768 asHebrewYear) name
		equals: 'Adar I'.
	self
		assert: (MonthOfYear adarIIOf: 5768 asHebrewYear) name
		equals: 'Adar II'
]

{ #category : 'test querying' }
HebrewMonthOfYearTest >> testNext [

	self assert: (Nisan , 5767) next equals: Iyyar , 5767.
	self assert: (Elul , 5767) next equals: Tishri , 5768
]

{ #category : 'test querying' }
HebrewMonthOfYearTest >> testNextANumberOfMonths [

	self assert: (Nisan , 5768 next: oneMonth) equals: Iyyar , 5768.
	self assert: (Nisan , 5768 next: elevenMonths) equals: Adar , 5769.
	self assert: (Nisan , 5768 next: twelveMonths) equals: Nisan , 5769.
	self assert: (Nisan , 5768 next: thirteenMonths) equals: Iyyar , 5769.
	self assert: (Nisan , 5768 next: zeroMonths) equals: Nisan , 5768.
	self assert: (Nisan , 5768 next: oneYear) equals: Nisan , 5769.
	self assert: (Sivan , 5768 next: oneYear) equals: Sivan , 5769.
	self
		assert: (Nisan , 5768 next: 0.5 monthsMeasure)
		equals: Nisan , 5768.
	self
		assert: (Nisan , 5768 next: 1.5 monthsMeasure)
		equals: Iyyar , 5768
]

{ #category : 'test querying' }
HebrewMonthOfYearTest >> testNextMonth [

	| monthOfYear |
	monthOfYear := Nisan , 5768.
	self
		assert: (monthOfYear nextMonth: calendar nisan)
		equals: Nisan , 5769.
	self
		assert: (monthOfYear nextMonth: Nisan in: twoYears)
		equals: Nisan , 5770.
	self
		assert: (monthOfYear nextMonth: calendar iyyar)
		equals: Iyyar , 5768.
	self
		assert: (monthOfYear nextMonth: Kislev in: twoYears)
		equals: Kislev , 5770.

	monthOfYear := Sivan , 5768.
	self assert: (monthOfYear nextMonth: Nisan) equals: Nisan , 5769.
	self
		assert: (monthOfYear nextMonth: calendar nisan in: twoYears)
		equals: Nisan , 5770.

	monthOfYear := Nisan , -1.
	self
		assert: (monthOfYear nextMonth: calendar nisan)
		equals: Nisan , 0.
	self assert: (monthOfYear nextMonth: calendar adar) equals: Adar , -1
]

{ #category : 'test accessing' }
HebrewMonthOfYearTest >> testNumberOfDays [

	self
		assert: (MonthOfYear nisanOf: 5768 asHebrewYear) numberOfDays
		equals: 30 daysMeasure.
	self
		assert: (MonthOfYear iyyarOf: 5768 asHebrewYear) numberOfDays
		equals: 29 daysMeasure.
	self
		assert: (MonthOfYear sivanOf: 5768 asHebrewYear) numberOfDays
		equals: 30 daysMeasure.
	self
		assert: (MonthOfYear tammuzOf: 5768 asHebrewYear) numberOfDays
		equals: 29 daysMeasure.
	self
		assert: (MonthOfYear avOf: 5768 asHebrewYear) numberOfDays
		equals: 30 daysMeasure.
	self
		assert: (MonthOfYear elulOf: 5768 asHebrewYear) numberOfDays
		equals: 29 daysMeasure.
	self
		assert: (MonthOfYear tishriOf: 5768 asHebrewYear) numberOfDays
		equals: 30 daysMeasure.
	self
		assert: (MonthOfYear marheshvanOf: 5768 asHebrewYear) numberOfDays
		equals: 29 daysMeasure.
	self
		assert: (MonthOfYear kislevOf: 5768 asHebrewYear) numberOfDays
		equals: 29 daysMeasure.
	self
		assert: (MonthOfYear tevetOf: 5768 asHebrewYear) numberOfDays
		equals: 29 daysMeasure.
	self
		assert: (MonthOfYear shevatOf: 5768 asHebrewYear) numberOfDays
		equals: 30 daysMeasure.
	self
		assert: (MonthOfYear adarOf: 5767 asHebrewYear) numberOfDays
		equals: 29 daysMeasure.
	self
		assert: (MonthOfYear adarIOf: 5768 asHebrewYear) numberOfDays
		equals: 30 daysMeasure.
	self
		assert: (MonthOfYear adarIIOf: 5768 asHebrewYear) numberOfDays
		equals: 29 daysMeasure
]

{ #category : 'test accessing' }
HebrewMonthOfYearTest >> testNumberOfDaysFromEpoch [

	self
		assert: (MonthOfYear nisanOf: 1 asHebrewYear) numberOfDaysFromEpoch
		equals: -1373250 daysMeasure.
	self
		assert: (MonthOfYear nisanOf: 2 asHebrewYear) numberOfDaysFromEpoch
		equals: -1372895 daysMeasure.
	self
		assert:
		(MonthOfYear nisanOf: 5767 asHebrewYear) numberOfDaysFromEpoch
		equals: 732754 daysMeasure
]

{ #category : 'test accessing' }
HebrewMonthOfYearTest >> testOrdinalDay [
	"To obtain a certain day of the month, for example the second yom revi`i."

	| monthOfYear |
	monthOfYear := MonthOfYear nisanOf: 5767 asHebrewYear.
	self
		assert: (monthOfYear ordinal: 2 day: calendar yomRevii)
		equals: Nisan ninth , 5767
]

{ #category : 'test querying' }
HebrewMonthOfYearTest >> testPrevious [

	self assert: (Tishri , 5768) previous equals: Elul , 5767.
	self assert: (AdarII , 5768) previous equals: AdarI , 5768
]

{ #category : 'test querying' }
HebrewMonthOfYearTest >> testPreviousANumberOfMonths [

	self assert: (Nisan , 5768 previous: oneMonth) equals: AdarII , 5768.
	self
		assert: (Nisan , 5768 previous: elevenMonths)
		equals: Sivan , 5767.
	self
		assert: (Nisan , 5768 previous: twelveMonths)
		equals: Iyyar , 5767.
	self
		assert: (Iyyar , 5768 previous: thirteenMonths)
		equals: Iyyar , 5767.
	self
		assert: (Nisan , 5768 previous: thirteenMonths)
		equals: Nisan , 5767.
	self assert: (Nisan , 5768 previous: zeroMonths) equals: Nisan , 5768.
	self assert: (Nisan , 5768 previous: oneYear) equals: Nisan , 5767.
	self assert: (Tishri , 5768 previous: oneYear) equals: Tishri , 5767.
	self assert: (Tishri , 5768 previous: oneMonth) equals: Elul , 5767.
	self
		assert: (Elul , 5768 previous: elevenMonths)
		equals: Marheshvan , 5768.
	self
		assert: (Elul , 5768 previous: twelveMonths)
		equals: Tishri , 5768
]

{ #category : 'test querying' }
HebrewMonthOfYearTest >> testPreviousMonth [

	| monthOfYear |
	monthOfYear := Nisan , 5768.
	self
		assert: (monthOfYear previousMonth: calendar nisan)
		equals: Nisan , 5767.
	self
		assert: (monthOfYear previousMonth: Nisan in: twoYears)
		equals: Nisan , 5766.

	monthOfYear := Av , 5768.
	self
		assert: (monthOfYear previousMonth: calendar tammuz)
		equals: Tammuz , 5768.
	self
		assert: (monthOfYear previousMonth: calendar tammuz in: twoYears)
		equals: Tammuz , 5766.

	monthOfYear := Elul , 5768.
	self
		assert: (monthOfYear previousMonth: calendar nisan)
		equals: Nisan , 5768.
	self
		assert: (monthOfYear previousMonth: Nisan in: twoYears)
		equals: Nisan , 5766.

	monthOfYear := Nisan , 1.
	self
		assert: (monthOfYear previousMonth: calendar nisan)
		equals: Nisan , 0.
	self assert: (monthOfYear previousMonth: Adar) equals: AdarI , 0
]

{ #category : 'test printing' }
HebrewMonthOfYearTest >> testPrintString [

	| year |
	year := 5768 asHebrewYear.
	self
		assert: (MonthOfYear nisanOf: year) printString
		equals: calendar nisan printString , ' of ' , year printString
]

{ #category : 'test interval protocol' }
HebrewMonthOfYearTest >> testTo [

	| interval |
	interval := Nisan , 5768 to: Iyyar , 5768.
	self assert: interval from equals: Nisan , 5768.
	self assert: interval to equals: Iyyar , 5768.
	self assert: interval by equals: oneMonth
]

{ #category : 'test interval protocol' }
HebrewMonthOfYearTest >> testToBy [

	| interval |
	interval := Nisan , 5768 to: Tammuz , 5768 by: twoMonths.
	self assert: interval from equals: Nisan , 5768.
	self assert: interval to equals: Tammuz , 5768.
	self assert: interval by equals: twoMonths
]

{ #category : 'test interval protocol' }
HebrewMonthOfYearTest >> testToByDo [

	| number |
	number := 7.
	(Tishri , 5767 to: Elul , 5767 by: twoMonths) do: [ :month |
		self assert: month monthNumber equals: number.
		number := number + 2.
		number = 13 ifTrue: [ number := 1 ] ].
	self assert: number equals: 7
]

{ #category : 'test interval protocol' }
HebrewMonthOfYearTest >> testToByYearsDo [

	| yearNumber |
	yearNumber := 5768.
	(Nisan , 5768 to: AdarII , 5774 by: twelveMonths) do: [ :month |
		self assert: (month monthNumber = 1 or: [
				 month monthNumber = 12 or: [ month monthNumber = 13 ] ]).
		self assert: month year number equals: yearNumber.
		yearNumber := yearNumber + 1 ].
	self assert: yearNumber equals: 5775
]

{ #category : 'test interval protocol' }
HebrewMonthOfYearTest >> testToNegativeBy [

	| interval number |
	interval := Elul , 5768 to: Tishri , 5768 by: -2 monthsMeasure.
	number := 6.
	interval do: [ :monthOfYear |
		number = 0 ifTrue: [ number := 13 ].
		self assert: monthOfYear monthNumber equals: number.
		number := number - 2 ].
	self assert: number equals: 5.
	interval := Elul , 5767 to: Tishri , 5767 by: -2 monthsMeasure.
	number := 6.
	interval do: [ :monthOfYear |
		number = 0 ifTrue: [ number := 12 ].
		self assert: monthOfYear monthNumber equals: number.
		number := number - 2 ].
	self assert: number equals: 6
]

{ #category : 'test interval protocol' }
HebrewMonthOfYearTest >> testToReverse [

	| coll number |
	coll := (Tishri , 5768 to: Elul , 5768 by: 2 monthsMeasure) reverse.
	number := 6.
	coll do: [ :monthOfYear |
		number = 0 ifTrue: [ number := 13 ].
		self assert: monthOfYear monthNumber equals: number.
		number := number - 2 ].
	self assert: number equals: 5.
	coll := (Tishri , 5767 to: Elul , 5767 by: 2 monthsMeasure) reverse.
	number := 5.
	coll do: [ :monthOfYear |
		number < 0 ifTrue: [ number := 11 ].
		self assert: monthOfYear monthNumber equals: number.
		number := number - 2 ].
	self assert: number equals: 5
]
