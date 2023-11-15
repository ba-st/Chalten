"
An InvalidYearNumberException is an exception raised when an invalid year number is about to be created. For example, 1.5 is an invalid number for a year in the gregorian calendar.

Instance Variables
	calendar:		<CalendarDefinition>
	number:		<Number>

calendar
	- The calendar for wich the year wants to be created.

number
	- The year number.

"
Class {
	#name : 'InvalidYearNumberException',
	#superclass : 'Error',
	#instVars : [
		'number',
		'calendar'
	],
	#category : 'Chalten-Core-Time',
	#package : 'Chalten-Core',
	#tag : 'Time'
}

{ #category : 'instance creation' }
InvalidYearNumberException class >> number: aNumber calendar: aCalendar [

	^self new initializeNumber: aNumber calendar: aCalendar
]

{ #category : 'signaling' }
InvalidYearNumberException class >> signalNumber: aNumber calendar: aCalendar [

	(self number: aNumber calendar: aCalendar) signal
]

{ #category : 'accessing' }
InvalidYearNumberException >> description [

	^'<1p> is an invalid number for a year in the <2p>' expandMacrosWith: number with: calendar
]

{ #category : 'initialization' }
InvalidYearNumberException >> initializeNumber: aNumber calendar: aCalendar [

	number := aNumber.
	calendar := aCalendar
]
