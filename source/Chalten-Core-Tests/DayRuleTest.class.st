Class {
	#name : 'DayRuleTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Core-Tests-Filter',
	#package : 'Chalten-Core-Tests',
	#tag : 'Filter'
}

{ #category : 'test' }
DayRuleTest >> testAccessing [

	| rule decoratedRule |
	decoratedRule := ObjectInclusionRule for:
		                 (ChaltenEnvironment calendarNamed:
			                  #GregorianCalendar) friday.
	rule := DayRule rule: decoratedRule.
	self assert: rule day equals: Friday.
	self assert: rule decoratedRule equals: decoratedRule.
	self assert: rule printString equals: decoratedRule printString
]

{ #category : 'test' }
DayRuleTest >> testIncludes [

	| rule includedDate |

	includedDate := January first, 2006.
	rule := DayRule day:  Sunday.
	self
		assert: (rule includes: includedDate);
		deny: (rule includes: includedDate next)
]
