"
An InvalidTimeOfDayException is an exception raised when an invalid time of day is about to be created. For example, the time 24 hours is invalid for one day because the hour 24:00:00 those not exist, the correct is the time 00:00:00.

Instance Variables
	time:		<Measure>

time
	- A time measure.

"
Class {
	#name : #InvalidTimeOfDayException,
	#superclass : #Error,
	#instVars : [
		'time'
	],
	#category : #'Chalten-Core-Time'
}

{ #category : #signaling }
InvalidTimeOfDayException class >> signalTime: aTime [

	(self time: aTime) signal
]

{ #category : #'instance creation' }
InvalidTimeOfDayException class >> time: aTime [

	^self new initializeTime: aTime
]

{ #category : #accessing }
InvalidTimeOfDayException >> description [

	^'The time <1p> is invalid for one day' expandMacrosWith: time
]

{ #category : #initialization }
InvalidTimeOfDayException >> initializeTime: aTime [

	time := aTime.
]
