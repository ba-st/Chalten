"
A year in the Hebrew Calendar.
The Hebrew calendar is a lunisolar calendar.  This means the system performs a constant mathematical dance
to keep its months synchronized with the Moon while keeping its years synchronized with the Sun and the agricultural seasons.
Unlike the Gregorian calendar, which has only two year lengths (365 or 366 days), the Hebrew calendar has six possible year lengths.
A standard lunar year of 12 months is about 354 days - roughly 11 days shorter than a solar year. To prevent Passover (which must
be in the Spring) from drifting into the Winter, the calendar add an extra Adar month 7 times every 19 years:
- Common Year: 12 months (353, 354, or 355 days).
- Leap Year: 13 months (383, 384, or 385 days).
To ensure that certain holidays do not fall on inconvenient days of the week (e.g., Rosh Hashanah cannot be a Sunday, Wednesday,
or Friday), the months of Cheshvan and Kislev can change their length. This results in three ""characters"" for both common and leap
years:
- Deficient (Chaserah): Both Cheshvan and Kislev have 29 days.
- Regular (Kesidrah): Cheshvan has 29 days; Kislev has 30 days.
- Complete (Shlemah): Both Cheshvan and Kislev have 30 days.
This implementation don't allow hebrew years before year 1.
"
Class {
	#name : 'HebrewYear',
	#superclass : 'CalendarYear',
	#instVars : [
		'number',
		'months',
		'numberOfDays'
	],
	#classInstVars : [
		'years'
	],
	#category : 'Chalten-Hebrew-Calendar',
	#package : 'Chalten-Hebrew-Calendar'
}

