"
An InvalidMonthNumberException is an exception raised when an invalid month number is queried. For example, the month numbered 13 is invalid if you ask for it to the gregorian calendar beacuse this calendar only has 12 months.

Instance Variables
	number:		<Number>

number
	- The wrong month number.

"
Class {
	#name : 'InvalidMonthNumberException',
	#superclass : 'Error',
	#instVars : [
		'number'
	],
	#category : 'Chalten-Core-Time',
	#package : 'Chalten-Core',
	#tag : 'Time'
}

{ #category : 'instance creation' }
InvalidMonthNumberException class >> number: aNumber [
	^ self new initializeNumber: aNumber
]

{ #category : 'signaling' }
InvalidMonthNumberException class >> signalNumber: aNumber [ 
	(self number: aNumber) signal
]

{ #category : 'accessing' }
InvalidMonthNumberException >> description [

	^'<1p> is an invalid number for a month' expandMacrosWith: number
]

{ #category : 'initialization' }
InvalidMonthNumberException >> initializeNumber: aNumber [

	number := aNumber
]
