"
A PointInTime is a representation of certain time entity. This time entities are points in a line, a line that represents the passing time. The observers of that line can zoom in and out the points it contains. When the observer zooms in he sees smaller points (i.e. dates), when the observer zooms out he sees bigger points (i.e. years). We say that the timeline has different scales or that timelines of different scale can represent the passing time.

"
Class {
	#name : 'PointInTime',
	#superclass : 'IntervalAwareMagnitude',
	#category : 'Chalten-Core-Time',
	#package : 'Chalten-Core',
	#tag : 'Time'
}

{ #category : 'querying' }
PointInTime >> absoluteDistanceTo: aPointInTime [

	^(self distanceTo: aPointInTime) abs
	

]

{ #category : 'magnitude protocol' }
PointInTime >> assertIsSameKindAs: aPointInTime [

	(aPointInTime isKindOf: self class)
		ifFalse: [ InvalidComparisonBetweenPointsInTimeException
			signalWith: self
			and: aPointInTime ]
]

{ #category : 'querying' }
PointInTime >> distanceFrom: aPointInTime [

	^aPointInTime distanceTo: self
]

{ #category : 'querying' }
PointInTime >> distanceTo: aPointInTime [

	self subclassResponsibility
]

{ #category : 'enumerating' }
PointInTime >> next [
	
	^self next: self defaultIntervalIncrement
]

{ #category : 'enumerating' }
PointInTime >> next: aMeasure [
	self subclassResponsibility
]

{ #category : 'enumerating' }
PointInTime >> previous [
	
	^self previous: self defaultIntervalIncrement
]

{ #category : 'enumerating' }
PointInTime >> previous: aMeasure [ 
	
	^self next: aMeasure negated
]

{ #category : 'interval protocol' }
PointInTime >> toTheBeginningOfTime [

	^self toTheBeginningOfTimeBy: self defaultIntervalIncrement
]

{ #category : 'interval protocol' }
PointInTime >> toTheBeginningOfTimeBy: anIncrement [

	^ArithmeticObjectInterval
		from: self
		to: TheBeginningOfTime
		by: anIncrement
		intervalStrategy: InfinityIntervalStrategy new
]

{ #category : 'interval protocol' }
PointInTime >> toTheEndOfTime [

	^self toTheEndOfTimeBy: self defaultIntervalIncrement
]

{ #category : 'interval protocol' }
PointInTime >> toTheEndOfTimeBy: anIncrement [

	^ArithmeticObjectInterval
		from: self
		to: TheEndOfTime
		by: anIncrement
		intervalStrategy: InfinityIntervalStrategy new
]
