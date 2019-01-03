Class {
	#name : #DateRuleTest,
	#superclass : #TestCase,
	#category : #'Chalten-Core-Tests-Filter'
}

{ #category : #test }
DateRuleTest >> testAccessing [

	| rule decoratedRule |

	decoratedRule := ObjectInclusionRule for: May fourth, 2014.
	rule := DateRule rule: decoratedRule.
	self assert: rule date = (May fourth, 2014).
	self assert: rule decoratedRule = decoratedRule.
	self assert: rule printString = decoratedRule printString
]

{ #category : #test }
DateRuleTest >> testIncludes [

	| rule includedDate |

	includedDate := January first, 2006.
	rule := DateRule date: includedDate.
	self
		assert: (rule includes: includedDate);
		deny: (rule includes: includedDate next)
]
