Class {
	#name : #IntervalConstrainedInclusionRuleTest,
	#superclass : #TestCase,
	#category : #'Chalten-Core-Tests-Filter'
}

{ #category : #querying }
IntervalConstrainedInclusionRuleTest >> includes: aMagnitude [

	^aMagnitude even
]

{ #category : #'test support' }
IntervalConstrainedInclusionRuleTest >> object [

	^self
]

{ #category : #test }
IntervalConstrainedInclusionRuleTest >> testFrom [

	| rule |
	
	rule := IntervalConstrainedInclusionRule on: (1 to: 10) apply: self.
	(2 to: 10 by: 2) do: [ :aNumber | self assert: (rule includes: aNumber) ].
	
	self assert: rule from = 1

]

{ #category : #test }
IntervalConstrainedInclusionRuleTest >> testIncludes [

	| rule |
	
	rule := IntervalConstrainedInclusionRule on: (1 to: 10) apply: self.
	(2 to: 10 by: 2) do: [ :aNumber | self assert: (rule includes: aNumber) ].
	
	self deny: (rule includes: 1).
	self deny: (rule includes: 0).
	self deny: (rule includes: 11).
	self deny: (rule includes: 12).
	

]

{ #category : #test }
IntervalConstrainedInclusionRuleTest >> testInstanceCreation [

	self assert: (IntervalConstrainedInclusionRule on: (1 to: 10) apply: self) interval = (1 to: 10).
	self assert: (IntervalConstrainedInclusionRule from: 1 to: 10 apply: self) interval = (1 to: 10).

	self assert: (IntervalConstrainedInclusionRule on: (1 to: 10) apply: self) decoratedRule = self.
	self assert: (IntervalConstrainedInclusionRule from: 1 to: 10 apply: self) decoratedRule = self
]

{ #category : #test }
IntervalConstrainedInclusionRuleTest >> testObject [

	| rule |
	
	rule := IntervalConstrainedInclusionRule on: (1 to: 10) apply: self.
	(2 to: 10 by: 2) do: [ :aNumber | self assert: (rule includes: aNumber) ].
	
	self assert: rule object = self

]

{ #category : #test }
IntervalConstrainedInclusionRuleTest >> testPrintString [

	self assert: (IntervalConstrainedInclusionRule on: (1 to: 10) apply: self) printString = 'From: 1 to: 10 -> IntervalConstrainedInclusionRuleTest>>#testPrintString'
]

{ #category : #test }
IntervalConstrainedInclusionRuleTest >> testTo [

	| rule |
	
	rule := IntervalConstrainedInclusionRule on: (1 to: 10) apply: self.
	(2 to: 10 by: 2) do: [ :aNumber | self assert: (rule includes: aNumber) ].
	
	self assert: rule to = 10

]
