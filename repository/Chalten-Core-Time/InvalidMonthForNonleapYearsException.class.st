"
An InvalidMonthForNonleapYearsException is an exception raised when an invalid month in a nonleap year is about to be created. For example, in the hebrew calendar Adar II is an invalid month for nonleap Year 5767.

Instance Variables
	month:		<Month>
	year:		<Year>

month
	- The month.

year
	- The year.

"
Class {
	#name : #InvalidMonthForNonleapYearsException,
	#superclass : #Error,
	#instVars : [
		'month',
		'year'
	],
	#category : #'Chalten-Core-Time'
}

{ #category : #'instance creation' }
InvalidMonthForNonleapYearsException class >> month: aMonth year: aYear [

	^self new initializeMonth: aMonth year: aYear
]

{ #category : #signaling }
InvalidMonthForNonleapYearsException class >> signalMonth: aMonth year: aYear [

	(self month: aMonth year: aYear) signal
]

{ #category : #accessing }
InvalidMonthForNonleapYearsException >> description [

	^'<1p> is an invalid month for nonleap <2p>' expandMacrosWith: month with: year
]

{ #category : #accessing }
InvalidMonthForNonleapYearsException >> initializeMonth: aMonth year: aYear [

	month := aMonth.
	year := aYear
]
