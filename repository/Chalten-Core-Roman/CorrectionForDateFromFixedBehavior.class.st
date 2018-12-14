"
A CorrectionForDateFromFixedBehavior is an abstract class for corrections made when conversions between calendars are needed.

"
Class {
	#name : #CorrectionForDateFromFixedBehavior,
	#superclass : #Object,
	#category : #'Chalten-Core-Roman'
}

{ #category : #testing }
CorrectionForDateFromFixedBehavior class >> canHandle: aYearNumber fixed: aNumber using: aCalendar [

	self subclassResponsibility
]

{ #category : #'accessing - private' }
CorrectionForDateFromFixedBehavior class >> firstOfMarchOf: aYearNumber in: aCalendar [

	^aCalendar march first , aYearNumber
]

{ #category : #'instance creation' }
CorrectionForDateFromFixedBehavior class >> for: aYearNumber fixed: aNumber using: aCalendar [

	| handleClass |

	handleClass :=
		self subclasses detect: [:eachSubclass |
			eachSubclass canHandle: aYearNumber fixed: aNumber using: aCalendar].
	^handleClass new
]

{ #category : #evaluating }
CorrectionForDateFromFixedBehavior >> value [

	self subclassResponsibility
]
