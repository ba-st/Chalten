Class {
	#name : #IslamicTimeConcepts,
	#superclass : #SharedPool,
	#classVars : [
		'IslamicTimeUnits'
	],
	#category : #'Chalten-Islamic-Calendar'
}

{ #category : #'class initialization' }
IslamicTimeConcepts class >> initialize [

	| week month year decade century millennium |

	IslamicTimeUnits := Namespace new.
	week := ProportionalDerivedUnit baseUnit: TimeUnits day conversionFactor: 7 named: 'week'.
	month := BaseUnit named: 'month'.
	year := BaseUnit named: 'year'.
	decade := ProportionalDerivedUnit baseUnit: year conversionFactor: 10 named: 'decade'.
	century := ProportionalDerivedUnit baseUnit: year conversionFactor: 100 named: 'century'.
	millennium := ProportionalDerivedUnit baseUnit: year conversionFactor: 1000 named: 'millennium'.

	IslamicTimeUnits
		bind: #week to: week;
		bind: #month to: month;
		bind: #year to: year;
		bind: #decade to: decade;
		bind: #century to: century;
		bind: #millennium to: millennium
]
