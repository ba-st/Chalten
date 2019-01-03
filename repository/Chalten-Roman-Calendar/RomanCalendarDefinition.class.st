"
A RomanCalendarDefinition is an abstract class wich defines common behavior for roman calendars.

"
Class {
	#name : #RomanCalendarDefinition,
	#superclass : #CalendarDefinition,
	#category : #'Chalten-Roman-Calendar'
}

{ #category : #'month creation - private' }
RomanCalendarDefinition >> addMonth: aMonth [

	^self months at: aMonth number put: aMonth
]

{ #category : #'days accessing' }
RomanCalendarDefinition >> amountOfDaysPerWeek [
	
	^7
]

{ #category : #'months accessing' }
RomanCalendarDefinition >> amountOfMonthsInLeapYears [

	^self amountOfMonthsPerYear
]

{ #category : #'months accessing' }
RomanCalendarDefinition >> amountOfMonthsInNonleapYears [

	^self amountOfMonthsPerYear
]

{ #category : #'months accessing' }
RomanCalendarDefinition >> amountOfMonthsPerYear [

	^12
]

{ #category : #'months accessing' }
RomanCalendarDefinition >> april [

	^self months at: self aprilNumber
]

{ #category : #'month definitions - private' }
RomanCalendarDefinition >> aprilDefinition [
	^ GenericMonthDefinition numberOfDays: 30 daysMeasure
]

{ #category : #'month names' }
RomanCalendarDefinition >> aprilName [
	
	^'April'
]

{ #category : #'month numbers' }
RomanCalendarDefinition >> aprilNumber [
	
	^4
]

{ #category : #'month preconditions' }
RomanCalendarDefinition >> assert: aMonth isValidIn: aYear [
]

{ #category : #'months accessing' }
RomanCalendarDefinition >> august [

	^self months at: self augustNumber
]

{ #category : #'month definitions - private' }
RomanCalendarDefinition >> augustDefinition [
	^ GenericMonthDefinition numberOfDays: 31 daysMeasure
]

{ #category : #'month names' }
RomanCalendarDefinition >> augustName [
	
	^'August'
]

{ #category : #'month numbers' }
RomanCalendarDefinition >> augustNumber [
	
	^8
]

{ #category : #'month creation - private' }
RomanCalendarDefinition >> createApril [
	^ ChaltenMonth 
		named: self aprilName
		numbered: self aprilNumber
		definedAs: self aprilDefinition
		calendar: self
]

{ #category : #'month creation - private' }
RomanCalendarDefinition >> createAugust [
	^ ChaltenMonth 
		named: self augustName
		numbered: self augustNumber
		definedAs: self augustDefinition
		calendar: self
]

{ #category : #'month creation - private' }
RomanCalendarDefinition >> createDecember [
	^ ChaltenMonth 
		named: self decemberName
		numbered: self decemberNumber
		definedAs: self decemberDefinition
		calendar: self
]

{ #category : #'month creation - private' }
RomanCalendarDefinition >> createFebruary [
	^ ChaltenMonth 
		named: self februaryName
		numbered: self februaryNumber
		definedAs: self februaryDefinition
		calendar: self
]

{ #category : #'day creation - private' }
RomanCalendarDefinition >> createFriday [
	^ Day 
		named: self fridayName
		positionInWeek: self fridayPositionInWeek
		calendar: self
]

{ #category : #'month creation - private' }
RomanCalendarDefinition >> createJanuary [
	^ ChaltenMonth 
		named: self januaryName
		numbered: self januaryNumber
		definedAs: self januaryDefinition
		calendar: self
]

{ #category : #'month creation - private' }
RomanCalendarDefinition >> createJuly [
	^ ChaltenMonth 
		named: self julyName
		numbered: self julyNumber
		definedAs: self julyDefinition
		calendar: self
]

{ #category : #'month creation - private' }
RomanCalendarDefinition >> createJune [
	^ ChaltenMonth 
		named: self juneName
		numbered: self juneNumber
		definedAs: self juneDefinition
		calendar: self
]

{ #category : #'month creation - private' }
RomanCalendarDefinition >> createMarch [
	^ ChaltenMonth 
		named: self marchName
		numbered: self marchNumber
		definedAs: self marchDefinition
		calendar: self
]

{ #category : #'month creation - private' }
RomanCalendarDefinition >> createMay [
	^ ChaltenMonth 
		named: self mayName
		numbered: self mayNumber
		definedAs: self mayDefinition
		calendar: self
]

{ #category : #'day creation - private' }
RomanCalendarDefinition >> createMonday [
	^ Day 
		named: self mondayName
		positionInWeek: self mondayPositionInWeek
		calendar: self
]

{ #category : #'month creation - private' }
RomanCalendarDefinition >> createNovember [
	^ ChaltenMonth 
		named: self novemberName
		numbered: self novemberNumber
		definedAs: self novemberDefinition
		calendar: self
]

{ #category : #'month creation - private' }
RomanCalendarDefinition >> createOctober [
	^ ChaltenMonth 
		named: self octoberName
		numbered: self octoberNumber
		definedAs: self octoberDefinition
		calendar: self
]

{ #category : #'day creation - private' }
RomanCalendarDefinition >> createSaturday [
	^ Day 
		named: self saturdayName
		positionInWeek: self saturdayPositionInWeek
		calendar: self
]

{ #category : #'month creation - private' }
RomanCalendarDefinition >> createSeptember [
	^ ChaltenMonth 
		named: self septemberName
		numbered: self septemberNumber
		definedAs: self septemberDefinition
		calendar: self
]

{ #category : #'day creation - private' }
RomanCalendarDefinition >> createSunday [
	^ Day 
		named: self sundayName
		positionInWeek: self sundayPositionInWeek
		calendar: self
]

{ #category : #'day creation - private' }
RomanCalendarDefinition >> createThursday [
	^ Day 
		named: self thursdayName
		positionInWeek: self thursdayPositionInWeek
		calendar: self
]

{ #category : #'day creation - private' }
RomanCalendarDefinition >> createTuesday [
	^ Day 
		named: self tuesdayName
		positionInWeek: self tuesdayPositionInWeek
		calendar: self
]

{ #category : #'day creation - private' }
RomanCalendarDefinition >> createWednesday [
	^ Day 
		named: self wednesdayName
		positionInWeek: self wednesdayPositionInWeek
		calendar: self
]

{ #category : #'dates accessing - private' }
RomanCalendarDefinition >> dateFromNumberOfDays: aNumberOfDays [

	| yearNumber priorDays correction monthNumber dayNumber |
	yearNumber := self yearNumberFromFixed: aNumberOfDays.
	priorDays := aNumberOfDays - (self numberOfDaysFromDate: self january first , yearNumber).
	correction := (CorrectionForDateFromFixedBehavior for: yearNumber fixed: aNumberOfDays using: self) value.
	monthNumber := (12 * (priorDays + correction) + 373) // 367.
	dayNumber := aNumberOfDays - (self numberOfDaysFromDate: (self newDateFromYearNumber: yearNumber monthNumber: monthNumber dayNumber: 1)) + 1.
	^self
		newDateFromYearNumber: yearNumber
		monthNumber: monthNumber
		dayNumber: dayNumber
]

{ #category : #'months accessing' }
RomanCalendarDefinition >> december [

	^self months at: self decemberNumber
]

{ #category : #'month definitions - private' }
RomanCalendarDefinition >> decemberDefinition [
	^ GenericMonthDefinition numberOfDays: 31 daysMeasure
]

{ #category : #'month names' }
RomanCalendarDefinition >> decemberName [
	
	^'December'
]

{ #category : #'month numbers' }
RomanCalendarDefinition >> decemberNumber [
	
	^12
]

{ #category : #'months accessing' }
RomanCalendarDefinition >> february [

	^self months at: self februaryNumber
]

{ #category : #'month definitions - private' }
RomanCalendarDefinition >> februaryDefinition [
	^ GenericMonthDefinition numberOfDaysInNonleapYear: 28 daysMeasure numberOfDaysInLeapYear: 29 daysMeasure
]

{ #category : #'month names' }
RomanCalendarDefinition >> februaryName [
	
	^'February'
]

{ #category : #'month numbers' }
RomanCalendarDefinition >> februaryNumber [
	
	^2
]

{ #category : #'months accessing' }
RomanCalendarDefinition >> firstMonth [

	^self january
]

{ #category : #'days accessing' }
RomanCalendarDefinition >> friday [

	^self dayPositionedInWeek: self fridayPositionInWeek
]

{ #category : #'day names' }
RomanCalendarDefinition >> fridayName [
	
	^'Friday'
]

{ #category : #'day positions in week' }
RomanCalendarDefinition >> fridayPositionInWeek [
	
	^6
]

{ #category : #initialization }
RomanCalendarDefinition >> initializeDays [

	self addDay: self createSunday.
	self addDay: self createMonday.
	self addDay: self createTuesday.
	self addDay: self createWednesday.
	self addDay: self createThursday.
	self addDay: self createFriday.
	self addDay: self createSaturday
]

{ #category : #initialization }
RomanCalendarDefinition >> initializeGlobalVariables [

	self initializeDaysGlobalVariables.
	self initializeMonthsGlobalVariables
]

{ #category : #initialization }
RomanCalendarDefinition >> initializeMonths [

	self addMonth: self createJanuary.
	self addMonth: self createFebruary.
	self addMonth: self createMarch.
	self addMonth: self createApril.
	self addMonth: self createMay.
	self addMonth: self createJune.
	self addMonth: self createJuly.
	self addMonth: self createAugust.
	self addMonth: self createSeptember.
	self addMonth: self createOctober.
	self addMonth: self createNovember.
	self addMonth: self createDecember
]

{ #category : #'month testing' }
RomanCalendarDefinition >> isApril: aChristianMonth [

	^aChristianMonth is: self april
]

{ #category : #'month testing' }
RomanCalendarDefinition >> isAugust: aChristianMonth [

	^aChristianMonth is: self august
]

{ #category : #'month testing' }
RomanCalendarDefinition >> isDecember: aChristianMonth [

	^aChristianMonth is: self december
]

{ #category : #'month testing' }
RomanCalendarDefinition >> isFebruary: aChristianMonth [

	^aChristianMonth is: self february
]

{ #category : #'day testing' }
RomanCalendarDefinition >> isFriday: aDay [

	^aDay is: self friday
]

{ #category : #'month testing' }
RomanCalendarDefinition >> isJanuary: aChristianMonth [

	^aChristianMonth is: self january
]

{ #category : #'month testing' }
RomanCalendarDefinition >> isJuly: aChristianMonth [

	^aChristianMonth is: self july
]

{ #category : #'month testing' }
RomanCalendarDefinition >> isJune: aChristianMonth [

	^aChristianMonth is: self june
]

{ #category : #'month testing' }
RomanCalendarDefinition >> isMarch: aChristianMonth [

	^aChristianMonth is: self march
]

{ #category : #'month testing' }
RomanCalendarDefinition >> isMay: aChristianMonth [

	^aChristianMonth is: self may
]

{ #category : #'day testing' }
RomanCalendarDefinition >> isMonday: aDay [

	^aDay is: self monday
]

{ #category : #'month testing' }
RomanCalendarDefinition >> isNovember: aChristianMonth [

	^aChristianMonth is: self november
]

{ #category : #'month testing' }
RomanCalendarDefinition >> isOctober: aChristianMonth [

	^aChristianMonth is: self october
]

{ #category : #'day testing' }
RomanCalendarDefinition >> isSaturday: aDay [

	^aDay is: self saturday
]

{ #category : #'month testing' }
RomanCalendarDefinition >> isSeptember: aChristianMonth [

	^aChristianMonth is: self september
]

{ #category : #'day testing' }
RomanCalendarDefinition >> isSunday: aDay [

	^aDay is: self sunday
]

{ #category : #'day testing' }
RomanCalendarDefinition >> isThursday: aDay [

	^aDay is: self thursday
]

{ #category : #'day testing' }
RomanCalendarDefinition >> isTuesday: aDay [

	^aDay is: self tuesday
]

{ #category : #'day testing' }
RomanCalendarDefinition >> isWednesday: aDay [

	^aDay is: self wednesday
]

{ #category : #'months accessing' }
RomanCalendarDefinition >> january [

	^self months at: self januaryNumber
]

{ #category : #'month definitions - private' }
RomanCalendarDefinition >> januaryDefinition [
	^ GenericMonthDefinition numberOfDays: 31 daysMeasure
]

{ #category : #'month names' }
RomanCalendarDefinition >> januaryName [

	^'January'
]

{ #category : #'month numbers' }
RomanCalendarDefinition >> januaryNumber [
	
	^1
]

{ #category : #'months accessing' }
RomanCalendarDefinition >> july [

	^self months at: self julyNumber
]

{ #category : #'month definitions - private' }
RomanCalendarDefinition >> julyDefinition [
	^ GenericMonthDefinition numberOfDays: 31 daysMeasure
]

{ #category : #'month names' }
RomanCalendarDefinition >> julyName [
	
	^'July'
]

{ #category : #'month numbers' }
RomanCalendarDefinition >> julyNumber [
	
	^7
]

{ #category : #'months accessing' }
RomanCalendarDefinition >> june [

	^self months at: self juneNumber
]

{ #category : #'month definitions - private' }
RomanCalendarDefinition >> juneDefinition [
	^ GenericMonthDefinition numberOfDays: 30 daysMeasure
]

{ #category : #'month names' }
RomanCalendarDefinition >> juneName [
	
	^'June'
]

{ #category : #'month numbers' }
RomanCalendarDefinition >> juneNumber [
	
	^6
]

{ #category : #'months accessing' }
RomanCalendarDefinition >> lastMonth [

	^self december
]

{ #category : #'months accessing' }
RomanCalendarDefinition >> march [

	^self months at: self marchNumber
]

{ #category : #'month definitions - private' }
RomanCalendarDefinition >> marchDefinition [
	^ GenericMonthDefinition numberOfDays: 31 daysMeasure
]

{ #category : #'month names' }
RomanCalendarDefinition >> marchName [
	
	^'March'
]

{ #category : #'month numbers' }
RomanCalendarDefinition >> marchNumber [
	
	^3
]

{ #category : #'days accessing' }
RomanCalendarDefinition >> maximumNumberOfDaysInOneYear [
	^ 366 daysMeasure
]

{ #category : #'months accessing' }
RomanCalendarDefinition >> may [

	^self months at: self mayNumber
]

{ #category : #'month definitions - private' }
RomanCalendarDefinition >> mayDefinition [
	^ GenericMonthDefinition numberOfDays: 31 daysMeasure
]

{ #category : #'month names' }
RomanCalendarDefinition >> mayName [
	
	^'May'
]

{ #category : #'month numbers' }
RomanCalendarDefinition >> mayNumber [
	
	^5
]

{ #category : #'days accessing' }
RomanCalendarDefinition >> monday [

	^self dayPositionedInWeek: self mondayPositionInWeek
]

{ #category : #'day names' }
RomanCalendarDefinition >> mondayName [

	^'Monday'
]

{ #category : #'day positions in week' }
RomanCalendarDefinition >> mondayPositionInWeek [
	
	^2
]

{ #category : #'months accessing' }
RomanCalendarDefinition >> monthsForLeapYears [

	^self months
]

{ #category : #'months accessing' }
RomanCalendarDefinition >> monthsForNonleapYears [

	^self months
]

{ #category : #'months accessing' }
RomanCalendarDefinition >> november [

	^self months at: self novemberNumber
]

{ #category : #'month definitions - private' }
RomanCalendarDefinition >> novemberDefinition [
	^ GenericMonthDefinition numberOfDays: 30 daysMeasure
]

{ #category : #'month names' }
RomanCalendarDefinition >> novemberName [
	
	^'November'
]

{ #category : #'month numbers' }
RomanCalendarDefinition >> novemberNumber [
	
	^11
]

{ #category : #'days accessing' }
RomanCalendarDefinition >> numberOfDaysIn: aChristianYear [
	^ (aChristianYear firstDate distanceTo: aChristianYear lastDate) + 1 dayMeasure
]

{ #category : #'months accessing' }
RomanCalendarDefinition >> october [

	^self months at: self octoberNumber
]

{ #category : #'month definitions - private' }
RomanCalendarDefinition >> octoberDefinition [
	^ GenericMonthDefinition numberOfDays: 31 daysMeasure
]

{ #category : #'month names' }
RomanCalendarDefinition >> octoberName [
	
	^'October'
]

{ #category : #'month numbers' }
RomanCalendarDefinition >> octoberNumber [
	
	^10
]

{ #category : #'days accessing' }
RomanCalendarDefinition >> saturday [

	^self dayPositionedInWeek: self saturdayPositionInWeek
]

{ #category : #'day names' }
RomanCalendarDefinition >> saturdayName [
	
	^'Saturday'
]

{ #category : #'day positions in week' }
RomanCalendarDefinition >> saturdayPositionInWeek [
	
	^7
]

{ #category : #'months accessing' }
RomanCalendarDefinition >> september [

	^self months at: self septemberNumber
]

{ #category : #'month definitions - private' }
RomanCalendarDefinition >> septemberDefinition [
	^ GenericMonthDefinition numberOfDays: 30 daysMeasure
]

{ #category : #'month names' }
RomanCalendarDefinition >> septemberName [
	
	^'September'
]

{ #category : #'month numbers' }
RomanCalendarDefinition >> septemberNumber [
	
	^9
]

{ #category : #'days accessing' }
RomanCalendarDefinition >> sinceSunday: aNumberOfDays [

	^self sinceFirstDayOfWeek: aNumberOfDays
]

{ #category : #'days accessing' }
RomanCalendarDefinition >> sunday [

	^self dayPositionedInWeek: self sundayPositionInWeek
]

{ #category : #'day names' }
RomanCalendarDefinition >> sundayName [
	
	^'Sunday'
]

{ #category : #'day positions in week' }
RomanCalendarDefinition >> sundayPositionInWeek [
	
	^1
]

{ #category : #'days accessing' }
RomanCalendarDefinition >> thursday [

	^self dayPositionedInWeek: self thursdayPositionInWeek
]

{ #category : #'day names' }
RomanCalendarDefinition >> thursdayName [

	^'Thursday'
]

{ #category : #'day positions in week' }
RomanCalendarDefinition >> thursdayPositionInWeek [
	
	^5
]

{ #category : #'days accessing' }
RomanCalendarDefinition >> tuesday [

	^self dayPositionedInWeek: self tuesdayPositionInWeek
]

{ #category : #'day names' }
RomanCalendarDefinition >> tuesdayName [
	
	^'Tuesday'
]

{ #category : #'day positions in week' }
RomanCalendarDefinition >> tuesdayPositionInWeek [
	
	^3
]

{ #category : #'days accessing' }
RomanCalendarDefinition >> wednesday [

	^self dayPositionedInWeek: self wednesdayPositionInWeek
]

{ #category : #'day names' }
RomanCalendarDefinition >> wednesdayName [
	
	^'Wednesday'
]

{ #category : #'day positions in week' }
RomanCalendarDefinition >> wednesdayPositionInWeek [

	^4
]

{ #category : #'year accessing - private' }
RomanCalendarDefinition >> yearNumberFromFixed: aNumber [

	^(YearNumberFromFixed for: aNumber using: self) value
]
