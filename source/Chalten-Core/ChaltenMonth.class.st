"
A ChaltenMonth is month representation.

Instance Variables
	calendar:		<CalendarDefinition>
	definition:		<MonthDefinition>
	name:			<String>
	number:		<Number>

calendar
	- The calendar that the month belongs to.

definition
	- The month definition.

name
	- The month name.

number
	- The month number.

"
Class {
	#name : #ChaltenMonth,
	#superclass : #PointInTime,
	#instVars : [
		'definition',
		'name',
		'number',
		'calendar'
	],
	#category : #'Chalten-Core-Time'
}

{ #category : #'instance creation' }
ChaltenMonth class >> named: aString numbered: aNumber definedAs: aMonthDefinition calendar: aCalendar [
	"Don`t use this message to obtain an specific month. The correct way to obtain a month is sending to calendar the message named as the month; or send #monthNamed: or #monthNumbered:,
	with the correct collaborators, to the calendar too.
	Or, directly, use the well know objects, for example: January, February, March, April, May, June, July, August, September, October, November or December"
	
	^self new initializeNamed: aString numbered: aNumber definedAs: aMonthDefinition calendar: aCalendar
]

{ #category : #'month of year creation' }
ChaltenMonth >> , aNumber [

	^self ofYear: (ChaltenYear number: aNumber calendar: calendar)
]

{ #category : #'magnitude protocol' }
ChaltenMonth >> < aMonth [

	self assertIsSameKindAs: aMonth.
	^self number < aMonth number
]

{ #category : #preconditions }
ChaltenMonth >> assertIsValidIn: aYear [

	calendar assert: self isValidIn: aYear
]

{ #category : #accessing }
ChaltenMonth >> calendar [

	^calendar
]

{ #category : #'interval protocol - private' }
ChaltenMonth >> defaultIntervalIncrement [

	^ calendar monthUnit with: 1
]

{ #category : #'accessing - private' }
ChaltenMonth >> defaultMonthsForCircularStreamStrategy [

	^self monthsOfNonleapYearsForCircularStreamStrategy
]

{ #category : #querying }
ChaltenMonth >> distanceTo: aMonth [

	^self distanceTo: aMonth strategy: self defaultMonthsForCircularStreamStrategy
]

{ #category : #'querying - private' }
ChaltenMonth >> distanceTo: aMonth strategy: aMonthsForCircularStreamStrategy [

	^aMonthsForCircularStreamStrategy distanceFrom: self to: aMonth
]

{ #category : #'day of month creation' }
ChaltenMonth >> eighteenth [

	^DayOfMonth month: self dayNumber: 18
]

{ #category : #'day of month creation' }
ChaltenMonth >> eighth [

	^DayOfMonth month: self dayNumber: 8
]

{ #category : #'day of month creation' }
ChaltenMonth >> eleventh [

	^DayOfMonth month: self dayNumber: 11
]

{ #category : #'day of month creation' }
ChaltenMonth >> fifteenth [

	^DayOfMonth month: self dayNumber: 15
]

{ #category : #'day of month creation' }
ChaltenMonth >> fifth [

	^DayOfMonth month: self dayNumber: 5
]

{ #category : #'day of month creation' }
ChaltenMonth >> first [

	^DayOfMonth month: self dayNumber: 1
]

{ #category : #'accessing days of months' }
ChaltenMonth >> firstDayOfMonth [

	^DayOfMonth month: self dayNumber: 1
]

{ #category : #'day of month creation' }
ChaltenMonth >> fourteenth [

	^DayOfMonth month: self dayNumber: 14
]

{ #category : #'day of month creation' }
ChaltenMonth >> fourth [

	^DayOfMonth month: self dayNumber: 4
]

{ #category : #initialization }
ChaltenMonth >> initializeNamed: aString numbered: aNumber definedAs: aMonthDefinition calendar: aCalendar [

	name := aString.
	number := aNumber.
	definition := aMonthDefinition.
	calendar := aCalendar
]

{ #category : #'interval protocol - private' }
ChaltenMonth >> intervalStrategy [

	^RoundedTimelineIntervalStrategy new
]

{ #category : #testing }
ChaltenMonth >> is: aMonth [

	^self = aMonth
]

{ #category : #testing }
ChaltenMonth >> isFirstMonthOfYear [

	^calendar isFirstMonthOfYear: self
]

{ #category : #testing }
ChaltenMonth >> isPreviousTo: aMonth in: aYear [

	| stream |
	
	stream := CircularReadStream
		on: aYear arrayOfMonths
		moving: calendar monthUnit
		startingCircleAt: calendar firstMonth.
	^stream isPrevious: self to: aMonth
]

{ #category : #testing }
ChaltenMonth >> isValidDayNumber: aDayNumber [

	^definition isValidDayNumber: aDayNumber
]

{ #category : #accessing }
ChaltenMonth >> lastDayNumber [
	
	^self numberOfDays amount
]

{ #category : #accessing }
ChaltenMonth >> lastDayNumberIn: aYear [

	^(self numberOfDaysIn: aYear) amount
]

{ #category : #'accessing days of months' }
ChaltenMonth >> lastDayOfMonth [

	^DayOfMonth month: self dayNumber: self lastDayNumber
]

{ #category : #'accessing - private' }
ChaltenMonth >> monthsOfLeapYearsForCircularStreamStrategy [

	^MonthsOfLeapYearsForCircularStreamStrategy of: calendar
]

{ #category : #'accessing - private' }
ChaltenMonth >> monthsOfNonleapYearsForCircularStreamStrategy [

	^MonthsOfNonleapYearsForCircularStreamStrategy of: calendar
]

{ #category : #accessing }
ChaltenMonth >> name [

	^name
]

{ #category : #enumerating }
ChaltenMonth >> next: aMeasure [

	^self next: aMeasure strategy: self defaultMonthsForCircularStreamStrategy
]

{ #category : #'enumerating - private' }
ChaltenMonth >> next: aMeasure strategy: aMonthsForCircularStreamStrategy [

	^aMonthsForCircularStreamStrategy next: aMeasure from: self
]

{ #category : #enumerating }
ChaltenMonth >> nextInLeapYears [
	
	^self nextInLeapYears: self defaultIntervalIncrement
]

{ #category : #enumerating }
ChaltenMonth >> nextInLeapYears: aMeasure [

	^self next: aMeasure strategy: self monthsOfLeapYearsForCircularStreamStrategy
]

{ #category : #enumerating }
ChaltenMonth >> nextInNonleapYears [
	
	^self nextInNonleapYears: self defaultIntervalIncrement
]

{ #category : #enumerating }
ChaltenMonth >> nextInNonleapYears: aMeasure [

	^self next: aMeasure strategy: self monthsOfNonleapYearsForCircularStreamStrategy
]

{ #category : #'day of month creation' }
ChaltenMonth >> nineteenth [

	^DayOfMonth month: self dayNumber: 19
]

{ #category : #'day of month creation' }
ChaltenMonth >> ninth [

	^DayOfMonth month: self dayNumber: 9
]

{ #category : #accessing }
ChaltenMonth >> number [

	^number
]

{ #category : #'accessing days' }
ChaltenMonth >> numberOfDays [

	^definition numberOfDays
]

{ #category : #'accessing days' }
ChaltenMonth >> numberOfDaysFromBeginningOfYearIn: aYear [

	^definition numberOfDaysFromBeginningOfYearIn: aYear for: self
]

{ #category : #'accessing days' }
ChaltenMonth >> numberOfDaysIn: aYear [

	^definition numberOfDaysIn: aYear
]

{ #category : #'accessing days' }
ChaltenMonth >> numberOfDaysInLeapYear [

	^definition numberOfDaysInLeapYear
]

{ #category : #'accessing days' }
ChaltenMonth >> numberOfDaysInNonleapYear [

	^definition numberOfDaysInNonleapYear
]

{ #category : #'month of year creation' }
ChaltenMonth >> of: aYearNumber [

	^self, aYearNumber
]

{ #category : #'month of year creation' }
ChaltenMonth >> ofYear: aYear [

	^MonthOfYear year: aYear month: self
]

{ #category : #printing }
ChaltenMonth >> printOn: aStream [

	aStream nextPutAll: self name
]

{ #category : #'day of month creation' }
ChaltenMonth >> second [

	^DayOfMonth month: self dayNumber: 2
]

{ #category : #'day of month creation' }
ChaltenMonth >> seventeenth [

	^DayOfMonth month: self dayNumber: 17
]

{ #category : #'day of month creation' }
ChaltenMonth >> seventh [

	^DayOfMonth month: self dayNumber: 7
]

{ #category : #'day of month creation' }
ChaltenMonth >> sixteenth [

	^DayOfMonth month: self dayNumber: 16
]

{ #category : #'day of month creation' }
ChaltenMonth >> sixth [

	^DayOfMonth month: self dayNumber: 6
]

{ #category : #'day of month creation' }
ChaltenMonth >> tenth [

	^DayOfMonth month: self dayNumber: 10
]

{ #category : #'day of month creation' }
ChaltenMonth >> third [

	^DayOfMonth month: self dayNumber: 3
]

{ #category : #'day of month creation' }
ChaltenMonth >> thirteenth [

	^DayOfMonth month: self dayNumber: 13
]

{ #category : #'day of month creation' }
ChaltenMonth >> thirtieth [

	^DayOfMonth month: self dayNumber: 30
]

{ #category : #'day of month creation' }
ChaltenMonth >> thirtyfirst [

	^DayOfMonth month: self dayNumber: 31
]

{ #category : #'day of month creation' }
ChaltenMonth >> twelfth [

	^DayOfMonth month: self dayNumber: 12
]

{ #category : #'day of month creation' }
ChaltenMonth >> twentieth [

	^DayOfMonth month: self dayNumber: 20
]

{ #category : #'day of month creation' }
ChaltenMonth >> twentyeighth [

	^DayOfMonth month: self dayNumber: 28
]

{ #category : #'day of month creation' }
ChaltenMonth >> twentyfifth [

	^DayOfMonth month: self dayNumber: 25
]

{ #category : #'day of month creation' }
ChaltenMonth >> twentyfirst [

	^DayOfMonth month: self dayNumber: 21
]

{ #category : #'day of month creation' }
ChaltenMonth >> twentyfourth [

	^DayOfMonth month: self dayNumber: 24
]

{ #category : #'day of month creation' }
ChaltenMonth >> twentyninth [

	^DayOfMonth month: self dayNumber: 29
]

{ #category : #'day of month creation' }
ChaltenMonth >> twentysecond [

	^DayOfMonth month: self dayNumber: 22
]

{ #category : #'day of month creation' }
ChaltenMonth >> twentyseventh [

	^DayOfMonth month: self dayNumber: 27
]

{ #category : #'day of month creation' }
ChaltenMonth >> twentysixth [

	^DayOfMonth month: self dayNumber: 26
]

{ #category : #'day of month creation' }
ChaltenMonth >> twentythird [

	^DayOfMonth month: self dayNumber: 23
]
