"
Represents a 'Naive' calendar date and time, independent of any specific timezone or geographical offset.

This class captures a calendar-based instant (Year, Month, Day, Hour, Minute, Second) 
without anchoring it to a location on Earth. As such, it does not represent 
a single, unique moment in universal history unless paired with external 
context (such as a UTC offset or a location-specific 'Sunset' rule).

It is primarily used for:
* Naive arithmetic where relative time differences matter more than absolute global positioning.
* Situations where the timezone/offset is managed externally or provided by the broader system context.
* Inter-calendar algorithmic bridges that operate on a standardized, context-free timeline.

For precise, globally unique points in time that require explicit offset 
management, use `TimeOffsetAwareGregorianDateTime` or `Instant`.
"
Class {
	#name : 'CalendarDateTime',
	#superclass : 'CalendarMagnitude',
	#category : 'Chalten-Core',
	#package : 'Chalten-Core'
}

{ #category : 'private' }
CalendarDateTime class >> convert: aNonGregorianDateTime toGregorianUsing: fixedNonGregorianDate asReferencePointTo: fixedGregorianDate [
  "This method converts a non-gregorian date time to a gregorian one,
	given a pair of well known gregorian & non-gregorian equivalence.
	Takes into account time differences"

  | numberOfDaysSinceFixedDate midnightTime midnight |
  numberOfDaysSinceFixedDate := aNonGregorianDateTime date - fixedNonGregorianDate.
  midnight := aNonGregorianDateTime date atMidnight timeOfDay.
  midnightTime := midnight timeFromStartOfDay.

  ^ aNonGregorianDateTime timeOfDay < midnight
      then: [ "If the hour is before midnight just move the hour to the gregorian equivalent"
          ( fixedGregorianDate next: numberOfDaysSinceFixedDate ) at:
            aNonGregorianDateTime timeOfDay + ( 24 * TimeOfDay hour - midnightTime )
        ]
      otherwise: [ "If not, the day has changed, so increase the day count and rollback the time"
          ( fixedGregorianDate next: numberOfDaysSinceFixedDate + ( 1 * self day ) ) at:
            aNonGregorianDateTime timeOfDay - midnightTime
        ]
]

{ #category : 'testing' }
CalendarDateTime class >> isAbstract [

  ^ self = CalendarDateTime
]

{ #category : 'testing' }
CalendarDateTime >> < dateTime [

  ^ self date < dateTime date or: [
        self date = dateTime date and: [ self timeOfDay < dateTime timeOfDay ] ]
]

{ #category : 'comparing' }
CalendarDateTime >> = anObject [

  ^ self equalityChecker
      compareAll: #( date timeOfDay );
      checkAgainst: anObject
]

{ #category : 'converting' }
CalendarDateTime >> asGregorianDateTime [

  ^ self subclassResponsibility
]

{ #category : 'accessing' }
CalendarDateTime >> date [

  ^ self subclassResponsibility
]

{ #category : 'accessing' }
CalendarDateTime >> dayNumber [

  ^ self date dayNumber
]

{ #category : 'comparing' }
CalendarDateTime >> hash [

  ^ self equalityHashCombinator combineHashOf: self date with: self timeOfDay
]

{ #category : 'converting' }
CalendarDateTime >> in: aTimeOffsetRuleset [

  ^ self asGregorianDateTime in: aTimeOffsetRuleset
]

{ #category : 'converting' }
CalendarDateTime >> inCoordinatedUniversalTime [

  ^ self asGregorianDateTime inCoordinatedUniversalTime
]

{ #category : 'accessing' }
CalendarDateTime >> month [

  ^ self date month
]

{ #category : 'accessing' }
CalendarDateTime >> monthNumber [

  ^ self date monthNumber
]

{ #category : 'accessing' }
CalendarDateTime >> monthOfYear [

  ^ self date monthOfYear
]

{ #category : 'printing' }
CalendarDateTime >> printOn: stream [

  stream
    print: self date;
    space;
    nextPutAll: 'at';
    space;
    print: self timeOfDay
]

{ #category : 'accessing' }
CalendarDateTime >> timeOfDay [

  ^ self subclassResponsibility
]

{ #category : 'accessing' }
CalendarDateTime >> year [

  ^ self date year
]

{ #category : 'accessing' }
CalendarDateTime >> yearNumber [

  ^ self date yearNumber
]
