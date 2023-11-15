"
An InvalidDayNameException is an exception raised when an invalid day name is queried. For example, the day named yom rishon is invalid if you ask for it to the gregorian calendar (is an hebrew calendar day).

Instance Variables
	name:		<String>

name
	- The wrong name of day.

"
Class {
	#name : 'InvalidDayNameException',
	#superclass : 'Error',
	#instVars : [
		'name'
	],
	#category : 'Chalten-Core-Time',
	#package : 'Chalten-Core',
	#tag : 'Time'
}

{ #category : 'instance creation' }
InvalidDayNameException class >> name: aName [

	^self new initializeName: aName
]

{ #category : 'signaling' }
InvalidDayNameException class >> signalName: aName [

	(self name: aName) signal
]

{ #category : 'accessing' }
InvalidDayNameException >> description [

	^'The name <1s> is invalid as a day of a week' expandMacrosWith: name
]

{ #category : 'initialization' }
InvalidDayNameException >> initializeName: aName [

	name := aName
]
