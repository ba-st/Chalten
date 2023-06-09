"
A MonthsOfNonleapYearsForCircularStreamStrategy isan strategy to advance months of nonleap years in a stream

Instance Variables
	stream:		<Stream>

stream
	- The stream.

"
Class {
	#name : #MonthsOfNonleapYearsForCircularStreamStrategy,
	#superclass : #MonthsForCircularStreamStrategyBehavior,
	#instVars : [
		'stream'
	],
	#category : #'Chalten-Core-Time'
}

{ #category : #'instance creation' }
MonthsOfNonleapYearsForCircularStreamStrategy class >> of: aCalendar [

	^self new initializeOf: aCalendar
]

{ #category : #initialization }
MonthsOfNonleapYearsForCircularStreamStrategy >> initializeOf: aCalendar [

	stream := CircularReadStream on: aCalendar monthsForNonleapYears moving: aCalendar monthUnit
]

{ #category : #'months days accessing' }
MonthsOfNonleapYearsForCircularStreamStrategy >> numberOfDaysOf: aMonth [

	^aMonth numberOfDaysInNonleapYear
]

{ #category : #'accessing - private' }
MonthsOfNonleapYearsForCircularStreamStrategy >> stream [

	^stream
]
