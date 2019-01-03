Class {
	#name : #MonthRuleTest,
	#superclass : #TestCase,
	#category : #'Chalten-Core-Tests-Filter'
}

{ #category : #test }
MonthRuleTest >> testAccessing [

	| rule decoratedRule |

	decoratedRule := ObjectInclusionRule for: GregorianCalendar january.
	rule := MonthRule rule: decoratedRule.
	self assert: rule decoratedRule = decoratedRule.
	self assert: rule month = January.
	self assert: rule printString = decoratedRule printString
]

{ #category : #test }
MonthRuleTest >> testIncludes [

	| rule includedDate |

	includedDate := January first, 2006.
	rule := MonthRule month: January.
	self
		assert: (rule includes: includedDate);
		assert: (rule includes: includedDate next);
		deny: (rule includes: (includedDate next: 1 monthMeasure))
]
