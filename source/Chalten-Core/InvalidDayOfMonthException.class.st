"
An InvalidDayOfMonthException is an exception raised when an invalid day of month is about to be created. For example, the day of month February 30th is invalid because february only have 28 or 29 days.

Instance Variables
	dayNumber:		<Number>
	month:				<Month>

dayNumber
	- The day number.

month
	- The month.

"
Class {
	#name : 'InvalidDayOfMonthException',
	#superclass : 'Error',
	#instVars : [
		'month',
		'dayNumber'
	],
	#category : 'Chalten-Core-Time',
	#package : 'Chalten-Core',
	#tag : 'Time'
}

{ #category : 'instance creation' }
InvalidDayOfMonthException class >> month: aMonth dayNumber: aDayNumber [

	^self new initializeMonth: aMonth dayNumber: aDayNumber
]

{ #category : 'signaling' }
InvalidDayOfMonthException class >> signalMonth: aMonth dayNumber: aDayNumber [

	(self month: aMonth dayNumber: aDayNumber) signal
]

{ #category : 'accessing' }
InvalidDayOfMonthException >> description [

	^'Day of month <1p> invalid for <2p>'
		expandMacrosWith: dayNumber
		with: month
]

{ #category : 'initialization' }
InvalidDayOfMonthException >> initializeMonth: aMonth dayNumber: aDayNumber [

	month := aMonth.
	dayNumber := aDayNumber.
]
