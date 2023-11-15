"
An InvalidDateException is an exception raised when a date is invalid. For example, the date February 31, 2014 is invalid because february have 28 or 29 days only.

Instance Variables
	dayNumber:		<Number>
	monthOfYear:		<MonthOfYear>

dayNumber
	- The number of the day.

monthOfYear
	- The month of year.

"
Class {
	#name : 'InvalidDateException',
	#superclass : 'Error',
	#instVars : [
		'dayNumber',
		'monthOfYear'
	],
	#category : 'Chalten-Core-Time',
	#package : 'Chalten-Core',
	#tag : 'Time'
}

{ #category : 'instance creation' }
InvalidDateException class >> monthOfYear: aMonthOfYear dayNumber: aDayNumber [

	^self new initializeMonthOfYear: aMonthOfYear dayNumber: aDayNumber
]

{ #category : 'signaling' }
InvalidDateException class >> signalMonthOfYear: aMonthOfYear dayNumber: aDayNumber [

	(self monthOfYear: aMonthOfYear dayNumber: aDayNumber) signal
]

{ #category : 'accessing' }
InvalidDateException >> description [

	^'The day <1p> is invalid for the month <2p>' expandMacrosWith: dayNumber with: monthOfYear
]

{ #category : 'initialization' }
InvalidDateException >> initializeMonthOfYear: aMonthOfYear dayNumber: aDayNumber [

	monthOfYear := aMonthOfYear.
	dayNumber := aDayNumber
]
