"
I test the localization of Gregorian dates and their parts, in every style, with the conventions shipped with Chalten.
"
Class {
	#name : 'GregorianLocalizationTest',
	#superclass : 'ChaltenTest',
	#category : 'Chalten-Core-Tests',
	#package : 'Chalten-Core-Tests'
}

{ #category : 'private - asserting' }
GregorianLocalizationTest >> assertLocalizationsOf: aChronologyObject in: aLanguageTag are: expected [
  "expected holds the short, medium, long and full localizations, in that order"

  CurrentLocale use: aLanguageTag during: [
      #( #short #medium #long #full ) with: expected do: [ :style :localization |
          self
            assert: ( aChronologyObject localizedWith: [ :options | options perform: style ] )
            equals: localization
        ].
      self assert: aChronologyObject localized equals: expected second
    ]
]

{ #category : 'private' }
GregorianLocalizationTest >> conventionsWith: json [

  | conventions |
  conventions := LocaleConventions new.
  conventions loadJSONChronologyConventionsFromString: json.
  ^ conventions
]

{ #category : 'private' }
GregorianLocalizationTest >> format: aChronologyObject in: aLanguageTag with: conventions [

  ^ ( LocalizedChronologyFormatter for: aLanguageTag in: conventions configuredBy: [ :options |  ] )
      format: aChronologyObject
]

{ #category : 'tests - dates' }
GregorianLocalizationTest >> testDates [

  | date |
  date := march fifth , 2026.

  self
    assertLocalizationsOf: date
    in: 'en'
    are: #( '3/5/26' 'Mar 5, 2026' 'March 5, 2026' 'Thursday, March 5, 2026' );
    assertLocalizationsOf: date
    in: 'en-GB'
    are: #( '05/03/2026' '5 Mar 2026' '5 March 2026' 'Thursday, 5 March 2026' );
    assertLocalizationsOf: date
    in: 'es'
    are: #( '5/3/26' '5 Mar 2026' '5 de Marzo de 2026' 'Jueves, 5 de Marzo de 2026' );
    assertLocalizationsOf: date
    in: 'es-AR'
    are: #( '5/3/26' '5 Mar 2026' '5 de Marzo de 2026' 'Jueves, 5 de Marzo de 2026' )
]

{ #category : 'tests - dates' }
GregorianLocalizationTest >> testDatesPadTheirNumbers [

  self
    assertLocalizationsOf: january second , 2005
    in: 'en'
    are: #( '1/2/05' 'Jan 2, 2005' 'January 2, 2005' 'Sunday, January 2, 2005' );
    assertLocalizationsOf: january second , 2005
    in: 'en-GB'
    are: #( '02/01/2005' '2 Jan 2005' '2 January 2005' 'Sunday, 2 January 2005' );
    assertLocalizationsOf: december thirtyFirst , 1900
    in: 'es'
    are: #( '31/12/00' '31 Dic 1900' '31 de Diciembre de 1900' 'Lunes, 31 de Diciembre de 1900' )
]

{ #category : 'tests - days of month' }
GregorianLocalizationTest >> testDaysOfMonth [

  | dayOfMonth |
  dayOfMonth := march fifth.

  self
    assertLocalizationsOf: dayOfMonth in: 'en' are: #( '3/5' 'Mar 5' 'March 5' 'March 5' );
    assertLocalizationsOf: dayOfMonth in: 'en-GB' are: #( '05/03' '5 Mar' '5 March' '5 March' );
    assertLocalizationsOf: dayOfMonth in: 'es' are: #( '5/3' '5 Mar' '5 de Marzo' '5 de Marzo' );
    assertLocalizationsOf: dayOfMonth in: 'es-AR' are: #( '5/3' '5 Mar' '5 de Marzo' '5 de Marzo' )
]

{ #category : 'tests - days of week' }
GregorianLocalizationTest >> testDaysOfWeek [

  #( 'en' 'en-GB' ) do: [ :languageTag |
      self
        assertLocalizationsOf: DayOfWeek thursday
        in: languageTag
        are: #( 'Th' 'Th' 'Thursday' 'Thursday' )
    ].
  #( 'es' 'es-AR' ) do: [ :languageTag |
      self
        assertLocalizationsOf: DayOfWeek thursday
        in: languageTag
        are: #( 'Ju' 'Ju' 'Jueves' 'Jueves' ) ]
]

{ #category : 'tests' }
GregorianLocalizationTest >> testFieldsTheFormatterDoesNotKnowYet [

  | conventions |
  conventions := self conventionsWith: '{"*": {"mediumDateFormat": "d/M/y h:mm"}}'.

  self
    should: [ self format: march fifth , 2026 in: 'en' with: conventions ]
    raise: AssertionFailed
    withMessageText: 'The field hourOf12HourClock can''t be formatted yet'
]

{ #category : 'tests' }
GregorianLocalizationTest >> testFormattersUseTheirOwnLanguage [

  CurrentLocale use: 'en' during: [
      self
        assert:
          ( ( LocalizedChronologyFormatter for: 'es-AR' configuredBy: [ :options | options full ] )
              format: march fifth , 2026 )
        equals: 'Jueves, 5 de Marzo de 2026';
        assert: ( march fifth , 2026 ) localized equals: 'Mar 5, 2026'
    ]
]

{ #category : 'tests - months' }
GregorianLocalizationTest >> testMonths [

  #( 'en' 'en-GB' ) do: [ :languageTag |
      self assertLocalizationsOf: march in: languageTag are: #( 'Mar' 'Mar' 'March' 'March' ) ].
  #( 'es' 'es-AR' ) do: [ :languageTag |
      self assertLocalizationsOf: march in: languageTag are: #( 'Mar' 'Mar' 'Marzo' 'Marzo' ) ].
  self assertLocalizationsOf: january in: 'es' are: #( 'Ene' 'Ene' 'Enero' 'Enero' )
]

{ #category : 'tests - months of year' }
GregorianLocalizationTest >> testMonthsOfYear [

  | monthOfYear |
  monthOfYear := march , 2026.

  self
    assertLocalizationsOf: monthOfYear
    in: 'en'
    are: #( '3/2026' 'Mar 2026' 'March 2026' 'March 2026' );
    assertLocalizationsOf: monthOfYear
    in: 'en-GB'
    are: #( '03/2026' 'Mar 2026' 'March 2026' 'March 2026' );
    assertLocalizationsOf: monthOfYear
    in: 'es'
    are: #( '3/2026' 'Mar 2026' 'Marzo de 2026' 'Marzo de 2026' );
    assertLocalizationsOf: monthOfYear
    in: 'es-AR'
    are: #( '3-2026' 'Mar 2026' 'Marzo de 2026' 'Marzo de 2026' )
]

{ #category : 'tests' }
GregorianLocalizationTest >> testPatternsNeedingPartsTheObjectDoesNotHave [

  | conventions |
  conventions := self conventionsWith: '{"*": {"mediumMonthDayFormat": "d MMM y"}}'.

  self
    should: [ self format: march fifth in: 'en' with: conventions ]
    raise: AssertionFailed
    withMessageText: 'The pattern needs a year the formatted object doesn''t have'
]

{ #category : 'tests - years' }
GregorianLocalizationTest >> testYears [

  #( 'en' 'en-GB' 'es' 'es-AR' ) do: [ :languageTag |
      self
        assertLocalizationsOf: 2026 asGregorianYear
        in: languageTag
        are: #( '2026' '2026' '2026' '2026' );
        assertLocalizationsOf: 12026 asGregorianYear
        in: languageTag
        are: #( '12026' '12026' '12026' '12026' )
    ]
]
