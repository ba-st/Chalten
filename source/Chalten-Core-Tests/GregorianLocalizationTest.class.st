"
I test the localization of Gregorian dates and their parts, times of day, dates and times and instants, in every style, with the conventions shipped with Chalten.
"
Class {
	#name : 'GregorianLocalizationTest',
	#superclass : 'ChaltenTest',
	#category : 'Chalten-Core-Tests',
	#package : 'Chalten-Core-Tests'
}

{ #category : 'private - asserting' }
GregorianLocalizationTest >> assertLocalizationsOf: aChronologyObject in: aLanguageTag are: expected [
  "expected holds the short, medium, long and full localizations, in that order,
	with Buoy's escape sequences for invisible characters, like \u{202F} for the narrow no-break space before AM and PM"

  | localizations |
  localizations := expected collect: [ :localization | localization unescaped ].
  CurrentLocale use: aLanguageTag during: [
      #( #short #medium #long #full ) with: localizations do: [ :style :localization |
          self
            assert: ( aChronologyObject localizedWith: [ :options | options perform: style ] )
            equals: localization
        ].
      self assert: aChronologyObject localized equals: localizations second
    ]
]

{ #category : 'private - asserting' }
GregorianLocalizationTest >> assertOffset: anOffset isShownAs: shortOffset and: longOffset [

  | dateTime |
  dateTime := ( self marchFifthAt: self timeOfDay ) in: ( FixedOffsetRuleset for: anOffset ).

  CurrentLocale use: 'en-GB' during: [
      self
        assert: ( dateTime localizedWith: [ :options | options long ] )
        equals: '5 March 2026, 14:30:45 ' , shortOffset;
        assert: ( dateTime localizedWith: [ :options | options full ] )
        equals: 'Thursday, 5 March 2026, 14:30:45 ' , longOffset
    ]
]

{ #category : 'private' }
GregorianLocalizationTest >> conventionsWith: json [
  "The medium patterns and the marks are needed to create a formatter"

  | conventions |
  conventions := LocaleConventions new.
  conventions
    loadJSONChronologyConventionsFromString:
      '{"*": {"mediumDateFormat": "MMM d, y", "mediumTimeFormat": "h:mm:ss a", "mediumDateTimeFormat": "{1}, {0}", "mediumYearMonthFormat": "MMM y", "mediumMonthDayFormat": "MMM d", "amMark": "AM", "pmMark": "PM"}}';
    loadJSONChronologyConventionsFromString: json.
  ^ conventions
]

{ #category : 'private' }
GregorianLocalizationTest >> format: aChronologyObject in: aLanguageTag with: conventions [

  ^ ( LocalizedChronologyFormatter for: aLanguageTag in: conventions configuredBy: [ :options |  ] )
      format: aChronologyObject
]

{ #category : 'private' }
GregorianLocalizationTest >> marchFifthAt: aTimeOfDay [

  ^ march fifth , 2026 at: aTimeOfDay
]

{ #category : 'private' }
GregorianLocalizationTest >> offsetAwareDateTime [
  "March 5, 2026 at 14:30:45, three hours behind UTC"

  ^ ( self marchFifthAt: self timeOfDay ) in: ( FixedOffsetRuleset for: -3 * hour )
]

{ #category : 'tests - date times' }
GregorianLocalizationTest >> testDateTimes [

  | dateTime |
  dateTime := self marchFifthAt: self timeOfDay.

  self
    assertLocalizationsOf: dateTime
    in: 'en'
    are:
      #( '3/5/26, 2:30\u{202F}PM' 'Mar 5, 2026, 2:30:45\u{202F}PM' 'March 5, 2026, 2:30:45\u{202F}PM'
         'Thursday, March 5, 2026, 2:30:45\u{202F}PM' );
    assertLocalizationsOf: dateTime
    in: 'en-GB'
    are:
      #( '05/03/2026, 14:30' '5 Mar 2026, 14:30:45' '5 March 2026, 14:30:45'
         'Thursday, 5 March 2026, 14:30:45' );
    assertLocalizationsOf: dateTime
    in: 'es'
    are: #( '5/3/26, 14:30' '5 Mar 2026, 14:30:45' '5 de Marzo de 2026, 14:30:45'
         'Jueves, 5 de Marzo de 2026, 14:30:45' );
    assertLocalizationsOf: dateTime
    in: 'es-AR'
    are: #( '5/3/26, 2:30\u{202F}p.\u{202F}m.' '5 Mar 2026, 2:30:45\u{202F}p.\u{202F}m.'
         '5 de Marzo de 2026, 2:30:45\u{202F}p.\u{202F}m.'
         'Jueves, 5 de Marzo de 2026, 2:30:45\u{202F}p.\u{202F}m.' )
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

{ #category : 'tests - instants' }
GregorianLocalizationTest >> testInstants [

  | instant |
  instant := self offsetAwareDateTime asInstant.

  self
    assertLocalizationsOf: instant
    in: 'en'
    are:
      #( '3/5/26, 5:30\u{202F}PM' 'Mar 5, 2026, 5:30:45\u{202F}PM' 'March 5, 2026, 5:30:45\u{202F}PM UTC'
         'Thursday, March 5, 2026, 5:30:45\u{202F}PM UTC' );
    assertLocalizationsOf: instant
    in: 'en-GB'
    are: #( '05/03/2026, 17:30' '5 Mar 2026, 17:30:45' '5 March 2026, 17:30:45 UTC'
         'Thursday, 5 March 2026, 17:30:45 UTC' );
    assertLocalizationsOf: instant
    in: 'es'
    are: #( '5/3/26, 17:30' '5 Mar 2026, 17:30:45' '5 de Marzo de 2026, 17:30:45 UTC'
         'Jueves, 5 de Marzo de 2026, 17:30:45 (UTC)' );
    assertLocalizationsOf: instant
    in: 'es-AR'
    are: #( '5/3/26, 5:30\u{202F}p.\u{202F}m.' '5 Mar 2026, 5:30:45\u{202F}p.\u{202F}m.'
         '5 de Marzo de 2026, 5:30:45\u{202F}p.\u{202F}m. UTC'
         'Jueves, 5 de Marzo de 2026, 5:30:45\u{202F}p.\u{202F}m. UTC' )
]

