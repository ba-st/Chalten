"
An absolute Islamic date and time without external context. It tracks the Islamic year, month, and day,
as well as the time of day relative to the traditional sunset start of the day. This naive representation provides
a stable foundation for converting Islamic timestamps into the Gregorian system.
"
Class {
	#name : 'IslamicDateTime',
	#superclass : 'CalendarDateTime',
	#instVars : [
		'date',
		'timeOfDay'
	],
	#category : 'Chalten-Islamic-Calendar',
	#package : 'Chalten-Islamic-Calendar'
}

{ #category : 'instance creation' }
IslamicDateTime class >> on: anIslamicDate at: aTimeOfDay [

  ^ self new initializeOn: anIslamicDate at: aTimeOfDay
]

{ #category : 'converting' }
IslamicDateTime >> asGregorianDateTime [

  "Muharram 1, 1 AH at 0:00 is equivalent to July 19, 622 at 18:00 (Sunset)"
  ^ self class
      convert: self
      toGregorianUsing: 1 asIslamicYear muharram first
      asReferencePointTo: 622 asGregorianYear july nineteenth
]

{ #category : 'accessing' }
IslamicDateTime >> date [

  ^ date
]

{ #category : 'initialization' }
IslamicDateTime >> initializeOn: anIslamicDate at: aTimeOfDay [

  date := anIslamicDate.
  timeOfDay := aTimeOfDay
]

{ #category : 'accessing' }
IslamicDateTime >> timeOfDay [

  ^ timeOfDay
]
