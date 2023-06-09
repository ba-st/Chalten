"
A TimelineStream is a stream used with timeline filters.

Instance Variables
	current:			<PointInTime>
	from:				<PointInTime>
	timelineFilter:		<TimelineFilter>

current
	- The current point in time.

from
	- The starting point in time.

timelineFilter
	- The filter.

"
Class {
	#name : #TimelineStream,
	#superclass : #Stream,
	#instVars : [
		'from',
		'current',
		'timelineFilter'
	],
	#category : #'Chalten-Core-Filter'
}

{ #category : #'instance creation' }
TimelineStream class >> from: aDate using: aTimeLineFilter [

	^self new initializeFrom: aDate using: aTimeLineFilter
]

{ #category : #'instance creation' }
TimelineStream class >> new [

	^self basicNew
]

{ #category : #querying }
TimelineStream >> atEnd [
	
	^false
]

{ #category : #accessing }
TimelineStream >> current [

	^current
]

{ #category : #initialization }
TimelineStream >> initializeFrom: aDate using: aTimeLineFilter [

	from := aDate.
	timelineFilter := aTimeLineFilter.
	self reset
]

{ #category : #enumerating }
TimelineStream >> next [
	
	current := self peek.	
	^current.

]

{ #category : #enumerating }
TimelineStream >> peek [
	
	| currentDate |
	
	currentDate := current.
	[ currentDate := currentDate next.
	(timelineFilter includes: currentDate) ] whileFalse.

	^currentDate
]

{ #category : #enumerating }
TimelineStream >> peekPrevious [
	
	| nextDate |
	
	nextDate := current.
	[ nextDate := nextDate previous.
	(timelineFilter includes: nextDate) ] whileFalse.

	^nextDate
]

{ #category : #enumerating }
TimelineStream >> previous [
	
	current := self peekPrevious.	
	^current.

]

{ #category : #enumerating }
TimelineStream >> reset [
	current := from.
	
]

{ #category : #enumerating }
TimelineStream >> skip: aNumberOfDays [

	| daysToSkip |
	
	daysToSkip := (aNumberOfDays convertTo: timelineFilter calendar dayUnit) amount.
	daysToSkip > 0 
		ifTrue: [ daysToSkip timesRepeat: [ self next ] ]
		ifFalse: [ daysToSkip negated timesRepeat: [ self previous ] ]
]
