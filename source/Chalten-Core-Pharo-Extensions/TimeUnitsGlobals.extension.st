Extension { #name : 'TimeUnitsGlobals' }

{ #category : '*Chalten-Core-Pharo-Extensions' }
TimeUnitsGlobals class >> initializeAfterLoad [

	self initialize.
	Smalltalk at: #TimeUnits put: self new
]
