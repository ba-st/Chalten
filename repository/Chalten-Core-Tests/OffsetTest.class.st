Class {
	#name : #OffsetTest,
	#superclass : #TestCase,
	#category : #'Chalten-Core-Tests-Time'
}

{ #category : #'test arithmetic operations' }
OffsetTest >> testAdd [
	self assert: (Offset of: 3) + (Offset ofHours: 1 hourMeasure) = (Offset of: 4).
	self assert: (Offset of: 1) + (Offset ofHours: 3 hoursMeasure) = (Offset of: 4)
]

{ #category : #'test measure protocol' }
OffsetTest >> testAddMeasure [
	self assert: ((Offset of: 3) addMeasure: 1 hourMeasure) = 4 hoursMeasure
]

{ #category : #'test comparing' }
OffsetTest >> testEqual [
	self assert: (Offset of: 3) = (Offset ofHours: 3 hoursMeasure).
	self deny: (Offset of: 3) = (Offset ofHours: 2 hoursMeasure)
]

{ #category : #'test comparing' }
OffsetTest >> testHash [
	self assert: (Offset of: 3) hash = (Offset ofHours: 3 hoursMeasure) hash.
	self deny: (Offset of: 3) hash = (Offset ofHours: 2 hoursMeasure) hash
]

{ #category : #'test printing' }
OffsetTest >> testPrintString [

	| positiveOffset negativeOffset zeroOffset |
	
	positiveOffset := Offset of: 3.
	self assert: positiveOffset printString = '+03:00'.
	
	negativeOffset := Offset of: -3.
	self assert: negativeOffset printString = '-03:00'.
	
	zeroOffset := Offset of: 0.
	self assert: zeroOffset printString = '00:00'.
]

{ #category : #'test arithmetic operations' }
OffsetTest >> testSubtract [
	self assert: (Offset of: 3) - (Offset ofHours: 1 hourMeasure) = (Offset of: 2).
	self assert: (Offset of: 1) - (Offset ofHours: 3 hoursMeasure) = (Offset of: -2)
]
