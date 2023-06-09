"
A TimelineFilterBehavior is an abstract class wich defines common protocol for timeline filters.

"
Class {
	#name : #TimelineFilterBehavior,
	#superclass : #Object,
	#category : #'Chalten-Core-Filter'
}

{ #category : #accessing }
TimelineFilterBehavior >> calendar [
	
	self subclassResponsibility 
]

{ #category : #enumerating }
TimelineFilterBehavior >> daysBetween: aDate and: anotherDate [

	^(aDate to: anotherDate) select: [:date | self includes: date]
]

{ #category : #'querying - excluded' }
TimelineFilterBehavior >> excludedFrom: aDate to: anotherDate [

	^self negated includedFrom: aDate to: anotherDate
]

{ #category : #'querying - excluded' }
TimelineFilterBehavior >> excludedIn: anInterval [

	^self negated includedIn: anInterval
]

{ #category : #'querying - excluded' }
TimelineFilterBehavior >> excludes: aDate [

	^self negated includes: aDate
]

{ #category : #'querying - excluded' }
TimelineFilterBehavior >> excludesAll: aCollection [

	^self negated includesAll: aCollection
]

{ #category : #'querying - included' }
TimelineFilterBehavior >> includedFrom: aDate to: anotherDate [

	^self includedIn: (aDate to: anotherDate)
]

{ #category : #'querying - included' }
TimelineFilterBehavior >> includedIn: anInterval [

	^anInterval select: [:each | self includes: each]
]

{ #category : #'querying - included' }
TimelineFilterBehavior >> includes: aDate [

	self subclassResponsibility
]

{ #category : #'querying - included' }
TimelineFilterBehavior >> includesAll: aCollection [

	^aCollection allSatisfy: [:each | self includes: each]
]

{ #category : #accessing }
TimelineFilterBehavior >> name [

	self subclassResponsibility
]

{ #category : #accessing }
TimelineFilterBehavior >> negated [
	self subclassResponsibility
]

{ #category : #enumerating }
TimelineFilterBehavior >> next: aTimespan [

	| stream |
	
	stream := TimelineStream from: aTimespan from using: self.
	stream skip: aTimespan duration.
	^stream current
]

{ #category : #'querying - included' }
TimelineFilterBehavior >> numberOfDaysBetween: aDate and: anotherDate [

	^Measure amount: (self daysBetween: aDate and: anotherDate) size unit: self calendar dayUnit
]

{ #category : #printing }
TimelineFilterBehavior >> printOn: aStream [

	aStream nextPutAll: self name
]

{ #category : #enumerating }
TimelineFilterBehavior >> streamFrom: aDate [

	^TimelineStream from: aDate using: self
]
