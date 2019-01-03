"
A ChaltenEnvironment is an abstract class for defining behavior related to the environment.

"
Class {
	#name : #ChaltenEnvironmentBehavior,
	#superclass : #Object,
	#category : #'Chalten-Core-Time'
}

{ #category : #initialization }
ChaltenEnvironmentBehavior class >> initializeAfterLoad [

	self initializeEnvironment
]

{ #category : #initialization }
ChaltenEnvironmentBehavior class >> initializeEnvironment [

	|  environmentClass |
	environmentClass := self subclasses
		detect: [ :each | each isForCurrentPlatform ]
		ifNone: [ self undefinedEnvironment ].
	Smalltalk at:#ChaltenEnvironment put: environmentClass new
]

{ #category : #testing }
ChaltenEnvironmentBehavior class >> isForCurrentPlatform [

	self subclassResponsibility
]

{ #category : #'accessing time' }
ChaltenEnvironmentBehavior >> localTimeOffset [

	self subclassResponsibility
]

{ #category : #'accessing time' }
ChaltenEnvironmentBehavior >> microsecondsClock [

	self subclassResponsibility
]

{ #category : #'accessing time' }
ChaltenEnvironmentBehavior >> millisecondsClock [

	self subclassResponsibility
]

{ #category : #'accessing time' }
ChaltenEnvironmentBehavior >> secondsClock [

	self subclassResponsibility
]
