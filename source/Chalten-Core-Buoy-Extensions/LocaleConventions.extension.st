Extension { #name : 'LocaleConventions' }

{ #category : '*Chalten-Core-Buoy-Extensions' }
LocaleConventions class >> chronologyPatternNames [

  ^ #( #shortDateFormat #mediumDateFormat #longDateFormat #fullDateFormat #shortTimeFormat
       #mediumTimeFormat #longTimeFormat #fullTimeFormat #shortDateTimeFormat #mediumDateTimeFormat
       #longDateTimeFormat #fullDateTimeFormat #shortYearMonthFormat #mediumYearMonthFormat
       #longYearMonthFormat #shortMonthDayFormat #mediumMonthDayFormat #longMonthDayFormat )
]

{ #category : '*Chalten-Core-Buoy-Extensions' }
LocaleConventions class >> chronologyPropertyNames [

  ^ self chronologyPatternNames , #( #amMark #pmMark )
]

{ #category : '*Chalten-Core-Buoy-Extensions' }
LocaleConventions >> chronologyPropertyNamed: aName for: aLanguageTagOrString [

  ^ self propertyNamed: aName of: #chronology for: aLanguageTagOrString
]

{ #category : '*Chalten-Core-Buoy-Extensions' }
LocaleConventions >> loadJSONChronologyConventionsFrom: aFileReference [
  "Merges into the receiver the date and time conventions in the file, property by property,
	so the ones in the file override the ones already loaded."

  self loadJSONChronologyConventionsFromString: aFileReference contents
]

{ #category : '*Chalten-Core-Buoy-Extensions' }
LocaleConventions >> loadJSONChronologyConventionsFromString: aString [
  "Merges into the receiver the date and time conventions in the JSON string, property by property,
	so the ones in the string override the ones already loaded.
	The patterns are parsed first, so a pattern with an unsupported field is rejected before loading anything."

  | patternNames |
  patternNames := self class chronologyPatternNames.
  ( STON fromString: aString ) do: [ :properties |
      properties keysAndValuesDo: [ :name :value |
          ( patternNames includes: name asSymbol ) ifTrue: [ ChronologyPattern fromString: value ] ]
    ].
  self
    registerCategory: #chronology withPropertiesNamed: self class chronologyPropertyNames;
    loadJSONConventionsOf: #chronology fromString: aString
]
