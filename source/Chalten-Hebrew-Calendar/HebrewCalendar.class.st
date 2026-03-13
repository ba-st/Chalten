"
The hebrew calendar add two more relative time units that are calendar-dependant.
While commonly used in the human context, their conversion to absolute units depends
on the specific moment the unit refers to.

This implementation defines the following relative time units:
•	hebrew months 
•	hebrew years

In this calendar the month and year units are not convertible, because some years
have 13 months and other 12 months depending on the specific year.
"
Class {
	#name : 'HebrewCalendar',
	#superclass : 'Object',
	#classVars : [
		'Units'
	],
	#category : 'Chalten-Hebrew-Calendar',
	#package : 'Chalten-Hebrew-Calendar'
}

{ #category : 'class initialization' }
HebrewCalendar class >> initialize [

  <ignoreForCoverage>
  self initializeUnits
]

{ #category : 'initialization' }
HebrewCalendar class >> initializeUnits [

  <ignoreForCoverage>
  | year month |
  Units := Namespace new.
  year := BaseUnitOfMeasure
            measuring:
            ( BaseDimension named: 'Relative years in the Hebrew Calendar Time escale' symbol: '✡️⏳' )
            singularNamed: 'hebrew year'
            pluralNamed: 'hebrew years'
            symbol: 'hyr'.
month := BaseUnitOfMeasure
            measuring:
            ( BaseDimension named: 'Relative months in the Hebrew Calendar Time escale' symbol: '✡️⏳' )
            singularNamed: 'hebrew month'
            pluralNamed: 'hebrew months'
            symbol: 'hmo'.
  Units
    bind: #year to: year;
    bind: #month to: month
]

{ #category : 'accessing' }
HebrewCalendar class >> month [

  ^ Units >> #month
]

{ #category : 'accessing' }
HebrewCalendar class >> year [

  ^ Units >> #year
]
