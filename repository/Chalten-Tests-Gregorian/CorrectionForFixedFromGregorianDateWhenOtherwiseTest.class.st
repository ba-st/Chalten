Class {
	#name : #CorrectionForFixedFromGregorianDateWhenOtherwiseTest,
	#superclass : #TestCase,
	#category : #'Chalten-Tests-Gregorian'
}

{ #category : #test }
CorrectionForFixedFromGregorianDateWhenOtherwiseTest >> testValue [

	| correction |

	correction := CorrectionForFixedFromDateBehavior for: May fifteenth, 2005.
	self assert: correction value = 2
]
