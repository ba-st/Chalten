Class {
	#name : 'DayOfMonthRuleTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Core-Tests-Filter',
	#package : 'Chalten-Core-Tests',
	#tag : 'Filter'
}

{ #category : 'test' }
DayOfMonthRuleTest >> testAccessing [

	| rule decoratedRule |
	decoratedRule := ObjectInclusionRule for: January first.
	rule := DayOfMonthRule rule: decoratedRule.
	self assert: rule dayOfMonth equals: January first.
	self assert: rule decoratedRule equals: decoratedRule.
	self assert: rule printString equals: decoratedRule printString
]

{ #category : 'test' }
DayOfMonthRuleTest >> testIncludes [

	| rule includedDate |

	includedDate := January first, 2006.
	rule := DayOfMonthRule dayOfMonth: January first.
	self
		assert: (rule includes: includedDate);
		deny: (rule includes: includedDate next)
]
