Extension { #name : 'TimeZonesGlobals' }

{ #category : '*Chalten-Core-Pharo-Extensions' }
TimeZonesGlobals class >> initializeAfterLoad [

	self initialize.
	Smalltalk at: #TimeZones put: self new
]
