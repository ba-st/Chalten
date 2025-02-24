"
A TheEndOfTimeClass is an object used to represent the end of time. TheEndOfTime”is always greater than any point in time.

"
Class {
	#name : 'TheEndOfTimeClass',
	#superclass : 'EndsOfTimeline',
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Chalten-Core-Time',
	#package : 'Chalten-Core',
	#tag : 'Time'
}

{ #category : 'initialization' }
TheEndOfTimeClass class >> initializeUniqueInstance [

	uniqueInstance := super new
]

{ #category : 'instance creation' }
TheEndOfTimeClass class >> new [

	^uniqueInstance
]

{ #category : 'magnitude protocol' }
TheEndOfTimeClass >> < aMagnitude [

	^false
]

{ #category : 'magnitude protocol' }
TheEndOfTimeClass >> > aMagnitude [

	^true
]

{ #category : 'accessing days - private' }
TheEndOfTimeClass >> amountOfDaysFromEpoch [

	^ ArithmeticObject infinity
]

{ #category : 'printing' }
TheEndOfTimeClass >> printOn: aStream [

	aStream nextPutAll: 'The end of time'
]
