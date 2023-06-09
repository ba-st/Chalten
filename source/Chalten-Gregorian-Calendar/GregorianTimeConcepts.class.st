Class {
	#name : #GregorianTimeConcepts,
	#superclass : #SharedPool,
	#classVars : [
		'GregorianTimeUnits'
	],
	#category : #'Chalten-Gregorian-Calendar'
}

{ #category : #'class initialization' }
GregorianTimeConcepts class >> initialize [

	| week month year decade century millennium |

	GregorianTimeUnits := Namespace new.
	week := ProportionalDerivedUnit baseUnit: TimeUnits day conversionFactor: 7 named: 'week'.
	month := BaseUnit named: 'month'.
	year := ProportionalDerivedUnit baseUnit: month
		        conversionFactor: GregorianCalendar amountOfMonthsPerYear
		        named: 'year'.
	decade := ProportionalDerivedUnit baseUnit: year conversionFactor: 10 named: 'decade'.
	century := ProportionalDerivedUnit baseUnit: year conversionFactor: 100 named: 'century'.
	millennium := ProportionalDerivedUnit baseUnit: year conversionFactor: 1000 named: 'millennium'.

	GregorianTimeUnits
		bind: #week to: week;
		bind: #month to: month;
		bind: #year to: year;
		bind: #decade to: decade;
		bind: #century to: century;
		bind: #millennium to: millennium
]
