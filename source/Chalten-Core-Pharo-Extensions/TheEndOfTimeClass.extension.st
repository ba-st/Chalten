Extension { #name : 'TheEndOfTimeClass' }

{ #category : '*Chalten-Core-Pharo-Extensions' }
TheEndOfTimeClass class >> initializeAfterLoad [

	self initializeUniqueInstance.
	Smalltalk at: #TheEndOfTime put: self new
]
