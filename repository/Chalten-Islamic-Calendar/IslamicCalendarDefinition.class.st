"
An IslamicCalendarDefinition is the islamic calendar representation. It is used to date events in many Muslim countries (concurrently with the gregorian calendar), and used by Muslims everywhere to determine the proper days on which to observe the annual fast (Ramadan), to attend Hajj, and to celebrate other Islamic holidays and festivals.

Instance Variables
	days:			<Collection>
	epoch:			<Number>
	months:		<Collection>

days
	- A collection of defined days.

epoch
	- The epoch or starting date is a hypothetical starting point for the first day.

months
	- A collection of defined months.

"
Class {
	#name : #IslamicCalendarDefinition,
	#superclass : #CalendarDefinition,
	#instVars : [
		'days',
		'months'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Chalten-Islamic-Calendar'
}

{ #category : #initialization }
IslamicCalendarDefinition class >> initializeGlobalNameCalendar [

	Smalltalk at: #IslamicCalendar put: uniqueInstance
]

{ #category : #initialization }
IslamicCalendarDefinition class >> initializeUniqueInstance [

	uniqueInstance := self basicNew initialize

]

{ #category : #'instance creation' }
IslamicCalendarDefinition class >> new [

	^uniqueInstance
]

{ #category : #'month creation - private' }
IslamicCalendarDefinition >> addMonth: anIslamicMonth [

	^months at: anIslamicMonth number put: anIslamicMonth
]

{ #category : #'days accessing' }
IslamicCalendarDefinition >> amountOfDaysPerWeek [
	
	^7
]

{ #category : #'months accessing' }
IslamicCalendarDefinition >> amountOfMonthsInLeapYears [
	
	^self amountOfMonthsPerYear
]

{ #category : #'months accessing' }
IslamicCalendarDefinition >> amountOfMonthsInNonleapYears [
	
	^self amountOfMonthsPerYear
]

{ #category : #'months accessing' }
IslamicCalendarDefinition >> amountOfMonthsPerYear [

	^12
]

{ #category : #'month preconditions' }
IslamicCalendarDefinition >> assert: aMonth isValidIn: aYear [
]

{ #category : #'converting - private' }
IslamicCalendarDefinition >> convertToDate: aDate [

	^self convertToIslamicDate: aDate
]

{ #category : #'converting - private' }
IslamicCalendarDefinition >> convertToDateTime: aDateTime [

	^self convertToIslamicDateTime: aDateTime
]

{ #category : #'month creation - private' }
IslamicCalendarDefinition >> createDhuAlHijja [
	^ ChaltenMonth 
		named: self dhuAlHijjaName
		numbered: self dhuAlHijjaNumber
		definedAs: self dhuAlHijjaDefinition
		calendar: self
]

{ #category : #'month creation - private' }
IslamicCalendarDefinition >> createDhuAlQada [
	^ ChaltenMonth 
		named: self dhuAlQadaName
		numbered: self dhuAlQadaNumber
		definedAs: self dhuAlQadaDefinition
		calendar: self
]

{ #category : #'month creation - private' }
IslamicCalendarDefinition >> createJumadaI [
	^ ChaltenMonth 
		named: self jumadaIName
		numbered: self jumadaINumber
		definedAs: self jumadaIDefinition
		calendar: self
]

{ #category : #'month creation - private' }
IslamicCalendarDefinition >> createJumadaII [
	^ ChaltenMonth 
		named: self jumadaIIName
		numbered: self jumadaIINumber
		definedAs: self jumadaIIDefinition
		calendar: self
]

{ #category : #'month creation - private' }
IslamicCalendarDefinition >> createMuharram [
	^ ChaltenMonth 
		named: self muharramName
		numbered: self muharramNumber
		definedAs: self muharramDefinition
		calendar: self
]

{ #category : #'month creation - private' }
IslamicCalendarDefinition >> createRabiI [
	^ ChaltenMonth 
		named: self rabiIName
		numbered: self rabiINumber
		definedAs: self rabiIDefinition
		calendar: self
]

{ #category : #'month creation - private' }
IslamicCalendarDefinition >> createRabiII [
	^ ChaltenMonth 
		named: self rabiIIName
		numbered: self rabiIINumber
		definedAs: self rabiIIDefinition
		calendar: self
]

{ #category : #'month creation - private' }
IslamicCalendarDefinition >> createRajab [
	^ ChaltenMonth 
		named: self rajabName
		numbered: self rajabNumber
		definedAs: self rajabDefinition
		calendar: self
]

{ #category : #'month creation - private' }
IslamicCalendarDefinition >> createRamadan [
	^ ChaltenMonth 
		named: self ramadanName
		numbered: self ramadanNumber
		definedAs: self ramadanDefinition
		calendar: self
]

{ #category : #'month creation - private' }
IslamicCalendarDefinition >> createSafar [
	^ ChaltenMonth 
		named: self safarName
		numbered: self safarNumber
		definedAs: self safarDefinition
		calendar: self
]

{ #category : #'month creation - private' }
IslamicCalendarDefinition >> createShaban [
	^ ChaltenMonth 
		named: self shabanName
		numbered: self shabanNumber
		definedAs: self shabanDefinition
		calendar: self
]

{ #category : #'month creation - private' }
IslamicCalendarDefinition >> createShawwal [
	^ ChaltenMonth 
		named: self shawwalName
		numbered: self shawwalNumber
		definedAs: self shawwalDefinition
		calendar: self
]

{ #category : #'day creation - private' }
IslamicCalendarDefinition >> createYaumAlAhad [
	^ Day 
		named: self yaumAlAhadName
		positionInWeek: self yaumAlAhadPositionInWeek
		calendar: self
]

{ #category : #'day creation - private' }
IslamicCalendarDefinition >> createYaumAlArbaa [
	^ Day 
		named: self yaumAlArbaaName
		positionInWeek: self yaumAlArbaaPositionInWeek
		calendar: self
]

{ #category : #'day creation - private' }
IslamicCalendarDefinition >> createYaumAlHamis [
	^ Day 
		named: self yaumAlHamisName
		positionInWeek: self yaumAlHamisPositionInWeek
		calendar: self
]

{ #category : #'day creation - private' }
IslamicCalendarDefinition >> createYaumAlIthnayna [
	^ Day 
		named: self yaumAlIthnaynaName
		positionInWeek: self yaumAlIthnaynaPositionInWeek
		calendar: self
]

{ #category : #'day creation - private' }
IslamicCalendarDefinition >> createYaumAlJuma [
	^ Day 
		named: self yaumAlJumaName
		positionInWeek: self yaumAlJumaPositionInWeek
		calendar: self
]

{ #category : #'day creation - private' }
IslamicCalendarDefinition >> createYaumAsSabt [
	^ Day 
		named: self yaumAsSabtName
		positionInWeek: self yaumAsSabtPositionInWeek
		calendar: self
]

{ #category : #'day creation - private' }
IslamicCalendarDefinition >> createYaumAthThalatha [
	^ Day 
		named: self yaumAthThalathaName
		positionInWeek: self yaumAthThalathaPositionInWeek
		calendar: self
]

{ #category : #'dates accessing' }
IslamicCalendarDefinition >> currentDateTime [

	^self convertToIslamicDateTime: GregorianCalendar currentDateTime
]

{ #category : #'dates accessing - private' }
IslamicCalendarDefinition >> dateFromNumberOfDays: aNumberOfDays [

	| yearNumber priorDays monthNumber dayNumber |
	yearNumber := (30 * (aNumberOfDays - self epoch) + 10646) // 10631.
	priorDays := aNumberOfDays - (self numberOfDaysFromDate: self muharram first , yearNumber).
	monthNumber := (11 * priorDays + 330) // 325.
	dayNumber := aNumberOfDays - (self numberOfDaysFromDate: (self newDateFromYearNumber: yearNumber monthNumber: monthNumber dayNumber: 1)) + 1.
	^self
		newDateFromYearNumber: yearNumber
		monthNumber: monthNumber
		dayNumber: dayNumber
]

{ #category : #'days accessing' }
IslamicCalendarDefinition >> days [

	^days
]

{ #category : #'months accessing' }
IslamicCalendarDefinition >> dhuAlHijja [

	^months at: self dhuAlHijjaNumber
]

{ #category : #'month definitions - private' }
IslamicCalendarDefinition >> dhuAlHijjaDefinition [
	^ GenericMonthDefinition numberOfDaysInNonleapYear: 29 daysMeasure numberOfDaysInLeapYear: 30 daysMeasure
]

{ #category : #'month names' }
IslamicCalendarDefinition >> dhuAlHijjaName [

	^'Dhu al-Hijja'
]

{ #category : #'month numbers' }
IslamicCalendarDefinition >> dhuAlHijjaNumber [

	^12
]

{ #category : #'months accessing' }
IslamicCalendarDefinition >> dhuAlQada [

	^months at: self dhuAlQadaNumber
]

{ #category : #'month definitions - private' }
IslamicCalendarDefinition >> dhuAlQadaDefinition [
	^ GenericMonthDefinition numberOfDays: 30 daysMeasure
]

{ #category : #'month names' }
IslamicCalendarDefinition >> dhuAlQadaName [

	^'Dhu al-Qa`da'
]

{ #category : #'month numbers' }
IslamicCalendarDefinition >> dhuAlQadaNumber [

	^11
]

{ #category : #'year querying' }
IslamicCalendarDefinition >> distanceInYearsFrom: aFromYear to: aToYear [

	| difference |

	difference := aToYear number - aFromYear number.
	^difference yearsMeasure
]

{ #category : #accessing }
IslamicCalendarDefinition >> epoch [

	"The epoch or starting date is virtually never the date the calendar was adopted but rather a hypothetical starting point for the first day.
	The islamic calendar epoch is Muharram 1, 1 (R.D. 227015), that is equal to julian date Friday, July 16, 622 (gregorian date July 19, 622).
	- Extracted from 'Calendrical Calculations, The Millennium Edition'; page 88."

	^ 227015
]

{ #category : #'months accessing' }
IslamicCalendarDefinition >> firstMonth [

	^self muharram
]

{ #category : #initialization }
IslamicCalendarDefinition >> initializeDays [
	"Days begins at sunset. The week begins on yaum al-ahad; wich is sunday in gregorian calendar. The days Sunday-Thursday are numbered, not named:
		Sunday 	yaum al-ahad (the first day)
		Monday 	yaum al-ithnayna (the second day)
		Tuesday 	yaum ath-thalatha (the third day)
		Wednesday 	yaum al-arba`a` (the fourth day)
		Thursday 	yaum al-hamis (the fifth day)
		Friday 		yaum al-jum`a (the day of assembly)
		Saturday 	yaum as-sabt (the sabbath day)
	- Extracted from 'Calendrical Calculations, The Millennium Edition'; page 87."
	
	days := Array new: self amountOfDaysPerWeek.
	self addDay: self createYaumAlAhad.
	self addDay: self createYaumAlIthnayna.
	self addDay: self createYaumAthThalatha.
	self addDay: self createYaumAlArbaa.
	self addDay: self createYaumAlHamis.
	self addDay: self createYaumAlJuma.
	self addDay: self createYaumAsSabt
]

{ #category : #initialization }
IslamicCalendarDefinition >> initializeDaysGlobalVariables [

	Smalltalk at: #YaumAlAhad put: self yaumAlAhad.
	Smalltalk at: #YaumAlIthnayna put: self yaumAlIthnayna.
	Smalltalk at: #YaumAthThalatha put: self yaumAthThalatha.
	Smalltalk at: #YaumAlArbaa put: self yaumAlArbaa.
	Smalltalk at: #YaumAlHamis put: self yaumAlHamis.
	Smalltalk at: #YaumAlJuma put: self yaumAlJuma.
	Smalltalk at: #YaumAsSabt put: self yaumAsSabt
]

{ #category : #initialization }
IslamicCalendarDefinition >> initializeGlobalVariables [

	self initializeDaysGlobalVariables.
	self initializeMonthsGlobalVariables
]

{ #category : #initialization }
IslamicCalendarDefinition >> initializeMonths [
	"There are 12 islamic months, wich contain, alternately, 29 or 30 days:
		(1) Muharram 						30 days
		(2) Safar 							29 days
		(3) Rabi` I (Rabi` al-Awwal) 		30 days
		(4) Rabi` II (Rabi` al-Ahir) 			29 days
		(5) Jumada I (Jumada al-Ula) 		30 days
		(6) Jumada II (Jumada al-Ahira) 	29 days
		(7) Rajab 							30 days
		(8) Sha`ban 						29 days
		(9) Ramadan 						30 days
		(10) Shawwal 						29 days
		(11) Dhu al-Qa`da 					30 days
		(12) Dhu al-Hijja 					29 {30} days
	The leap-year structure is given in curly brackets; the last month, Dhu al-Hijja, contains 30 days in years
	2, 5, 7, 10, 13, 16, 18, 21, 24, 26 and 29 of a 30-year cycle.
	- Extracted from 'Calendrical Calculations, The Millennium Edition'; page 88."
	
	months := Array new: self amountOfMonthsPerYear.
	self addMonth: self createMuharram.
	self addMonth: self createSafar.
	self addMonth: self createRabiI.
	self addMonth: self createRabiII.
	self addMonth: self createJumadaI.
	self addMonth: self createJumadaII.
	self addMonth: self createRajab.
	self addMonth: self createShaban.
	self addMonth: self createRamadan.
	self addMonth: self createShawwal.
	self addMonth: self createDhuAlQada.
	self addMonth: self createDhuAlHijja
]

{ #category : #initialization }
IslamicCalendarDefinition >> initializeMonthsGlobalVariables [

	Smalltalk at: #Muharram put: self muharram.
	Smalltalk at: #Safar put: self safar.
	Smalltalk at: #RabiI put: self rabiI.
	Smalltalk at: #RabiII put: self rabiII.
	Smalltalk at: #JumadaI put: self jumadaI.
	Smalltalk at: #JumadaII put: self jumadaII.
	Smalltalk at: #Rajab put: self rajab.
	Smalltalk at: #Shaban put: self shaban.
	Smalltalk at: #Ramadan put: self ramadan.
	Smalltalk at: #Shawwal put: self shawwal.
	Smalltalk at: #DhuAlQada put: self dhuAlQada.
	Smalltalk at: #DhuAlHijja put: self dhuAlHijja
]

{ #category : #'month testing' }
IslamicCalendarDefinition >> isDhuAlHijja: aMonth [

	^aMonth is: self dhuAlHijja
]

{ #category : #'month testing' }
IslamicCalendarDefinition >> isDhuAlQada: aMonth [

	^aMonth is: self dhuAlQada
]

{ #category : #'month testing' }
IslamicCalendarDefinition >> isJumadaI: aMonth [

	^aMonth is: self jumadaI
]

{ #category : #'month testing' }
IslamicCalendarDefinition >> isJumadaII: aMonth [

	^aMonth is: self jumadaII
]

{ #category : #'month testing' }
IslamicCalendarDefinition >> isMuharram: aMonth [

	^aMonth is: self muharram
]

{ #category : #'month testing' }
IslamicCalendarDefinition >> isRabiI: aMonth [

	^aMonth is: self rabiI
]

{ #category : #'month testing' }
IslamicCalendarDefinition >> isRabiII: aMonth [

	^aMonth is: self rabiII
]

{ #category : #'month testing' }
IslamicCalendarDefinition >> isRajab: aMonth [

	^aMonth is: self rajab
]

{ #category : #'month testing' }
IslamicCalendarDefinition >> isRamadan: aMonth [

	^aMonth is: self ramadan
]

{ #category : #'month testing' }
IslamicCalendarDefinition >> isSafar: aMonth [

	^aMonth is: self safar
]

{ #category : #'month testing' }
IslamicCalendarDefinition >> isShaban: aMonth [

	^aMonth is: self shaban
]

{ #category : #'month testing' }
IslamicCalendarDefinition >> isShawwal: aMonth [

	^aMonth is: self shawwal
]

{ #category : #'year testing' }
IslamicCalendarDefinition >> isValidYearNumber: aNumber [

	^aNumber isInteger
]

{ #category : #'day testing' }
IslamicCalendarDefinition >> isYaumAlAhad: anIslamicDay [

	^anIslamicDay is: self yaumAlAhad
]

{ #category : #'day testing' }
IslamicCalendarDefinition >> isYaumAlArbaa: anIslamicDay [

	^anIslamicDay is: self yaumAlArbaa
]

{ #category : #'day testing' }
IslamicCalendarDefinition >> isYaumAlHamis: anIslamicDay [

	^anIslamicDay is: self yaumAlHamis
]

{ #category : #'day testing' }
IslamicCalendarDefinition >> isYaumAlIthnayna: anIslamicDay [

	^anIslamicDay is: self yaumAlIthnayna
]

{ #category : #'day testing' }
IslamicCalendarDefinition >> isYaumAlJuma: anIslamicDay [

	^anIslamicDay is: self yaumAlJuma
]

{ #category : #'day testing' }
IslamicCalendarDefinition >> isYaumAsSabt: anIslamicDay [

	^anIslamicDay is: self yaumAsSabt
]

{ #category : #'day testing' }
IslamicCalendarDefinition >> isYaumAthThalatha: anIslamicDay [

	^anIslamicDay is: self yaumAthThalatha
]

{ #category : #'year testing' }
IslamicCalendarDefinition >> isYearNumberLeap: aNumber [
	"In the islamic calendar, leap years occurs in years 2, 5, 7, 10, 13, 16, 18, 21, 24, 26 and 29 of the 30-year cycle.
	This sequence can be computed concisely by noting that islamic year y is a leap year if and only if (11y + 14) mod 30 is less than 11.
	- Extracted from 'Calendrical Calculations, Third Edition'; page 84."

	^((14 + (11 * aNumber)) \\ 30) < 11
]

{ #category : #'months accessing' }
IslamicCalendarDefinition >> jumadaI [

	^months at: self jumadaINumber
]

{ #category : #'month definitions - private' }
IslamicCalendarDefinition >> jumadaIDefinition [
	^ GenericMonthDefinition numberOfDays: 30 daysMeasure
]

{ #category : #'months accessing' }
IslamicCalendarDefinition >> jumadaII [

	^months at: self jumadaIINumber
]

{ #category : #'month definitions - private' }
IslamicCalendarDefinition >> jumadaIIDefinition [
	^ GenericMonthDefinition numberOfDays: 29 daysMeasure
]

{ #category : #'month names' }
IslamicCalendarDefinition >> jumadaIIName [

	^'Jumada II (Jumada al-Ahira)'
]

{ #category : #'month numbers' }
IslamicCalendarDefinition >> jumadaIINumber [

	^6
]

{ #category : #'month names' }
IslamicCalendarDefinition >> jumadaIName [

	^'Jumada I (Jumada al-Ula)'
]

{ #category : #'month numbers' }
IslamicCalendarDefinition >> jumadaINumber [

	^5
]

{ #category : #'months accessing' }
IslamicCalendarDefinition >> lastMonth [

	^self dhuAlHijja
]

{ #category : #'days accessing' }
IslamicCalendarDefinition >> maximumNumberOfDaysInOneYear [
	^ 355 daysMeasure
]

{ #category : #'months accessing' }
IslamicCalendarDefinition >> months [

	^months
]

{ #category : #'months accessing' }
IslamicCalendarDefinition >> monthsForLeapYears [

	^self months
]

{ #category : #'months accessing' }
IslamicCalendarDefinition >> monthsForNonleapYears [

	^self months
]

{ #category : #'months accessing' }
IslamicCalendarDefinition >> muharram [

	^months at: self muharramNumber
]

{ #category : #'month definitions - private' }
IslamicCalendarDefinition >> muharramDefinition [
	^ GenericMonthDefinition numberOfDays: 30 daysMeasure
]

{ #category : #'month names' }
IslamicCalendarDefinition >> muharramName [

	^'Muharram'
]

{ #category : #'month numbers' }
IslamicCalendarDefinition >> muharramNumber [

	^1
]

{ #category : #'year accessing' }
IslamicCalendarDefinition >> newYearNumberFrom: aYear adding: aNumberOfYears [

	^aYear number + aNumberOfYears
]

{ #category : #'dates accessing - private' }
IslamicCalendarDefinition >> numberOfDaysFromDate: anIslamicDate [
	"Converting from an islamic date to a fixed number is done by summing the days so far in the current month, the days so far in prior months
	of the current islamic year, the days of prior islamic years and the days prior to the islamic calendar.
	- Extracted from 'Calendrical Calculations, The Millennium Edition'; page 89."
	
	| yearNumber monthNumber dayNumber daysBeforeStartOfCalendar ordinaryDaysSinceEpoch leapDaysSinceEpoch daysInPriorMonthsOfThisYear |
	yearNumber := anIslamicDate year number.
	monthNumber := anIslamicDate month number.
	dayNumber := anIslamicDate dayNumber.
	daysBeforeStartOfCalendar := self epoch - 1.
	ordinaryDaysSinceEpoch := (yearNumber - 1) * 354.
	leapDaysSinceEpoch := (3 + (11 * yearNumber)) // 30.
	daysInPriorMonthsOfThisYear := 29 * (monthNumber - 1) + ((6 * monthNumber - 1) // 11).
	^daysBeforeStartOfCalendar + ordinaryDaysSinceEpoch + leapDaysSinceEpoch + daysInPriorMonthsOfThisYear + dayNumber
]

{ #category : #'days accessing' }
IslamicCalendarDefinition >> numberOfDaysIn: anIslamicYear [
	^ (anIslamicYear firstDate distanceTo: anIslamicYear lastDate) + 1 dayMeasure
]

{ #category : #printing }
IslamicCalendarDefinition >> printOn: aStream [

	aStream nextPutAll: 'Islamic Calendar'
]

{ #category : #'months accessing' }
IslamicCalendarDefinition >> rabiI [

	^months at: self rabiINumber
]

{ #category : #'month definitions - private' }
IslamicCalendarDefinition >> rabiIDefinition [
	^ GenericMonthDefinition numberOfDays: 30 daysMeasure
]

{ #category : #'months accessing' }
IslamicCalendarDefinition >> rabiII [

	^months at: self rabiIINumber
]

{ #category : #'month definitions - private' }
IslamicCalendarDefinition >> rabiIIDefinition [
	^ GenericMonthDefinition numberOfDays: 29 daysMeasure
]

{ #category : #'month names' }
IslamicCalendarDefinition >> rabiIIName [

	^'Rabi` II (Rabi` al-Ahir)'
]

{ #category : #'month numbers' }
IslamicCalendarDefinition >> rabiIINumber [

	^4
]

{ #category : #'month names' }
IslamicCalendarDefinition >> rabiIName [

	^'Rabi` I (Rabi` al-Awwal)'
]

{ #category : #'month numbers' }
IslamicCalendarDefinition >> rabiINumber [

	^3
]

{ #category : #'months accessing' }
IslamicCalendarDefinition >> rajab [

	^months at: self rajabNumber
]

{ #category : #'month definitions - private' }
IslamicCalendarDefinition >> rajabDefinition [
	^ GenericMonthDefinition numberOfDays: 30 daysMeasure
]

{ #category : #'month names' }
IslamicCalendarDefinition >> rajabName [

	^'Rajab'
]

{ #category : #'month numbers' }
IslamicCalendarDefinition >> rajabNumber [

	^7
]

{ #category : #'months accessing' }
IslamicCalendarDefinition >> ramadan [

	^months at: self ramadanNumber
]

{ #category : #'month definitions - private' }
IslamicCalendarDefinition >> ramadanDefinition [
	^ GenericMonthDefinition numberOfDays: 30 daysMeasure
]

{ #category : #'month names' }
IslamicCalendarDefinition >> ramadanName [

	^'Ramadan'
]

{ #category : #'month numbers' }
IslamicCalendarDefinition >> ramadanNumber [

	^9
]

{ #category : #'months accessing' }
IslamicCalendarDefinition >> safar [

	^months at: self safarNumber
]

{ #category : #'month definitions - private' }
IslamicCalendarDefinition >> safarDefinition [
	^ GenericMonthDefinition numberOfDays: 29 daysMeasure
]

{ #category : #'month names' }
IslamicCalendarDefinition >> safarName [

	^'Safar'
]

{ #category : #'month numbers' }
IslamicCalendarDefinition >> safarNumber [

	^2
]

{ #category : #'months accessing' }
IslamicCalendarDefinition >> shaban [

	^months at: self shabanNumber
]

{ #category : #'month definitions - private' }
IslamicCalendarDefinition >> shabanDefinition [
	^ GenericMonthDefinition numberOfDays: 29 daysMeasure
]

{ #category : #'month names' }
IslamicCalendarDefinition >> shabanName [

	^'Sha`ban'
]

{ #category : #'month numbers' }
IslamicCalendarDefinition >> shabanNumber [

	^8
]

{ #category : #'months accessing' }
IslamicCalendarDefinition >> shawwal [

	^months at: self shawwalNumber
]

{ #category : #'month definitions - private' }
IslamicCalendarDefinition >> shawwalDefinition [
	^ GenericMonthDefinition numberOfDays: 29 daysMeasure
]

{ #category : #'month names' }
IslamicCalendarDefinition >> shawwalName [

	^'Shawwal'
]

{ #category : #'month numbers' }
IslamicCalendarDefinition >> shawwalNumber [

	^10
]

{ #category : #'days accessing' }
IslamicCalendarDefinition >> sinceYaumAlAhad: aNumberOfDays [

	^self sinceFirstDayOfWeek: aNumberOfDays
]

{ #category : #'days accessing' }
IslamicCalendarDefinition >> yaumAlAhad [

	^self dayPositionedInWeek: self yaumAlAhadPositionInWeek
]

{ #category : #'day names' }
IslamicCalendarDefinition >> yaumAlAhadName [
	
	^'yaum al-ahad'
]

{ #category : #'day position in week' }
IslamicCalendarDefinition >> yaumAlAhadPositionInWeek [
	
	^1
]

{ #category : #'days accessing' }
IslamicCalendarDefinition >> yaumAlArbaa [

	^self dayPositionedInWeek: self yaumAlArbaaPositionInWeek
]

{ #category : #'day names' }
IslamicCalendarDefinition >> yaumAlArbaaName [
	
	^'yaum al-arba`a`'
]

{ #category : #'day position in week' }
IslamicCalendarDefinition >> yaumAlArbaaPositionInWeek [
	
	^4
]

{ #category : #'days accessing' }
IslamicCalendarDefinition >> yaumAlHamis [

	^self dayPositionedInWeek: self yaumAlHamisPositionInWeek
]

{ #category : #'day names' }
IslamicCalendarDefinition >> yaumAlHamisName [
	
	^'yaum al-hamis'
]

{ #category : #'day position in week' }
IslamicCalendarDefinition >> yaumAlHamisPositionInWeek [
	
	^5
]

{ #category : #'days accessing' }
IslamicCalendarDefinition >> yaumAlIthnayna [

	^self dayPositionedInWeek: self yaumAlIthnaynaPositionInWeek
]

{ #category : #'day names' }
IslamicCalendarDefinition >> yaumAlIthnaynaName [
	
	^'yaum al-ithnayna'
]

{ #category : #'day position in week' }
IslamicCalendarDefinition >> yaumAlIthnaynaPositionInWeek [
	
	^2
]

{ #category : #'days accessing' }
IslamicCalendarDefinition >> yaumAlJuma [

	^self dayPositionedInWeek: self yaumAlJumaPositionInWeek
]

{ #category : #'day names' }
IslamicCalendarDefinition >> yaumAlJumaName [
	
	^'yaum al-jum`a'
]

{ #category : #'day position in week' }
IslamicCalendarDefinition >> yaumAlJumaPositionInWeek [
	
	^6
]

{ #category : #'days accessing' }
IslamicCalendarDefinition >> yaumAsSabt [

	^self dayPositionedInWeek: self yaumAsSabtPositionInWeek
]

{ #category : #'day names' }
IslamicCalendarDefinition >> yaumAsSabtName [
	
	^'yaum as-sabt'
]

{ #category : #'day position in week' }
IslamicCalendarDefinition >> yaumAsSabtPositionInWeek [
	
	^7
]

{ #category : #'days accessing' }
IslamicCalendarDefinition >> yaumAthThalatha [

	^self dayPositionedInWeek: self yaumAthThalathaPositionInWeek
]

{ #category : #'day names' }
IslamicCalendarDefinition >> yaumAthThalathaName [
	
	^'yaum ath-thalatha'
]

{ #category : #'day position in week' }
IslamicCalendarDefinition >> yaumAthThalathaPositionInWeek [
	
	^3
]
