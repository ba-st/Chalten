"
A MonthOfYearRuleTest is xxxxxxxxx.

"
Class {
	#name : 'MonthOfYearRuleTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Core-Tests-Filter',
	#package : 'Chalten-Core-Tests',
	#tag : 'Filter'
}

{ #category : 'test' }
MonthOfYearRuleTest >> testAccessing [

	| rule decoratedRule |
	decoratedRule := ObjectInclusionRule for:
		                 ((ChaltenEnvironment calendarNamed:
			                   #GregorianCalendar) january of: 2014).
	rule := MonthOfYearRule rule: decoratedRule.
	self assert: rule decoratedRule equals: decoratedRule.
	self assert: rule monthOfYear equals: January , 2014.
	self assert: rule printString equals: decoratedRule printString
]

{ #category : 'test' }
MonthOfYearRuleTest >> testIncludes [

	| rule includedDate |

	includedDate := January first, 2006.
	rule := MonthOfYearRule monthOfYear: January, 2006.
	self
		assert: (rule includes: includedDate);
		assert: (rule includes: includedDate next);
		deny: (rule includes: (includedDate next: 1 monthMeasure));
		deny: (rule includes: (includedDate next: 1 yearMeasure))
]
