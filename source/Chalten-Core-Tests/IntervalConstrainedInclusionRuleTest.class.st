Class {
	#name : 'IntervalConstrainedInclusionRuleTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Core-Tests-Filter',
	#package : 'Chalten-Core-Tests',
	#tag : 'Filter'
}

{ #category : 'querying' }
IntervalConstrainedInclusionRuleTest >> includes: aMagnitude [

	^aMagnitude even
]

{ #category : 'test support' }
IntervalConstrainedInclusionRuleTest >> object [

	^self
]

{ #category : 'test' }
IntervalConstrainedInclusionRuleTest >> testFrom [

	| rule |
	rule := IntervalConstrainedInclusionRule on: (1 to: 10) apply: self.
	(2 to: 10 by: 2) do: [ :aNumber |
		self assert: (rule includes: aNumber) ].
	self assert: rule from equals: 1
]

{ #category : 'test' }
IntervalConstrainedInclusionRuleTest >> testIncludes [

	| rule |
	
	rule := IntervalConstrainedInclusionRule on: (1 to: 10) apply: self.
	(2 to: 10 by: 2) do: [ :aNumber | self assert: (rule includes: aNumber) ].
	
	self deny: (rule includes: 1).
	self deny: (rule includes: 0).
	self deny: (rule includes: 11).
	self deny: (rule includes: 12).
	

]

{ #category : 'test' }
IntervalConstrainedInclusionRuleTest >> testInstanceCreation [

	self
		assert:
		(IntervalConstrainedInclusionRule on: (1 to: 10) apply: self)
			interval
		equals: (1 to: 10).
	self
		assert:
		(IntervalConstrainedInclusionRule from: 1 to: 10 apply: self)
			interval
		equals: (1 to: 10).
	self
		assert:
			(IntervalConstrainedInclusionRule on: (1 to: 10) apply: self)
				decoratedRule
		equals: self.
	self
		assert:
			(IntervalConstrainedInclusionRule from: 1 to: 10 apply: self)
				decoratedRule
		equals: self
]

{ #category : 'test' }
IntervalConstrainedInclusionRuleTest >> testObject [

	| rule |
	rule := IntervalConstrainedInclusionRule on: (1 to: 10) apply: self.
	(2 to: 10 by: 2) do: [ :aNumber |
		self assert: (rule includes: aNumber) ].
	self assert: rule object equals: self
]

{ #category : 'test' }
IntervalConstrainedInclusionRuleTest >> testPrintString [

	self
		assert:
			(IntervalConstrainedInclusionRule on: (1 to: 10) apply: self)
				printString
		equals: ('From: 1 to: 10 -> <1s>' expandMacrosWith: self printString)
]

{ #category : 'test' }
IntervalConstrainedInclusionRuleTest >> testTo [

	| rule |
	rule := IntervalConstrainedInclusionRule on: (1 to: 10) apply: self.
	(2 to: 10 by: 2) do: [ :aNumber |
		self assert: (rule includes: aNumber) ].
	self assert: rule to equals: 10
]