{ #category : 'private - asserting' }
HebrewYear class >> assertIsValid: anInteger [

  super assertIsValid: anInteger.
  AssertionChecker
    enforce: [ anInteger strictlyPositive ]
    because: 'Negative years are unsupported for the Hebrew calendar' localized
    raising: InstanceCreationFailed
]

{ #category : 'private - accessing' }
HebrewYear class >> calendarName [

  ^ 'Hebrew' localized
]

{ #category : 'class initialization' }
HebrewYear class >> initialize [

  <ignoreForCoverage>
  years := IdentityDictionary new
]

{ #category : 'accessing - time units' }
HebrewYear class >> month [

  ^ HebrewCalendar month
]

{ #category : 'instance creation' }
HebrewYear class >> number: anInteger [

  self assertIsValid: anInteger.
  ^ years at: anInteger ifAbsentPut: [ self new initializeNumber: anInteger ]
]

{ #category : 'accessing - time units' }
HebrewYear class >> year [

  ^ HebrewCalendar year
]

{ #category : 'comparing' }
HebrewYear >> = anObject [

  ^ self equalityChecker
      compare: #number;
      checkAgainst: anObject
]

{ #category : 'accessing - months' }
HebrewYear >> adar [

  ^ self monthAt: ( HebrewMonth adar positionIn: self )
]

{ #category : 'accessing - months' }
HebrewYear >> adarI [

  ^ self monthAt: ( HebrewMonth adarI positionIn: self )
]

{ #category : 'accessing - months' }
HebrewYear >> adarII [

  ^ self monthAt: ( HebrewMonth adarII positionIn: self )
]

{ #category : 'accessing - months' }
HebrewYear >> av [

  ^ self monthAt: ( HebrewMonth av positionIn: self )
]

{ #category : 'accessing - months' }
HebrewYear >> cheshvan [

  ^ self monthAt: ( HebrewMonth cheshvan positionIn: self )
]

{ #category : 'accessing - months' }
HebrewYear >> elul [

  ^ self monthAt: ( HebrewMonth elul positionIn: self )
]

{ #category : 'accessing' }
HebrewYear >> firstDate [

  ^ self tishrei first
]

{ #category : 'comparing' }
HebrewYear >> hash [

  ^ number hash
]

{ #category : 'initialization' }
HebrewYear >> initializeNumber: anInteger [

  number := anInteger.
  months := Array new: self numberOfMonths numericalValue
]

{ #category : 'testing' }
HebrewYear >> isCompleteYear [

  ^ #( 355 385 ) includes: self numberOfDays numericalValue
]

{ #category : 'testing' }
HebrewYear >> isDeficientYear [

  ^ #( 353 383 ) includes: self numberOfDays numericalValue
]

{ #category : 'testing' }
HebrewYear >> isLeapYear [

  ^ 1 + ( 7 * number ) \\ 19 < 7
]

{ #category : 'testing' }
HebrewYear >> isRegularYear [

  ^ #( 354 384 ) includes: self numberOfDays numericalValue
]

{ #category : 'accessing - months' }
HebrewYear >> iyar [

  ^ self monthAt: ( HebrewMonth iyar positionIn: self )
]

{ #category : 'accessing - months' }
HebrewYear >> kislev [

  ^ self monthAt: ( HebrewMonth kislev positionIn: self )
]

{ #category : 'accessing' }
HebrewYear >> lastDate [

  ^ self elul twentyNinth
]

{ #category : 'private - querying' }
HebrewYear >> monthAt: monthIndex [

  ^ ( months at: monthIndex )
      ifNil: [
          | month |
          month := self isLeapYear
                     then: [ HebrewMonth monthOnLeapYearAt: monthIndex ]
                     otherwise: [ HebrewMonth monthOnCommonYearAt: monthIndex ].
          months at: monthIndex put: ( HebrewMonthOfYear year: self month: month )
        ]
      ifNotNil: [ :month | month ]
]

{ #category : 'accessing - months' }
HebrewYear >> nisan [

  ^ self monthAt: ( HebrewMonth nisan positionIn: self )
]

{ #category : 'accessing' }
HebrewYear >> number [

  ^ number
]

{ #category : 'accessing' }
HebrewYear >> numberOfDays [

  numberOfDays ifNil: [
      numberOfDays := self class day
                      * ( self next roshHashanahDayNumber - self roshHashanahDayNumber ) ].
  ^ numberOfDays
]

{ #category : 'accessing' }
HebrewYear >> numberOfMonths [

  ^ self class month * ( self isLeapYear then: [ 13 ] otherwise: [ 12 ] )
]

{ #category : 'private - querying' }
HebrewYear >> partsPerHour [
  "In the hebrew calendar, hours are divided in a smaller unit: `parts`,
   where 1 hour is equivalent to 1080 parts."

  ^ 1080
]

{ #category : 'printing' }
HebrewYear >> printOn: stream [

  stream
    print: number;
    space;
    nextPutAll: 'AM'
]

{ #category : 'querying' }
HebrewYear >> roshHashanahDayNumber [

  | partsPerDay lunarMonthDurationInParts moladTohuInParts elapsedMonths moladOfThisreiInParts moladOfThisreiInDays remainingMoladOfThisreiParts dayOfWeekIndex postponement |
  partsPerDay := 24 * self partsPerHour.
  "Lunar Month Duration: 29 days, 12 hours, 793 parts"
  lunarMonthDurationInParts := 29 * partsPerDay + ( 12 * self partsPerHour ) + 793.
  "Step #1: Molad Tohu - Monday (Day 2), 5h 204p"
  moladTohuInParts := 1 * partsPerDay + ( 5 * self partsPerHour ) + 204.
  "Step #2: Calculate elapsed months since year 1"
  elapsedMonths := 235 * number - 234 // 19.
  "Step #3: Calculate Molad of Tishrei for this year"
  moladOfThisreiInParts := moladTohuInParts + ( elapsedMonths * lunarMonthDurationInParts ).
  moladOfThisreiInDays := moladOfThisreiInParts // partsPerDay.
  remainingMoladOfThisreiParts := moladOfThisreiInParts \\ partsPerDay.
  dayOfWeekIndex := moladOfThisreiInDays \\ 7 + 1. "1=Sunday -- 7=Saturday"
  "Step #4: Apply the 4 Dechiyot (Postponement rules) "
  postponement := self
                    roshHashanahPostponementOffsetFor: remainingMoladOfThisreiParts
                    and: dayOfWeekIndex.
  "Final logic for Day of Week constraints (Lo ADU Rosh)
Re-calculate day and dayOfWeekIndex after initial postponement"
  moladOfThisreiInDays := moladOfThisreiInDays + postponement.
  dayOfWeekIndex := moladOfThisreiInDays \\ 7 + 1.
  "# Rule 4: Lo ADU (Rosh Hashanah cannot be Sun, Wed, Fri)"
  ( #( 1 4 6 ) includes: dayOfWeekIndex ) then: [ moladOfThisreiInDays := moladOfThisreiInDays + 1 ].

  ^ moladOfThisreiInDays
]

{ #category : 'private - querying' }
HebrewYear >> roshHashanahPostponementOffsetFor: remainingMoladOfThisreiParts and: dayOfWeekIndex [
  "Rule #1: Molad Zaken (noon or later)"

  remainingMoladOfThisreiParts >= ( 18 * self partsPerHour ) then: [ ^ 1 ].

  "# Rule 2: GaTaRaD (Tuesday, Common Year, 9h 204p or later)"
  ( self isLeapYear not and: [
        dayOfWeekIndex = 3 and: [ remainingMoladOfThisreiParts >= ( 9 * self partsPerHour + 204 ) ] ] )
    then: [ "Postpone to Thursday" ^ 2 ].

  "# Rule 3: BaTuTaKePaT (Monday, Following a Leap Year, 15h 589p or later)"
  ( number ~= 1 and: [self previous isLeapYear and: [
        dayOfWeekIndex = 2 and: [ remainingMoladOfThisreiParts >= ( 15 * self partsPerHour + 589 ) ] ] ])
    then: [ ^ 1 ].

  ^ 0
]

{ #category : 'accessing - months' }
HebrewYear >> shevat [

  ^ self monthAt: ( HebrewMonth shevat positionIn: self )
]

{ #category : 'accessing - months' }
HebrewYear >> sivan [

  ^ self monthAt: ( HebrewMonth sivan positionIn: self )
]

{ #category : 'accessing - months' }
HebrewYear >> tammuz [

  ^ self monthAt: ( HebrewMonth tammuz positionIn: self )
]

{ #category : 'accessing - months' }
HebrewYear >> tevet [

  ^ self monthAt: ( HebrewMonth tevet positionIn: self )
]

{ #category : 'accessing - months' }
HebrewYear >> tishrei [

  ^ self monthAt: ( HebrewMonth tishrei positionIn: self )
]
