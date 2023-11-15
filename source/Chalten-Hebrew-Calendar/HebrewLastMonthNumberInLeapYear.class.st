"
A HebrewLastMonthNumberInLeapYear is the last month number in an hebrew leap year.

"
Class {
	#name : 'HebrewLastMonthNumberInLeapYear',
	#superclass : 'HebrewLastMonthNumberInYearBehavior',
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Chalten-Hebrew-Calendar',
	#package : 'Chalten-Hebrew-Calendar'
}

{ #category : 'testing' }
HebrewLastMonthNumberInLeapYear class >> canHandle: aYear [

	^aYear isLeap
]

{ #category : 'initialization' }
HebrewLastMonthNumberInLeapYear class >> initialize [

	self initializeUniqueInstance
]

{ #category : 'initialization' }
HebrewLastMonthNumberInLeapYear class >> initializeUniqueInstance [

	uniqueInstance := super new
]

{ #category : 'instance creation' }
HebrewLastMonthNumberInLeapYear class >> new [

	^uniqueInstance
]

{ #category : 'evaluating' }
HebrewLastMonthNumberInLeapYear >> value [

	^13
]
