"
A HebrewElapsedDaysInYearCorrectionBehavior is an abstract class for corrections nedded when we are converting a date from and to an hebrew date.

"
Class {
	#name : 'HebrewElapsedDaysInYearCorrectionBehavior',
	#superclass : 'Object',
	#category : 'Chalten-Hebrew-Calendar',
	#package : 'Chalten-Hebrew-Calendar'
}

{ #category : 'testing' }
HebrewElapsedDaysInYearCorrectionBehavior class >> basicCanHandle: anAmountOfDays [

	^(3 * (anAmountOfDays + 1) \\ 7) < 3
]

{ #category : 'testing' }
HebrewElapsedDaysInYearCorrectionBehavior class >> canHandle: anAmountOfDays [

	self subclassResponsibility
]

{ #category : 'instance creation' }
HebrewElapsedDaysInYearCorrectionBehavior class >> for: anAmountOfdays [

	| handleClass |

	handleClass := self subclasses detect: [:eachSubclass | eachSubclass canHandle: anAmountOfdays].
	^handleClass new
]

{ #category : 'evaluating' }
HebrewElapsedDaysInYearCorrectionBehavior >> value [

	self subclassResponsibility
]
