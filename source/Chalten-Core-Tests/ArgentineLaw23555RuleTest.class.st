Class {
	#name : 'ArgentineLaw23555RuleTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Core-Tests-Filter',
	#package : 'Chalten-Core-Tests',
	#tag : 'Filter'
}

{ #category : 'testing' }
ArgentineLaw23555RuleTest >> testCreation [
	"The 16 of September move to following Monday.
	
	Monday 19 of September of Year 2005 is including."

	| rule |

	rule := ArgentineLaw23555Rule monthNumber: 9 dayNumber: 16.

	self assert: (rule includes: September nineteenth, 2005)
]

{ #category : 'testing' }
ArgentineLaw23555RuleTest >> testIncludesDayMovesToTheNextMonday [
	"The 02 of April move to following Monday.
	
	Friday 2 of April of Year 2004 is not including and it moves to following Monday.
	Monday 5 of April of Year 2004 is including."

	| rule |

	rule := ArgentineLaw23555Rule dayOfMonth: April second.

	self deny: (rule includes: April second, 2004).
	self assert: (rule includes: April fifth, 2004)
]

{ #category : 'testing' }
ArgentineLaw23555RuleTest >> testIncludesDayMovesToThePreviousMonday [
	"The 02 of April move to previous Monday.
	
	Wednesday 2 of April of Year 2003 is not including and it moves to previous Monday.
	Monday 31 of March of Year 2003 is including."

	| rule |

	rule := ArgentineLaw23555Rule dayOfMonth: April second.

	self deny: (rule includes: April second, 2003).
	self assert: (rule includes: March thirtyfirst, 2003)
]

{ #category : 'testing' }
ArgentineLaw23555RuleTest >> testIncludesDayWhenDayIsMonday [
	"The 02 of April move to Monday.

	  Monday 2 of April of Year 2007 does not move because already it is Monday."

	| rule |

	rule := ArgentineLaw23555Rule dayOfMonth: April second.

	self assert: (rule includes: April second, 2007)
]

{ #category : 'testing' }
ArgentineLaw23555RuleTest >> testIncludesDayWhenDayIsSaturday [
	"The 02 of April move to Monday.

	 Saturday 2 of April of Year 2005 does not move because it is Saturday.
	 Sunday 3 of April of Year 2005 is not including.
	 Monday 4 of April of Year 2005 is not including."

	| rule |

	rule := ArgentineLaw23555Rule dayOfMonth: April second.

	self assert: (rule includes: April second, 2005).
	self deny: (rule includes: April third, 2005).
	self deny: (rule includes: April fourth, 2005)
]

{ #category : 'test' }
ArgentineLaw23555RuleTest >> testPrintOn [

	| rule |
	rule := ArgentineLaw23555Rule monthNumber: 9 dayNumber: 16.
	self
		assert: rule printString
		equals: 'September 16 transferable holiday by Argentine Law 23555'
]
