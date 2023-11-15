Class {
	#name : 'DateRuleTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Core-Tests-Filter',
	#package : 'Chalten-Core-Tests',
	#tag : 'Filter'
}

{ #category : 'test' }
DateRuleTest >> testAccessing [

	| rule decoratedRule |
	decoratedRule := ObjectInclusionRule for: May fourth , 2014.
	rule := DateRule rule: decoratedRule.
	self assert: rule date equals: May fourth , 2014.
	self assert: rule decoratedRule equals: decoratedRule.
	self assert: rule printString equals: decoratedRule printString
]

{ #category : 'test' }
DateRuleTest >> testIncludes [

	| rule includedDate |

	includedDate := January first, 2006.
	rule := DateRule date: includedDate.
	self
		assert: (rule includes: includedDate);
		deny: (rule includes: includedDate next)
]
