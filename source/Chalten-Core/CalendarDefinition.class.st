"
A CalendarDefinition is an abstract class which defines common behavior for calendars.
All the calendars, their protocol and conversion was developed according to the description found in the book Calendrical Calculations written by Edward M. Reingold and Nachum Dershowitz.
"
Class {
	#name : 'CalendarDefinition',
	#superclass : 'Object',
	#category : 'Chalten-Core-Time',
	#package : 'Chalten-Core',
	#tag : 'Time'
}

{ #category : 'as yet unclassified' }
CalendarDefinition class >> calendarName [

	self subclassResponsibility
]

{ #category : 'initialization' }
CalendarDefinition class >> initializeCalendar [

	ChaltenEnvironment defineCalendarNamed: self calendarName with: self new
]

{ #category : 'day creation - private' }
CalendarDefinition >> addDay: aDay [

	^ self days at: aDay positionInWeek put: aDay
]

{ #category : 'days accessing' }
CalendarDefinition >> amountOfDaysPerWeek [

	self subclassResponsibility
]

{ #category : 'months accessing' }
CalendarDefinition >> amountOfMonthsInLeapYears [

	self subclassResponsibility
]

{ #category : 'months accessing' }
CalendarDefinition >> amountOfMonthsInNonleapYears [

	self subclassResponsibility
]

{ #category : 'months accessing' }
CalendarDefinition >> amountOfMonthsPerYear [

	self subclassResponsibility
]

{ #category : 'preconditions' }
CalendarDefinition >> assert: aMonth isValidIn: aYear [

	self subclassResponsibility
]

{ #category : 'preconditions' }
CalendarDefinition >> assertYearNumber: aNumber [

	(self isValidYearNumber: aNumber) 
		ifFalse: [InvalidYearNumberException signalNumber: aNumber calendar: self]
]

{ #category : 'converting' }
CalendarDefinition >> convert: aDateOrDateTime [

	(aDateOrDateTime isKindOf: FixedDate)
		ifTrue: [ ^self convertToDate: aDateOrDateTime ].
	(aDateOrDateTime isKindOf: ChaltenDateTime)
		ifTrue: [ ^self convertToDateTime: aDateOrDateTime ].
	self error: ('<1p> can`t be converted to Date nor DateTime' expandMacrosWith: aDateOrDateTime)
]

{ #category : 'converting - private' }
CalendarDefinition >> convertToDate: aDate [

	self subclassResponsibility
]

{ #category : 'converting - private' }
CalendarDefinition >> convertToDateTime: aDateTime [

	self subclassResponsibility
]

{ #category : 'as yet unclassified' }
CalendarDefinition >> convertToGregorianDate: aDate [

	^ (ChaltenEnvironment calendarNamed: #GregorianCalendar)
		  dateFromDays: aDate dayNumberFromEpoch
]

{ #category : 'as yet unclassified' }
CalendarDefinition >> convertToGregorianDateTime: aDateTime [

	^ChaltenDateTime
		date: (self convertToGregorianDate: aDateTime date)
		timeOfDay: aDateTime timeOfDay
]

{ #category : 'as yet unclassified' }
CalendarDefinition >> convertToHebrewDate: aDate [

	^ (ChaltenEnvironment calendarNamed: #HebrewCalendar) dateFromDays:
		  aDate dayNumberFromEpoch
]

{ #category : 'as yet unclassified' }
CalendarDefinition >> convertToHebrewDateTime: aDateTime [

	^ChaltenDateTime
		date: (self convertToHebrewDate: aDateTime date)
		timeOfDay: aDateTime timeOfDay
]

{ #category : 'as yet unclassified' }
CalendarDefinition >> convertToIslamicDate: aDate [

	^ (ChaltenEnvironment calendarNamed: #IslamicCalendar) dateFromDays:
		  aDate dayNumberFromEpoch
]

{ #category : 'as yet unclassified' }
CalendarDefinition >> convertToIslamicDateTime: aDateTime [

	^ChaltenDateTime
		date: (self convertToIslamicDate: aDateTime date)
		timeOfDay: aDateTime timeOfDay
]

{ #category : 'as yet unclassified' }
CalendarDefinition >> convertToJulianDate: aDate [

	^ (ChaltenEnvironment calendarNamed: #JulianCalendar) dateFromDays:
		  aDate dayNumberFromEpoch
]

{ #category : 'as yet unclassified' }
CalendarDefinition >> convertToJulianDateTime: aDateTime [

	^ChaltenDateTime
		date: (self convertToJulianDate: aDateTime date)
		timeOfDay: aDateTime timeOfDay
]

{ #category : 'converting' }
CalendarDefinition >> convertToSmalltalkDate: aDate [

	| gregorianDate |
	gregorianDate := aDate asGregorian.
	^Date
		newDay: gregorianDate dayNumber
		monthNumber: gregorianDate month number
		year: gregorianDate year number
]

{ #category : 'dates accessing' }
CalendarDefinition >> currentDateTime [

	^self subclassResponsibility
]

{ #category : 'dates accessing' }
CalendarDefinition >> currentDayOfMonth [

	^self today dayOfMonth
]

{ #category : 'dates accessing' }
CalendarDefinition >> currentMonth [

	^self today month
]

{ #category : 'dates accessing' }
CalendarDefinition >> currentMonthOfYear [

	^self today monthOfYear
]

{ #category : 'dates accessing' }
CalendarDefinition >> currentYear [

	^self today year
]

{ #category : 'dates accessing' }
CalendarDefinition >> dateFromDays: aDaysMeasure [ 
	^ self dateFromNumberOfDays: aDaysMeasure amount
]

{ #category : 'dates accessing - private' }
CalendarDefinition >> dateFromNumberOfDays: aNumberOfDays [

	self subclassResponsibility
]

{ #category : 'days accessing' }
CalendarDefinition >> dayNamed: aString [

	| lowercaseString |

	lowercaseString := aString asLowercase.
	^ self days
		detect: [ :day | day name asLowercase = lowercaseString ]
		ifNone: [ InvalidDayNameException signalName: aString ]
]

{ #category : 'days accessing' }
CalendarDefinition >> dayNumberFromEpochTo: aDate [ 
	^(self numberOfDaysFromDate: aDate) daysMeasure
]

{ #category : 'days accessing' }
CalendarDefinition >> dayOf: aDate [

	| dayPositionInWeek |

	dayPositionInWeek :=
		aDate numberOfDaysFromEpoch amount + 1 \\ self amountOfDaysPerWeek + 1.
	^self dayPositionedInWeek: dayPositionInWeek
]

{ #category : 'days accessing' }
CalendarDefinition >> dayPositionedInWeek: aNumber [

	(aNumber < 1 or: [ aNumber > self amountOfDaysPerWeek ])
		ifTrue: [ InvalidDayNumberException signalDayNumber: aNumber ].
	^ self days at: aNumber
]

{ #category : 'days accessing' }
CalendarDefinition >> days [

	self subclassResponsibility
]

{ #category : 'year querying' }
CalendarDefinition >> distanceInYearsFrom: aFromYear to: aToYear [

	self subclassResponsibility
]

{ #category : 'accessing' }
CalendarDefinition >> epoch [
	"The epoch or starting date is virtually never the date the calendar was adopted but rather a hypothetical starting point for the first day.
	- Extracted from 'Calendrical Calculations, The Millennium Edition'; page 16."


	self subclassResponsibility
]

{ #category : 'months accessing' }
CalendarDefinition >> firstMonth [

	self subclassResponsibility
]

{ #category : 'month of year accessing' }
CalendarDefinition >> firstMonthOf: aYear [

	^self firstMonth ofYear: aYear
]

{ #category : 'initialization' }
CalendarDefinition >> initialize [

	self initializeDays.
	self initializeMonths
]

{ #category : 'initialization' }
CalendarDefinition >> initializeDays [

	self subclassResponsibility
]

{ #category : 'initialization' }
CalendarDefinition >> initializeMonths [

	self subclassResponsibility
]

{ #category : 'year testing' }
CalendarDefinition >> isFirstMonthOfYear: aMonth [

	^aMonth is: self firstMonth
]

{ #category : 'year testing' }
CalendarDefinition >> isValidYearNumber: aNumber [

	self subclassResponsibility
]

{ #category : 'year testing' }
CalendarDefinition >> isYearNumberLeap: aNumber [

	self subclassResponsibility
]

{ #category : 'months accessing' }
CalendarDefinition >> lastMonth [

	self subclassResponsibility
]

{ #category : 'month of year accessing' }
CalendarDefinition >> lastMonthOf: aYear [

	^self lastMonth ofYear: aYear
]

{ #category : 'days accessing' }
CalendarDefinition >> maximumNumberOfDaysInOneYear [

	self subclassResponsibility
]

{ #category : 'months accessing' }
CalendarDefinition >> monthInLeapYearsNumbered: aNumber [

	^self monthsForLeapYears
		detect: [:month | month number = aNumber]
		ifNone: [InvalidMonthNumberException signalNumber: aNumber]
]

{ #category : 'months accessing' }
CalendarDefinition >> monthInNonleapYearsNumbered: aNumber [

	^self monthNumbered: aNumber
]

{ #category : 'months accessing' }
CalendarDefinition >> monthNamed: aString [

	| lowercaseString |

	lowercaseString := aString asLowercase.
	^self months
		detect: [:aMonth | aMonth name asLowercase = lowercaseString]
		ifNone: [InvalidMonthNameException signalName: aString]
]

{ #category : 'months accessing' }
CalendarDefinition >> monthNumbered: aNumber [

	^self months
		detect: [:month | month number = aNumber]
		ifNone: [InvalidMonthNumberException signalNumber: aNumber]
]

{ #category : 'months accessing' }
CalendarDefinition >> months [

	self subclassResponsibility
]

{ #category : 'months accessing' }
CalendarDefinition >> monthsForLeapYears [

	self subclassResponsibility
]

{ #category : 'months accessing' }
CalendarDefinition >> monthsForNonleapYears [

	self subclassResponsibility
]

{ #category : 'dates accessing' }
CalendarDefinition >> newDateFromYearNumber: aYearNumber monthNumber: aMonthNumber dayNumber: aDayNumber [

	^FixedDate yearNumber: aYearNumber monthNumber: aMonthNumber dayNumber: aDayNumber calendar: self
]

{ #category : 'year accessing' }
CalendarDefinition >> newYearNumberFrom: aYear adding: aNumberOfYears [

	self subclassResponsibility
]

{ #category : 'dates accessing' }
CalendarDefinition >> now [

	^self currentDateTime timeOfDay
]

{ #category : 'dates accessing - private' }
CalendarDefinition >> numberOfDaysFromDate: aDate [

	self subclassResponsibility
]

{ #category : 'days accessing' }
CalendarDefinition >> numberOfDaysFromEpochTo: aDate [
	^ (self dayNumberFromEpochTo: aDate) - 1 dayMeasure
]

{ #category : 'days accessing' }
CalendarDefinition >> numberOfDaysIn: aYear [

	self subclassResponsibility
]

{ #category : 'days accessing' }
CalendarDefinition >> numberOfDaysPerWeek [

	^self amountOfDaysPerWeek daysMeasure
]

{ #category : 'months accessing' }
CalendarDefinition >> numberOfMonthsPerYear [

	^ self amountOfMonthsPerYear monthsMeasure
]

{ #category : 'days accessing' }
CalendarDefinition >> sinceFirstDayOfWeek: aNumberOfDays [

	^self dayPositionedInWeek: (aNumberOfDays convertTo: TimeUnits day) amount + 1
]

{ #category : 'dates accessing' }
CalendarDefinition >> theBeginningOfTime [

	^TheBeginningOfTime
]

{ #category : 'dates accessing' }
CalendarDefinition >> theEndOfTime [

	^TheEndOfTime
]

{ #category : 'dates accessing' }
CalendarDefinition >> today [

	^self currentDateTime date
]

{ #category : 'dates accessing' }
CalendarDefinition >> tomorrow [

	^self today next
]

{ #category : 'dates accessing' }
CalendarDefinition >> yesterday [

	^self today previous
]
