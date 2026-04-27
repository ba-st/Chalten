"
An absolute Hebrew date and time without external context. It tracks the Hebrew year, month, and day,
as well as the time of day relative to the traditional sunset start of the day. This naive representation provides
a stable foundation for converting Hebrew timestamps into the Gregorian system.
"
Class {
	#name : 'HebrewDateTime',
	#superclass : 'CalendarDateTime',
	#instVars : [
		'date',
		'timeOfDay'
	],
	#category : 'Chalten-Hebrew-Calendar',
	#package : 'Chalten-Hebrew-Calendar'
}

{ #category : 'instance creation' }
HebrewDateTime class >> on: aHebrewDate at: aTimeOfDay [

  ^ self new initializeOn: aHebrewDate at: aTimeOfDay
]

{ #category : 'converting' }
HebrewDateTime >> asGregorianDateTime [
  "Tishrei 1, 1 AM at 0:00 is equivalent to September 7, 3761 BCE at 18:00 (Sunset).
	In our implementation 3761 BCE is -3760, because we have year 0"

  ^ self class
      convert: self
      toGregorianUsing: 1 asHebrewYear tishrei first
      asReferencePointTo: -3760 asGregorianYear september seventh
]

{ #category : 'accessing' }
HebrewDateTime >> date [

  ^ date
]

{ #category : 'initialization' }
HebrewDateTime >> initializeOn: aHebrewDate at: aTimeOfDay [

  date := aHebrewDate.
  timeOfDay := aTimeOfDay
]

{ #category : 'accessing' }
HebrewDateTime >> timeOfDay [

  ^ timeOfDay
]
