"
Chalten extends the time units declared in the Internation System of Units to include relative time units.

Absolute time units include the following, based on the second (using definitions from the ISO proleptic Gregorian calendar):
- minutes (60 seconds)
- hours (60 minutes)
- days (24 hours)
- weeks (7 days)

Relative time units are calendar-dependant. While commonly used in the human context, their conversion to absolute units depends
on the specific moment the unit refers to. Relative time units are not automatically converted to absolute time units; external context
is required for such conversions. Refer to the concept of ""day count convention""  for various methods of converting relative time units
to absolute ones.

This implementation defines the following relative time units (using definitions from the ISO proleptic Gregorian calendar):
- months : based on the Moon's orbital period around the Earth
- years (12 months)
- lustrums ( 5 years)
- decades (10 years)
- jubilees (50 years)
- centuries (100 years)
- milleniums (1.000 years)
"
Class {
	#name : 'TimeUnits',
	#superclass : 'Object',
	#classVars : [
		'Units'
	],
	#category : 'Chalten-Core',
	#package : 'Chalten-Core'
}

{ #category : 'class initialization' }
TimeUnits class >> initialize [

  <ignoreForCoverage>
  self initializeUnits
]

{ #category : 'class initialization' }
TimeUnits class >> initializeRelativeUnits [

  <ignoreForCoverage>
  | year |
  year := BaseUnitOfMeasure
            measuring: ( BaseDimension named: 'Relative time' symbol: '⏳' )
            singularNamed: 'year'
            pluralNamed: 'years'
            symbol: 'yr'.

  Units
    bind: #year to: year;
    bind: #month to: ( MultipleUnitOfMeasure
          basedOn: year
          singularNamed: 'month'
          pluralNamed: 'months'
          symbol: 'mo'
          factor: 1 / 12 );
    bind: #lustrum to: ( MultipleUnitOfMeasure
          basedOn: year
          singularNamed: 'lustrum'
          pluralNamed: 'lustrums'
          symbol: 'lus'
          factor: 5 );
    bind: #decade to: ( MultipleUnitOfMeasure
          basedOn: year
          singularNamed: 'decade'
          pluralNamed: 'decades'
          symbol: 'dec'
          factor: 10 );
    bind: #jubilee to: ( MultipleUnitOfMeasure
          basedOn: year
          singularNamed: 'jubilee'
          pluralNamed: 'jubilees'
          symbol: 'jub'
          factor: 50 );
    bind: #century to: ( MultipleUnitOfMeasure
          basedOn: year
          singularNamed: 'century'
          pluralNamed: 'centuries'
          symbol: 'cent'
          factor: 100 );
    bind: #millenium to: ( MultipleUnitOfMeasure
          basedOn: year
          singularNamed: 'millenium'
          pluralNamed: 'milleniums'
          symbol: 'mil'
          factor: 1000 )
]

{ #category : 'class initialization' }
TimeUnits class >> initializeUnits [

  <ignoreForCoverage>
  Units := Namespace new.
  self initializeRelativeUnits
]

{ #category : 'accessing' }
TimeUnits class >> units [

  Units ifNil: [ self initializeUnits ].
  ^ Units
]