{ #category : 'tests - instants' }
GregorianLocalizationTest >> testInstantsAreShownOnTheirUTCDate [

  | instant |
  instant := ( ( self marchFifthAt: ( TimeOfDay hours: 22 ) ) in:
                 ( FixedOffsetRuleset for: -3 * hour ) ) asInstant.

  self
    assertLocalizationsOf: instant
    in: 'en'
    are:
      #( '3/6/26, 1:00\u{202F}AM' 'Mar 6, 2026, 1:00:00\u{202F}AM' 'March 6, 2026, 1:00:00\u{202F}AM UTC'
         'Friday, March 6, 2026, 1:00:00\u{202F}AM UTC' )
]

{ #category : 'tests - times of day' }
GregorianLocalizationTest >> testMidnightAndNoon [

  self
    assertLocalizationsOf: TimeOfDay startOfDay
    in: 'en'
    are: #( '12:00\u{202F}AM' '12:00:00\u{202F}AM' '12:00:00\u{202F}AM' '12:00:00\u{202F}AM' );
    assertLocalizationsOf: ( TimeOfDay hours: 12 )
    in: 'en'
    are: #( '12:00\u{202F}PM' '12:00:00\u{202F}PM' '12:00:00\u{202F}PM' '12:00:00\u{202F}PM' );
    assertLocalizationsOf: ( TimeOfDay hours: 0 minutes: 5 )
    in: 'en-GB'
    are: #( '00:05' '00:05:00' '00:05:00' '00:05:00' );
    assertLocalizationsOf: ( TimeOfDay hours: 0 minutes: 5 )
    in: 'es'
    are: #( '0:05' '0:05:00' '0:05:00' '0:05:00' );
    assertLocalizationsOf: ( TimeOfDay hours: 12 )
    in: 'es-AR'
    are:
      #( '12:00\u{202F}p.\u{202F}m.' '12:00:00\u{202F}p.\u{202F}m.' '12:00:00\u{202F}p.\u{202F}m.'
         '12:00:00\u{202F}p.\u{202F}m.' )
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

{ #category : 'tests - date times' }
GregorianLocalizationTest >> testOffsetAwareDateTimes [

  | dateTime |
  dateTime := self offsetAwareDateTime.

  self
    assertLocalizationsOf: dateTime
    in: 'en'
    are:
      #( '3/5/26, 2:30\u{202F}PM' 'Mar 5, 2026, 2:30:45\u{202F}PM' 'March 5, 2026, 2:30:45\u{202F}PM UTC-3'
         'Thursday, March 5, 2026, 2:30:45\u{202F}PM UTC-03:00' );
    assertLocalizationsOf: dateTime
    in: 'en-GB'
    are: #( '05/03/2026, 14:30' '5 Mar 2026, 14:30:45' '5 March 2026, 14:30:45 UTC-3'
         'Thursday, 5 March 2026, 14:30:45 UTC-03:00' );
    assertLocalizationsOf: dateTime
    in: 'es'
    are: #( '5/3/26, 14:30' '5 Mar 2026, 14:30:45' '5 de Marzo de 2026, 14:30:45 UTC-3'
         'Jueves, 5 de Marzo de 2026, 14:30:45 (UTC-03:00)' );
    assertLocalizationsOf: dateTime
    in: 'es-AR'
    are: #( '5/3/26, 2:30\u{202F}p.\u{202F}m.' '5 Mar 2026, 2:30:45\u{202F}p.\u{202F}m.'
         '5 de Marzo de 2026, 2:30:45\u{202F}p.\u{202F}m. UTC-3'
         'Jueves, 5 de Marzo de 2026, 2:30:45\u{202F}p.\u{202F}m. UTC-03:00' )
]

