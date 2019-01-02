"
A time zone is a region that has a uniform standard time for legal, commercial, and social purposes. It is convenient for areas in close commercial or other communication to keep the same time, so time zones tend to follow the boundaries of countries and their subdivisions.

Instance Variables
	name:		<String>
	offset:		<Number>

name
	- The name wich univocally identify the timezone.

offset
	- The offset or displacement in local time measured from the zero meridian.

"
Class {
	#name : #ChaltenTimeZone,
	#superclass : #Object,
	#instVars : [
		'name',
		'offset'
	],
	#category : #'Chalten-Core-Time'
}

{ #category : #'instance creation' }
ChaltenTimeZone class >> named: aName offset: anOffset [

	^self new initializeNamed: aName offset: anOffset
]

{ #category : #'offset applying' }
ChaltenTimeZone >> applyOffsetTo: aDateTime from: aTimeZone [

	^aDateTime nextIn: aTimeZone
]

{ #category : #initialization }
ChaltenTimeZone >> initializeNamed: aName offset: anOffset [

	name := aName.
	offset := anOffset
]

{ #category : #accessing }
ChaltenTimeZone >> offset [

	^offset
]

{ #category : #printing }
ChaltenTimeZone >> printOn: aStream [

	aStream nextPutAll: '(GMT'.
	offset printOn: aStream.
	aStream nextPut: $).
	aStream space.
	aStream nextPutAll: name
]
