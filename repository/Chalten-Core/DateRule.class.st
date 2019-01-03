"
A DateRule is an inclusion rule for an specific date. For example, includes May 4th, 2104.

Instance Variables
	decoratedRule:		<InclusionRule>

decoratedRule
	- A decorated rule.

"
Class {
	#name : #DateRule,
	#superclass : #InclusionRule,
	#instVars : [
		'decoratedRule'
	],
	#category : #'Chalten-Core-Filter'
}

{ #category : #'instance creation' }
DateRule class >> date: aDate [

	^self rule: (ObjectInclusionRule for: aDate)
]

{ #category : #'instance creation' }
DateRule class >> rule: anInclusionRule [

	^self new initializeRule: anInclusionRule
]

{ #category : #accessing }
DateRule >> date [

	^decoratedRule object
]

{ #category : #accessing }
DateRule >> decoratedRule [

	^decoratedRule
]

{ #category : #querying }
DateRule >> includes: aDate [

	^decoratedRule includes: aDate
]

{ #category : #initialization }
DateRule >> initializeRule: anInclusionRule [

	decoratedRule := anInclusionRule
]

{ #category : #printing }
DateRule >> printOn: aStream [

	decoratedRule printOn: aStream
]
