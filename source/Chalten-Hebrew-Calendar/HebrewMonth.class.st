"
A calendar month. In the Hebrew calendar, a month amongst the sequence of hebrew calendar
months. The hebrew calendar has the particularity that during leap years the Adar month is replaced
with two months. 
So, in common years the months are:
Tishrei, Cheshvan, Kislev, Tevet, Shevat, Adar, Nisan, Iyar, Sivan, Tammuz, Av, and Elul
and in leap years are:
Tishrei, Cheshvan, Kislev, Tevet, Shevat, Adar I, Adar II, Nisan, Iyar, Sivan, Tammuz, Av and Elul.
This logic introduces some particularities in the calendrical calculations, because not every hebrew year
has the same number of months, and some months don't have the same position on all years. As a side
effect of this behavior, a quantity of hebrew months is not convertible to a quantity of hebrew years.
In the hebrew calendar, a month without further context cannot be advanced a number of months.
In addition, the hebrew years are divided in deficient, regular or complete:
- On deficient years the months of Cheshvan and Kislev have a 29 day duration.
- On regular years the month of Cheshvan has a 29 day duration and the month of Kislev a 30 day duration.
- On complete years the months of Cheshvan and Kislev have a 30 day duration.
"
Class {
	#name : 'HebrewMonth',
	#superclass : 'CalendarMonth',
	#instVars : [
		'numberOfDaysInDeficientYear',
		'numberOfDaysInRegularYear',
		'numberOfDaysInCompleteYear',
		'positionInLeapYearBinding',
		'positionInCommonYearBinding'
	],
	#classVars : [
		'AllMonthsInLeapYears',
		'AllMonthsInNonLeapYears'
	],
	#category : 'Chalten-Hebrew-Calendar',
	#package : 'Chalten-Hebrew-Calendar'
}

