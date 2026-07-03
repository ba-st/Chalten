"
I'm a parser of the ISO 8601 extended format
"
Class {
	#name : 'ISO8601Parser',
	#superclass : 'Object',
	#instVars : [
		'numberReader'
	],
	#category : 'Chalten-Core',
	#package : 'Chalten-Core'
}

{ #category : 'private' }
ISO8601Parser >> enforce: aFact because: aStringOrBlockExplanation [

  AssertionChecker enforce: aFact because: aStringOrBlockExplanation raising: InstanceCreationFailed
]

{ #category : 'private' }
ISO8601Parser >> errorMessageForDateParsing: string [

  ^ 'The provided date ''{1}'' is invalid. Dates must be 4 digits (e.g., 2026) or expanded ISO 8601 (e.g., +010000) for the year, exactly 2 digits for the month and exactly 2 digits for the day.'
      localizedWithAll: { string }
]

{ #category : 'private' }
ISO8601Parser >> errorMessageForDateTimeParsing: string [

  ^ 'The provided datetime ''{1}'' is invalid.' localizedWithAll: { string }
]

{ #category : 'private' }
ISO8601Parser >> errorMessageForDayNumberParsing: string [

  ^ 'The provided day number ''{1}'' is invalid. Day numbers must be 2 digits between 01 and maximum of the month (e.g., 05).'
      localizedWithAll: { string }
]

{ #category : 'private' }
ISO8601Parser >> errorMessageForDurationParsing: string [

  ^ 'The provided duration ''{1}'' is invalid.' localizedWithAll: { string }
]

{ #category : 'private' }
ISO8601Parser >> errorMessageForMonthOfYearParsing: string [

  ^ 'The provided month of year ''{1}'' is invalid. Months of year must be 4 digits (e.g., 2026) or expanded ISO 8601 (e.g., +010000) for the year and exactly 2 digits for the month.'
      localizedWithAll: { string }
]

{ #category : 'private' }
ISO8601Parser >> errorMessageForMonthParsing: string [

  ^ 'The provided month ''{1}'' is invalid. Months must be 2 digits between 01 and 12 (e.g., 05).'
      localizedWithAll: { string }
]

{ #category : 'private' }
ISO8601Parser >> errorMessageForTimeParsing: string [

  ^ 'The provided time ''{1}'' is invalid. Ensure it follows ISO 8601 (e.g., ''T14:30:00'').'
      localizedWithAll: { string }
]

{ #category : 'private' }
ISO8601Parser >> errorMessageForYearParsing: string [

  ^ 'The provided year ''{1}'' is invalid. Years must be 4 digits (e.g., 2026) or expanded ISO 8601 (e.g., +010000).'
      localizedWithAll: { string }
]

{ #category : 'initialization' }
ISO8601Parser >> initialize [

  super initialize.
  self readNumbersUsing: Number
]

{ #category : 'private' }
ISO8601Parser >> numberIn: numberStream parsing: string [

  | numberString number |
  numberString := numberStream contents.
  numberString ifEmpty: [ self signal: ( self errorMessageForDurationParsing: string ) ].
  number := numberReader
              readFrom: numberString
              ifFail: [ self signal: ( self errorMessageForDurationParsing: string ) ].
  numberStream reset.
  ^ number
]

{ #category : 'parsing' }
ISO8601Parser >> parseDate: string [

  | sign parts yearString year month dayNumber |
  self enforce: [ string size >= 10 ] because: [ self errorMessageForDateParsing: string ].
  sign := ''.
  parts := string first = $-
             then: [
                 sign := '-'.
                 string substrings: sign
               ]
             otherwise: [ string substrings: '-' ].
  self enforce: [ parts size = 3 ] because: [ self errorMessageForDateParsing: string ].
  yearString := sign , parts first.
  year := self parseYear: yearString.
  month := self parseMonth: parts second.
  dayNumber := self parseDayNumber: parts third.
  ^ ( year monthAt: month positionInYear ) dateAt: dayNumber
]

{ #category : 'parsing' }
ISO8601Parser >> parseDateTime: string [

  | parts date timeOfDay |
  parts := string substrings: 'T'.
  self enforce: [ parts size = 2 ] because: [ self errorMessageForDateTimeParsing: string ].
  date := self parseDate: parts first.
  timeOfDay := self parseTimeOfDay: 'T' , parts second.
  ^ date at: timeOfDay
]

{ #category : 'parsing' }
ISO8601Parser >> parseDayNumber: string [

  self enforce: [ string size = 2 ] because: [ self errorMessageForDayNumberParsing: string ].
  self enforce: [ string isAllDigits ] because: [ self errorMessageForDayNumberParsing: string ].
  ^ Integer
      readFrom: string
      ifFail: [ self signal: ( self errorMessageForDayNumberParsing: string ) ]
]

{ #category : 'parsing' }
ISO8601Parser >> parseDuration: string [

  ^ self parseDuration: string allowingSeveralTimePeriods: false
]

{ #category : 'parsing' }
ISO8601Parser >> parseDuration: string allowingSeveralTimePeriods: allowSeveralTimePeriods [

  | stringToParse periods |
  self enforce: [ string beginsWith: 'P' ] because: [ self errorMessageForDurationParsing: string ].
  stringToParse := string withoutFirst.
  "Week durations are specially handled"
  ( stringToParse endsWith: 'W' ) then: [ ^ self parseWeekDuration: stringToParse allButLast ].

  "Handle non-week periods that can be combined"
  periods := self parseTimePeriodsInDuration: string.
  periods ifEmpty: [ self signal: ( self errorMessageForDurationParsing: string ) ].

  ^ allowSeveralTimePeriods then: [ periods ] otherwise: [
        periods size = 1
          then: [ periods anyOne ]
          otherwise: [ self signal: 'Durations with several time periods are disallowed' ]
      ]
]

{ #category : 'parsing' }
ISO8601Parser >> parseMonth: string [

  | index |
  self enforce: [ string size = 2 ] because: [ self errorMessageForMonthParsing: string ].
  self enforce: [ string isAllDigits ] because: [ self errorMessageForMonthParsing: string ].
  index := Integer
             readFrom: string
             ifFail: [ self signal: ( self errorMessageForMonthParsing: string ) ].
  self enforce: [ index between: 1 and: 12 ] because: [ self errorMessageForMonthParsing: string ].
  ^ GregorianMonth monthAt: index
]

{ #category : 'parsing' }
ISO8601Parser >> parseMonthOfYear: string [

  | sign parts yearString year month |
  self enforce: [ string size >= 7 ] because: [ self errorMessageForMonthOfYearParsing: string ].
  sign := ''.
  parts := string first = $-
             then: [
                 sign := '-'.
                 string substrings: sign
               ]
             otherwise: [ string substrings: '-' ].
  self enforce: [ parts size = 2 ] because: [ self errorMessageForMonthOfYearParsing: string ].
  yearString := sign , parts first.
  year := self parseYear: yearString.
  month := self parseMonth: parts second.
  ^ year monthAt: month positionInYear
]

{ #category : 'parsing' }
ISO8601Parser >> parseTimeOfDay: string [

  | parts hoursPart hours minutesPart minutes secondsPart seconds microsecondsPart microseconds |
  self enforce: [ string beginsWith: 'T' ] because: [ self errorMessageForTimeParsing: string ].
  self refuse: [ string endsWith: ':' ] because: [ self errorMessageForTimeParsing: string ].
  self refuse: [ string endsWith: '.' ] because: [ self errorMessageForTimeParsing: string ].
  parts := string withoutFirst substrings: ':'.
  self enforce: [ parts size <= 3 ] because: [ self errorMessageForTimeParsing: string ].
  parts ifEmpty: [ self signal: ( self errorMessageForTimeParsing: string ) ].
  hoursPart := parts first.
  self enforce: [ hoursPart size = 2 ] because: [ self errorMessageForTimeParsing: string ].
  hours := Integer
             readFrom: hoursPart
             ifFail: [ self signal: ( self errorMessageForTimeParsing: string ) ].
  parts := parts withoutFirst.
  parts ifEmpty: [ ^ TimeOfDay hours: hours ].
  minutesPart := parts first.
  self enforce: [ minutesPart size = 2 ] because: [ self errorMessageForTimeParsing: string ].
  minutes := Integer
               readFrom: minutesPart
               ifFail: [ self signal: ( self errorMessageForTimeParsing: string ) ].
  parts := parts withoutFirst.
  parts ifEmpty: [ ^ TimeOfDay hours: hours minutes: minutes ].
  parts := parts first substrings: '.'.
  secondsPart := parts first.
  self enforce: [ secondsPart size = 2 ] because: [ self errorMessageForTimeParsing: string ].
  seconds := Integer
               readFrom: secondsPart
               ifFail: [ self signal: ( self errorMessageForTimeParsing: string ) ].
  parts := parts withoutFirst.
  parts ifEmpty: [ ^ TimeOfDay hours: hours minutes: minutes seconds: seconds ].
  microsecondsPart := parts first.
  self enforce: [ microsecondsPart size <= 6 ] because: [ self errorMessageForTimeParsing: string ].
  microseconds := Integer
                    readFrom: microsecondsPart
                    ifFail: [ self signal: ( self errorMessageForTimeParsing: string ) ].
  ^ TimeOfDay
      hours: hours
      minutes: minutes
      seconds: seconds
      microseconds: microseconds
]

{ #category : 'private' }
ISO8601Parser >> parseTimePeriodsInDuration: string [

  | periods readStream numberStream isInsideTimeSection |
  periods := OrderedCollection new.

  readStream := string withoutFirst readStream.
  numberStream := String new writeStream.
  isInsideTimeSection := false.

  [ readStream atEnd ] whileFalse: [
      | currentChar |
      currentChar := readStream next.
      ( currentChar isDigit or: [ currentChar = $. ] )
        then: [ "Accumulate digits and decimal points" numberStream nextPut: currentChar ]
        otherwise: [
            currentChar = $T
              then: [ "Switch to time section" isInsideTimeSection := true ]
              otherwise: [
                  | number unitOrNil |
                  number := self numberIn: numberStream parsing: string.
                  unitOrNil := self
                                 unitFromDesignator: currentChar
                                 insideTimeSection: isInsideTimeSection.
                  unitOrNil
                    ifNil: [ self signal: ( self errorMessageForDurationParsing: string ) ]
                    ifNotNil: [ :unit | periods add: number * unit ]
                ]
          ]
    ].
  ^ periods
]

{ #category : 'private' }
ISO8601Parser >> parseWeekDuration: string [

  | number |
  self enforce: [ string isAllDigits ] because: [ self errorMessageForDurationParsing: string ].
  number := Integer
              readFrom: string
              ifFail: [ self signal: ( self errorMessageForDurationParsing: string ) ].
  ^ number * ( InternationalSystemOfUnits units >> #week )
]

{ #category : 'parsing' }
ISO8601Parser >> parseYear: string [

  | sign number parsedString |
  self enforce: [ string size >= 4 ] because: [ self errorMessageForYearParsing: string ].
  parsedString := string.
  sign := 1.
  string first = $+ then: [ parsedString := string withoutFirst ].
  string first = $- then: [
      parsedString := parsedString withoutFirst.
      sign := -1
    ].
  self enforce: [ parsedString isAllDigits ] because: [ self errorMessageForYearParsing: string ].
  number := Integer
              readFrom: parsedString
              ifFail: [ self signal: ( self errorMessageForYearParsing: string ) ].
  ^ ( number * sign ) asGregorianYear
]

{ #category : 'initialization' }
ISO8601Parser >> readNumbersUsing: reader [

  numberReader := reader
]

{ #category : 'private' }
ISO8601Parser >> refuse: aFact because: aStringOrBlockExplanation [

  AssertionChecker refuse: aFact because: aStringOrBlockExplanation raising: InstanceCreationFailed
]

{ #category : 'private' }
ISO8601Parser >> signal: messageText [

  InstanceCreationFailed signal: messageText
]

{ #category : 'private' }
ISO8601Parser >> unitFromDesignator: designator insideTimeSection: isInsideTimeSection [

  isInsideTimeSection then: [
      designator = $H then: [ ^ InternationalSystemOfUnits units >> #hour ].
      designator = $S then: [ ^ InternationalSystemOfUnits units >> #second ].
      designator = $M then: [ ^ InternationalSystemOfUnits units >> #minute ]
    ].
  designator = $Y then: [ ^ TimeUnits units >> #year ].
  designator = $D then: [ ^ InternationalSystemOfUnits units >> #day ].
  designator = $M then: [ ^ TimeUnits units >> #month ].
  ^ nil
]
