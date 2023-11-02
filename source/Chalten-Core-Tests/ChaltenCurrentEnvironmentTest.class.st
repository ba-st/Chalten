Class {
	#name : 'ChaltenCurrentEnvironmentTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Core-Tests-Time',
	#package : 'Chalten-Core-Tests',
	#tag : 'Time'
}

{ #category : 'test testing' }
ChaltenCurrentEnvironmentTest >> testIsForCurrentPlatform [

	self assert: ChaltenEnvironment class isForCurrentPlatform
]

{ #category : 'test accessing time' }
ChaltenCurrentEnvironmentTest >> testLocalTimeOffset [

	self
		assert: (-11 to: 12)
		includes: ChaltenEnvironment localTimeOffset
]

{ #category : 'test accessing time' }
ChaltenCurrentEnvironmentTest >> testMicrosecondsClock [

	| first second |
	first := ChaltenEnvironment microsecondsClock.
	(Delay forMilliseconds: 1) wait.
	second := ChaltenEnvironment microsecondsClock.
	self assert: first equals: second - (second - first)
]

{ #category : 'test accessing time' }
ChaltenCurrentEnvironmentTest >> testMillisecondsClock [

	| first second |
	first := ChaltenEnvironment millisecondsClock.
	(Delay forMilliseconds: 1) wait.
	second := ChaltenEnvironment millisecondsClock.
	self assert: first equals: second - (second - first)
]

{ #category : 'test accessing time' }
ChaltenCurrentEnvironmentTest >> testSecondsClock [

	| first second |
	first := ChaltenEnvironment secondsClock.
	(Delay forMilliseconds: 1) wait.
	second := ChaltenEnvironment secondsClock.
	self assert: first equals: second - (second - first)
]
