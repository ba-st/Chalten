"
A MonthRule is an inclusion rule for an specific month. For example, includes all januaries.

Instance Variables
	decoratedRule:		<InclusionRule>

decoratedRule
	- A decorated rule.

"
Class {
	#name : #MonthRule,
	#superclass : #InclusionRule,
	#instVars : [
		'decoratedRule'
	],
	#category : #'Chalten-Core-Filter'
}

{ #category : #'instance creation' }
MonthRule class >> month: aMonth [

	^self rule: (ObjectInclusionRule for: aMonth)
]

{ #category : #'instance creation' }
MonthRule class >> rule: anInclusionRule [

	^self new initializeRule: anInclusionRule
]

{ #category : #accessing }
MonthRule >> decoratedRule [

	^decoratedRule
]

{ #category : #querying }
MonthRule >> includes: aDate [

	^decoratedRule includes: aDate month
]

{ #category : #initialization }
MonthRule >> initializeRule: anInclusionRule [

	decoratedRule := anInclusionRule
]

{ #category : #accessing }
MonthRule >> month [

	^decoratedRule object
]

{ #category : #printing }
MonthRule >> printOn: aStream [

	decoratedRule printOn: aStream
]
