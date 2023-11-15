"
A DayOfMonthRule is an inclusion rule for certain day of month. For example, July 2nd.

Instance Variables
	decoratedRule:		<InclusionRule>

decoratedRule
	- A decorated rule.

"
Class {
	#name : 'DayOfMonthRule',
	#superclass : 'InclusionRule',
	#instVars : [
		'decoratedRule'
	],
	#category : 'Chalten-Core-Filter',
	#package : 'Chalten-Core',
	#tag : 'Filter'
}

{ #category : 'instance creation' }
DayOfMonthRule class >> dayOfMonth: aDayOfMonth [

	^self rule: (ObjectInclusionRule for: aDayOfMonth)
]

{ #category : 'instance creation' }
DayOfMonthRule class >> rule: anInclusionRule [

	^self new initializeRule: anInclusionRule
]

{ #category : 'accessing' }
DayOfMonthRule >> dayOfMonth [

	^decoratedRule object
]

{ #category : 'accessing' }
DayOfMonthRule >> decoratedRule [

	^decoratedRule
]

{ #category : 'querying' }
DayOfMonthRule >> includes: aDate [

	| date |
	
	date := decoratedRule object calendar convert: aDate.
	^decoratedRule includes: date dayOfMonth
]

{ #category : 'initialization' }
DayOfMonthRule >> initializeRule: anInclusionRule [

	decoratedRule := anInclusionRule
]

{ #category : 'printing' }
DayOfMonthRule >> printOn: aStream [

	decoratedRule printOn: aStream
]
