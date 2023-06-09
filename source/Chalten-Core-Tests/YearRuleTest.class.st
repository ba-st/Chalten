"
A YearRuleTest is xxxxxxxxx.

"
Class {
	#name : #YearRuleTest,
	#superclass : #TestCase,
	#category : #'Chalten-Core-Tests-Filter'
}

{ #category : #test }
YearRuleTest >> testAccessing [

	| rule decoratedRule |

	decoratedRule := ObjectInclusionRule for: 2014 asGregorianYear.
	rule := YearRule rule: decoratedRule.
	self assert: rule decoratedRule = decoratedRule.
	self assert: rule year = 2014 asGregorianYear.
	self assert: rule printString = decoratedRule printString
]

{ #category : #test }
YearRuleTest >> testIncludes [

	| rule includedDate |

	includedDate := January first, 2006.
	rule := YearRule year: 2006 asGregorianYear.
	self
		assert: (rule includes: includedDate);
		assert: (rule includes: includedDate next);
		deny: (rule includes: (includedDate next: 1 gregorianYear))
]
