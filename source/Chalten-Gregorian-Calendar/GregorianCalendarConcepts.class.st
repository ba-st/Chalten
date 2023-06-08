"
A TimeUnitsGlobals is a helper object with common time units. Use it calling to TimeUnits, for example TimeUnits month.

"
Class {
	#name : #GregorianCalendarConcepts,
	#superclass : #SharedPool,
	#classVars : [
		'Constants',
		'GregorianCalendar',
		'GregorianTimeUnits'
	],
	#category : #'Chalten-Gregorian-Calendar'
}

{ #category : #initialization }
GregorianCalendarConcepts class >> initialize [

	self initializeAfterLoad
]

{ #category : #initialization }
GregorianCalendarConcepts class >> initializeAfterLoad [

	self initializeTimeUnits.
	GregorianCalendar := GregorianCalendarDefinition new
]

{ #category : #initialization }
GregorianCalendarConcepts class >> initializeDayBasedUnits [

	| week day millisecond hour minute second |

	day := BaseUnit named: 'day'.
	week := ProportionalDerivedUnit baseUnit: day conversionFactor: 7 named: 'week'.
	hour := ProportionalDerivedUnit baseUnit: day conversionFactor: 1 / 24 named: 'hour'.
	minute := ProportionalDerivedUnit baseUnit: day conversionFactor: 1 / ( 24 * 60 ) named: 'minute'.
	second := ProportionalDerivedUnit baseUnit: day
		          conversionFactor: 1 / ( 24 * 60 * 60 )
		          named: 'second'.
	millisecond := ProportionalDerivedUnit baseUnit: day
		               conversionFactor: 1 / ( 24 * 60 * 60 * 1000 )
		               named: 'millisecond'.

	GregorianTimeUnits
		bind: #week to: week;
		bind: #day to: day;
		bind: #hour to: hour;
		bind: #minute to: minute;
		bind: #second to: second;
		bind: #millisecond to: millisecond
]

{ #category : #initialization }
GregorianCalendarConcepts class >> initializeMonthBasedUnits [

	| month year decade century millennium |

	month := BaseUnit named: 'month'.
	year := ProportionalDerivedUnit baseUnit: month
		        conversionFactor: GregorianCalendar amountOfMonthsPerYear
		        named: 'year'.
	decade := ProportionalDerivedUnit baseUnit: year conversionFactor: 10 named: 'decade'.
	century := ProportionalDerivedUnit baseUnit: year conversionFactor: 100 named: 'century'.
	millennium := ProportionalDerivedUnit baseUnit: year conversionFactor: 1000 named: 'millennium'.

	GregorianTimeUnits
		bind: #month to: month;
		bind: #year to: year;
		bind: #decade to: decade;
		bind: #century to: century;
		bind: #millennium to: millennium
]

{ #category : #initialization }
GregorianCalendarConcepts class >> initializeTimeUnits [

	GregorianTimeUnits := Namespace new.
	self
		initializeDayBasedUnits;
		initializeMonthBasedUnits
]
