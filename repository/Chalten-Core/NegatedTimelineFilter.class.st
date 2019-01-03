"
A NegatedTimelineFilter is a timeline filter negated.

Instance Variables
	originalTimelineFilter:		<TimelineFilter>

originalTimelineFilter
	- The oginal timeline filter.

"
Class {
	#name : #NegatedTimelineFilter,
	#superclass : #TimelineFilterBehavior,
	#instVars : [
		'originalTimelineFilter'
	],
	#category : #'Chalten-Core-Filter'
}

{ #category : #'instance creation' }
NegatedTimelineFilter class >> for: aTimeLineFilter [

	^self new initializeFor: aTimeLineFilter
]

{ #category : #'querying - included' }
NegatedTimelineFilter >> includes: aDate [

	^(originalTimelineFilter includes: aDate) not
]

{ #category : #initialization }
NegatedTimelineFilter >> initializeFor: aTimeLineFilter [

	originalTimelineFilter := aTimeLineFilter
]

{ #category : #accessing }
NegatedTimelineFilter >> name [

	^originalTimelineFilter name
]

{ #category : #accessing }
NegatedTimelineFilter >> negated [
	
	^originalTimelineFilter
]
