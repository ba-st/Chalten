"
A ChaltenUndefinedEnvironmentTest is a test class for testing the behavior of ChaltenUndefinedEnvironment
"
Class {
	#name : 'ChaltenUndefinedEnvironmentTest',
	#superclass : 'TestCase',
	#instVars : [
		'environment'
	],
	#category : 'Chalten-Core-Tests-Time',
	#package : 'Chalten-Core-Tests',
	#tag : 'Time'
}

{ #category : 'initailize-release' }
ChaltenUndefinedEnvironmentTest >> setUp [

	super setUp.
	environment := ChaltenUndefinedEnvironment new
]

{ #category : 'initailize-release' }
ChaltenUndefinedEnvironmentTest >> tearDown [

	super tearDown.
	environment := nil
]

{ #category : 'test testing' }
ChaltenUndefinedEnvironmentTest >> testIsForCurrentPlatform [

	self deny: ChaltenUndefinedEnvironment isForCurrentPlatform
]

{ #category : 'test accessing time' }
ChaltenUndefinedEnvironmentTest >> testLocalTimeOffset [

	self
		should: [ environment localTimeOffset ]
		raise: UndefinedEnvironmentException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals:
					('There is no environment defined to resolve <1p>'
						 expandMacrosWith: #localTimeOffset) ]
]

{ #category : 'test accessing time' }
ChaltenUndefinedEnvironmentTest >> testMicrosecondsClock [

	self
		should: [ environment microsecondsClock ]
		raise: UndefinedEnvironmentException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals:
					('There is no environment defined to resolve <1p>'
						 expandMacrosWith: #microsecondsClock) ]
]

{ #category : 'test accessing time' }
ChaltenUndefinedEnvironmentTest >> testMillisecondsClock [

	self
		should: [ environment millisecondsClock ]
		raise: UndefinedEnvironmentException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals:
					('There is no environment defined to resolve <1p>'
						 expandMacrosWith: #millisecondsClock) ]
]

{ #category : 'test accessing time' }
ChaltenUndefinedEnvironmentTest >> testSecondsClock [

	self
		should: [ environment secondsClock ]
		raise: UndefinedEnvironmentException
		withExceptionDo: [ :exception |
			self
				assert: exception description
				equals:
					('There is no environment defined to resolve <1p>'
						 expandMacrosWith: #secondsClock) ]
]
