"
A HebrewNewYearDelay is an abstract class used to determinate the delay for a new hebrew year.

"
Class {
	#name : #HebrewNewYearDelay,
	#superclass : #Object,
	#category : #'Chalten-Core-Hebrew'
}

{ #category : #testing }
HebrewNewYearDelay class >> canHandle: aYearNumber [

	self subclassResponsibility
]

{ #category : #'instance creation' }
HebrewNewYearDelay class >> for: aYear [

	| delayClass |

	delayClass := self subclasses detect: [:eachSubclass | eachSubclass canHandle: aYear].
	^delayClass new
]

{ #category : #evaluating }
HebrewNewYearDelay >> value [

	self subclassResponsibility
]
