Extension { #name : 'TimeZonesGlobals' }

{ #category : '*Chalten-Core-Pharo-Extensions' }
TimeZonesGlobals class >> initializeAfterLoad [

	self initializeUniqueInstance.
	Smalltalk at: #TimeZones put: self new
]
