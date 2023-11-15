Class {
	#name : 'MonthRuleTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Core-Tests-Filter',
	#package : 'Chalten-Core-Tests',
	#tag : 'Filter'
}

{ #category : 'test' }
MonthRuleTest >> testAccessing [

	| rule decoratedRule |
	decoratedRule := ObjectInclusionRule for:
		                 (ChaltenEnvironment calendarNamed:
			                  #GregorianCalendar) january.
	rule := MonthRule rule: decoratedRule.
	self assert: rule decoratedRule equals: decoratedRule.
	self assert: rule month equals: January.
	self assert: rule printString equals: decoratedRule printString
]

{ #category : 'test' }
MonthRuleTest >> testIncludes [

	| rule includedDate |

	includedDate := January first, 2006.
	rule := MonthRule month: January.
	self
		assert: (rule includes: includedDate);
		assert: (rule includes: includedDate next);
		deny: (rule includes: (includedDate next: 1 monthMeasure))
]
