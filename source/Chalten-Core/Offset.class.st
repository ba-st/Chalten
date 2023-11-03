"
An Offset is the time zone's offset from UTC.

Instance Variables
	measure:		<Measure>

measure
	- The amount of hours from UTC.

"
Class {
	#name : 'Offset',
	#superclass : 'Object',
	#instVars : [
		'measure'
	],
	#category : 'Chalten-Core-Time',
	#package : 'Chalten-Core',
	#tag : 'Time'
}

{ #category : 'instance creation' }
Offset class >> of: aNumber [

	^self ofHours: aNumber hoursMeasure 
]

{ #category : 'instance creation' }
Offset class >> ofHours: aTimeMeasure [

	^self new initializeOf: aTimeMeasure
]

{ #category : 'arithmetic operations' }
Offset >> + anOffset [

	^self class ofHours: (anOffset addMeasure: measure)
]

{ #category : 'arithmetic operations' }
Offset >> - anOffset [

	^self class ofHours: (anOffset subtractFromMeasure: measure)
]

{ #category : 'comparing' }
Offset >> = anOffset [

	^self class = anOffset class
		and: [anOffset measureSameAs: measure]
]

{ #category : 'measure protocol' }
Offset >> addMeasure: aMeasure [

	^aMeasure + measure
]

{ #category : 'comparing' }
Offset >> hash [

	^measure hash
]

{ #category : 'initialization' }
Offset >> initializeOf: aTimeMeasure [

	measure := aTimeMeasure
]

{ #category : 'comparing - private' }
Offset >> measureSameAs: aMeasure [

	^measure = aMeasure
]

{ #category : 'printing - private' }
Offset >> print: aTimeOfDay on: aStream [

	aStream
		nextPutAll: (aTimeOfDay hours amount printStringLength: 2 padded: true);
		nextPut: $:;
		nextPutAll: (aTimeOfDay minutes amount printStringLength: 2 padded: true)
]

{ #category : 'printing' }
Offset >> printOn: aStream [

	| hours |
	
	hours := (measure convertTo: TimeUnits hour) abs.
	aStream nextPutAll: (self signFor: measure).
	self print: (TimeOfDay hours: hours amount) on: aStream
]

{ #category : 'printing - private' }
Offset >> signFor: aMeasure [

	aMeasure isNothing ifTrue: [^''].
	^aMeasure positive
		ifTrue: ['+']
		ifFalse: ['-']
]

{ #category : 'arithmetic operations' }
Offset >> subtractFromMeasure: aMeasure [

	^aMeasure - measure
]
