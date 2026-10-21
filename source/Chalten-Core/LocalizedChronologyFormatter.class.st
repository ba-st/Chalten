"
I format dates and times following the conventions of a locale, taken from the Unicode CLDR: the order of their parts, the separators between them, the 12 or 24 hour clock and the AM and PM marks.

I lay out every object in one of CLDR's four styles, chosen with my configuration messages: `short`, `medium` (the default), `long` and `full`. Each of them takes the patterns of its style from the locale conventions, so formatting only applies them. Each object is laid out with the pattern of the style for what it is:

- a date, with the locale's date pattern;
- a time of day, with its time pattern. It has no offset, so in the long and full styles it uses the medium pattern, which is what CLDR's long and full time patterns are without their zone;
- a date and time, combining the date and time patterns as the locale's date and time pattern says, with the same time pattern as a time of day;
- a date and time aware of its offset, the same way, but with the zone of the long and full time patterns: its offset from UTC, as `UTC-3` in the long style and `UTC-03:00` in the full one, and `UTC` for no offset. An instant is shown as one with no offset;
- a month of a year, with its month and year patterns: `yM`, `yMMM` and `yMMMM` in the short, medium and long styles, and `yMMMM` in the full one;
- a day of a month, with its month and day patterns: `Md`, `MMMd` and `MMMMd`, and `MMMMd` in the full style;
- a year, in full and without grouping its digits;
- a month or a day of the week, with its short name in the short and medium styles, and its name in the long and full ones.

