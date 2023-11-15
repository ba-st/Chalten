"
A LeapYearType is an object that represent a leap year.

"
Class {
	#name : 'LeapYearType',
	#superclass : 'YearType',
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Chalten-Core-Time',
	#package : 'Chalten-Core',
	#tag : 'Time'
}

{ #category : 'initialization' }
LeapYearType class >> initializeUniqueInstance [

	uniqueInstance := super new
]

{ #category : 'instance creation' }
LeapYearType class >> new [

	^uniqueInstance
]

{ #category : 'accessing months' }
LeapYearType >> amountOfMonthsIn: aYear [

	^aYear amountOfMonthsInLeapYears
]

{ #category : 'months stream accessing' }
LeapYearType >> arrayOfMonthsOf: aYear [

	^aYear arrayOfMonthsInLeapYears
]

{ #category : 'testing' }
LeapYearType >> isLeap [

	^true
]

{ #category : 'accessing months' }
LeapYearType >> monthNumbered: aNumber in: aCalendar [

	^aCalendar monthInLeapYearsNumbered: aNumber
]

{ #category : 'accessing days' }
LeapYearType >> numberOfDaysFor: aMonthDefinition [
	
	^aMonthDefinition numberOfDaysInLeapYear
]

{ #category : 'printing' }
LeapYearType >> printOn: aStream [

	aStream nextPutAll: 'Leap Year'
]
