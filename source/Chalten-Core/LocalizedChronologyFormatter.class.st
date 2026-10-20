"
I format dates following the conventions of a locale, taken from the Unicode CLDR: the order of their parts and the separators between them.

I lay out every object in one of CLDR's four styles, chosen with my configuration messages: `short`, `medium` (the default), `long` and `full`. Each of them takes the patterns of its style from the locale conventions, so formatting only applies them. Each object is laid out with the pattern of the style for what it is:

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
		'fieldWriters',
		'datePattern',
		'yearMonthPattern',
		'monthDayPattern',
		'nameAccessor'
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

{ #category : 'formatting' }
LocalizedChronologyFormatter >> format: aChronologyObject on: aStream [
  "The month and weekday names are translated by the objects themselves, into the current locale"

  CurrentLocale use: languageTag during: [ aChronologyObject printLocalizedOn: aStream using: self ]
]

{ #category : 'configuring' }
LocalizedChronologyFormatter >> full [
  "There are no full patterns for months of a year and days of a month: they use the long ones"

  datePattern := self patternNamed: #fullDateFormat.
  yearMonthPattern := self patternNamed: #longYearMonthFormat.
  monthDayPattern := self patternNamed: #longMonthDayFormat.
  nameAccessor := [ :named | named name ]
]

{ #category : 'initialization' }
LocalizedChronologyFormatter >> initializeFieldWriters [

  fieldWriters := Dictionary new
                    at: #year
                    put: [ :parts :stream | stream print: ( self part: #year of: parts ) ];
                    at: #twoDigitYear put: [ :parts :stream |
                        stream nextPutAll:
                            ( ( self part: #year of: parts ) \\ 100
                                printStringLength: 2
                                padded: true ) ];
                    at: #month
                    put: [ :parts :stream |
                        stream print: ( self part: #month of: parts ) positionInYear ];
                    at: #twoDigitMonth put: [ :parts :stream |
                        stream nextPutAll:
                            ( ( self part: #month of: parts ) positionInYear
                                printStringLength: 2
                                padded: true )
                      ];
                    at: #monthShortName
                    put: [ :parts :stream |
                        stream nextPutAll: ( self part: #month of: parts ) shortName ];
                    at: #monthName
                    put: [ :parts :stream | stream nextPutAll: ( self part: #month of: parts ) name ];
                    at: #day put: [ :parts :stream | stream print: ( self part: #day of: parts ) ];
                    at: #twoDigitDay put: [ :parts :stream |
                        stream nextPutAll:
                            ( ( self part: #day of: parts ) printStringLength: 2 padded: true ) ];
                    at: #dayOfWeekShortName
                    put: [ :parts :stream |
                        stream nextPutAll: ( self part: #dayOfWeek of: parts ) shortName ];
                    at: #dayOfWeekName
                    put: [ :parts :stream |
                        stream nextPutAll: ( self part: #dayOfWeek of: parts ) name ];
                    yourself
]

{ #category : 'initialization' }
LocalizedChronologyFormatter >> initializeFor: aLanguageTag in: aLocaleConventions [

  languageTag := aLanguageTag asLanguageTag.
  conventions := aLocaleConventions.
  self
    initializeFieldWriters;
    medium
]

{ #category : 'configuring' }
LocalizedChronologyFormatter >> long [

  datePattern := self patternNamed: #longDateFormat.
  yearMonthPattern := self patternNamed: #longYearMonthFormat.
  monthDayPattern := self patternNamed: #longMonthDayFormat.
  nameAccessor := [ :named | named name ]
]

{ #category : 'configuring' }
LocalizedChronologyFormatter >> medium [

  datePattern := self patternNamed: #mediumDateFormat.
  yearMonthPattern := self patternNamed: #mediumYearMonthFormat.
  monthDayPattern := self patternNamed: #mediumMonthDayFormat.
  nameAccessor := [ :named | named shortName ]
]

{ #category : 'private' }
LocalizedChronologyFormatter >> part: aPartName of: parts [

  ^ parts at: aPartName ifAbsent: [
        AssertionFailed signal:
          ( 'The pattern needs a <1s> the formatted object doesn''t have' expandMacrosWith:
              aPartName asString )
      ]
]

{ #category : 'private' }
LocalizedChronologyFormatter >> patternNamed: aName [

  ^ ChronologyPattern fromString: ( conventions chronologyPropertyNamed: aName for: languageTag )
]

{ #category : 'private' }
LocalizedChronologyFormatter >> print: aPattern with: parts on: aStream [

  aPattern elements do: [ :element |
      element isSymbol
        ifTrue: [
            | writer |
            writer := fieldWriters at: element ifAbsent: [
                          AssertionFailed signal:
                            ( 'The field <1s> can''t be formatted yet' expandMacrosWith:
                                element asString )
                        ].
            writer value: parts value: aStream
          ]
        ifFalse: [ aStream nextPutAll: element ]
    ]
]

{ #category : 'printing' }
LocalizedChronologyFormatter >> printDate: aGregorianDate on: aStream [

  self
    print: datePattern
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
    print: monthDayPattern
    with: ( Dictionary new
          at: #month put: aCalendarDayOfMonth month;
          at: #day put: aCalendarDayOfMonth dayNumber;
          yourself )
    on: aStream
]

{ #category : 'printing' }
LocalizedChronologyFormatter >> printDayOfWeek: aCalendarDayOfWeek on: aStream [

  aStream nextPutAll: ( nameAccessor value: aCalendarDayOfWeek )
]

{ #category : 'printing' }
LocalizedChronologyFormatter >> printMonth: aCalendarMonth on: aStream [

  aStream nextPutAll: ( nameAccessor value: aCalendarMonth )
]

{ #category : 'printing' }
LocalizedChronologyFormatter >> printMonthOfYear: aGregorianMonthOfYear on: aStream [

  self
    print: yearMonthPattern
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

  datePattern := self patternNamed: #shortDateFormat.
  yearMonthPattern := self patternNamed: #shortYearMonthFormat.
  monthDayPattern := self patternNamed: #shortMonthDayFormat.
  nameAccessor := [ :named | named shortName ]
]