{ #category : 'accessing' }
HebrewMonth class >> adar [

  ^ AllMonthsInNonLeapYears at: 6
]

{ #category : 'accessing' }
HebrewMonth class >> adarI [

  ^ AllMonthsInLeapYears at: 6
]

{ #category : 'accessing' }
HebrewMonth class >> adarII [

  ^ AllMonthsInLeapYears at: 7
]

{ #category : 'accessing' }
HebrewMonth class >> allOnCommonYear [

  ^ AllMonthsInNonLeapYears
]

{ #category : 'accessing' }
HebrewMonth class >> allOnLeapYear [

  ^ AllMonthsInLeapYears
]

{ #category : 'accessing' }
HebrewMonth class >> av [

  ^ AllMonthsInNonLeapYears at: 11
]

{ #category : 'accessing' }
HebrewMonth class >> cheshvan [

  ^ AllMonthsInNonLeapYears at: 2
]

{ #category : 'accessing' }
HebrewMonth class >> elul [

  ^ AllMonthsInNonLeapYears at: 12
]

{ #category : 'class initialization' }
HebrewMonth class >> initialize [

  <ignoreForCoverage>
  | tishrei cheshvan kislev tevet shevat adar adarI adarII nisan iyar sivan tammuz av elul |
  tishrei := self
               named: 'Tishrei'
               shortNamed: 'Tish'
               positionInYear: 1
               numberOfDaysInYear: 30.
  cheshvan := self
                named: 'Cheshvan'
                shortNamed: 'Chesh'
                positionInYear: 2
                numberOfDaysInDeficientYear: 29
                numberOfDaysInRegularYear: 29
                numberOfDaysInCompleteYear: 30.
  kislev := self
              named: 'Kislev'
              shortNamed: 'Kis'
              positionInYear: 3
              numberOfDaysInDeficientYear: 29
              numberOfDaysInRegularYear: 30
              numberOfDaysInCompleteYear: 30.
  tevet := self
             named: 'Tevet'
             shortNamed: 'Tev'
             positionInYear: 4
             numberOfDaysInYear: 29.
  shevat := self
              named: 'Shevat'
              shortNamed: 'Shev'
              positionInYear: 5
              numberOfDaysInYear: 30.
  adar := self
            named: 'Adar'
            shortNamed: 'Ad'
            positionInCommonYear: ( Binding to: 6 )
            inLeapYear:
            ( Binding
                undefinedExplainedBy: 'Adar only exists on common years'
                raising: InstanceCreationFailed )
            numberOfDaysInDeficientYear: 29
            numberOfDaysInRegularYear: 29
            numberOfDaysInCompleteYear: 29.
  adarI := self
             named: 'Adar I'
             shortNamed: 'Ad I'
             positionInCommonYear:
             ( Binding
                 undefinedExplainedBy: 'Adar I only exists on leap years'
                 raising: InstanceCreationFailed )
             inLeapYear: ( Binding to: 6 )
             numberOfDaysInDeficientYear: 30
             numberOfDaysInRegularYear: 30
             numberOfDaysInCompleteYear: 30.
  adarII := self
              named: 'Adar II'
              shortNamed: 'Ad II'
              positionInCommonYear:
              ( Binding
                  undefinedExplainedBy: 'Adar II only exists on leap years'
                  raising: InstanceCreationFailed )
              inLeapYear: ( Binding to: 7 )
              numberOfDaysInDeficientYear: 29
              numberOfDaysInRegularYear: 29
              numberOfDaysInCompleteYear: 29.
  nisan := self
             named: 'Nisan'
             shortNamed: 'Nis'
             positionInNonLeapYear: 7
             inLeapYear: 8
             numberOfDaysInYear: 30.
  iyar := self
            named: 'Iyar'
            shortNamed: 'Iya'
            positionInNonLeapYear: 8
            inLeapYear: 9
            numberOfDaysInYear: 29.
  sivan := self
             named: 'Sivan'
             shortNamed: 'Siv'
             positionInNonLeapYear: 9
             inLeapYear: 10
             numberOfDaysInYear: 30.
  tammuz := self
              named: 'Tammuz'
              shortNamed: 'Tam'
              positionInNonLeapYear: 10
              inLeapYear: 11
              numberOfDaysInYear: 29.
  av := self
          named: 'Av'
          shortNamed: 'Av'
          positionInNonLeapYear: 11
          inLeapYear: 12
          numberOfDaysInYear: 30.
  elul := self
            named: 'Elul'
            shortNamed: 'Elu'
            positionInNonLeapYear: 12
            inLeapYear: 13
            numberOfDaysInYear: 29.
  AllMonthsInNonLeapYears := { tishrei . cheshvan . kislev . tevet . shevat . adar . nisan . iyar .
                               sivan . tammuz . av . elul }.
  AllMonthsInLeapYears := { tishrei . cheshvan . kislev . tevet . shevat . adarI . adarII . nisan .
                            iyar . sivan . tammuz . av . elul }
]

{ #category : 'accessing' }
HebrewMonth class >> iyar [

  ^ AllMonthsInNonLeapYears at: 8
]

{ #category : 'accessing' }
HebrewMonth class >> kislev [

  ^ AllMonthsInNonLeapYears at: 3
]

{ #category : 'accessing' }
HebrewMonth class >> monthOnCommonYearAt: index [

  ^ AllMonthsInNonLeapYears at: index
]

{ #category : 'accessing' }
HebrewMonth class >> monthOnLeapYearAt: index [

  ^ AllMonthsInLeapYears at: index
]

{ #category : 'private - instance creation' }
HebrewMonth class >> named: aName shortNamed: aShortName positionInCommonYear: commonIndexBinding inLeapYear: leapIndexBinding numberOfDaysInDeficientYear: deficientNumber numberOfDaysInRegularYear: regularNumber numberOfDaysInCompleteYear: completeNumber [

  <ignoreForCoverage>
  ^ self new
      initializeNamed: aName
      shortNamed: aShortName
      positionInNonLeapYear: commonIndexBinding
      inLeapYear: leapIndexBinding
      numberOfDaysInDeficientYear: deficientNumber * self day
      numberOfDaysInRegularYear: regularNumber * self day
      numberOfDaysInCompleteYear: completeNumber * self day
]

{ #category : 'private - instance creation' }
HebrewMonth class >> named: aName shortNamed: aShortName positionInNonLeapYear: commonIndex inLeapYear: leapIndex numberOfDaysInYear: number [

  <ignoreForCoverage>
  ^ self
      named: aName
      shortNamed: aShortName
      positionInCommonYear: ( Binding to: commonIndex )
      inLeapYear: ( Binding to: leapIndex )
      numberOfDaysInDeficientYear: number
      numberOfDaysInRegularYear: number
      numberOfDaysInCompleteYear: number
]

{ #category : 'private - instance creation' }
HebrewMonth class >> named: aName shortNamed: aShortName positionInYear: index numberOfDaysInDeficientYear: deficientNumber numberOfDaysInRegularYear: regularNumber numberOfDaysInCompleteYear: completeNumber [

  <ignoreForCoverage>
  | positionBinding |
  positionBinding := Binding to: index.
  ^ self
      named: aName
      shortNamed: aShortName
      positionInCommonYear: positionBinding
      inLeapYear: positionBinding
      numberOfDaysInDeficientYear: deficientNumber
      numberOfDaysInRegularYear: regularNumber
      numberOfDaysInCompleteYear: completeNumber
]

{ #category : 'private - instance creation' }
HebrewMonth class >> named: aName shortNamed: aShortName positionInYear: index numberOfDaysInYear: number [

  <ignoreForCoverage>
  | indexBinding |
  indexBinding := Binding to: index.
  ^ self
      named: aName
      shortNamed: aShortName
      positionInCommonYear: indexBinding
      inLeapYear: indexBinding
      numberOfDaysInDeficientYear: number
      numberOfDaysInRegularYear: number
      numberOfDaysInCompleteYear: number
]

{ #category : 'accessing' }
HebrewMonth class >> nisan [

  ^ AllMonthsInNonLeapYears at: 7
]

{ #category : 'accessing' }
HebrewMonth class >> shevat [

  ^ AllMonthsInNonLeapYears at: 5
]

{ #category : 'accessing' }
HebrewMonth class >> sivan [

  ^ AllMonthsInNonLeapYears at: 9
]

{ #category : 'accessing' }
HebrewMonth class >> tammuz [

  ^ AllMonthsInNonLeapYears at: 10
]

{ #category : 'accessing' }
HebrewMonth class >> tevet [

  ^ AllMonthsInNonLeapYears at: 4
]

{ #category : 'accessing' }
HebrewMonth class >> tishrei [

  ^ AllMonthsInNonLeapYears at: 1
]

{ #category : 'instance creation' }
HebrewMonth >> , yearNumber [

  | year |
  year := yearNumber asHebrewYear.
  ^ year monthAt: ( self positionIn: year )
]

{ #category : 'private' }
HebrewMonth >> dayOfMonthAt: dayNumber [

  ^ CalendarDayOfMonth hebrewMonth: self dayNumber: dayNumber
]

{ #category : 'initialization' }
HebrewMonth >> initializeNamed: aName shortNamed: aShortName positionInNonLeapYear: commonIndexBinding inLeapYear: leapIndexBinding numberOfDaysInDeficientYear: deficientNumber numberOfDaysInRegularYear: regularNumber numberOfDaysInCompleteYear: completeNumber [

  <ignoreForCoverage>
  name := aName.
  shortName := aShortName.
  positionInLeapYearBinding := leapIndexBinding.
  positionInCommonYearBinding := commonIndexBinding.
  numberOfDaysInRegularYear := regularNumber.
  numberOfDaysInCompleteYear := completeNumber.
  numberOfDaysInDeficientYear := deficientNumber
]

{ #category : 'private' }
HebrewMonth >> isGregorian [

  ^ false
]

{ #category : 'testing' }
HebrewMonth >> isVariableLengthMonth [

  ^ ( numberOfDaysInRegularYear = numberOfDaysInCompleteYear and: [
          numberOfDaysInCompleteYear = numberOfDaysInDeficientYear ] ) not
]

{ #category : 'accessing' }
HebrewMonth >> numberOfDaysInCompleteYear [

  ^ numberOfDaysInCompleteYear
]

{ #category : 'accessing' }
HebrewMonth >> numberOfDaysInDeficientYear [

  ^ numberOfDaysInDeficientYear
]

{ #category : 'accessing' }
HebrewMonth >> numberOfDaysInRegularYear [

  ^ numberOfDaysInRegularYear
]

{ #category : 'private' }
HebrewMonth >> positionIn: year [

  ^ year isLeapYear then: [ self positionInLeapYear ] otherwise: [ self positionInCommonYear ]
]

{ #category : 'accessing' }
HebrewMonth >> positionInCommonYear [

  ^ positionInCommonYearBinding content
]

{ #category : 'accessing' }
HebrewMonth >> positionInLeapYear [ 

	^ positionInLeapYearBinding content
]

{ #category : 'accessing - dates' }
HebrewMonth >> thirtieth [

  ^ numberOfDaysInCompleteYear > ( 29 * self class day )
      then: [ self dayOfMonthAt: 30 ]
      otherwise: [  self doesNotUnderstand: #thirtieth ]
]
