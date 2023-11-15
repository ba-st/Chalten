"
A NonleapYearType is an object that represent a nonleap year.

"
Class {
	#name : 'NonleapYearType',
	#superclass : 'YearType',
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Chalten-Core-Time',
	#package : 'Chalten-Core',
	#tag : 'Time'
}

{ #category : 'initialization' }
NonleapYearType class >> initializeUniqueInstance [

	uniqueInstance := super new
]

{ #category : 'instance creation' }
NonleapYearType class >> new [

	^uniqueInstance
]

{ #category : 'accessing months' }
NonleapYearType >> amountOfMonthsIn: aYear [

	^aYear amountOfMonthsInNonleapYears
]

{ #category : 'months stream accessing' }
NonleapYearType >> arrayOfMonthsOf: aYear [

	^aYear arrayOfMonthsInNonleapYears
]

{ #category : 'testing' }
NonleapYearType >> isLeap [

	^false
]

{ #category : 'accessing months' }
NonleapYearType >> monthNumbered: aNumber in: aCalendar [

	^aCalendar monthInNonleapYearsNumbered: aNumber
]

{ #category : 'accessing days' }
NonleapYearType >> numberOfDaysFor: aMonthDefinition [

	^aMonthDefinition numberOfDaysInNonleapYear
]

{ #category : 'printing' }
NonleapYearType >> printOn: aStream [

	aStream nextPutAll: 'Nonleap Year'
]
