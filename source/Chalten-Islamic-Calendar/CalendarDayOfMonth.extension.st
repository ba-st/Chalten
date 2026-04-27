Extension { #name : 'CalendarDayOfMonth' }

{ #category : '*Chalten-Islamic-Calendar' }
CalendarDayOfMonth class >> islamicMonth: islamicMonth dayNumber: dayNumber [

  | daysForMonth |
  AssertionChecker
    refuse: [ islamicMonth isGregorian ]
    because: 'Cannot use non-islamic months for days of islamic months' localized.
  daysForMonth := ( self instanceRegistryFor: #Islamic )
                    at: islamicMonth positionInYear
                    ifAbsentPut: [ IdentityDictionary new ].
  ^ daysForMonth
      at: dayNumber
      ifAbsentPut: [ self new initalizeMonth: islamicMonth dayNumber: dayNumber ]
]
