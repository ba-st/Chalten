Class {
	#name : #JulianTimeConcepts,
	#superclass : #SharedPool,
	#classVars : [
		'JulianTimeUnits'
	],
	#category : #'Chalten-Julian-Calendar'
}

{ #category : #'class initialization' }
JulianTimeConcepts class >> initialize [

	| week month year decade century millennium |

	JulianTimeUnits := Namespace new.
	week := ProportionalDerivedUnit baseUnit: TimeUnits day conversionFactor: 7 named: 'week'.
	month := BaseUnit named: 'month'.
	year := BaseUnit named: 'year'.
	decade := ProportionalDerivedUnit baseUnit: year conversionFactor: 10 named: 'decade'.
	century := ProportionalDerivedUnit baseUnit: year conversionFactor: 100 named: 'century'.
	millennium := ProportionalDerivedUnit baseUnit: year conversionFactor: 1000 named: 'millennium'.

	JulianTimeUnits
		bind: #week to: week;
		bind: #month to: month;
		bind: #year to: year;
		bind: #decade to: decade;
		bind: #century to: century;
		bind: #millennium to: millennium
]
