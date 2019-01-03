"
A MonthOfYearRule is an inclusion rule for a certain month of year. For example, includes january of 2014.

Instance Variables
	decoratedRule:		<InclusionRule>

decoratedRule
	- A decorated rule.

"
Class {
	#name : #MonthOfYearRule,
	#superclass : #InclusionRule,
	#instVars : [
		'decoratedRule'
	],
	#category : #'Chalten-Core-Filter'
}

{ #category : #'instance creation' }
MonthOfYearRule class >> monthOfYear: aMonthOfYear [

	^self rule: (ObjectInclusionRule for: aMonthOfYear)
]

{ #category : #'instance creation' }
MonthOfYearRule class >> rule: anInclusionRule [

	^self new initializeRule: anInclusionRule
]

{ #category : #accessing }
MonthOfYearRule >> decoratedRule [

	^decoratedRule
]

{ #category : #querying }
MonthOfYearRule >> includes: aDate [

	^decoratedRule includes: aDate monthOfYear
]

{ #category : #initialization }
MonthOfYearRule >> initializeRule: anInclusionRule [

	decoratedRule := anInclusionRule
]

{ #category : #accessing }
MonthOfYearRule >> monthOfYear [

	^decoratedRule object
]

{ #category : #printing }
MonthOfYearRule >> printOn: aStream [

	decoratedRule printOn: aStream
]
