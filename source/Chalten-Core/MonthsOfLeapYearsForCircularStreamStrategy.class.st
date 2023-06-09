"
A MonthsOfLeapYearsForCircularStreamStrategy is an strategy to advance months of leap years in a stream

Instance Variables
	stream:		<Stream>

stream
	- The stream.

"
Class {
	#name : #MonthsOfLeapYearsForCircularStreamStrategy,
	#superclass : #MonthsForCircularStreamStrategyBehavior,
	#instVars : [
		'stream'
	],
	#category : #'Chalten-Core-Time'
}

{ #category : #'instance creation' }
MonthsOfLeapYearsForCircularStreamStrategy class >> of: aCalendar [

	^self new initializeOf: aCalendar
]

{ #category : #initialization }
MonthsOfLeapYearsForCircularStreamStrategy >> initializeOf: aCalendar [

	stream := CircularReadStream on: aCalendar monthsForLeapYears moving: aCalendar monthUnit
]

{ #category : #'months days accessing' }
MonthsOfLeapYearsForCircularStreamStrategy >> numberOfDaysOf: aMonth [

	^aMonth numberOfDaysInLeapYear
]

{ #category : #'accessing - private' }
MonthsOfLeapYearsForCircularStreamStrategy >> stream [

	^stream
]
