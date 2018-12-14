"
A HebrewLastMonthNumberInNonleapYear is the last month number in an hebrew nonleap year.

"
Class {
	#name : #HebrewLastMonthNumberInNonleapYear,
	#superclass : #HebrewLastMonthNumberInYearBehavior,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Chalten-Core-Hebrew'
}

{ #category : #testing }
HebrewLastMonthNumberInNonleapYear class >> canHandle: aYear [

	^aYear isLeap not
]

{ #category : #initialization }
HebrewLastMonthNumberInNonleapYear class >> initialize [

	self initializeUniqueInstance
]

{ #category : #initialization }
HebrewLastMonthNumberInNonleapYear class >> initializeUniqueInstance [

	uniqueInstance := super new
]

{ #category : #'instance creation' }
HebrewLastMonthNumberInNonleapYear class >> new [

	^uniqueInstance
]

{ #category : #evaluating }
HebrewLastMonthNumberInNonleapYear >> value [

	^12
]
