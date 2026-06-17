"
I'm a parser of the ISO 8601 extended format
"
Class {
	#name : 'ISO8601Parser',
	#superclass : 'Object',
	#category : 'Chalten-Core',
	#package : 'Chalten-Core'
}

{ #category : 'private' }
ISO8601Parser >> errorMessageForDateParsing: string [

  ^ 'The provided date ''<1s>'' is invalid. Dates must be 4 digits (e.g., 2026) or expanded ISO 8601 (e.g., +010000) for the year, exactly 2 digits for the month and exactly 2 digits for the day.'
      expandMacrosWith: string
]

{ #category : 'private' }
ISO8601Parser >> errorMessageForDayNumberParsing: string [

  ^ 'The provided day number ''<1s>'' is invalid. Day numbers must be 2 digits between 01 and maximum of the month (e.g., 05).'
      expandMacrosWith: string
]

{ #category : 'private' }
ISO8601Parser >> errorMessageForMonthOfYearParsing: string [

  ^ 'The provided month of year ''<1s>'' is invalid. Months of year must be 4 digits (e.g., 2026) or expanded ISO 8601 (e.g., +010000) for the year and exactly 2 digits for the month.'
      expandMacrosWith: string
]

{ #category : 'private' }
ISO8601Parser >> errorMessageForMonthParsing: string [

  ^ 'The provided month ''<1s>'' is invalid. Months must be 2 digits between 01 and 12 (e.g., 05).'
      expandMacrosWith: string
]

{ #category : 'private' }
ISO8601Parser >> errorMessageForYearParsing: string [

  ^ 'The provided year ''<1s>'' is invalid. Years must be 4 digits (e.g., 2026) or expanded ISO 8601 (e.g., +010000).'
      expandMacrosWith: string
]

{ #category : 'parsing' }
ISO8601Parser >> parseDate: string ifFail: failBlock [

  | sign parts yearString year month dayNumber |
  string size < 10 then: [ ^ failBlock cull: ( self errorMessageForDateParsing: string ) ].
  sign := ''.
  parts := string first = $-
             then: [
                 sign := '-'.
                 string substrings: sign
               ]
             otherwise: [ string substrings: '-' ].
  parts size ~= 3 then: [ ^ failBlock cull: ( self errorMessageForDateParsing: string ) ].
  yearString := sign , parts first.
  year := self
            parseYear: yearString
            ifFail: [ ^ failBlock cull: ( self errorMessageForYearParsing: yearString ) ].
  month := self
             parseMonth: parts second
             ifFail: [ ^ failBlock cull: ( self errorMessageForMonthParsing: parts second ) ].
  dayNumber := self parseDayNumber: parts third ifFail: [ :error | ^ failBlock cull: error ].
  ^ [ ( year monthAt: month positionInYear ) dateAt: dayNumber ]
      on: InstanceCreationFailed
      do: [ :error | failBlock cull: error messageText ]
]

{ #category : 'parsing' }
ISO8601Parser >> parseDayNumber: string ifFail: failBlock [

  string size = 2 ifFalse: [ ^ failBlock cull: ( self errorMessageForDayNumberParsing: string ) ].
  string isAllDigits ifFalse: [ ^ failBlock cull: ( self errorMessageForDayNumberParsing: string ) ].
  ^ Integer
      readFrom: string
      ifFail: [ failBlock cull: ( self errorMessageForDayNumberParsing: string ) ]
]

{ #category : 'parsing' }
ISO8601Parser >> parseMonth: string ifFail: failBlock [

  | index |
  string size = 2 ifFalse: [ ^ failBlock cull: ( self errorMessageForMonthParsing: string ) ].
  string isAllDigits ifFalse: [ ^ failBlock cull: ( self errorMessageForMonthParsing: string ) ].
  index := Integer
             readFrom: string
             ifFail: [ ^ failBlock cull: ( self errorMessageForMonthParsing: string ) ].
  ( index between: 1 and: 12 ) ifFalse: [
      ^ failBlock cull: ( self errorMessageForMonthParsing: string ) ].
  ^ GregorianMonth monthAt: index
]

{ #category : 'parsing' }
ISO8601Parser >> parseMonthOfYear: string ifFail: failBlock [

  | sign parts yearString year month |
  string size < 7 then: [ ^ failBlock cull: ( self errorMessageForMonthOfYearParsing: string ) ].
  sign := ''.
  parts := string first = $-
             then: [
                 sign := '-'.
                 string substrings: sign
               ]
             otherwise: [ string substrings: '-' ].
  parts size ~= 2 then: [ ^ failBlock cull: ( self errorMessageForMonthOfYearParsing: string ) ].
  yearString := sign , parts first.
  year := self
            parseYear: yearString
            ifFail: [ ^ failBlock cull: ( self errorMessageForYearParsing: yearString ) ].
  month := self
             parseMonth: parts second
             ifFail: [ ^ failBlock cull: ( self errorMessageForMonthParsing: parts second ) ].
  ^ year monthAt: month positionInYear
]

{ #category : 'parsing' }
ISO8601Parser >> parseYear: string ifFail: failBlock [

  | sign number parsedString |
  string size < 4 then: [ ^ failBlock cull: ( self errorMessageForYearParsing: string ) ].
  parsedString := string.
  sign := 1.
  string first = $+ then: [ parsedString := string withoutFirst ].
  string first = $- then: [
      parsedString := parsedString withoutFirst.
      sign := -1
    ].
  parsedString isAllDigits ifFalse: [ ^ failBlock cull: ( self errorMessageForYearParsing: string ) ].
  number := Integer
              readFrom: parsedString
              ifFail: [ ^ failBlock cull: ( self errorMessageForYearParsing: string ) ].
  ^ ( number * sign ) asGregorianYear
]
