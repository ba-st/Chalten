Class {
	#name : 'TimeSpanTest',
	#superclass : 'TestCase',
	#instVars : [
		'midnight',
		'noon',
		'oneHour',
		'twelveHours',
		'twoSeconds'
	],
	#category : 'Chalten-Core-Tests-Time',
	#package : 'Chalten-Core-Tests',
	#tag : 'Time'
}

{ #category : 'initialization' }
TimeSpanTest >> setUp [
	midnight := TimeOfDay midnight.
	noon := TimeOfDay noon.
	oneHour := 1 hourMeasure.
	twelveHours := 12 hoursMeasure.
	twoSeconds := 2 secondsMeasure
]

{ #category : 'testing' }
TimeSpanTest >> testAccessing [

	self
		assert: (TimeSpan from: midnight duration: oneHour) from
		equals: midnight.
	self
		assert: (TimeSpan from: midnight duration: oneHour) duration
		equals: oneHour
]

{ #category : 'testing' }
TimeSpanTest >> testAsInterval [

	| timespan interval |
	timespan := TimeSpan from: midnight duration: twelveHours.
	interval := ArithmeticObjectInterval
		            from: midnight
		            to: noon
		            by: oneHour
		            intervalStrategy: PointInTimeIntervalStrategy new.
	self assert: timespan asInterval equals: interval
]

{ #category : 'testing' }
TimeSpanTest >> testEqual [

	self
		assert: (TimeSpan from: midnight duration: oneHour)
		equals: (TimeSpan from: midnight duration: oneHour).
	self deny: (TimeSpan from: midnight duration: oneHour)
		= (TimeSpan from: noon duration: 13 hoursMeasure).
	self deny: (TimeSpan from: midnight duration: oneHour)
		= (TimeSpan from: midnight duration: twoSeconds)
]

{ #category : 'testing' }
TimeSpanTest >> testFromInterval [

	| interval timespan |
	interval := ArithmeticObjectInterval
		            from: midnight
		            to: noon
		            by: oneHour
		            intervalStrategy: PointInTimeIntervalStrategy new.
	timespan := TimeSpan from: midnight duration: twelveHours.
	self assert: (TimeSpan fromInterval: interval) equals: timespan
]

{ #category : 'testing' }
TimeSpanTest >> testHash [

	self
		assert: (TimeSpan from: midnight duration: oneHour) hash
		equals: (TimeSpan from: midnight duration: oneHour) hash
]

{ #category : 'testing' }
TimeSpanTest >> testPrintString [

	self
		assert: (TimeSpan from: midnight duration: oneHour) printString
		equals: '1 hour from 00:00:00'
]

{ #category : 'testing' }
TimeSpanTest >> testTo [

	self
		assert: (TimeSpan from: midnight duration: oneHour) to
		equals: (TimeOfDay hours: 1).
	self
		assert: (TimeSpan from: TimeOfDay noon duration: oneHour) to
		equals: (TimeOfDay hours: 13).
	self
		assert:
		(TimeSpan from: (TimeOfDay hours: 1) duration: 10 hoursMeasure) to
		equals: (TimeOfDay hours: 11)
]

{ #category : 'testing' }
TimeSpanTest >> testValue [

	self
		assert: (TimeSpan from: midnight duration: oneHour) value
		equals: (TimeSpan from: midnight duration: oneHour).
	self
		assert: (TimeSpan from: midnight duration: oneHour) value
		equals: (TimeSpan from: midnight duration: oneHour)
]
