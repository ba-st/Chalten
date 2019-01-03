"
A Day is the representation of a day. For example, Monday.

Instance Variables
	calendar:			<CalendarDefinition>
	name:				<String>
	positionInWeek:	<Number>

calendar
	- The calendar of the day.

name
	- The day name.

positionInWeek
	- The day position in the week.

"
Class {
	#name : #Day,
	#superclass : #PointInTime,
	#instVars : [
		'name',
		'positionInWeek',
		'calendar'
	],
	#category : #'Chalten-Core-Time'
}

{ #category : #'instance creation' }
Day class >> named: aString positionInWeek: aNumber calendar: aCalendar [

	^self new initializeNamed: aString positionInWeek: aNumber calendar: aCalendar
]

{ #category : #'magnitude protocol' }
Day >> < aDay [

	self assertIsSameKindAs: aDay.
	^self positionInWeek < aDay positionInWeek
]

{ #category : #'accessing - private' }
Day >> calendar [

	^calendar
]

{ #category : #'interval protocol - private' }
Day >> defaultIntervalIncrement [
	^ 1 dayMeasure
]

{ #category : #querying }
Day >> distanceTo: aDay [

	| stream |
	
	stream := CircularReadStream on: self calendar days moving: TimeUnits day.
	^stream distanceFrom: self to: aDay
]

{ #category : #initialization }
Day >> initializeNamed: aString positionInWeek: aNumber calendar: aCalendar [

	name := aString.
	positionInWeek := aNumber.
	calendar := aCalendar
]

{ #category : #'interval protocol - private' }
Day >> intervalStrategy [

	^RoundedTimelineIntervalStrategy new
]

{ #category : #testing }
Day >> is: aDay [

	^self = aDay
]

{ #category : #accessing }
Day >> name [

	^name
]

{ #category : #enumerating }
Day >> next: aNumberOfDays [

	| stream |
	
	stream := CircularReadStream on: self calendar days moving: TimeUnits day.
	stream upTo: self.
	^stream next: aNumberOfDays
]

{ #category : #accessing }
Day >> numberOfDaysSinceFirstDayOfWeek [

	^(self positionInWeek - 1) daysMeasure
]

{ #category : #accessing }
Day >> positionInWeek [

	^positionInWeek
]

{ #category : #printing }
Day >> printOn: aStream [

	aStream nextPutAll: name
]
