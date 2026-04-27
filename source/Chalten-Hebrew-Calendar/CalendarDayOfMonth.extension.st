Extension { #name : 'CalendarDayOfMonth' }

{ #category : '*Chalten-Hebrew-Calendar' }
CalendarDayOfMonth class >> hebrewMonth: hebrewMonth dayNumber: dayNumber [

  | daysForMonth positionIndex |
  positionIndex := ( [ hebrewMonth positionInCommonYear ]
                       on: InstanceCreationFailed
                       do: [ :error | error return: 0 ] )
                   + ( [ 100 * hebrewMonth positionInLeapYear ]
                         on: InstanceCreationFailed
                         do: [ :error | error return: 0 ] ).
  daysForMonth := ( self instanceRegistryFor: #Hebrew )
                    at: positionIndex
                    ifAbsentPut: [ IdentityDictionary new ].
  ^ daysForMonth
      at: dayNumber
      ifAbsentPut: [ self new initalizeMonth: hebrewMonth dayNumber: dayNumber ]
]
