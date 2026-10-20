"
I test the date and time conventions shipped with Chalten, loaded into the current locale conventions when Chalten is loaded.
"
Class {
	#name : 'ShippedChronologyConventionsTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Core-Tests',
	#package : 'Chalten-Core-Tests'
}

{ #category : 'private' }
ShippedChronologyConventionsTest >> assertConventionsFor: aLanguageTag areDates: dateFormats times: timeFormats [

  #( #shortDateFormat #mediumDateFormat #longDateFormat #fullDateFormat )
    with: dateFormats
    do: [ :name :format |
      self assert: ( self propertyNamed: name for: aLanguageTag ) equals: format ].
  #( #shortTimeFormat #mediumTimeFormat #longTimeFormat #fullTimeFormat )
    with: timeFormats
    do: [ :name :format |
      self assert: ( self propertyNamed: name for: aLanguageTag ) equals: format ]
]

{ #category : 'private' }
ShippedChronologyConventionsTest >> assertConventionsFor: aLanguageTag areYearMonths: yearMonthFormats monthDays: monthDayFormats [

  #( #shortYearMonthFormat #mediumYearMonthFormat #longYearMonthFormat )
    with: yearMonthFormats
    do: [ :name :format |
      self assert: ( self propertyNamed: name for: aLanguageTag ) equals: format ].
  #( #shortMonthDayFormat #mediumMonthDayFormat #longMonthDayFormat )
    with: monthDayFormats
    do: [ :name :format |
      self assert: ( self propertyNamed: name for: aLanguageTag ) equals: format ]
]

{ #category : 'private' }
ShippedChronologyConventionsTest >> assertDateTimeFormatsFor: aLanguageTag are: aString [

  #( #shortDateTimeFormat #mediumDateTimeFormat #longDateTimeFormat #fullDateTimeFormat ) do: [
    :name | self assert: ( self propertyNamed: name for: aLanguageTag ) equals: aString ]
]

{ #category : 'private' }
ShippedChronologyConventionsTest >> assertMarksFor: aLanguageTag are: amMark and: pmMark [

  self
    assert: ( self propertyNamed: #amMark for: aLanguageTag ) equals: amMark;
    assert: ( self propertyNamed: #pmMark for: aLanguageTag ) equals: pmMark
]

{ #category : 'private' }
ShippedChronologyConventionsTest >> narrowNoBreakSpace [

  ^ String with: ( Character codePoint: 16r202F )
]

{ #category : 'private' }
ShippedChronologyConventionsTest >> propertyNamed: aName for: aLanguageTag [

  ^ LocaleConventions current chronologyPropertyNamed: aName for: aLanguageTag
]

{ #category : 'tests' }
ShippedChronologyConventionsTest >> testArgentinianSpanish [

  | space |
  space := self narrowNoBreakSpace.
  self
    assertConventionsFor: 'es-AR'
    areDates: #( 'd/M/yy' 'd MMM y' 'd ''de'' MMMM ''de'' y' 'EEEE, d ''de'' MMMM ''de'' y' )
    times: { 'h:mm' , space , 'a' . 'h:mm:ss' , space , 'a' . 'h:mm:ss' , space , 'a z' .
        'h:mm:ss' , space , 'a zzzz' };
    assertConventionsFor: 'es-AR'
    areYearMonths: #( 'M-y' 'MMM y' 'MMMM ''de'' y' )
    monthDays: #( 'd/M' 'd MMM' 'd ''de'' MMMM' );
    assertDateTimeFormatsFor: 'es-AR' are: '{1}, {0}';
    assertMarksFor: 'es-AR' are: 'a.' , space , 'm.' and: 'p.' , space , 'm.'
]

{ #category : 'tests' }
ShippedChronologyConventionsTest >> testBritishEnglish [

  self
    assertConventionsFor: 'en-GB'
    areDates: #( 'dd/MM/y' 'd MMM y' 'd MMMM y' 'EEEE, d MMMM y' )
    times: #( 'HH:mm' 'HH:mm:ss' 'HH:mm:ss z' 'HH:mm:ss zzzz' );
    assertConventionsFor: 'en-GB'
    areYearMonths: #( 'MM/y' 'MMM y' 'MMMM y' )
    monthDays: #( 'dd/MM' 'd MMM' 'd MMMM' );
    assertDateTimeFormatsFor: 'en-GB' are: '{1}, {0}';
    assertMarksFor: 'en-GB' are: 'am' and: 'pm'
]

{ #category : 'tests' }
ShippedChronologyConventionsTest >> testDefaults [

  self
    assertConventionsFor: 'ja'
    areDates: #( 'y-MM-dd' 'y MMM d' 'y MMMM d' 'y MMMM d, EEEE' )
    times: #( 'HH:mm' 'HH:mm:ss' 'HH:mm:ss z' 'HH:mm:ss zzzz' );
    assertConventionsFor: 'ja'
    areYearMonths: #( 'y-MM' 'y MMM' 'y MMMM' )
    monthDays: #( 'MM-dd' 'MMM d' 'MMMM d' );
    assertDateTimeFormatsFor: 'ja' are: '{1} {0}';
    assertMarksFor: 'ja' are: 'AM' and: 'PM'
]

{ #category : 'tests' }
ShippedChronologyConventionsTest >> testEnglish [

  | space |
  space := self narrowNoBreakSpace.
  #( 'en' 'en-US' ) do: [ :languageTag |
      self
        assertConventionsFor: languageTag
        areDates: #( 'M/d/yy' 'MMM d, y' 'MMMM d, y' 'EEEE, MMMM d, y' )
        times: { 'h:mm' , space , 'a' . 'h:mm:ss' , space , 'a' . 'h:mm:ss' , space , 'a z' .
            'h:mm:ss' , space , 'a zzzz' };
        assertConventionsFor: languageTag
        areYearMonths: #( 'M/y' 'MMM y' 'MMMM y' )
        monthDays: #( 'M/d' 'MMM d' 'MMMM d' );
        assertDateTimeFormatsFor: languageTag are: '{1}, {0}';
        assertMarksFor: languageTag are: 'AM' and: 'PM'
    ]
]

{ #category : 'tests' }
ShippedChronologyConventionsTest >> testSpanish [

  | space |
  space := self narrowNoBreakSpace.
  #( 'es' 'es-ES' ) do: [ :languageTag |
      self
        assertConventionsFor: languageTag
        areDates: #( 'd/M/yy' 'd MMM y' 'd ''de'' MMMM ''de'' y' 'EEEE, d ''de'' MMMM ''de'' y' )
        times: #( 'H:mm' 'H:mm:ss' 'H:mm:ss z' 'H:mm:ss (zzzz)' );
        assertConventionsFor: languageTag
        areYearMonths: #( 'M/y' 'MMM y' 'MMMM ''de'' y' )
        monthDays: #( 'd/M' 'd MMM' 'd ''de'' MMMM' );
        assertDateTimeFormatsFor: languageTag are: '{1}, {0}';
        assertMarksFor: languageTag are: 'a.' , space , 'm.' and: 'p.' , space , 'm.'
    ]
]
