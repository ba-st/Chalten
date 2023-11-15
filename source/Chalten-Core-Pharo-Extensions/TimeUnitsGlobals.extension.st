Extension { #name : 'TimeUnitsGlobals' }

{ #category : '*Chalten-Core-Pharo-Extensions' }
TimeUnitsGlobals class >> initializeAfterLoad [

	self initializeUniqueInstance.
	Smalltalk at: #TimeUnits put: self new
]
