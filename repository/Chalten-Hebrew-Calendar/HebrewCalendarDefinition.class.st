"
A HebrewCalendarDefinition is the hebrew calendar representation. It is a lunisolar calendar used today predominantly for Jewish religious observances. It determines the dates for Jewish holidays and the appropriate public reading of Torah portions, yahrzeits (dates to commemorate the death of a relative), and daily Psalm readings, among many ceremonial uses. In Israel, it is used for religious purposes, provides a time frame for agriculture and is an official calendar for civil purposes, although the latter usage has been steadily declining in favor of the gregorian calendar.

Instance Variables
	days:					<Collection>
	epoch:					<Number>
	leapYearsMonths:		<Collection>
	nonleapYearsMonths:	<Collection>

days
	- A collection of defined days.

epoch
	- The epoch or starting date is a hypothetical starting point for the first day.

leapYearsMonths
	- A collection of defined months for leap years.

nonleapYearsMonths
	- A collection of defined months for nonleap years.

"
Class {
	#name : #HebrewCalendarDefinition,
	#superclass : #CalendarDefinition,
	#instVars : [
		'days',
		'nonleapYearsMonths',
		'leapYearsMonths'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Chalten-Hebrew-Calendar'
}

{ #category : #initialization }
HebrewCalendarDefinition class >> initializeGlobalNameCalendar [

	Smalltalk at: #HebrewCalendar put: uniqueInstance
]

{ #category : #initialization }
HebrewCalendarDefinition class >> initializeUniqueInstance [

	uniqueInstance := self basicNew initialize
]

{ #category : #'instance creation' }
HebrewCalendarDefinition class >> new [

	^uniqueInstance
]

{ #category : #'months accessing' }
HebrewCalendarDefinition >> adar [

	^nonleapYearsMonths last
]

{ #category : #'month definitions - private' }
HebrewCalendarDefinition >> adarDefinition [
	^ AdarMonthDefinition adar
]

{ #category : #'months accessing' }
HebrewCalendarDefinition >> adarI [

	^leapYearsMonths at: self adarINumber
]

{ #category : #'month definitions - private' }
HebrewCalendarDefinition >> adarIDefinition [
	^ AdarMonthDefinition adarI
]

{ #category : #'months accessing' }
HebrewCalendarDefinition >> adarII [

	^leapYearsMonths at: self adarIINumber
]

{ #category : #'month definitions - private' }
HebrewCalendarDefinition >> adarIIDefinition [
	^ AdarMonthDefinition adarII
]

{ #category : #'month names' }
HebrewCalendarDefinition >> adarIIName [

	^'Adar II'
]

{ #category : #'month numbers' }
HebrewCalendarDefinition >> adarIINumber [

	^13
]

{ #category : #'month names' }
HebrewCalendarDefinition >> adarIName [

	^'Adar I'
]

{ #category : #'month numbers' }
HebrewCalendarDefinition >> adarINumber [

	^12
]

{ #category : #'month names' }
HebrewCalendarDefinition >> adarName [

	^'Adar'
]

{ #category : #'month numbers' }
HebrewCalendarDefinition >> adarNumber [

	^12
]

{ #category : #'month creation - private' }
HebrewCalendarDefinition >> addLeapYearMonth: anHebrewMonth [

	^leapYearsMonths at: anHebrewMonth number put: anHebrewMonth
]

{ #category : #'month creation - private' }
HebrewCalendarDefinition >> addNonleapYearMonth: anHebrewMonth [

	^nonleapYearsMonths at: anHebrewMonth number put: anHebrewMonth
]

{ #category : #'days accessing' }
HebrewCalendarDefinition >> amountOfDaysIn: anHebrewYear [
	
	^(self newYearFrom: anHebrewYear next) - (self newYearFrom: anHebrewYear)
]

{ #category : #'days accessing' }
HebrewCalendarDefinition >> amountOfDaysPerWeek [
	
	^7
]

{ #category : #'months accessing' }
HebrewCalendarDefinition >> amountOfMonthsInLeapYears [

	^13
]

{ #category : #'months accessing' }
HebrewCalendarDefinition >> amountOfMonthsInNonleapYears [

	^12
]

{ #category : #'months accessing' }
HebrewCalendarDefinition >> amountOfMonthsInYear: aYear [

	^aYear amountOfMonths
]

{ #category : #'months accessing' }
HebrewCalendarDefinition >> amountOfMonthsPerYear [

	^13
]

{ #category : #'month preconditions' }
HebrewCalendarDefinition >> assert: aMonth isValidIn: aYear [

	(self is: aMonth adarInLeapYear: aYear)
		ifTrue: [InvalidMonthForLeapYearsException signalMonth: aMonth year: aYear].
	(self is: aMonth adarIOrAdarIIInNonleapYear: aYear)
		ifTrue: [InvalidMonthForNonleapYearsException signalMonth: aMonth year: aYear]
]

{ #category : #'months accessing' }
HebrewCalendarDefinition >> av [

	^nonleapYearsMonths at: self avNumber
]

{ #category : #'month definitions - private' }
HebrewCalendarDefinition >> avDefinition [
	^ GenericMonthDefinition numberOfDays: 30 daysMeasure
]

{ #category : #'month names' }
HebrewCalendarDefinition >> avName [

	^'Av'
]

{ #category : #'month numbers' }
HebrewCalendarDefinition >> avNumber [

	^5
]

{ #category : #'converting - private' }
HebrewCalendarDefinition >> convertToDate: aDate [

	^self convertToHebrewDate: aDate
]

{ #category : #'converting - private' }
HebrewCalendarDefinition >> convertToDateTime: aDateTime [

	^self convertToHebrewDateTime: aDateTime
]

{ #category : #'month creation - private' }
HebrewCalendarDefinition >> createAdar [
	^ ChaltenMonth 
		named: self adarName
		numbered: self adarNumber
		definedAs: self adarDefinition
		calendar: self
]

{ #category : #'month creation - private' }
HebrewCalendarDefinition >> createAdarI [
	^ ChaltenMonth 
		named: self adarIName
		numbered: self adarINumber
		definedAs: self adarIDefinition
		calendar: self
]

{ #category : #'month creation - private' }
HebrewCalendarDefinition >> createAdarII [
	^ ChaltenMonth 
		named: self adarIIName
		numbered: self adarIINumber
		definedAs: self adarIIDefinition
		calendar: self
]

{ #category : #'month creation - private' }
HebrewCalendarDefinition >> createAv [
	^ ChaltenMonth 
		named: self avName
		numbered: self avNumber
		definedAs: self avDefinition
		calendar: self
]

{ #category : #'month creation - private' }
HebrewCalendarDefinition >> createElul [
	^ ChaltenMonth 
		named: self elulName
		numbered: self elulNumber
		definedAs: self elulDefinition
		calendar: self
]

{ #category : #'month creation - private' }
HebrewCalendarDefinition >> createIyyar [
	^ ChaltenMonth 
		named: self iyyarName
		numbered: self iyyarNumber
		definedAs: self iyyarDefinition
		calendar: self
]

{ #category : #'month creation - private' }
HebrewCalendarDefinition >> createKislev [
	^ ChaltenMonth 
		named: self kislevName
		numbered: self kislevNumber
		definedAs: self kislevDefinition
		calendar: self
]

{ #category : #'month creation - private' }
HebrewCalendarDefinition >> createMarheshvan [
	^ ChaltenMonth 
		named: self marheshvanName
		numbered: self marheshvanNumber
		definedAs: self marheshvanDefinition
		calendar: self
]

{ #category : #'month creation - private' }
HebrewCalendarDefinition >> createNisan [
	^ ChaltenMonth 
		named: self nisanName
		numbered: self nisanNumber
		definedAs: self nisanDefinition
		calendar: self
]

{ #category : #'month creation - private' }
HebrewCalendarDefinition >> createShevat [
	^ ChaltenMonth 
		named: self shevatName
		numbered: self shevatNumber
		definedAs: self shevatDefinition
		calendar: self
]

{ #category : #'month creation - private' }
HebrewCalendarDefinition >> createSivan [
	^ ChaltenMonth 
		named: self sivanName
		numbered: self sivanNumber
		definedAs: self sivanDefinition
		calendar: self
]

{ #category : #'month creation - private' }
HebrewCalendarDefinition >> createTammuz [
	^ ChaltenMonth 
		named: self tammuzName
		numbered: self tammuzNumber
		definedAs: self tammuzDefinition
		calendar: self
]

{ #category : #'month creation - private' }
HebrewCalendarDefinition >> createTevet [
	^ ChaltenMonth 
		named: self tevetName
		numbered: self tevetNumber
		definedAs: self tevetDefinition
		calendar: self
]

{ #category : #'month creation - private' }
HebrewCalendarDefinition >> createTishri [
	^ ChaltenMonth 
		named: self tishriName
		numbered: self tishriNumber
		definedAs: self tishriDefinition
		calendar: self
]

{ #category : #'day creation - private' }
HebrewCalendarDefinition >> createYomHamishi [
	^ Day 
		named: self yomHamishiName
		positionInWeek: self yomHamishiPositionInWeek
		calendar: self
]

{ #category : #'day creation - private' }
HebrewCalendarDefinition >> createYomRevii [
	^ Day 
		named: self yomReviiName
		positionInWeek: self yomReviiPositionInWeek
		calendar: self
]

{ #category : #'day creation - private' }
HebrewCalendarDefinition >> createYomRishon [
	^ Day 
		named: self yomRishonName
		positionInWeek: self yomRishonPositionInWeek
		calendar: self
]

{ #category : #'day creation - private' }
HebrewCalendarDefinition >> createYomShabbat [
	^ Day 
		named: self yomShabbatName
		positionInWeek: self yomShabbatPositionInWeek
		calendar: self
]

{ #category : #'day creation - private' }
HebrewCalendarDefinition >> createYomShelishi [
	^ Day 
		named: self yomShelishiName
		positionInWeek: self yomShelishiPositionInWeek
		calendar: self
]

{ #category : #'day creation - private' }
HebrewCalendarDefinition >> createYomSheni [
	^ Day 
		named: self yomSheniName
		positionInWeek: self yomSheniPositionInWeek
		calendar: self
]

{ #category : #'day creation - private' }
HebrewCalendarDefinition >> createYomShishi [
	^ Day 
		named: self yomShishiName
		positionInWeek: self yomShishiPositionInWeek
		calendar: self
]

{ #category : #'dates accessing' }
HebrewCalendarDefinition >> currentDateTime [

	^self convertToHebrewDateTime: GregorianCalendar currentDateTime
]

{ #category : #'dates accessing - private' }
HebrewCalendarDefinition >> dateFromNumberOfDays: aNumberOfDays [

	| approximation year start month dayNumber |
	approximation := (aNumberOfDays - self epoch) // (35975351 / 98496) + 1.
	year := ChaltenYear number: approximation - 1 calendar: self.
	[(self newYearFrom: year) <= aNumberOfDays] whileTrue: [year := year next].
	year := year previous.
	start := aNumberOfDays < (self numberOfDaysFromDate: (self newDateFromYear: year month: Nisan dayNumber: 1)) 
		ifTrue: [Tishri]
		ifFalse: [Nisan].
	month := start.
	[(aNumberOfDays <= (self numberOfDaysFromDate: (self newDateFromYear: year month: month dayNumber: (month ofYear: year) lastDayNumber))) not] 
		whileTrue: [month := year isLeap
			ifTrue: [self nextMonthInLeapYearsFrom: month]
			ifFalse: [self nextMonthInNonleapYearsFrom: month]].
	dayNumber := 1 + aNumberOfDays - (self numberOfDaysFromDate: (self newDateFromYear: year month: month dayNumber: 1)).
	^self
		newDateFromYear: year
		month: month
		dayNumber: dayNumber
]

{ #category : #'days accessing' }
HebrewCalendarDefinition >> days [

	^days
]

{ #category : #'year querying' }
HebrewCalendarDefinition >> distanceInYearsFrom: aFromYear to: aToYear [

	| difference |

	difference := aToYear number - aFromYear number.
	^difference yearsMeasure
]

{ #category : #'months accessing' }
HebrewCalendarDefinition >> elul [

	^nonleapYearsMonths at: self elulNumber
]

{ #category : #'month definitions - private' }
HebrewCalendarDefinition >> elulDefinition [
	^ GenericMonthDefinition numberOfDays: 29 daysMeasure
]

{ #category : #'month names' }
HebrewCalendarDefinition >> elulName [

	^'Elul'
]

{ #category : #'month numbers' }
HebrewCalendarDefinition >> elulNumber [

	^6
]

{ #category : #accessing }
HebrewCalendarDefinition >> epoch [

	"The epoch or starting date is virtually never the date the calendar was adopted but rather a hypothetical starting point for the first day.
	The hebrew calendar epoch is Tishri 1, 1 (R.D. -1373427), that is equal to julian date October 7, -3761 (gregorian date September 7, -3760).
	- Extracted from 'Calendrical Calculations, The Millennium Edition'; page 101."

	^ -1373427
]

{ #category : #'months accessing' }
HebrewCalendarDefinition >> firstMonth [

	^self tishri
]

{ #category : #'month testing' }
HebrewCalendarDefinition >> ifLongMarheshvanIn: aYear do: aBlock else: anotherBlock [

	^(self longMarheshvanIn: aYear)
		ifTrue: aBlock
		ifFalse: anotherBlock
]

{ #category : #'month testing' }
HebrewCalendarDefinition >> ifShortKislevIn: aYear do: aBlock else: anotherBlock [

	^(self shortKislevIn: aYear)
		ifTrue: aBlock
		ifFalse: anotherBlock
]

{ #category : #initialization }
HebrewCalendarDefinition >> initializeDays [
	"Days begins at sunset. The week begins on yom rishon; wich is sunday in gregorian calendar. The days Sunday-Friday are numbered, not named:
		Sunday 	yom rishon (the first day)
		Monday 	yom sheni (the second day)
		Tuesday 	yom shelishi (the third day)
		Wednesday 	yon revi`i (the fourth day)
		Thursday 	yom hamishi (the fifth day)
		Friday 		yom shishi (the day of assembly)
		Saturday 	yom shabbat (the sabbath day)
	- Extracted from 'Calendrical Calculations, The Millennium Edition'; page 95."
	
	days := Array new: self amountOfDaysPerWeek.
	self addDay: self createYomRishon.
	self addDay: self createYomSheni.
	self addDay: self createYomShelishi.
	self addDay: self createYomRevii.
	self addDay: self createYomHamishi.
	self addDay: self createYomShishi.
	self addDay: self createYomShabbat
]

{ #category : #initialization }
HebrewCalendarDefinition >> initializeDaysGlobalVariables [

	Smalltalk at: #YomRishon put: self yomRishon.
	Smalltalk at: #YomSheni put: self yomSheni.
	Smalltalk at: #YomShelishi put: self yomShelishi.
	Smalltalk at: #YomRevii put: self yomRevii.
	Smalltalk at: #YomHamishi put: self yomHamishi.
	Smalltalk at: #YomShishi put: self yomShishi.
	Smalltalk at: #YomShabbat put: self yomShabbat
]

{ #category : #initialization }
HebrewCalendarDefinition >> initializeGlobalVariables [

	self initializeDaysGlobalVariables.
	self initializeMonthsGlobalVariables
]

{ #category : #initialization }
HebrewCalendarDefinition >> initializeMonths [
	"The hebrew year consists of 12 months in a common year and 13 in a leap year:
		(1) Nisan 							30 days
		(2) Iyyar 							29 days
		(3) Sivan 							30 days
		(4) Tammuz 						29 days
		(5) Av 								30 days
		(6) Elul 							29 days
		(7) Tishri 							30 days
		(8) Marheshvan 					29 or 30 days
		(9) Kislev 							29 or 30 days
		(10) Tevet 							29 days
		(11) Shevat 							30 days
		{(12) Adar I 						30 days}
		(12) {(13)} Adar {II} 					29 days
	The leap-year structure is given in curly brackets -in leap year there is an interpolated twelfth month of 30 days
	called Adar I to distinguish it from the final month, Adar II. The length of the eigth and ninth month varies from
	year to year. Our ordering of the hebrew months follows biblical conention (Leviticus 23:5) in witch (what is now called)
	Nisan is the first month. This numbering causes the Hebrew New Year (Rosh ha-Shanah) to begin on the first of tishri,
	wich by our ordering is the seventh month -but this too agrees with biblical usage (Leviticus 23:24).	
	- Extracted from 'Calendrical Calculations, The Millennium Edition'; page 96."

	self initializeMonthsForNonleapYears.
	self initializeMonthsForLeapYears
]

{ #category : #initialization }
HebrewCalendarDefinition >> initializeMonthsForLeapYears [

	leapYearsMonths := Array new: 13.
	self addLeapYearMonth: self nisan.
	self addLeapYearMonth: self iyyar.
	self addLeapYearMonth: self sivan.
	self addLeapYearMonth: self tammuz.
	self addLeapYearMonth: self av.
	self addLeapYearMonth: self elul.
	self addLeapYearMonth: self tishri.
	self addLeapYearMonth: self marheshvan.
	self addLeapYearMonth: self kislev.
	self addLeapYearMonth: self tevet.
	self addLeapYearMonth: self shevat.
	self addLeapYearMonth: self createAdarI.
	self addLeapYearMonth: self createAdarII
]

{ #category : #initialization }
HebrewCalendarDefinition >> initializeMonthsForNonleapYears [

	nonleapYearsMonths := Array new: 12.
	self addNonleapYearMonth: self createNisan.
	self addNonleapYearMonth: self createIyyar.
	self addNonleapYearMonth: self createSivan.
	self addNonleapYearMonth: self createTammuz.
	self addNonleapYearMonth: self createAv.
	self addNonleapYearMonth: self createElul.
	self addNonleapYearMonth: self createTishri.
	self addNonleapYearMonth: self createMarheshvan.
	self addNonleapYearMonth: self createKislev.
	self addNonleapYearMonth: self createTevet.
	self addNonleapYearMonth: self createShevat.
	self addNonleapYearMonth: self createAdar
]

{ #category : #initialization }
HebrewCalendarDefinition >> initializeMonthsGlobalVariables [

	Smalltalk at: #Nisan put: self nisan.
	Smalltalk at: #Iyyar put: self iyyar.
	Smalltalk at: #Sivan put: self sivan.
	Smalltalk at: #Tammuz put: self tammuz.
	Smalltalk at: #Av put: self av.
	Smalltalk at: #Elul put: self elul.
	Smalltalk at: #Tishri put: self tishri.
	Smalltalk at: #Marheshvan put: self marheshvan.
	Smalltalk at: #Kislev put: self kislev.
	Smalltalk at: #Tevet put: self tevet.
	Smalltalk at: #Shevat put: self shevat.
	Smalltalk at: #Adar put: self adar.
	Smalltalk at: #AdarI put: self adarI.
	Smalltalk at: #AdarII put: self adarII
]

{ #category : #'month preconditions' }
HebrewCalendarDefinition >> is: aMonth adarIOrAdarIIInNonleapYear: aYear [

	^aYear isLeap not and: [(aMonth is: AdarI) or: [aMonth is: AdarII]]
]

{ #category : #'month preconditions' }
HebrewCalendarDefinition >> is: aMonth adarInLeapYear: aYear [

	^aYear isLeap and: [aMonth is: Adar]
]

{ #category : #'month testing' }
HebrewCalendarDefinition >> isAdar: aMonth [

	^aMonth is: self adar
]

{ #category : #'month testing' }
HebrewCalendarDefinition >> isAdarI: aMonth [

	^aMonth is: self adarI
]

{ #category : #'month testing' }
HebrewCalendarDefinition >> isAdarII: aMonth [

	^aMonth is: self adarII
]

{ #category : #'month testing' }
HebrewCalendarDefinition >> isAv: aMonth [

	^aMonth is: self av
]

{ #category : #'month testing' }
HebrewCalendarDefinition >> isElul: aMonth [

	^aMonth is: self elul
]

{ #category : #'month testing' }
HebrewCalendarDefinition >> isIyyar: aMonth [

	^aMonth is: self iyyar
]

{ #category : #'month testing' }
HebrewCalendarDefinition >> isKislev: aMonth [

	^aMonth is: self kislev
]

{ #category : #'month testing' }
HebrewCalendarDefinition >> isLongMarheshvan: aMonthOfYear [

	^(aMonthOfYear is: Marheshvan) and: [self longMarheshvanIn: aMonthOfYear year]
]

{ #category : #'month testing' }
HebrewCalendarDefinition >> isMarheshvan: aMonth [

	^aMonth is: self marheshvan
]

{ #category : #'month testing' }
HebrewCalendarDefinition >> isNisan: aMonth [

	^aMonth is: self nisan
]

{ #category : #'month testing' }
HebrewCalendarDefinition >> isShevat: aMonth [

	^aMonth is: self shevat
]

{ #category : #'month testing' }
HebrewCalendarDefinition >> isShortKislev: aMonthOfYear [

	^(aMonthOfYear is: Kislev) and: [self shortKislevIn: aMonthOfYear year]
]

{ #category : #'month testing' }
HebrewCalendarDefinition >> isSivan: aMonth [

	^aMonth is: self sivan
]

{ #category : #'month testing' }
HebrewCalendarDefinition >> isTammuz: aMonth [

	^aMonth is: self tammuz
]

{ #category : #'month testing' }
HebrewCalendarDefinition >> isTevet: aMonth [

	^aMonth is: self tevet
]

{ #category : #'month testing' }
HebrewCalendarDefinition >> isTishri: aMonth [

	^aMonth is: self tishri
]

{ #category : #'year testing' }
HebrewCalendarDefinition >> isValidYearNumber: aNumber [

	^aNumber isInteger
]

{ #category : #'year testing' }
HebrewCalendarDefinition >> isYearNumberLeap: aNumber [
	"In the hebrew calendar, leap years occurs in years 3, 6, 8, 11, 14, 17, and 19 of the 19-year metonic cycle. This sequence
	can be computed concisely by noting that hebrew year y is leap if and only if (7y + 1) mod 19 is less than 7.
	- Extracted from 'Calendrical Calculations, Third Edition'; page 91."

	^((7 * aNumber + 1) \\ 19) < 7
]

{ #category : #'day testing' }
HebrewCalendarDefinition >> isYomHamishi: anHebrewDay [

	^anHebrewDay is: self yomHamishi
]

{ #category : #'day testing' }
HebrewCalendarDefinition >> isYomRevii: anHebrewDay [

	^anHebrewDay is: self yomRevii
]

{ #category : #'day testing' }
HebrewCalendarDefinition >> isYomRishon: anHebrewDay [

	^anHebrewDay is: self yomRishon
]

{ #category : #'day testing' }
HebrewCalendarDefinition >> isYomShabbat: anHebrewDay [

	^anHebrewDay is: self yomShabbat
]

{ #category : #'day testing' }
HebrewCalendarDefinition >> isYomShelishi: anHebrewDay [

	^anHebrewDay is: self yomShelishi
]

{ #category : #'day testing' }
HebrewCalendarDefinition >> isYomSheni: anHebrewDay [

	^anHebrewDay is: self yomSheni
]

{ #category : #'day testing' }
HebrewCalendarDefinition >> isYomShishi: anHebrewDay [

	^anHebrewDay is: self yomShishi
]

{ #category : #'months accessing' }
HebrewCalendarDefinition >> iyyar [

	^nonleapYearsMonths at: self iyyarNumber
]

{ #category : #'month definitions - private' }
HebrewCalendarDefinition >> iyyarDefinition [
	^ GenericMonthDefinition numberOfDays: 29 daysMeasure
]

{ #category : #'month names' }
HebrewCalendarDefinition >> iyyarName [

	^'Iyyar'
]

{ #category : #'month numbers' }
HebrewCalendarDefinition >> iyyarNumber [

	^2
]

{ #category : #'months accessing' }
HebrewCalendarDefinition >> kislev [

	^nonleapYearsMonths at: self kislevNumber
]

{ #category : #'month definitions - private' }
HebrewCalendarDefinition >> kislevDefinition [
	^ KislevMonthDefinition numberOfDays: 30 daysMeasure
]

{ #category : #'month names' }
HebrewCalendarDefinition >> kislevName [

	^'Kislev'
]

{ #category : #'month numbers' }
HebrewCalendarDefinition >> kislevNumber [

	^9
]

{ #category : #'months accessing' }
HebrewCalendarDefinition >> lastMonth [

	^self elul
]

{ #category : #'month testing' }
HebrewCalendarDefinition >> longMarheshvanIn: aYear [

	| daysInYear |
	
	daysInYear := self amountOfDaysIn: aYear.
	^daysInYear = 355 or: [daysInYear = 385]
]

{ #category : #'months accessing' }
HebrewCalendarDefinition >> marheshvan [

	^nonleapYearsMonths at: self marheshvanNumber
]

{ #category : #'month definitions - private' }
HebrewCalendarDefinition >> marheshvanDefinition [
	^ MarheshvanMonthDefinition numberOfDays: 30 daysMeasure
]

{ #category : #'month names' }
HebrewCalendarDefinition >> marheshvanName [

	^'Marheshvan'
]

{ #category : #'month numbers' }
HebrewCalendarDefinition >> marheshvanNumber [

	^8
]

{ #category : #'days accessing' }
HebrewCalendarDefinition >> maximumNumberOfDaysInOneYear [
	^ 385 daysMeasure
]

{ #category : #'months accessing' }
HebrewCalendarDefinition >> monthNamed: aString [

	^[super monthNamed: aString ]
		on: InvalidMonthNameException
		do: [:anException | | lowercaseString |
			lowercaseString := aString asLowercase.
			^self monthsForLeapYears
				detect: [:aMonth | aMonth name asLowercase = lowercaseString]
				ifNone: [anException signal]]
]

{ #category : #'months accessing' }
HebrewCalendarDefinition >> monthNumbered: aNumber [

	^[super monthNumbered: aNumber]
		on: InvalidMonthNumberException
		do: [:anException |
			^self monthsForLeapYears
				detect: [:month | month number = aNumber]
				ifNone: [anException signal]]
]

{ #category : #'months accessing' }
HebrewCalendarDefinition >> months [

	^nonleapYearsMonths
]

{ #category : #'months accessing' }
HebrewCalendarDefinition >> monthsForLeapYears [

	^leapYearsMonths
]

{ #category : #'months accessing' }
HebrewCalendarDefinition >> monthsForNonleapYears [

	^nonleapYearsMonths
]

{ #category : #'dates accessing' }
HebrewCalendarDefinition >> newDateFromYear: anHebrewYear month: anHebrewMonth dayNumber: aDayNumber [

	^FixedDate year: anHebrewYear month: anHebrewMonth dayNumber: aDayNumber
]

{ #category : #'year accessing' }
HebrewCalendarDefinition >> newYearFrom: aYear [
	"Adding the number of elapsed days to the value of the delay determine the day the year begins.
	- Extracted from 'Calendrical Calculations, The Millennium Edition'; page 103."

	| elapsedDays |
	
	elapsedDays := (HebrewElapsedDaysInYear for: aYear) value.
	^self epoch + elapsedDays amount + (HebrewNewYearDelay for: aYear) value
]

{ #category : #'year accessing' }
HebrewCalendarDefinition >> newYearNumberFrom: aYear adding: aNumberOfYears [

	^aYear number + aNumberOfYears
]

{ #category : #'dates accessing - private' }
HebrewCalendarDefinition >> nextMonthInLeapYearsFrom: aMonth [

	^aMonth nextInLeapYears
]

{ #category : #'dates accessing - private' }
HebrewCalendarDefinition >> nextMonthInNonleapYearsFrom: aMonth [

	^aMonth nextInNonleapYears
]

{ #category : #'months accessing' }
HebrewCalendarDefinition >> nisan [

	^nonleapYearsMonths at: self nisanNumber
]

{ #category : #'month definitions - private' }
HebrewCalendarDefinition >> nisanDefinition [
	^ GenericMonthDefinition numberOfDays: 30 daysMeasure
]

{ #category : #'month names' }
HebrewCalendarDefinition >> nisanName [

	^'Nisan'
]

{ #category : #'month numbers' }
HebrewCalendarDefinition >> nisanNumber [

	^1
]

{ #category : #'dates accessing - private' }
HebrewCalendarDefinition >> numberOfDaysFromDate: anHebrewDate [
	"To the fixed date of the start of the given year we add the number of elpased days in the given month
	and the length of each elapsed month. We distinguish between months before and after Tishri, wich is
	the seventh month, though the new year begins with its new moon. For dates in the second half of the
	year (months 1...6) we need ti include the lengths of all months from Tishri until last month of hebrew
	year (month 12 or 13).
	- Extracted from 'Calendrical Calculations, The Millennium Edition'; page 104."
	
	| tishri nisan year month dayNumber numberOfDays |
	
	tishri := 7.
	nisan := 1.
	year := anHebrewDate year.
	month := anHebrewDate month.
	dayNumber := anHebrewDate dayNumber.
	numberOfDays := (month number < tishri)
		ifTrue: [((tishri to: year arrayOfMonths last number) inject: 0 into: [:sum :monthNumber | sum + (year monthNumbered: monthNumber) lastDayNumber])
			+ ((nisan to: month number - 1) inject: 0 into: [:sum :monthNumber | sum + (year monthNumbered: monthNumber) lastDayNumber])]
		ifFalse: [(tishri to: month number - 1) inject: 0 into: [:sum :monthNumber | sum + (year monthNumbered: monthNumber) lastDayNumber]].
	^(self newYearFrom: year) + dayNumber - 1 + numberOfDays
]

{ #category : #'days accessing' }
HebrewCalendarDefinition >> numberOfDaysIn: anHebrewYear [
	
	^(self amountOfDaysIn: anHebrewYear) daysMeasure
]

{ #category : #'months accessing' }
HebrewCalendarDefinition >> numberOfMonthsPerYear [
	^ 13 monthsMeasure
]

{ #category : #printing }
HebrewCalendarDefinition >> printOn: aStream [

	aStream nextPutAll: 'Hebrew Calendar'
]

{ #category : #'months accessing' }
HebrewCalendarDefinition >> shevat [

	^nonleapYearsMonths at: self shevatNumber
]

{ #category : #'month definitions - private' }
HebrewCalendarDefinition >> shevatDefinition [
	^ GenericMonthDefinition numberOfDays: 30 daysMeasure
]

{ #category : #'month names' }
HebrewCalendarDefinition >> shevatName [

	^'Shevat'
]

{ #category : #'month numbers' }
HebrewCalendarDefinition >> shevatNumber [

	^11
]

{ #category : #'month testing' }
HebrewCalendarDefinition >> shortKislevIn: aYear [

	| daysInYear |
	
	daysInYear := self amountOfDaysIn: aYear.
	^daysInYear = 353 or: [daysInYear = 383]
]

{ #category : #'days accessing' }
HebrewCalendarDefinition >> sinceYomRishon: aNumberOfDays [

	^self sinceFirstDayOfWeek: aNumberOfDays
]

{ #category : #'months accessing' }
HebrewCalendarDefinition >> sivan [

	^nonleapYearsMonths at: self sivanNumber
]

{ #category : #'month definitions - private' }
HebrewCalendarDefinition >> sivanDefinition [
	^ GenericMonthDefinition numberOfDays: 30 daysMeasure
]

{ #category : #'month names' }
HebrewCalendarDefinition >> sivanName [

	^'Sivan'
]

{ #category : #'month numbers' }
HebrewCalendarDefinition >> sivanNumber [

	^3
]

{ #category : #'months accessing' }
HebrewCalendarDefinition >> tammuz [

	^nonleapYearsMonths at: self tammuzNumber
]

{ #category : #'month definitions - private' }
HebrewCalendarDefinition >> tammuzDefinition [
	^ GenericMonthDefinition numberOfDays: 29 daysMeasure
]

{ #category : #'month names' }
HebrewCalendarDefinition >> tammuzName [

	^'Tammuz'
]

{ #category : #'month numbers' }
HebrewCalendarDefinition >> tammuzNumber [

	^4
]

{ #category : #'months accessing' }
HebrewCalendarDefinition >> tevet [

	^nonleapYearsMonths at: self tevetNumber
]

{ #category : #'month definitions - private' }
HebrewCalendarDefinition >> tevetDefinition [
	^ GenericMonthDefinition numberOfDays: 29 daysMeasure
]

{ #category : #'month names' }
HebrewCalendarDefinition >> tevetName [

	^'Tevet'
]

{ #category : #'month numbers' }
HebrewCalendarDefinition >> tevetNumber [

	^10
]

{ #category : #'months accessing' }
HebrewCalendarDefinition >> tishri [

	^nonleapYearsMonths at: self tishriNumber
]

{ #category : #'month definitions - private' }
HebrewCalendarDefinition >> tishriDefinition [
	^ GenericMonthDefinition numberOfDays: 30 daysMeasure
]

{ #category : #'month names' }
HebrewCalendarDefinition >> tishriName [

	^'Tishri'
]

{ #category : #'month numbers' }
HebrewCalendarDefinition >> tishriNumber [

	^7
]

{ #category : #'days accessing' }
HebrewCalendarDefinition >> yomHamishi [

	^self dayPositionedInWeek: self yomHamishiPositionInWeek
]

{ #category : #'day names' }
HebrewCalendarDefinition >> yomHamishiName [
	
	^'yom hamishi'
]

{ #category : #'day position in week' }
HebrewCalendarDefinition >> yomHamishiPositionInWeek [
	
	^5
]

{ #category : #'days accessing' }
HebrewCalendarDefinition >> yomRevii [

	^self dayPositionedInWeek: self yomReviiPositionInWeek
]

{ #category : #'day names' }
HebrewCalendarDefinition >> yomReviiName [
	
	^'yom revi`i'
]

{ #category : #'day position in week' }
HebrewCalendarDefinition >> yomReviiPositionInWeek [
	
	^4
]

{ #category : #'days accessing' }
HebrewCalendarDefinition >> yomRishon [

	^self dayPositionedInWeek: self yomRishonPositionInWeek
]

{ #category : #'day names' }
HebrewCalendarDefinition >> yomRishonName [
	
	^'yom rishon'
]

{ #category : #'day position in week' }
HebrewCalendarDefinition >> yomRishonPositionInWeek [
	
	^1
]

{ #category : #'days accessing' }
HebrewCalendarDefinition >> yomShabbat [

	^self dayPositionedInWeek: self yomShabbatPositionInWeek
]

{ #category : #'day names' }
HebrewCalendarDefinition >> yomShabbatName [
	
	^'yom shabbat'
]

{ #category : #'day position in week' }
HebrewCalendarDefinition >> yomShabbatPositionInWeek [
	
	^7
]

{ #category : #'days accessing' }
HebrewCalendarDefinition >> yomShelishi [

	^self dayPositionedInWeek: self yomShelishiPositionInWeek
]

{ #category : #'day names' }
HebrewCalendarDefinition >> yomShelishiName [
	
	^'yom shelishi'
]

{ #category : #'day position in week' }
HebrewCalendarDefinition >> yomShelishiPositionInWeek [
	
	^3
]

{ #category : #'days accessing' }
HebrewCalendarDefinition >> yomSheni [

	^self dayPositionedInWeek: self yomSheniPositionInWeek
]

{ #category : #'day names' }
HebrewCalendarDefinition >> yomSheniName [
	
	^'yom sheni'
]

{ #category : #'day position in week' }
HebrewCalendarDefinition >> yomSheniPositionInWeek [
	
	^2
]

{ #category : #'days accessing' }
HebrewCalendarDefinition >> yomShishi [

	^self dayPositionedInWeek: self yomShishiPositionInWeek
]

{ #category : #'day names' }
HebrewCalendarDefinition >> yomShishiName [
	
	^'yom shishi'
]

{ #category : #'day position in week' }
HebrewCalendarDefinition >> yomShishiPositionInWeek [
	
	^6
]
