"
I format dates following the conventions of a locale, taken from the Unicode CLDR: the order of their parts and the separators between them.

I lay out every object in one of CLDR's four styles, chosen with my configuration messages: `short`, `medium` (the default), `long` and `full`. Each object is laid out with the patterns of the style for what it is:

- a date, with the locale's date pattern;
- a month of a year, with its month and year patterns: `yM`, `yMMM` and `yMMMM` in the short, medium and long styles, and `yMMMM` in the full one;
- a day of a month, with its month and day patterns: `Md`, `MMMd` and `MMMMd`, and `MMMMd` in the full style;
- a year, in full and without grouping its digits;
- a month or a day of the week, with its short name in the short and medium styles, and its name in the long and full ones.

Month and weekday names are Chalten's own translations into my locale, not CLDR's. Numbers are written with ASCII digits, without grouping.
"
Class {
	#name : 'LocalizedChronologyFormatter',
	#superclass : 'Formatter',
	#instVars : [
		'languageTag',
		'conventions',
		'style'
	],
	#category : 'Chalten-Core',
	#package : 'Chalten-Core'
}

{ #category : 'instance creation' }
LocalizedChronologyFormatter class >> for: aLanguageTag [

  ^ self for: aLanguageTag configuredBy: [ :options |  ]
]

{ #category : 'instance creation' }
LocalizedChronologyFormatter class >> for: aLanguageTag configuredBy: aBlock [

  ^ self for: aLanguageTag in: LocaleConventions current configuredBy: aBlock
]

{ #category : 'instance creation' }
LocalizedChronologyFormatter class >> for: aLanguageTag in: aLocaleConventions configuredBy: aBlock [

  | formatter |
  formatter := self new initializeFor: aLanguageTag in: aLocaleConventions.
  aBlock value: formatter.
  ^ formatter
]

{ #category : 'private' }
LocalizedChronologyFormatter >> fieldWriters [

  ^ Dictionary new
      at: #year put: [ :parts :stream | stream print: ( self part: #year of: parts ) ];
      at: #twoDigitYear
      put: [ :parts :stream | self print: ( self part: #year of: parts ) \\ 100 paddedOn: stream ];
      at: #month
      put: [ :parts :stream | stream print: ( self part: #month of: parts ) positionInYear ];
      at: #twoDigitMonth
      put: [ :parts :stream |
          self print: ( self part: #month of: parts ) positionInYear paddedOn: stream ];
      at: #monthShortName
      put: [ :parts :stream | stream nextPutAll: ( self part: #month of: parts ) shortName ];
      at: #monthName
      put: [ :parts :stream | stream nextPutAll: ( self part: #month of: parts ) name ];
      at: #day put: [ :parts :stream | stream print: ( self part: #day of: parts ) ];
      at: #twoDigitDay
      put: [ :parts :stream | self print: ( self part: #day of: parts ) paddedOn: stream ];
      at: #dayOfWeekShortName
      put: [ :parts :stream | stream nextPutAll: ( self part: #dayOfWeek of: parts ) shortName ];
      at: #dayOfWeekName
      put: [ :parts :stream | stream nextPutAll: ( self part: #dayOfWeek of: parts ) name ];
      yourself
]

{ #category : 'formatting' }
LocalizedChronologyFormatter >> format: aChronologyObject on: aStream [
  "The month and weekday names are translated by the objects themselves, into the current locale"

  CurrentLocale use: languageTag during: [ aChronologyObject printLocalizedOn: aStream using: self ]
]

{ #category : 'configuring' }
LocalizedChronologyFormatter >> full [

  style := #full
]

{ #category : 'initialization' }
LocalizedChronologyFormatter >> initializeFor: aLanguageTag in: aLocaleConventions [

  languageTag := aLanguageTag asLanguageTag.
  conventions := aLocaleConventions.
  style := #medium
]

{ #category : 'private' }
LocalizedChronologyFormatter >> isAbbreviated [

  ^ style = #short or: [ style = #medium ]
]

{ #category : 'configuring' }
LocalizedChronologyFormatter >> long [

  style := #long
]

{ #category : 'configuring' }
LocalizedChronologyFormatter >> medium [

  style := #medium
]

{ #category : 'private' }
LocalizedChronologyFormatter >> part: aPartName of: parts [

  ^ parts at: aPartName ifAbsent: [
        AssertionFailed signal:
          'The pattern needs a ' , aPartName asString , ' the formatted object doesn''t have'
      ]
]

{ #category : 'private' }
LocalizedChronologyFormatter >> patternNamed: aName [

  ^ ChronologyPattern fromString: ( conventions chronologyPropertyNamed: aName for: languageTag )
]

{ #category : 'private' }
LocalizedChronologyFormatter >> print: aPattern with: parts on: aStream [

  | fieldWriters |
  fieldWriters := self fieldWriters.
  aPattern elements do: [ :element |
      element isSymbol
        ifTrue: [
            ( fieldWriters
                at: element
                ifAbsent: [
                  AssertionFailed signal:
                    'The field ' , element asString , ' can''t be formatted yet' ] )
              value: parts
              value: aStream
          ]
        ifFalse: [ aStream nextPutAll: element ]
    ]
]

{ #category : 'private' }
LocalizedChronologyFormatter >> print: anInteger paddedOn: aStream [

  anInteger < 10 ifTrue: [ aStream nextPut: $0 ].
  aStream print: anInteger
]

{ #category : 'printing' }
LocalizedChronologyFormatter >> printDate: aGregorianDate on: aStream [

  self
    print: ( self patternNamed: style asString , 'DateFormat' )
    with: ( Dictionary new
          at: #year put: aGregorianDate yearNumber;
          at: #month put: aGregorianDate month;
          at: #day put: aGregorianDate dayNumber;
          at: #dayOfWeek put: aGregorianDate dayOfWeek;
          yourself )
    on: aStream
]

{ #category : 'printing' }
LocalizedChronologyFormatter >> printDayOfMonth: aCalendarDayOfMonth on: aStream [

  AssertionChecker
    enforce: [ aCalendarDayOfMonth month isGregorian ]
    because: 'Only days of Gregorian months can be localized'.
  self
    print: ( self patternNamed: self wholeMonthStyle asString , 'MonthDayFormat' )
    with: ( Dictionary new
          at: #month put: aCalendarDayOfMonth month;
          at: #day put: aCalendarDayOfMonth dayNumber;
          yourself )
    on: aStream
]

{ #category : 'printing' }
LocalizedChronologyFormatter >> printDayOfWeek: aCalendarDayOfWeek on: aStream [

  aStream nextPutAll: ( self isAbbreviated
        ifTrue: [ aCalendarDayOfWeek shortName ]
        ifFalse: [ aCalendarDayOfWeek name ] )
]

{ #category : 'printing' }
LocalizedChronologyFormatter >> printMonth: aCalendarMonth on: aStream [

  aStream nextPutAll: ( self isAbbreviated
        ifTrue: [ aCalendarMonth shortName ]
        ifFalse: [ aCalendarMonth name ] )
]

{ #category : 'printing' }
LocalizedChronologyFormatter >> printMonthOfYear: aGregorianMonthOfYear on: aStream [

  self
    print: ( self patternNamed: self wholeMonthStyle asString , 'YearMonthFormat' )
    with: ( Dictionary new
          at: #year put: aGregorianMonthOfYear year number;
          at: #month put: aGregorianMonthOfYear month;
          yourself )
    on: aStream
]

{ #category : 'printing' }
LocalizedChronologyFormatter >> printYear: aGregorianYear on: aStream [

  aStream print: aGregorianYear number
]

{ #category : 'configuring' }
LocalizedChronologyFormatter >> short [

  style := #short
]

{ #category : 'private' }
LocalizedChronologyFormatter >> wholeMonthStyle [
  "The patterns of a month of a year and of a day of a month have no full style: they use the long one"

  ^ style = #full
      ifTrue: [ #long ]
      ifFalse: [ style ]
]
