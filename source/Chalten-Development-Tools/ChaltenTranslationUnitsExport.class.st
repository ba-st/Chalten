Class {
	#name : 'ChaltenTranslationUnitsExport',
	#superclass : 'Object',
	#category : 'Chalten-Development-Tools',
	#package : 'Chalten-Development-Tools'
}

{ #category : 'examples' }
ChaltenTranslationUnitsExport class >> monthStringsToTranslateByCategory [

  | stringsToTranslateByCategory |
  stringsToTranslateByCategory := OrderedDictionary new.
  stringsToTranslateByCategory
    at: 'gregorian'
    put: ( GregorianMonth all inject: SortedCollection new into: [ :strings :month |
            strings
              add: month name;
              add: month shortName;
              yourself
          ] ).
  stringsToTranslateByCategory
    at: 'hebrew'
    put: ( HebrewMonth allOnLeapYear , HebrewMonth allOnCommonYear
          inject: SortedCollection new
          into: [ :strings :month |
              strings
                add: month name;
                add: month shortName;
                yourself
            ] ).
  stringsToTranslateByCategory
    at: 'islamic'
    put: ( IslamicMonth all inject: SortedCollection new into: [ :strings :month |
            strings
              add: month name;
              add: month shortName;
              yourself
          ] ).
  ^ stringsToTranslateByCategory
]

{ #category : 'examples' }
ChaltenTranslationUnitsExport class >> run [

  <example>
  <ignoreForCoverage>
  | scanner |
  scanner := NaturalLanguageTranslationScanner forProjectNamed: 'Chalten'.
  scanner export.

  ( scanner repositoryLocalesDirectory / 'week-days.json' )
    ensureCreateFile;
    writeStreamDo: [ :stream | scanner export: self weekDayStringsToTranslateByCategory on: stream ].

  ( scanner repositoryLocalesDirectory / 'months.json' )
    ensureCreateFile;
    writeStreamDo: [ :stream | scanner export: self monthStringsToTranslateByCategory on: stream ].

  ( scanner repositoryLocalesDirectory / 'units.json' )
    ensureCreateFile;
    writeStreamDo: [ :stream | scanner export: self timeUnitStringsToTranslateByCategory on: stream ]
]

{ #category : 'examples' }
ChaltenTranslationUnitsExport class >> timeUnitStringsToTranslateByCategory [

  | stringsToTranslateByCategory |
  stringsToTranslateByCategory := OrderedDictionary new.
  stringsToTranslateByCategory
    at: 'timeUnits'
    put: ( { TimeUnits units >> #month . TimeUnits units >> #year . TimeUnits units >> #lustrum .
          TimeUnits units >> #decade . TimeUnits units >> #jubilee . TimeUnits units >> #century .
          TimeUnits units >> #millenium . HebrewCalendar month . HebrewCalendar year .
          IslamicCalendar month . IslamicCalendar year }
          inject: SortedCollection new
          into: [ :strings :unit |
              strings
                add: unit singularName;
                add: unit pluralName;
                yourself
            ] ).
  ^ stringsToTranslateByCategory
]

{ #category : 'examples' }
ChaltenTranslationUnitsExport class >> weekDayStringsToTranslateByCategory [

  | stringsToTranslateByCategory |
  stringsToTranslateByCategory := OrderedDictionary new.
  stringsToTranslateByCategory
    at: 'gregorian'
    put: ( { DayOfWeek monday . DayOfWeek tuesday . DayOfWeek wednesday . DayOfWeek thursday .
          DayOfWeek friday . DayOfWeek saturday . DayOfWeek sunday }
          inject: SortedCollection new
          into: [ :strings :dayOfWeek |
              strings
                add: dayOfWeek name;
                add: dayOfWeek shortName;
                yourself
            ] ).
  stringsToTranslateByCategory
    at: 'hebrew'
    put: ( { HebrewDayOfWeek yomRishon . HebrewDayOfWeek yomSheni . HebrewDayOfWeek yomShlishi .
          HebrewDayOfWeek yomRevii . HebrewDayOfWeek yomHamishi . HebrewDayOfWeek yomShishi .
          HebrewDayOfWeek yomShabbat } inject: SortedCollection new into: [ :strings :dayOfWeek |
            strings
              add: dayOfWeek name;
              add: dayOfWeek shortName;
              yourself
          ] ).
  stringsToTranslateByCategory
    at: 'islamic'
    put:
      ( { IslamicDayOfWeek yawnAlAhad . IslamicDayOfWeek yawnAlIthnayn .
          IslamicDayOfWeek yawnAthThulatha . IslamicDayOfWeek yawnAlArbaa .
          IslamicDayOfWeek yawnAlKhamees . IslamicDayOfWeek yawnAlJumuha .
          IslamicDayOfWeek yawnAsSabt } inject: SortedCollection new into: [ :strings :dayOfWeek |
            strings
              add: dayOfWeek name;
              add: dayOfWeek shortName;
              yourself
          ] ).
  ^ stringsToTranslateByCategory
]
