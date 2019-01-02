Class {
	#name : #CorrectionForFixedFromGregorianDateWhenOtherwiseTest,
	#superclass : #TestCase,
	#category : #'Chalten-Gregorian-Calendar-Tests'
}

{ #category : #test }
CorrectionForFixedFromGregorianDateWhenOtherwiseTest >> testValue [

	| correction |

	correction := CorrectionForFixedFromDateBehavior for: May fifteenth, 2005.
	self assert: correction value = 2
]
