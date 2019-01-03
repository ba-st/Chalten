"
A GregorianCalendarDefinition is the gregorian calendar representation. Is the most widely used civil calendar. The calendar was a refinement in 1582 to the julian calendar amounting to a 0.002% correction in the length of the year.

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
	#name : #GregorianCalendarDefinition,
	#superclass : #RomanCalendarDefinition,
	#instVars : [
		'months',
		'days'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Chalten-Gregorian-Calendar'
}

{ #category : #initialization }
GregorianCalendarDefinition class >> initializeGlobalNameCalendar [

	Smalltalk at: #GregorianCalendar put: uniqueInstance
]

{ #category : #initialization }
GregorianCalendarDefinition class >> initializeUniqueInstance [

	uniqueInstance := self basicNew initialize
]

{ #category : #'instance creation' }
GregorianCalendarDefinition class >> new [

	^uniqueInstance
]

{ #category : #'converting - private' }
GregorianCalendarDefinition >> convertToDate: aDate [

	^self convertToGregorianDate: aDate
]

{ #category : #'converting - private' }
GregorianCalendarDefinition >> convertToDateTime: aDateTime [

	^self convertToGregorianDateTime: aDateTime
]

{ #category : #'dates accessing' }
GregorianCalendarDefinition >> currentDateTime [

	| millisecondsFromEpoch |
	millisecondsFromEpoch := ChaltenEnvironment millisecondsClock millisecondsMeasure.
	^(self pharoEpoch
		next: millisecondsFromEpoch) convertTo: TimeZones local
]

{ #category : #'days accessing' }
GregorianCalendarDefinition >> days [

	^days
]

{ #category : #'year querying' }
GregorianCalendarDefinition >> distanceInYearsFrom: aFromYear to: aToYear [

	| difference |

	difference := aToYear number - aFromYear number.
	^difference yearsMeasure
]

{ #category : #accessing }
GregorianCalendarDefinition >> epoch [

	"The epoch or starting date is virtually never the date the calendar was adopted but rather a hypothetical starting point for the first day.
	The gregorian calendar was devised and adopted in the sixteenth century, but its epoch is January 1, 1 (R.D. 1).
	- Extracted from 'Calendrical Calculations, The Millennium Edition'; page 16."

	^ 1
]

{ #category : #initialization }
GregorianCalendarDefinition >> initializeDays [
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
GregorianCalendarDefinition >> initializeDaysGlobalVariables [

	Smalltalk at: #Monday put: self monday.
	Smalltalk at: #Tuesday put: self tuesday.
	Smalltalk at: #Wednesday put: self wednesday.
	Smalltalk at: #Thursday put: self thursday.
	Smalltalk at: #Friday put: self friday.
	Smalltalk at: #Saturday put: self saturday.
	Smalltalk at: #Sunday put: self sunday
]

{ #category : #initialization }
GregorianCalendarDefinition >> initializeMonths [
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
	The leap-year strcture is given in curly brackets. A year is leap if it is divisble by 4 and is not a century year (multiple of 100) or if it is divisible by 400.
	- Extracted from 'Calendrical Calculations, The Millennium Edition'; page 47."

	months := Array new: self amountOfMonthsPerYear.
	super initializeMonths
]

{ #category : #initialization }
GregorianCalendarDefinition >> initializeMonthsGlobalVariables [

	Smalltalk at: #January put: self january.
	Smalltalk at: #February put: self february.
	Smalltalk at: #March put: self march.
	Smalltalk at: #April put: self april.
	Smalltalk at: #May put: self may.
	Smalltalk at: #June put: self june.
	Smalltalk at: #July put: self july.
	Smalltalk at: #August put: self august.
	Smalltalk at: #September put: self september.
	Smalltalk at: #October put: self october.
	Smalltalk at: #November put: self november.
	Smalltalk at: #December put: self december
]

{ #category : #'year testing' }
GregorianCalendarDefinition >> isValidYearNumber: aNumber [

	^aNumber isInteger
]

{ #category : #'year testing' }
GregorianCalendarDefinition >> isYearNumberLeap: aNumber [
	"A gregorian year y is a leap year if (y mod 4) = 0 ^ (y mod 400) ~= {100, 200, 300}.
	- Extracted from 'Calendrical Calculations, Third Edition'; page 49."


	^aNumber \\ 4 = 0 and: [(aNumber \\ 100 ~= 0 or: [aNumber \\ 400 = 0])]
]

{ #category : #'months accessing' }
GregorianCalendarDefinition >> months [

	^months
]

{ #category : #'year accessing' }
GregorianCalendarDefinition >> newYearNumberFrom: aYear adding: aNumberOfYears [

	^aYear number + aNumberOfYears
]

{ #category : #'dates accessing - private' }
GregorianCalendarDefinition >> numberOfDaysFromDate: aDate [
	"We add together the number of days before the epoch of the calendar (0, but we do it explicit so that the dependence on our arbitrary starting date is clear),
	the number of nonleap days since the epoch, the number of leap days since the epoch, the number of days in prior months of the given date,
	and the number of days up to and including the given date. The number of days in prior months of the given year is corrected by 0, 1 or 2
	for the assumption that February always has 30 days. - Extracted from 'Calendrical Calculations, The Millennium Edition'; page 51."
	
	| yearNumber monthNumber dayNumber priorNonleapDays priorLeapDays priorDays februaryCorrection |
	yearNumber := aDate year number.
	monthNumber := aDate month number.
	dayNumber := aDate dayNumber.
	priorNonleapDays := self epoch - 1 + (365 * (yearNumber - 1)).
	priorLeapDays := (yearNumber - 1) // 4 - ((yearNumber - 1) // 100) + ((yearNumber - 1) // 400).
	priorDays := (367 * monthNumber - 362) // 12.
	februaryCorrection := (CorrectionForFixedFromDateBehavior for: aDate) value.
	^priorNonleapDays + priorLeapDays + priorDays - februaryCorrection + dayNumber
]

{ #category : #'accessing - private' }
GregorianCalendarDefinition >> pharoEpoch [
	"Answer the Squeak/Pharo epoch.
	That is 00:00:00 on the morning of January 1, 1901 UTC"

	^DateTime
		date: January first, 1901
		timeOfDay: TimeOfDay firstTimeOfDay
		zone: TimeZones universalTime
]

{ #category : #printing }
GregorianCalendarDefinition >> printOn: aStream [

	aStream nextPutAll: 'Gregorian Calendar'
]