Month and weekday names are Chalten's own translations into my locale, not CLDR's. Numbers are written with ASCII digits, without grouping, and seconds without their fraction.
"
Class {
	#name : 'LocalizedChronologyFormatter',
	#superclass : 'Formatter',
	#instVars : [
		'languageTag',
		'conventions',
		'fieldWriters',
		'datePattern',
		'timePattern',
		'dateTimePattern',
		'zonedDateTimePattern',
		'yearMonthPattern',
		'monthDayPattern',
		'nameAccessor',
		'amMark',
		'pmMark'
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
LocalizedChronologyFormatter >> addPartsOfDate: aGregorianDate to: parts [

  ^ parts
      at: #year put: aGregorianDate yearNumber;
      at: #month put: aGregorianDate month;
      at: #day put: aGregorianDate dayNumber;
      at: #dayOfWeek put: aGregorianDate dayOfWeek;
      yourself
]

{ #category : 'private' }
LocalizedChronologyFormatter >> addPartsOfDateTime: aGregorianDateTime to: parts [

  self
    addPartsOfDate: aGregorianDateTime date to: parts;
    addPartsOfTimeOfDay: aGregorianDateTime timeOfDay to: parts.
  ^ parts
]

{ #category : 'private' }
LocalizedChronologyFormatter >> addPartsOfTimeOfDay: aTimeOfDay to: parts [

  ^ parts
      at: #hour put: aTimeOfDay hours numericalValue;
      at: #minute put: aTimeOfDay minutes numericalValue;
      at: #second put: aTimeOfDay seconds numericalValue;
      yourself
]

{ #category : 'private' }
LocalizedChronologyFormatter >> combineDateAndTimeWith: aDateTimePatternName zonedTime: aZonedTimePattern [
  "The pattern combining a date and a time is resolved once, for the times with an offset and for the ones without it"

  | dateTimeFormat |
  dateTimeFormat := self patternNamed: aDateTimePatternName.
  dateTimePattern := dateTimeFormat replacingDateWith: datePattern andTimeWith: timePattern.
  zonedDateTimePattern := dateTimeFormat
                            replacingDateWith: datePattern
                            andTimeWith: aZonedTimePattern
]

{ #category : 'private' }
LocalizedChronologyFormatter >> dayPeriodIn: parts [

  ^ ( self part: #hour of: parts ) < 12
      ifTrue: [ amMark ]
      ifFalse: [ pmMark ]
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
  timePattern := self patternNamed: #mediumTimeFormat.
  self combineDateAndTimeWith: #fullDateTimeFormat zonedTime: ( self patternNamed: #fullTimeFormat ).
  yearMonthPattern := self patternNamed: #longYearMonthFormat.
  monthDayPattern := self patternNamed: #longMonthDayFormat.
  nameAccessor := [ :named | named name ]
]

{ #category : 'private' }
LocalizedChronologyFormatter >> hourOf12HourClockIn: parts [
  "Midnight and noon are 12"

  ^ ( self part: #hour of: parts ) - 1 \\ 12 + 1
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
                    at: #hourOf12HourClock
                    put: [ :parts :stream | stream print: ( self hourOf12HourClockIn: parts ) ];
                    at: #twoDigitHourOf12HourClock put: [ :parts :stream |
                        stream nextPutAll:
                            ( ( self hourOf12HourClockIn: parts ) printStringLength: 2 padded: true ) ];
                    at: #hourOf24HourClock
                    put: [ :parts :stream | stream print: ( self part: #hour of: parts ) ];
                    at: #twoDigitHourOf24HourClock put: [ :parts :stream |
                        stream nextPutAll:
                            ( ( self part: #hour of: parts ) printStringLength: 2 padded: true ) ];
                    at: #dayPeriod
                    put: [ :parts :stream | stream nextPutAll: ( self dayPeriodIn: parts ) ];
                    at: #minute
                    put: [ :parts :stream | stream print: ( self part: #minute of: parts ) ];
                    at: #twoDigitMinute put: [ :parts :stream |
                        stream nextPutAll:
                            ( ( self part: #minute of: parts ) printStringLength: 2 padded: true ) ];
                    at: #second
                    put: [ :parts :stream | stream print: ( self part: #second of: parts ) ];
                    at: #twoDigitSecond put: [ :parts :stream |
                        stream nextPutAll:
                            ( ( self part: #second of: parts ) printStringLength: 2 padded: true ) ];
                    at: #shortOffset
                    put: [ :parts :stream |
                        self printShortOffset: ( self part: #offset of: parts ) on: stream ];
                    at: #longOffset
                    put: [ :parts :stream |
                        self printLongOffset: ( self part: #offset of: parts ) on: stream ];
                    yourself
]

{ #category : 'initialization' }
LocalizedChronologyFormatter >> initializeFor: aLanguageTag in: aLocaleConventions [

  languageTag := aLanguageTag asLanguageTag.
  conventions := aLocaleConventions.
  amMark := conventions chronologyPropertyNamed: #amMark for: languageTag.
  pmMark := conventions chronologyPropertyNamed: #pmMark for: languageTag.
  self
    initializeFieldWriters;
    medium
]

{ #category : 'configuring' }
LocalizedChronologyFormatter >> long [
  "Times without an offset have no zone to show, so they use the medium time pattern"

  datePattern := self patternNamed: #longDateFormat.
  timePattern := self patternNamed: #mediumTimeFormat.
  self combineDateAndTimeWith: #longDateTimeFormat zonedTime: ( self patternNamed: #longTimeFormat ).
  yearMonthPattern := self patternNamed: #longYearMonthFormat.
  monthDayPattern := self patternNamed: #longMonthDayFormat.
  nameAccessor := [ :named | named name ]
]

{ #category : 'configuring' }
LocalizedChronologyFormatter >> medium [

  datePattern := self patternNamed: #mediumDateFormat.
  timePattern := self patternNamed: #mediumTimeFormat.
  self combineDateAndTimeWith: #mediumDateTimeFormat zonedTime: timePattern.
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
                            ( 'The <1s> placeholder can only be used in a pattern combining a date and a time'
                                expandMacrosWith: element asString )
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
    with: ( self addPartsOfDate: aGregorianDate to: Dictionary new )
    on: aStream
]

{ #category : 'printing' }
LocalizedChronologyFormatter >> printDateTime: aGregorianDateTime offsetBy: anOffset on: aStream [

  self
    print: zonedDateTimePattern
    with: ( ( self addPartsOfDateTime: aGregorianDateTime to: Dictionary new )
          at: #offset put: anOffset;
          yourself )
    on: aStream
]

{ #category : 'printing' }
LocalizedChronologyFormatter >> printDateTime: aGregorianDateTime on: aStream [

  self
    print: dateTimePattern
    with: ( self addPartsOfDateTime: aGregorianDateTime to: Dictionary new )
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

{ #category : 'private' }
LocalizedChronologyFormatter >> printLongOffset: anOffset on: aStream [

  self withPartsOfOffset: anOffset on: aStream do: [ :hours :minutes :seconds |
      aStream
        nextPutAll: ( hours printStringLength: 2 padded: true );
        nextPut: $:;
        nextPutAll: ( minutes printStringLength: 2 padded: true ).
      self printOffsetSeconds: seconds on: aStream
    ]
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

{ #category : 'private' }
LocalizedChronologyFormatter >> printOffsetSeconds: seconds on: aStream [
  "Only shown when there are any, as in some historical offsets"

  seconds > 0 ifTrue: [
      aStream
        nextPut: $:;
        nextPutAll: ( seconds printStringLength: 2 padded: true )
    ]
]

{ #category : 'private' }
LocalizedChronologyFormatter >> printShortOffset: anOffset on: aStream [
  "The short offset drops the leading zero of the hours, and the minutes when they are zero"

  self withPartsOfOffset: anOffset on: aStream do: [ :hours :minutes :seconds |
      aStream print: hours.
      ( minutes > 0 or: [ seconds > 0 ] ) ifTrue: [
          aStream
            nextPut: $:;
            nextPutAll: ( minutes printStringLength: 2 padded: true )
        ].
      self printOffsetSeconds: seconds on: aStream
    ]
]

{ #category : 'printing' }
LocalizedChronologyFormatter >> printTimeOfDay: aTimeOfDay on: aStream [

  self
    print: timePattern
    with: ( self addPartsOfTimeOfDay: aTimeOfDay to: Dictionary new )
    on: aStream
]

{ #category : 'printing' }
LocalizedChronologyFormatter >> printYear: aGregorianYear on: aStream [

  aStream print: aGregorianYear number
]

{ #category : 'configuring' }
LocalizedChronologyFormatter >> short [

  datePattern := self patternNamed: #shortDateFormat.
  timePattern := self patternNamed: #shortTimeFormat.
  self combineDateAndTimeWith: #shortDateTimeFormat zonedTime: timePattern.
  yearMonthPattern := self patternNamed: #shortYearMonthFormat.
  monthDayPattern := self patternNamed: #shortMonthDayFormat.
  nameAccessor := [ :named | named shortName ]
]

{ #category : 'private' }
LocalizedChronologyFormatter >> withPartsOfOffset: anOffset on: aStream do: aBlock [
  "Writes UTC and, for an offset other than zero, its sign, evaluating aBlock with its hours, minutes and seconds"

  | totalSeconds absoluteSeconds |
  aStream nextPutAll: 'UTC'.
  totalSeconds := ( anOffset convertTo: TimeOfDay second ) numericalValue truncated.
  totalSeconds = 0 ifTrue: [ ^ self ].
  aStream nextPut: ( totalSeconds negative
        ifTrue: [ $- ]
        ifFalse: [ $+ ] ).
  absoluteSeconds := totalSeconds abs.
  aBlock
    value: absoluteSeconds // 3600
    value: absoluteSeconds \\ 3600 // 60
    value: absoluteSeconds \\ 60
]
