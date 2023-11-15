"
A OrdinalDayMonthRule is an inclusion rule for certain ordinal day number. For example, the third monday of July.

Instance Variables
	ordinal:	<Number>
	day:		<Day>
	month:		<Month>

cardinal
	- The ordinal day number.

day
	- The day.

month
	- The month.

"
Class {
	#name : 'OrdinalDayMonthRule',
	#superclass : 'InclusionRule',
	#instVars : [
		'day',
		'month',
		'ordinal'
	],
	#category : 'Chalten-Core-Filter',
	#package : 'Chalten-Core',
	#tag : 'Filter'
}

{ #category : 'instance creation' }
OrdinalDayMonthRule class >> ordinal: aNumber day: aDay month: aMonth [

	^self new initializeOrdinal: aNumber day: aDay month: aMonth
]

{ #category : 'accessing' }
OrdinalDayMonthRule >> day [

	^day
]

{ #category : 'querying' }
OrdinalDayMonthRule >> includes: aDate [

	^aDate = ((month ofYear: aDate year) ordinal: ordinal day: day)
]

{ #category : 'initialization' }
OrdinalDayMonthRule >> initializeOrdinal: aNumber day: aDay month: aMonth [

	ordinal := aNumber.
	day := aDay.
	month := aMonth
]

{ #category : 'accessing' }
OrdinalDayMonthRule >> month [

	^month
]

{ #category : 'accessing' }
OrdinalDayMonthRule >> ordinal [

	^ordinal
]

{ #category : 'printing' }
OrdinalDayMonthRule >> printOn: aStream [

	self printOrdinalOn: aStream.
	self day printOn: aStream.
	aStream nextPutAll: ' of '.
	self month printOn: aStream
]

{ #category : 'printing - private' }
OrdinalDayMonthRule >> printOrdinalOn: aStream [

	| index |
	index :=  (ordinal / 10) fractionPart * 10.
	(#(0 11 12) includes: ordinal) ifTrue: [ index := 4 ].
	index := index min: 4.
	ordinal printOn: aStream.
	aStream
		nextPutAll: (#('st' 'nd' 'rd' 'th') at: index);
		space
]
