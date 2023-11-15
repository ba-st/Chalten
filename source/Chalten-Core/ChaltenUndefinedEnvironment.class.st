"
A ChaltenUndefinedEnvironment is a class for defining behavior related to an undefined environment.

"
Class {
	#name : 'ChaltenUndefinedEnvironment',
	#superclass : 'ChaltenEnvironmentBehavior',
	#category : 'Chalten-Core-Time',
	#package : 'Chalten-Core',
	#tag : 'Time'
}

{ #category : 'testing' }
ChaltenUndefinedEnvironment class >> isForCurrentPlatform [

	^false
]

{ #category : 'accessing time' }
ChaltenUndefinedEnvironment >> localTimeOffset [

	self raiseUndefinedEnvironmentExceptionFor: #localTimeOffset
]

{ #category : 'accessing time' }
ChaltenUndefinedEnvironment >> microsecondsClock [

	self raiseUndefinedEnvironmentExceptionFor: #microsecondsClock
]

{ #category : 'accessing time' }
ChaltenUndefinedEnvironment >> millisecondsClock [

	self raiseUndefinedEnvironmentExceptionFor: #millisecondsClock
]

{ #category : 'exception - raise' }
ChaltenUndefinedEnvironment >> raiseUndefinedEnvironmentExceptionFor: aMessage [

	UndefinedEnvironmentException signalMessage: aMessage
]

{ #category : 'accessing time' }
ChaltenUndefinedEnvironment >> secondsClock [

	self raiseUndefinedEnvironmentExceptionFor: #secondsClock
]
