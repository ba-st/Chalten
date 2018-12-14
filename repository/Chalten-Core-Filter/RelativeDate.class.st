"
A RelativeDate is a date relative to a timeline filter given a certain timespan.

Instance Variables
	timelineFilter:		<TimelineFilter>
	timespan:			<TimeSpan>

timeLineFilter
	- The filter used to calculate the absolute date from this relative date.

timespan
	- The timespan.

"
Class {
	#name : #RelativeDate,
	#superclass : #DateBehavior,
	#instVars : [
		'timespan',
		'timelineFilter'
	],
	#category : #'Chalten-Core-Filter'
}

{ #category : #'instance creation' }
RelativeDate class >> timespan: aTimespan using: aTimeLineFilter [
	
	^self new initializeTimespan: aTimespan using: aTimeLineFilter
]

{ #category : #'magnitude protocol' }
RelativeDate >> < aDate [

	^self absoluteDate < aDate
]

{ #category : #comparing }
RelativeDate >> = anObject [

	^self == anObject or: [
		(self class = anObject class and: [self absoluteDate = anObject absoluteDate])
			or: [self absoluteDate = anObject]]
]

{ #category : #accessing }
RelativeDate >> absoluteDate [
	"It is necessary to send #value for not assume that the dates of the time line filter are absolute,
	and also it is necessary to send #value to the timespan in order to obtain a relative timespan"
	
	^(timelineFilter next: timespan value) value
]

{ #category : #converting }
RelativeDate >> asGregorian [

	^self absoluteDate asGregorian
]

{ #category : #converting }
RelativeDate >> asSmalltalkDate [

	^self absoluteDate asSmalltalkDate
]

{ #category : #'accessing datetime' }
RelativeDate >> atTimeOfDay: aTimeOfDay [

	^self absoluteDate atTimeOfDay: aTimeOfDay
]

{ #category : #accessing }
RelativeDate >> calendar [
	
	^self absoluteDate calendar
]

{ #category : #'accessing days' }
RelativeDate >> day [
	
	^self absoluteDate day
]

{ #category : #accessing }
RelativeDate >> dayNumber [
	
	^self absoluteDate dayNumber
]

{ #category : #accessing }
RelativeDate >> dayOfMonth [

	^self absoluteDate dayOfMonth
]

{ #category : #'accessing datetime' }
RelativeDate >> firstTimeOfDay [

	^self absoluteDate firstTimeOfDay
]

{ #category : #comparing }
RelativeDate >> hash [

	^self absoluteDate hash
]

{ #category : #initialization }
RelativeDate >> initializeTimespan: aTimespan using: aTimeLineFilter [
	
	timespan := aTimespan.
	timelineFilter := aTimeLineFilter
]

{ #category : #testing }
RelativeDate >> isFirstDayOfMonth [
	
	^self absoluteDate isFirstDayOfMonth
]

{ #category : #testing }
RelativeDate >> isFirstDayOfYear [

	^self absoluteDate isFirstDayOfYear
]

{ #category : #testing }
RelativeDate >> isLastDayOfMonth [

	^self absoluteDate isLastDayOfMonth
]

{ #category : #testing }
RelativeDate >> isLastDayOfYear [

	^self absoluteDate isLastDayOfYear
]

{ #category : #'accessing datetime' }
RelativeDate >> lastTimeOfDay [

	^self absoluteDate lastTimeOfDay
]

{ #category : #accessing }
RelativeDate >> month [

	^self absoluteDate month
]

{ #category : #accessing }
RelativeDate >> monthOfYear [

	^self absoluteDate monthOfYear
]

{ #category : #enumerating }
RelativeDate >> next: aMeasure [

	^self absoluteDate next: aMeasure
]

{ #category : #'accessing days' }
RelativeDate >> numberOfDaysFromBeginningOfMonth [

	^self absoluteDate numberOfDaysFromBeginningOfMonth
]

{ #category : #'accessing days' }
RelativeDate >> numberOfDaysFromBeginningOfYear [

	^self absoluteDate numberOfDaysFromBeginningOfYear
]

{ #category : #'accessing days' }
RelativeDate >> numberOfDaysFromEpoch [

	^self absoluteDate numberOfDaysFromEpoch
]

{ #category : #'accessing days' }
RelativeDate >> numberOfDaysToEndOfMonth [

	^self absoluteDate numberOfDaysToEndOfMonth
]

{ #category : #'accessing days' }
RelativeDate >> numberOfDaysToEndOfYear [

	^self absoluteDate numberOfDaysToEndOfYear
]

{ #category : #printing }
RelativeDate >> printOn: aStream [

	self absoluteDate printOn: aStream
]

{ #category : #accessing }
RelativeDate >> timelineFilter [

	^timelineFilter
]

{ #category : #accessing }
RelativeDate >> timespan [

	^timespan
]

{ #category : #evaluating }
RelativeDate >> value [

	^self absoluteDate
]

{ #category : #accessing }
RelativeDate >> year [

	^self absoluteDate year
]
