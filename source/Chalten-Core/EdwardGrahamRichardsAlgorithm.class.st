"
This is an algorithm by Edward Graham Richards to convert a Julian Day Number, J, to a date in the Gregorian proleptic calendar
"
Class {
	#name : 'EdwardGrahamRichardsAlgorithm',
	#superclass : 'Object',
	#instVars : [
		'monthShift',
		'numberOfDaysInMarchToJuly',
		'numberOfDaysIn400Years',
		'numberOfDaysIn4YearCycle',
		'numberOfMonthsInYear',
		'numberOfYearsInCycle',
		'numberOfMonthsBetweenMarchAndJuly'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Chalten-Core',
	#package : 'Chalten-Core'
}

{ #category : 'instance creation' }
EdwardGrahamRichardsAlgorithm class >> new [

  uniqueInstance ifNil: [ uniqueInstance := super new ].
  ^ uniqueInstance
]

{ #category : 'private - calculations' }
EdwardGrahamRichardsAlgorithm >> computeGregorianYearFrom: e and: monthNumber [
  "Computes the Gregorian year.
   	(e // 1461) is the number of 4-year Julian cycles since start
    - 4716 adjusts to Gregorian epoch
    ((12 + 2 - month) // 12) subtracts a year if date is in Jan or Feb (month < March in shifted calendar)"

  ^ e // numberOfDaysIn4YearCycle - 4716
    + ( numberOfMonthsInYear + monthShift - monthNumber // numberOfMonthsInYear )
]

{ #category : 'executing' }
EdwardGrahamRichardsAlgorithm >> executeFor: julianDayNumber [

  | e h dayNumber monthNumber yearNumber |
  e := self prepareForSplittingInto4YearCycles: julianDayNumber.
  h := self prepareForMonthAndDayExtraction: e.
  dayNumber := self extractDayNumber: h.
  monthNumber := self extractMonthNumber: h.
  yearNumber := self computeGregorianYearFrom: e and: monthNumber.
  ^ { dayNumber . monthNumber . yearNumber }
]

{ #category : 'private - calculations' }
EdwardGrahamRichardsAlgorithm >> extractDayNumber: h [
  "Extracts day of the month.
    \\ 153 Day into a 5-month window.
    // 5 + 1  Converts to 1-based day index."

  ^ h \\ numberOfDaysInMarchToJuly // numberOfMonthsBetweenMarchAndJuly + 1
]

{ #category : 'private - calculations' }
EdwardGrahamRichardsAlgorithm >> extractMonthNumber: h [
  "Calculates month number.
    (h // 153) which 5-month block you are in
    (+2  \\ 12 + 1) adjusts from March-based index to standard January-based month (1–12)"

  ^ h // numberOfDaysInMarchToJuly + monthShift \\ numberOfMonthsInYear + 1
]

{ #category : 'initialization' }
EdwardGrahamRichardsAlgorithm >> initialize [

  super initialize.
  numberOfMonthsInYear := 12.
  "Calculations are made in 4-year cycles"
  numberOfYearsInCycle := 4.
  "365 × 4 + 1  Number of days in a 4-year cycle."
  numberOfDaysIn4YearCycle := 1461.
  "In a cycle of 400 years there are 97 leap years: 365 × 400 + 97"
  numberOfDaysIn400Years := 146097.

  monthShift := 2.
  numberOfMonthsBetweenMarchAndJuly := 5.
  numberOfDaysInMarchToJuly := 153
]

{ #category : 'private - calculations' }
EdwardGrahamRichardsAlgorithm >> normalize: julianDayNumber [
  "Normalizes the Julian Day Number for calendar conversion.
	Adjusts for leap year correction and shifts origin for positive results:
		(+ 1401) ensures the base year is positive even for dates before year 0."

  | jdn scalingFactor epochAlignment |
  jdn := julianDayNumber rounded.
  "(4 × J + 274277) scales the day number and applies offset for leap year compensation across centuries."
  scalingFactor := 4 * jdn + 274277.
  "−38: Fine-tunes alignment to epoch of March 1, year 1"
  epochAlignment := 38.
  "× 3 // 4 Corrects the leap year calculation across centuries."
  ^ jdn + 1401 + ( scalingFactor // numberOfDaysIn400Years * 3 // 4 ) - epochAlignment
]

{ #category : 'private - calculations' }
EdwardGrahamRichardsAlgorithm >> prepareForMonthAndDayExtraction: e [
  "Prepares for month and day extraction from the current year-day.
    (5 × g + 2) Transforms the day count into a scale where months can be found with base 153"

  ^ numberOfMonthsBetweenMarchAndJuly * ( self splitInto4YearCycles: e ) + monthShift
]

{ #category : 'private - calculations' }
EdwardGrahamRichardsAlgorithm >> prepareForSplittingInto4YearCycles: julianDayNumber [
  "Prepares for splitting f into 4-year Julian cycles:
   	4 × f scales to reflect days across 4-year blocks.
	+3 shifts for rounding purposes."

  ^ numberOfYearsInCycle * ( self normalize: julianDayNumber ) + 3
]

{ #category : 'private - calculations' }
EdwardGrahamRichardsAlgorithm >> splitInto4YearCycles: e [
  "Finds the number of days into a 4-year cycle.
    \\ 1461 gets the offset within the current 4-year cycle.
    // 4 converts to year-day (i.e., how many days into the current year)."

  ^ e \\ numberOfDaysIn4YearCycle // numberOfYearsInCycle
]
