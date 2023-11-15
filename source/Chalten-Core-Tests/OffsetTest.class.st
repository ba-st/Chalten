Class {
	#name : 'OffsetTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Core-Tests-Time',
	#package : 'Chalten-Core-Tests',
	#tag : 'Time'
}

{ #category : 'test arithmetic operations' }
OffsetTest >> testAdd [

	self
		assert: (Offset of: 3) + (Offset ofHours: 1 hourMeasure)
		equals: (Offset of: 4).
	self
		assert: (Offset of: 1) + (Offset ofHours: 3 hoursMeasure)
		equals: (Offset of: 4)
]

{ #category : 'test measure protocol' }
OffsetTest >> testAddMeasure [

	self
		assert: ((Offset of: 3) addMeasure: 1 hourMeasure)
		equals: 4 hoursMeasure
]

{ #category : 'test comparing' }
OffsetTest >> testEqual [

	self assert: (Offset of: 3) equals: (Offset ofHours: 3 hoursMeasure).
	self deny: (Offset of: 3) = (Offset ofHours: 2 hoursMeasure)
]

{ #category : 'test comparing' }
OffsetTest >> testHash [

	self
		assert: (Offset of: 3) hash
		equals: (Offset ofHours: 3 hoursMeasure) hash.
	self deny:
		(Offset of: 3) hash = (Offset ofHours: 2 hoursMeasure) hash
]

{ #category : 'test printing' }
OffsetTest >> testPrintString [

	| positiveOffset negativeOffset zeroOffset |
	positiveOffset := Offset of: 3.
	self assert: positiveOffset printString equals: '+03:00'.

	negativeOffset := Offset of: -3.
	self assert: negativeOffset printString equals: '-03:00'.

	zeroOffset := Offset of: 0.
	self assert: zeroOffset printString equals: '00:00'
]

{ #category : 'test arithmetic operations' }
OffsetTest >> testSubtract [

	self
		assert: (Offset of: 3) - (Offset ofHours: 1 hourMeasure)
		equals: (Offset of: 2).
	self
		assert: (Offset of: 1) - (Offset ofHours: 3 hoursMeasure)
		equals: (Offset of: -2)
]
