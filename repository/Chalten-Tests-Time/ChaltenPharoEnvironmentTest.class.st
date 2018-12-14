Class {
	#name : #ChaltenPharoEnvironmentTest,
	#superclass : #TestCase,
	#instVars : [
		'environment'
	],
	#category : #'Chalten-Tests-Time'
}

{ #category : #'initailize-release' }
ChaltenPharoEnvironmentTest >> setUp [

	super setUp.
	environment := ChaltenPharoEnvironment new
]

{ #category : #'initailize-release' }
ChaltenPharoEnvironmentTest >> tearDown [

	super tearDown.
	environment := nil
]

{ #category : #'test testing' }
ChaltenPharoEnvironmentTest >> testIsForCurrentPlatform [

	self assert: ChaltenPharoEnvironment isForCurrentPlatform
]

{ #category : #'test accessing time' }
ChaltenPharoEnvironmentTest >> testLocalTimeOffset [

	self assert: environment localTimeOffset = (environment primOffset // 60)
]

{ #category : #'test accessing time' }
ChaltenPharoEnvironmentTest >> testMicrosecondsClock [

	| first second |
	first := environment microsecondsClock.
	(Delay forMilliseconds: 1) wait.
	second := environment microsecondsClock.
	self assert: first = (second - (second -first))
]

{ #category : #'test accessing time' }
ChaltenPharoEnvironmentTest >> testMillisecondsClock [

	| first second |
	first := environment millisecondsClock.
	(Delay forMilliseconds: 1) wait.
	second := environment millisecondsClock.
	self assert: first = (second - (second -first))
]

{ #category : #'test accessing time' }
ChaltenPharoEnvironmentTest >> testSecondsClock [

	| first second |
	first := environment secondsClock.
	(Delay forMilliseconds: 1) wait.
	second := environment secondsClock.
	self assert: first = (second - (second -first))
]
