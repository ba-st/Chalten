Class {
	#name : 'ObjectInclusionRuleTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Core-Tests-Filter',
	#package : 'Chalten-Core-Tests',
	#tag : 'Filter'
}

{ #category : 'testing' }
ObjectInclusionRuleTest >> testAccessing [

	| rule |
	rule := ObjectInclusionRule for: 1.
	self assert: rule object equals: 1
]

{ #category : 'testing' }
ObjectInclusionRuleTest >> testIncludes [

	| rule |
	
	rule := ObjectInclusionRule for: 1.
	
	self assert: (rule includes: 1).
	self deny: (rule includes: 2)
]

{ #category : 'testing' }
ObjectInclusionRuleTest >> testPrintOn [

	self assert: (ObjectInclusionRule for: 1) printString notNil
]
