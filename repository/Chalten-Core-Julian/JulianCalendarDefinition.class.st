"
A JulianCalendarDefinition is the julian calendar representation. It was a reform of the Roman calendar introduced by Julius Caesar in 46 BC (708 AUC). It was the predominant calendar until it was refined and superseded by the Gregorian calendar. The difference in the average length of the year between Julian (365.25 days) and Gregorian (365.2425 days) is 0.002%.

Instance Variables
	days:		<Collection>
	epoch:		<Number>
	months:	<Collection>

days
	- A collection of defined days.

epoch
	- The epoch or starting date is a hypothetical starting point for the first day.

months
	- A collection of defined months.

"
Class {
	#name : #JulianCalendarDefinition,
	#superclass : #RomanCalendarDefinition,
	#instVars : [
		'months',
		'days'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Chalten-Core-Julian'
}

{ #category : #initialization }
JulianCalendarDefinition class >> initializeGlobalNameCalendar [

	Smalltalk at: #JulianCalendar put: uniqueInstance
]

{ #category : #initialization }
JulianCalendarDefinition class >> initializeUniqueInstance [

	uniqueInstance := self basicNew initialize
]

{ #category : #'instance creation' }
JulianCalendarDefinition class >> new [

	^uniqueInstance
]

{ #category : #'converting - private' }
JulianCalendarDefinition >> convertToDate: aDate [

	^self convertToJulianDate: aDate
]

{ #category : #'converting - private' }
JulianCalendarDefinition >> convertToDateTime: aDateTime [

	^self convertToJulianDateTime: aDateTime
]

{ #category : #'dates accessing' }
JulianCalendarDefinition >> currentDateTime [

	^self convertToJulianDateTime: GregorianCalendar currentDateTime
]

{ #category : #'days accessing' }
JulianCalendarDefinition >> days [

	^days
]

{ #category : #'year querying' }
JulianCalendarDefinition >> distanceInYearsFrom: aFromYear to: aToYear [

	| difference |

	difference := aToYear number - aFromYear number.
	aFromYear number < 0
		ifTrue: [aToYear number > 0 ifTrue: [difference := difference - 1]]
		ifFalse: [aToYear number < 0 ifTrue: [difference := difference + 1]].
	^difference yearsMeasure
]

{ #category : #accessing }
JulianCalendarDefinition >> epoch [

	"The epoch or starting date is virtually never the date the calendar was adopted but rather a hypothetical starting point for the first day.
	The julian calendar epoch is January 1, 1 (R.D. -1), that is equal to gregorian date December 30, 0.
	- Extracted from 'Calendrical Calculations, The Millennium Edition'; page 16."

	^ -1
]

{ #category : #initialization }
JulianCalendarDefinition >> initializeDays [
	"Days begins at midnight. The week begins on sunday The days are named:
		Sunday
		Monday
		Tuesday
		Wednesday
		Thursday
		Friday
		Saturday"
		
	days := Array new: self amountOfDaysPerWeek.
	super initializeDays
]

{ #category : #initialization }
JulianCalendarDefinition >> initializeDaysGlobalVariables [

	Smalltalk at: #JulianMonday put: self monday.
	Smalltalk at: #JulianTuesday put: self tuesday.
	Smalltalk at: #JulianWednesday put: self wednesday.
	Smalltalk at: #JulianThursday put: self thursday.
	Smalltalk at: #JulianFriday put: self friday.
	Smalltalk at: #JulianSaturday put: self saturday.
	Smalltalk at: #JulianSunday put: self sunday
]

{ #category : #initialization }
JulianCalendarDefinition >> initializeMonths [
	"This calendar is based on a 365-day common year divided into 12 months of lengths 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30 and 31 days, and on 366 days in leap years,
	the extra day being added to make the second month 29 days long:
		(1) January 		31 days
		(2) February 	28 {29} days
		(3) March 		31 days
		(4) April 		30 days
		(5) May 		31 days
		(6) June 		30 days
		(7) July 			31 days
		(8) August 		31 days
		(9) September 	30 days
		(10) October 	31 days
		(11) Novmeber 	30 days
		(12) December 31 days
	The leap-year strcture is given in curly brackets. A year is leap if it is divisble by 4"

	months := Array new: self amountOfMonthsPerYear.
	super initializeMonths
]

{ #category : #initialization }
JulianCalendarDefinition >> initializeMonthsGlobalVariables [

	Smalltalk at: #JulianJanuary put: self january.
	Smalltalk at: #JulianFebruary put: self february.
	Smalltalk at: #JulianMarch put: self march.
	Smalltalk at: #JulianApril put: self april.
	Smalltalk at: #JulianMay put: self may.
	Smalltalk at: #JulianJune put: self june.
	Smalltalk at: #JulianJuly put: self july.
	Smalltalk at: #JulianAugust put: self august.
	Smalltalk at: #JulianSeptember put: self september.
	Smalltalk at: #JulianOctober put: self october.
	Smalltalk at: #JulianNovember put: self november.
	Smalltalk at: #JulianDecember put: self december
]

{ #category : #'year testing' }
JulianCalendarDefinition >> isValidYearNumber: aNumber [

	^aNumber ~= 0 and: [ aNumber isInteger ]
]

{ #category : #'year testing' }
JulianCalendarDefinition >> isYearNumberLeap: aNumber [
	"A julian year y is a leap year if (y mod 4) = 0 when y > 0 or if (y mod 4) = 3 when y < 0.
	- Extracted from 'Calendrical Calculations, Third Edition'; page 63."


	^aNumber > 0 ifTrue: [aNumber \\ 4 = 0] ifFalse: [aNumber \\ 4 = 3]
]

{ #category : #'months accessing' }
JulianCalendarDefinition >> months [

	^months
]

{ #category : #'year accessing' }
JulianCalendarDefinition >> newYearNumberFrom: aChristianYear adding: aNumberOfYears [

	| newNumber |
	newNumber := aChristianYear number + aNumberOfYears.
	(newNumber = 0 and: [ aNumberOfYears positive ])
		ifTrue: [ ^1 ].
	(newNumber = 0 and: [ aNumberOfYears negative ])
		ifTrue: [ ^-1 ].
	^newNumber
]

{ #category : #'dates accessing - private' }
JulianCalendarDefinition >> numberOfDaysFromDate: aJulianDate [
	"We add together the number of days before the epoch of the calendar, the number of nonleap days since the epoch, the number of leap days since the epoch,
	the number of days in prior months of the given date, and the number of days in the given month up to and including the given date. For nonpositive years,
	we adjust the year to accommodate the lack of year 0. - Extracted from 'Calendrical Calculations, The Millennium Edition'; page 65."
	
	| yearNumber monthNumber dayNumber yearNumberCorrected priorNonleapDays priorLeapDays priorDays februaryCorrection |
	yearNumber := aJulianDate year number.
	monthNumber := aJulianDate month number.
	dayNumber := aJulianDate dayNumber.
	yearNumberCorrected := yearNumber < 0 
		ifTrue: [yearNumber + 1]
		ifFalse: [yearNumber].
	priorNonleapDays := self epoch - 1 + (365 * (yearNumberCorrected - 1)).
	priorLeapDays := (yearNumberCorrected - 1) // 4.
	priorDays := (367 * monthNumber - 362) // 12.
	februaryCorrection := (CorrectionForFixedFromDateBehavior for: aJulianDate) value.
	^priorNonleapDays + priorLeapDays + priorDays - februaryCorrection + dayNumber
]

{ #category : #printing }
JulianCalendarDefinition >> printOn: aStream [

	aStream nextPutAll: 'Julian Calendar'
]
