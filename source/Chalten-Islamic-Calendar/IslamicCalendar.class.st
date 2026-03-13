"
The islamic calendar add two more relative time units that are calendar-dependant.
While commonly used in the human context, their conversion to absolute units depends
on the specific moment the unit refers to.

This implementation defines the following relative time units:
•	islamic months
•	islamic years (12 islamic months)

"
Class {
	#name : 'IslamicCalendar',
	#superclass : 'Object',
	#classVars : [
		'Units'
	],
	#category : 'Chalten-Islamic-Calendar',
	#package : 'Chalten-Islamic-Calendar'
}

{ #category : 'class initialization' }
IslamicCalendar class >> initialize [

  <ignoreForCoverage>
  self initializeUnits
]

{ #category : 'class initialization' }
IslamicCalendar class >> initializeUnits [

  <ignoreForCoverage>
  | year |
  Units := Namespace new.
  year := BaseUnitOfMeasure
            measuring:
            ( BaseDimension named: 'Relative time in the Islamic Calendar Time escale' symbol: '☪️⏳' )
            singularNamed: 'islamic year'
            pluralNamed: 'islamic years'
            symbol: 'iyr'.

  Units
    bind: #year to: year;
    bind: #month to: ( MultipleUnitOfMeasure
          basedOn: year
          singularNamed: 'islamic month'
          pluralNamed: 'islamic months'
          symbol: 'imo'
          factor: 1 / 12 )
]

{ #category : 'accessing' }
IslamicCalendar class >> month [

  ^ Units >> #month
]

{ #category : 'accessing' }
IslamicCalendar class >> year [

  ^ Units >> #year
]
