"
Represents a 'Naive' Gregorian date and time, independent of any specific timezone or geographical offset.
"
Class {
	#name : 'GregorianDateTime',
	#superclass : 'CalendarDateTime',
	#instVars : [
		'date',
		'timeOfDay'
	],
	#category : 'Chalten-Core',
	#package : 'Chalten-Core'
}

{ #category : 'instance creation' }
GregorianDateTime class >> on: aGregorianDate at: aTimeOfDay [

  ^ self new initializeOn: aGregorianDate at: aTimeOfDay
]

{ #category : 'converting' }
GregorianDateTime >> asGregorianDateTime [

  ^ self
]

{ #category : 'accessing' }
GregorianDateTime >> date [

  ^ date
]

{ #category : 'converting' }
GregorianDateTime >> in: aTimeOffsetRuleset [

  ^ aTimeOffsetRuleset convertGregorianDateTime: self
]

{ #category : 'converting' }
GregorianDateTime >> inCoordinatedUniversalTime [

  ^ ( Instant fromJulianDayNumber: self julianDayNumber )
      asGregorianDateTimeInCoordinatedUniversalTime
]

{ #category : 'initialization' }
GregorianDateTime >> initializeOn: aGregorianDate at: aTimeOfDay [

  date := aGregorianDate.
  timeOfDay := aTimeOfDay
]

{ #category : 'private - accessing' }
GregorianDateTime >> julianDayNumber [

  | yearNumber monthNumber a b c e f |
  ( self month = GregorianMonth january or: [ self month = GregorianMonth february ] )
    then: [
        yearNumber := self yearNumber - 1.
        monthNumber := self monthNumber + 12
      ]
    otherwise: [
        yearNumber := self yearNumber.
        monthNumber := self monthNumber
      ].
  a := yearNumber // 100.
  b := a // 4.
  c := 2 - a + b.
  e := 36525 / 100 * ( yearNumber + 4716 ).
  f := 306001 / 10000 * ( monthNumber + 1 ).
  ^ c + self dayNumber + e truncated + f truncated - ( 15245 / 10 )
    + ( timeOfDay timeFromStartOfDay convertTo: self class day ) numericalValue
]

{ #category : 'printing' }
GregorianDateTime >> printAsISO8601String [

  ^ String streamContents: [ :stream |
        stream
          print: date yearNumber;
          nextPut: $-;
          nextPutAll: ( date monthNumber printStringLength: 2 padded: true );
          nextPut: $-;
          nextPutAll: ( date dayNumber printStringLength: 2 padded: true );
          nextPut: $T;
          print: timeOfDay
      ]
]

{ #category : 'accessing' }
GregorianDateTime >> timeOfDay [

  ^ timeOfDay
]
