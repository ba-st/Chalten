"
An InvalidDayNumberException is an exception raised when an invalid day number is queried. For example, the day numbered 8 is invalid if you ask for it to the gregorian calendar beacuse this calendar only has 7 days.

Instance Variables
	dayNumber:		<Number>

dayNumber
	- The wrong day number.

"
Class {
	#name : 'InvalidDayNumberException',
	#superclass : 'Error',
	#instVars : [
		'dayNumber'
	],
	#category : 'Chalten-Core-Time',
	#package : 'Chalten-Core',
	#tag : 'Time'
}

{ #category : 'instance creation' }
InvalidDayNumberException class >> dayNumber: aDayNumber [

	^self new initializeDayNumber: aDayNumber
]

{ #category : 'signaling' }
InvalidDayNumberException class >> signalDayNumber: aDayNumber [

	(self dayNumber: aDayNumber) signal
]

{ #category : 'accessing' }
InvalidDayNumberException >> description [

	^'The number <1p> is invalid as a day of a week' expandMacrosWith: dayNumber
]

{ #category : 'initialization' }
InvalidDayNumberException >> initializeDayNumber: aDayNumber [

	dayNumber := aDayNumber
]
