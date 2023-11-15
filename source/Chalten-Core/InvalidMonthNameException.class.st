"
An InvalidMonthNameException is an exception raised when an invalid month name is queried. For example, the month named Nisan is invalid if you ask for it to the gregorian calendar (is an hebrew calendar month).

Instance Variables
	name:		<String>

name
	- The wrong month name.

"
Class {
	#name : 'InvalidMonthNameException',
	#superclass : 'Error',
	#instVars : [
		'name'
	],
	#category : 'Chalten-Core-Time',
	#package : 'Chalten-Core',
	#tag : 'Time'
}

{ #category : 'instance creation' }
InvalidMonthNameException class >> name: aName [

	^self new initializeName: aName
]

{ #category : 'signaling' }
InvalidMonthNameException class >> signalName: aName [

	(self name: aName) signal
]

{ #category : 'accessing' }
InvalidMonthNameException >> description [

	^'<1s> is an invalid name for a month' expandMacrosWith: name
]

{ #category : 'initialization' }
InvalidMonthNameException >> initializeName: aName [

	name := aName
]
