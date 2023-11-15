"
A YearRuleTest is xxxxxxxxx.

"
Class {
	#name : 'YearRuleTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Core-Tests-Filter',
	#package : 'Chalten-Core-Tests',
	#tag : 'Filter'
}

{ #category : 'test' }
YearRuleTest >> testAccessing [

	| rule decoratedRule |
	decoratedRule := ObjectInclusionRule for: 2014 asGregorianYear.
	rule := YearRule rule: decoratedRule.
	self assert: rule decoratedRule equals: decoratedRule.
	self assert: rule year equals: 2014 asGregorianYear.
	self assert: rule printString equals: decoratedRule printString
]

{ #category : 'test' }
YearRuleTest >> testIncludes [

	| rule includedDate |

	includedDate := January first, 2006.
	rule := YearRule year: 2006 asGregorianYear.
	self
		assert: (rule includes: includedDate);
		assert: (rule includes: includedDate next);
		deny: (rule includes: (includedDate next: 1 yearMeasure))
]
