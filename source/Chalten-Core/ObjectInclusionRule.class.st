"
An ObjectInclusionRule is an inclusion rule for an specific object. It could be a day, a date, a month or any other point in time.

Instance Variables
	object:		<PointInTime>

object
	- The point in time included.

"
Class {
	#name : 'ObjectInclusionRule',
	#superclass : 'InclusionRule',
	#instVars : [
		'object'
	],
	#category : 'Chalten-Core-Filter',
	#package : 'Chalten-Core',
	#tag : 'Filter'
}

{ #category : 'instance creation' }
ObjectInclusionRule class >> for: anObject [

	^self new initializeFor: anObject
]

{ #category : 'querying' }
ObjectInclusionRule >> includes: anObject [

	^object = anObject
]

{ #category : 'initialization' }
ObjectInclusionRule >> initializeFor: anObject [

	object := anObject
]

{ #category : 'accessing' }
ObjectInclusionRule >> object [

	^object
]

{ #category : 'printing' }
ObjectInclusionRule >> printOn: aStream [

	aStream nextPutAll: 'Includes: '.
	self object printOn: aStream
]
