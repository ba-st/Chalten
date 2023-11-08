Extension { #name : 'TheBeginningOfTimeClass' }

{ #category : '*Chalten-Core-Pharo-Extensions' }
TheBeginningOfTimeClass class >> initializeAfterLoad [

	self initializeUniqueInstance.
	Smalltalk at: #TheBeginningOfTime put: self new
]
