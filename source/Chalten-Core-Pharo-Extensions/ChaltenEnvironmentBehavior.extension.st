Extension { #name : 'ChaltenEnvironmentBehavior' }

{ #category : '*Chalten-Core-Pharo-Extensions' }
ChaltenEnvironmentBehavior class >> initializeAfterLoad [

	| environmentClass |
	environmentClass := self initializeEnvironment.
	Smalltalk at: #ChaltenEnvironment put: environmentClass new
]
