"
In the human context, we often refer to dates and moments in time without much additional context.
For example, we might say that we bought something on May third, 2025 at 3:00 pm. However, that
date implicitly carries some context - specifically, the place where the purchase was made. If the 
purchase was made in Argentina, that moment in time is not the same as it were made in France.
That's why, in a computational system, it's important to differentiate and add precision to such cases.

This implementation defines a continuous and universal timeline, where each instant on that timeline is
comparable to any other, and we can establish a total ordering between any pair of moments. In that
context, we define an `Instant` as a specific moment on that continuous timeline. It is a particular point
within the flow of time, representing a junction or position with no duration (a concrete point on that line).

To represent these absolute points in time, we need a reference, and most often the Unix epoch is used for
this purpose (although it could be any other instant, theoretically). In this implementation our fixed point, 
then, will be January 1st, 1970 at 00:00:00 UTC, and any other moment in time will be modeled as a number
of microseconds forward or backward from that instant.
"
Class {
	#name : 'Instant',
	#superclass : 'AbsolutePointInTime',
	#instVars : [
		'microsecondsSinceEpoch'
	],
	#classVars : [
		'Epoch'
	],
	#category : 'Chalten-Core',
	#package : 'Chalten-Core'
}

{ #category : 'instance creation' }
Instant class >> daysSinceEpoch: daysSinceEpoch [

  ^ self microsecondsSinceEpoch: ( daysSinceEpoch convertTo: self microsecond )
]

{ #category : 'instance creation' }
Instant class >> epoch [

  ^ Epoch
]

{ #category : 'instance creation' }
Instant class >> fromJulianDayNumber: aJulianDayNumber [

  ^ self secondsSinceEpoch: aJulianDayNumber - self julianDayNumberOfEpoch * self day
]

{ #category : 'instance creation' }
Instant class >> fromUnixTime: numberOfSecondsSinceEpoch [

  ^ self secondsSinceEpoch: numberOfSecondsSinceEpoch * self second
]

{ #category : 'class initialization' }
Instant class >> initialize [

  <ignoreForCoverage>
  Epoch := self microsecondsSinceEpoch: 0 * self microsecond
]

{ #category : 'private - accessing' }
Instant class >> julianDayNumberOfEpoch [

  ^ 2440587 + ( 1 / 2 )
]

{ #category : 'accessing' }
Instant class >> microsecond [

  ^ InternationalSystemOfUnits units >> #microsecond
]

{ #category : 'instance creation' }
Instant class >> microsecondsSinceEpoch: microsecondsSinceEpoch [

  ^ self new initializeMicrosecondsSinceEpoch: microsecondsSinceEpoch
]

{ #category : 'accessing' }
Instant class >> millisecond [

  ^ InternationalSystemOfUnits units >> #millisecond
]

{ #category : 'instance creation' }
Instant class >> now [

  | microsecondsSinceJanuaryFirst1901 microsecondsBetweenJanuaryFirst1901andJanuaryFirst1970 |
  microsecondsSinceJanuaryFirst1901 := Time microsecondClockValue.
  microsecondsBetweenJanuaryFirst1901andJanuaryFirst1970 := 2177452800000000.
  ^ self microsecondsSinceEpoch:
      microsecondsSinceJanuaryFirst1901 - microsecondsBetweenJanuaryFirst1901andJanuaryFirst1970
      * self microsecond
]

{ #category : 'accessing' }
Instant class >> second [

  ^ InternationalSystemOfUnits units >> #second
]

{ #category : 'instance creation' }
Instant class >> secondsSinceEpoch: secondsSinceEpoch [

  ^ self microsecondsSinceEpoch: ( secondsSinceEpoch convertTo: self microsecond )
]

{ #category : 'converting' }
Instant >> asGregorianDateTimeIn: aTimeOffsetRuleset [

  ^ TimeOffsetAwareGregorianDateTime basedOn: self accordingTo: aTimeOffsetRuleset
]

{ #category : 'converting' }
Instant >> asGregorianDateTimeInCoordinatedUniversalTime [

  ^ TimeOffsetAwareGregorianDateTime at: self
]

{ #category : 'converting' }
Instant >> asInstant [

  ^ self
]

{ #category : 'converting' }
Instant >> asUnixTime [

  ^ self secondsSinceEpoch truncated numericalValue
]

{ #category : 'accessing' }
Instant >> daysSinceEpoch [

  ^ microsecondsSinceEpoch convertTo: self class day
]

{ #category : 'initialization' }
Instant >> initializeMicrosecondsSinceEpoch: microsecondsOffsetSinceEpoch [

  microsecondsSinceEpoch := microsecondsOffsetSinceEpoch
]

{ #category : 'private - accessing' }
Instant >> julianDayNumber [

  | julianDayNumberOfEpoch |
  julianDayNumberOfEpoch := self julianDayNumberOfEpoch.
  ^ julianDayNumberOfEpoch + self daysSinceEpoch numericalValue
]

{ #category : 'private - accessing' }
Instant >> julianDayNumberOfEpoch [
	^ self class julianDayNumberOfEpoch
]

{ #category : 'accessing' }
Instant >> microsecondsSinceEpoch [

	^ microsecondsSinceEpoch
]

{ #category : 'accessing' }
Instant >> milisecondsSinceEpoch [

  ^ microsecondsSinceEpoch convertTo: self class millisecond
]

{ #category : 'instance creation' }
Instant >> next: timePeriod [

  ^ self class microsecondsSinceEpoch:
      microsecondsSinceEpoch + ( timePeriod convertTo: self class microsecond )
]

{ #category : 'instance creation' }
Instant >> previous: timePeriod [

  ^ self class microsecondsSinceEpoch:
      microsecondsSinceEpoch - ( timePeriod convertTo: self class microsecond )
]

{ #category : 'printing' }
Instant >> printOn: stream [

  self printYearMonthDateOn: stream.
  self printTimeOfDayOn: stream.
  stream nextPut: $Z
]

{ #category : 'accessing' }
Instant >> secondsSinceEpoch [

  ^ microsecondsSinceEpoch convertTo: self class second
]

{ #category : 'private - converting' }
Instant >> withTimeOfDayDo: aBlock [

  | difference |
  difference := microsecondsSinceEpoch - self daysSinceEpoch truncated.
  ^ aBlock value: ( difference positive
          then: [ TimeOfDay offsetFromStartOfDay: difference ]
          otherwise: [ TimeOfDay offsetFromStartOfDay: difference + ( self class day * 1 ) ] )
]
