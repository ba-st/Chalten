Extension { #name : 'TheEndOfTimeClass' }

{ #category : '*Chalten-Core-Pharo-Extensions' }
TheEndOfTimeClass class >> initializeAfterLoad [

	self initialize.
	Smalltalk at: #TheEndOfTime put: self new
]
