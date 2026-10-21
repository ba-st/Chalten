"
A ChronologyPatternTest is a test class for testing the behavior of ChronologyPattern
"
Class {
	#name : 'ChronologyPatternTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Core-Tests',
	#package : 'Chalten-Core-Tests'
}

{ #category : 'private - asserting' }
ChronologyPatternTest >> assertElementsOf: aChronologyPattern are: anArray [
  "Field names are symbols and literals are strings, which may be equal in some dialects, so the kinds are compared too"

  | elements |
  elements := aChronologyPattern elements.
  self assert: elements equals: anArray.
  elements
    with: anArray
    do: [ :element :expected | self assert: element isSymbol equals: expected isSymbol ]
]

{ #category : 'private - asserting' }
ChronologyPatternTest >> assertPattern: aString hasElements: anArray [

  self assertElementsOf: ( ChronologyPattern fromString: aString ) are: anArray
]

{ #category : 'private - asserting' }
ChronologyPatternTest >> assertUnsupported: aString raises: anExplanation [

  self
    should: [ ChronologyPattern fromString: aString ]
    raise: InstanceCreationFailed
    withMessageText: anExplanation
]

{ #category : 'tests' }
ChronologyPatternTest >> testDay [

  self
    assertPattern: 'd' hasElements: #( #day );
    assertPattern: 'dd' hasElements: #( #twoDigitDay )
]

{ #category : 'tests' }
ChronologyPatternTest >> testDayOfWeek [

  #( 'E' 'EE' 'EEE' 'ccc' ) do: [ :pattern |
      self assertPattern: pattern hasElements: #( #dayOfWeekShortName ) ].
  #( 'EEEE' 'cccc' ) do: [ :pattern | self assertPattern: pattern hasElements: #( #dayOfWeekName ) ]
]

{ #category : 'tests' }
ChronologyPatternTest >> testDayPeriod [

  self assertPattern: 'a' hasElements: #( #dayPeriod )
]

{ #category : 'tests' }
ChronologyPatternTest >> testEmptyPattern [

  self assertPattern: '' hasElements: #(  )
]

{ #category : 'tests' }
ChronologyPatternTest >> testHour [

  self
    assertPattern: 'h' hasElements: #( #hourOf12HourClock );
    assertPattern: 'hh' hasElements: #( #twoDigitHourOf12HourClock );
    assertPattern: 'H' hasElements: #( #hourOf24HourClock );
    assertPattern: 'HH' hasElements: #( #twoDigitHourOf24HourClock )
]

{ #category : 'tests' }
ChronologyPatternTest >> testLiterals [

  self
    assertPattern: 'H:mm:ss (zzzz)'
    hasElements:
      #( #hourOf24HourClock ':' #twoDigitMinute ':' #twoDigitSecond ' (' #longOffset ')' );
    assertPattern: 'dd-MMM-y' hasElements: #( #twoDigitDay '-' #monthShortName '-' #year );
    assertPattern: 'h:mm' , ( String with: ( Character codePoint: 16r202F ) ) , 'a'
    hasElements:
      { #hourOf12HourClock . ':' . #twoDigitMinute . String with: ( Character codePoint: 16r202F ) .
        #dayPeriod }
]

{ #category : 'tests' }
ChronologyPatternTest >> testMinute [

  self
    assertPattern: 'm' hasElements: #( #minute );
    assertPattern: 'mm' hasElements: #( #twoDigitMinute )
]

{ #category : 'tests' }
ChronologyPatternTest >> testMissingClosingQuote [

  self
    assertUnsupported: 'd ''de MMMM' raises: 'Missing closing quote in date and time pattern';
    assertUnsupported: '''' raises: 'Missing closing quote in date and time pattern'
]

{ #category : 'tests' }
ChronologyPatternTest >> testMonth [

  self
    assertPattern: 'M' hasElements: #( #month );
    assertPattern: 'L' hasElements: #( #month );
    assertPattern: 'MM' hasElements: #( #twoDigitMonth );
    assertPattern: 'LL' hasElements: #( #twoDigitMonth );
    assertPattern: 'MMM' hasElements: #( #monthShortName );
    assertPattern: 'MMMM' hasElements: #( #monthName )
]

{ #category : 'tests' }
ChronologyPatternTest >> testNonASCIILettersAreLiteral [

  | year month day |
  year := String with: ( Character codePoint: 16r5E74 ).
  month := String with: ( Character codePoint: 16r6708 ).
  day := String with: ( Character codePoint: 16r65E5 ).

  self
    assertPattern: 'y' , year , 'M' , month , 'd' , day
    hasElements: { #year . year . #month . month . #day . day }
]

{ #category : 'tests' }
ChronologyPatternTest >> testOffset [

  #( 'z' 'zz' 'zzz' 'O' ) do: [ :pattern |
      self assertPattern: pattern hasElements: #( #shortOffset ) ].
  #( 'zzzz' 'OOOO' ) do: [ :pattern | self assertPattern: pattern hasElements: #( #longOffset ) ]
]

{ #category : 'tests' }
ChronologyPatternTest >> testPlaceholders [

  self
    assertPattern: '{1}, {0}' hasElements: #( #date ', ' #time );
    assertPattern: '{1} ''at'' {0}' hasElements: #( #date ' at ' #time )
]

{ #category : 'tests' }
ChronologyPatternTest >> testQuotedLiterals [

  self
    assertPattern: 'd ''de'' MMMM ''de'' y' hasElements: #( #day ' de ' #monthName ' de ' #year );
    assertPattern: '''week w''' hasElements: #( 'week w' );
    assertPattern: 'h ''o''''clock'' a'
    hasElements: #( #hourOf12HourClock ' o''clock ' #dayPeriod );
    assertPattern: 'h''''a' hasElements: #( #hourOf12HourClock '''' #dayPeriod );
    assertPattern: '''''' hasElements: #( '''' )
]

{ #category : 'tests' }
ChronologyPatternTest >> testReplacingDateAndTime [

  | date time |
  date := ChronologyPattern fromString: 'd/M/y'.
  time := ChronologyPattern fromString: 'H:mm'.

  self
    assertElementsOf:
      ( ( ChronologyPattern fromString: '{1}, {0}' ) replacingDateWith: date andTimeWith: time )
    are: #( #day '/' #month '/' #year ', ' #hourOf24HourClock ':' #twoDigitMinute );
    assertElementsOf: ( ( ChronologyPattern fromString: '''date'' {1} ''time'' {0}' )
          replacingDateWith: date
          andTimeWith: time )
    are: #( 'date ' #day '/' #month '/' #year ' time ' #hourOf24HourClock ':' #twoDigitMinute );
    assertElementsOf: ( date replacingDateWith: time andTimeWith: time )
    are: #( #day '/' #month '/' #year )
]

{ #category : 'tests' }
ChronologyPatternTest >> testSecond [

  self
    assertPattern: 's' hasElements: #( #second );
    assertPattern: 'ss' hasElements: #( #twoDigitSecond )
]

{ #category : 'tests' }
ChronologyPatternTest >> testUnsupportedFields [

  #( 'G' 'yyyy' 'MMMMM' 'c' 'B' 'zzzzz' 'v' 'k' 'S' ) do: [ :field |
      self
        assertUnsupported: 'd ' , field
        raises: 'The field ' , field , ' is not supported in date and time patterns'
    ]
]

{ #category : 'tests' }
ChronologyPatternTest >> testUnsupportedPlaceholders [

  self
    assertUnsupported: '{2}'
    raises: 'The placeholder {2} is not supported in date and time patterns';
    assertUnsupported: '{1' raises: 'Missing closing brace in date and time pattern'
]

{ #category : 'tests' }
ChronologyPatternTest >> testYear [

  self
    assertPattern: 'y' hasElements: #( #year );
    assertPattern: 'yy' hasElements: #( #twoDigitYear )
]