{ #category : 'tests - date times' }
GregorianLocalizationTest >> testOffsets [

  self
    assertOffset: 5 * hour + ( 30 * TimeOfDay minute ) isShownAs: 'UTC+5:30' and: 'UTC+05:30';
    assertOffset: 10 * hour isShownAs: 'UTC+10' and: 'UTC+10:00';
    assertOffset: -10 * hour isShownAs: 'UTC-10' and: 'UTC-10:00';
    assertOffset: 0 * hour isShownAs: 'UTC' and: 'UTC';
    assertOffset: -4 * hour - ( 16 * TimeOfDay minute ) - ( 48 * TimeOfDay second )
    isShownAs: 'UTC-4:16:48'
    and: 'UTC-04:16:48'
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

{ #category : 'tests' }
GregorianLocalizationTest >> testPlaceholdersOutsideCombiningPatterns [

  | conventions |
  conventions := self conventionsWith: '{"*": {"mediumDateFormat": "d/M/y {0}"}}'.

  self
    should: [ self format: march fifth , 2026 in: 'en' with: conventions ]
    raise: AssertionFailed
    withMessageText:
    'The time placeholder can only be used in a pattern combining a date and a time'
]

{ #category : 'tests - times of day' }
GregorianLocalizationTest >> testSecondsAreShownWithoutTheirFraction [

  self
    assertLocalizationsOf: ( TimeOfDay
          hours: 14
          minutes: 30
          seconds: 45
          microseconds: 999999 )
    in: 'es'
    are: #( '14:30' '14:30:45' '14:30:45' '14:30:45' )
]

{ #category : 'tests - times of day' }
GregorianLocalizationTest >> testTimesOfDay [

  self
    assertLocalizationsOf: self timeOfDay
    in: 'en'
    are: #( '2:30\u{202F}PM' '2:30:45\u{202F}PM' '2:30:45\u{202F}PM' '2:30:45\u{202F}PM' );
    assertLocalizationsOf: self timeOfDay
    in: 'en-GB'
    are: #( '14:30' '14:30:45' '14:30:45' '14:30:45' );
    assertLocalizationsOf: self timeOfDay
    in: 'es'
    are: #( '14:30' '14:30:45' '14:30:45' '14:30:45' );
    assertLocalizationsOf: self timeOfDay
    in: 'es-AR'
    are: #( '2:30\u{202F}p.\u{202F}m.' '2:30:45\u{202F}p.\u{202F}m.' '2:30:45\u{202F}p.\u{202F}m.'
         '2:30:45\u{202F}p.\u{202F}m.' )
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

{ #category : 'private' }
GregorianLocalizationTest >> timeOfDay [

  ^ TimeOfDay hours: 14 minutes: 30 seconds: 45
]
