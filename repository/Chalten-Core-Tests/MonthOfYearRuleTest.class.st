"
A MonthOfYearRuleTest is xxxxxxxxx.

"
Class {
	#name : #MonthOfYearRuleTest,
	#superclass : #TestCase,
	#category : #'Chalten-Core-Tests-Filter'
}

{ #category : #test }
MonthOfYearRuleTest >> testAccessing [

	| rule decoratedRule |

	decoratedRule := ObjectInclusionRule for: (GregorianCalendar january of: 2014).
	rule := MonthOfYearRule rule: decoratedRule.
	self assert: rule decoratedRule = decoratedRule.
	self assert: rule monthOfYear = (January, 2014).
	self assert: rule printString = decoratedRule printString
]

{ #category : #test }
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
