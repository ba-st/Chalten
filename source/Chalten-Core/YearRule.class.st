"
A YearRule is an inclusion rule for an specific year. For example, includes the year 2014.

Instance Variables
	decoratedRule:		<InclusionRule>

decoratedRule
	- A decorated rule.

"
Class {
	#name : 'YearRule',
	#superclass : 'InclusionRule',
	#instVars : [
		'decoratedRule'
	],
	#category : 'Chalten-Core-Filter',
	#package : 'Chalten-Core',
	#tag : 'Filter'
}

{ #category : 'instance creation' }
YearRule class >> rule: anInclusionRule [

	^self new initializeRule: anInclusionRule
]

{ #category : 'instance creation' }
YearRule class >> year: aYear [

	^self rule: (ObjectInclusionRule for: aYear)
]

{ #category : 'accessing' }
YearRule >> decoratedRule [

	^decoratedRule
]

{ #category : 'querying' }
YearRule >> includes: aDate [

	^decoratedRule includes: aDate year
]

{ #category : 'initialization' }
YearRule >> initializeRule: anInclusionRule [

	decoratedRule := anInclusionRule
]

{ #category : 'printing' }
YearRule >> printOn: aStream [

	decoratedRule printOn: aStream
]

{ #category : 'accessing' }
YearRule >> year [

	^decoratedRule object
]
