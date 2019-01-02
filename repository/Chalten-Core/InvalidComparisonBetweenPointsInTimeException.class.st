"
An InvalidComparisonBetweenPointsInTimeException is an exception raised when an invalid comparison between two points in time is about to e realized. For example, when you try to compare a year with a date.

Instance Variables
	onePointInTime:		<PointInTime>
	otherPointInTime:		<PointInTime>

onePointInTime
	- The first point in time used in te comparison.

otherPointInTime
	- The other point in time used in the comparison.

"
Class {
	#name : #InvalidComparisonBetweenPointsInTimeException,
	#superclass : #Error,
	#instVars : [
		'onePointInTime',
		'otherPointInTime'
	],
	#category : #'Chalten-Core-Time'
}

{ #category : #signaling }
InvalidComparisonBetweenPointsInTimeException class >> signalWith: aPointInTime and: anotherPointInTime [

	(self with: aPointInTime and: anotherPointInTime) signal
]

{ #category : #'instance creation' }
InvalidComparisonBetweenPointsInTimeException class >> with: aPointInTime and: anotherPointInTime [

	^self new initializeWith: aPointInTime and: anotherPointInTime
]

{ #category : #acccessing }
InvalidComparisonBetweenPointsInTimeException >> description [

	^'The <1p> <2p> can not be compared with the <3p> <4p> because are points of different resolution'
		expandMacrosWith: onePointInTime class
		with: onePointInTime
		with: otherPointInTime class
		with: otherPointInTime
]

{ #category : #initialization }
InvalidComparisonBetweenPointsInTimeException >> initializeWith: aPointInTime and: anotherPointInTime [

	onePointInTime := aPointInTime.
	otherPointInTime := anotherPointInTime
]
