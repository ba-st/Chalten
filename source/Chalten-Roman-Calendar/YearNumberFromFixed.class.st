"
A YearNumberFromFixed is an abstract class used to create a year from a number.

"
Class {
	#name : 'YearNumberFromFixed',
	#superclass : 'Object',
	#category : 'Chalten-Roman-Calendar',
	#package : 'Chalten-Roman-Calendar'
}

{ #category : 'testing' }
YearNumberFromFixed class >> canHandle: aCalendar [

	self subclassResponsibility
]

{ #category : 'instance creation' }
YearNumberFromFixed class >> for: aNumberOfDays using: aCalendar [

	| handleClass |

	handleClass := self subclasses detect: [:eachSubclass | eachSubclass canHandle: aCalendar].
	^handleClass new initializeFor: aNumberOfDays using: aCalendar
]

{ #category : 'initialization' }
YearNumberFromFixed >> initializeFor: aNumberOfDays using: aCalendar [

	self subclassResponsibility
]
