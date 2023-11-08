Extension { #name : 'TheBeginningOfTimeClass' }

{ #category : '*Chalten-Core-Pharo-Extensions' }
TheBeginningOfTimeClass class >> initializeAfterLoad [

	self initialize.
	Smalltalk at: #TheBeginningOfTime put: self new
]
