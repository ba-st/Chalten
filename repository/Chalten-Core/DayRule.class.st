"
A DayRule is an inclusion rule for an specific day. For example, includes all fridays.

Instance Variables
	decoratedRule:		<InclusionRule>

decoratedRule
	- A decorated rule.

"
Class {
	#name : #DayRule,
	#superclass : #InclusionRule,
	#instVars : [
		'decoratedRule'
	],
	#category : #'Chalten-Core-Filter'
}

{ #category : #'instance creation' }
DayRule class >> day: aDay [

	^self rule: (ObjectInclusionRule for: aDay)
]

{ #category : #'instance creation' }
DayRule class >> rule: anInclusionRule [

	^self new initializeRule: anInclusionRule
]

{ #category : #accessing }
DayRule >> day [

	^decoratedRule object
]

{ #category : #accessing }
DayRule >> decoratedRule [

	^decoratedRule
]

{ #category : #querying }
DayRule >> includes: aDate [

	^decoratedRule includes: aDate day
]

{ #category : #initialization }
DayRule >> initializeRule: anInclusionRule [

	decoratedRule := anInclusionRule
]

{ #category : #printing }
DayRule >> printOn: aStream [

	decoratedRule printOn: aStream
]
