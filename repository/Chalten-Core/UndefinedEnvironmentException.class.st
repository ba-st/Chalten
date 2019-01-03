"
An UndefinedEnvironmentException is an exception reised when there is no environment defined.

"
Class {
	#name : #UndefinedEnvironmentException,
	#superclass : #Error,
	#instVars : [
		'message'
	],
	#category : #'Chalten-Core-Time'
}

{ #category : #'instance creation' }
UndefinedEnvironmentException class >> message: aMessage [

	^self new initializeMessage: aMessage
]

{ #category : #signalling }
UndefinedEnvironmentException class >> signalMessage: aMessage [

	(self message: aMessage) signal
]

{ #category : #accesing }
UndefinedEnvironmentException >> description [

	^'There is no environment defined to resolve <1p>' expandMacrosWith: message
]

{ #category : #'initailize-release' }
UndefinedEnvironmentException >> initializeMessage: aMessage [

	message := aMessage
]
