"
An InvalidMonthForLeapYearsException is an exception raised when an invalid month in a leap year is about to be created. For example, in the hebrew calendar Adar is an invalid month for leap Year 5768.

Instance Variables
	month:		<Month>
	year:		<Year>

month
	- The month.

year
	- The year.

"
Class {
	#name : 'InvalidMonthForLeapYearsException',
	#superclass : 'Error',
	#instVars : [
		'month',
		'year'
	],
	#category : 'Chalten-Core-Time',
	#package : 'Chalten-Core',
	#tag : 'Time'
}

{ #category : 'instance creation' }
InvalidMonthForLeapYearsException class >> month: aMonth year: aYear [

	^self new initializeMonth: aMonth year: aYear
]

{ #category : 'signaling' }
InvalidMonthForLeapYearsException class >> signalMonth: aMonth year: aYear [

	(self month: aMonth year: aYear) signal
]

{ #category : 'accessing' }
InvalidMonthForLeapYearsException >> description [

	^'<1p> is an invalid month for leap <2p>' expandMacrosWith: month with: year
]

{ #category : 'accessing' }
InvalidMonthForLeapYearsException >> initializeMonth: aMonth year: aYear [

	month := aMonth.
	year := aYear
]
