"
A HebrewLastMonthNumberInYearBehavior is an abtract class used to determinate the last month number in an hebrew year.

"
Class {
	#name : 'HebrewLastMonthNumberInYearBehavior',
	#superclass : 'Object',
	#category : 'Chalten-Hebrew-Calendar',
	#package : 'Chalten-Hebrew-Calendar'
}

{ #category : 'testing' }
HebrewLastMonthNumberInYearBehavior class >> canHandle: aYear [

	self subclassResponsibility
]

{ #category : 'instance creation' }
HebrewLastMonthNumberInYearBehavior class >> for: aYear [

	| handleClass |

	handleClass := self subclasses detect: [:eachSubclass | eachSubclass canHandle: aYear].
	^handleClass new
]

{ #category : 'evaluating' }
HebrewLastMonthNumberInYearBehavior >> value [

	self subclassResponsibility
]
