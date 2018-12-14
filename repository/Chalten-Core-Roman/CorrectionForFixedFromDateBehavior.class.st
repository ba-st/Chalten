"
A CorrectionForFixedFromDateBehavior is an abstract class for corrections made when conversions between calendars are needed.


"
Class {
	#name : #CorrectionForFixedFromDateBehavior,
	#superclass : #Object,
	#category : #'Chalten-Core-Roman'
}

{ #category : #testing }
CorrectionForFixedFromDateBehavior class >> canHandle: aChristianDate [

	self subclassResponsibility
]

{ #category : #'instance creation' }
CorrectionForFixedFromDateBehavior class >> for: aChristianDate [

	| handleClass |

	handleClass := self subclasses detect: [:eachSubclass | eachSubclass canHandle: aChristianDate].
	^handleClass new
]

{ #category : #evaluating }
CorrectionForFixedFromDateBehavior >> value [

	self subclassResponsibility
]
