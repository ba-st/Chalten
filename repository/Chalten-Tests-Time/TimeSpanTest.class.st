Class {
	#name : #TimeSpanTest,
	#superclass : #TestCase,
	#instVars : [
		'midnight',
		'noon',
		'oneHour',
		'twelveHours',
		'twoSeconds'
	],
	#category : #'Chalten-Tests-Time'
}

{ #category : #initialization }
TimeSpanTest >> setUp [
	midnight := TimeOfDay midnight.
	noon := TimeOfDay noon.
	oneHour := 1 hourMeasure.
	twelveHours := 12 hoursMeasure.
	twoSeconds := 2 secondsMeasure
]

{ #category : #testing }
TimeSpanTest >> testAccessing [

	self assert: (TimeSpan from: midnight duration: oneHour) from = midnight.
	self assert: (TimeSpan from: midnight duration: oneHour) duration = oneHour
]

{ #category : #testing }
TimeSpanTest >> testAsInterval [

	| timespan interval |

	timespan := TimeSpan from: midnight duration: twelveHours.
	interval :=
		ArithmeticObjectInterval
			from: midnight
			to: noon
			by: oneHour
			intervalStrategy: PointInTimeIntervalStrategy new.
	self assert: timespan asInterval = interval
]

{ #category : #testing }
TimeSpanTest >> testEqual [
	self assert: (TimeSpan from: midnight duration: oneHour) = (TimeSpan from: midnight duration: oneHour).
	self deny: (TimeSpan from: midnight duration: oneHour) = (TimeSpan from: noon duration: 13 hoursMeasure).
	self deny: (TimeSpan from: midnight duration: oneHour) = (TimeSpan from: midnight duration: twoSeconds)
]

{ #category : #testing }
TimeSpanTest >> testFromInterval [

	| interval timespan |

	interval :=
		ArithmeticObjectInterval
			from: midnight
			to: noon
			by: oneHour
			intervalStrategy: PointInTimeIntervalStrategy new.
	timespan := TimeSpan from: midnight duration: twelveHours.
	self assert: (TimeSpan fromInterval: interval) = timespan
]

{ #category : #testing }
TimeSpanTest >> testHash [

	self assert:
		(TimeSpan from: midnight duration: oneHour) hash =
			(TimeSpan from: midnight duration: oneHour) hash
]

{ #category : #testing }
TimeSpanTest >> testPrintString [

	self assert: (TimeSpan from: midnight duration: oneHour) printString = '1 hour from 00:00:00'
]

{ #category : #testing }
TimeSpanTest >> testTo [
	self assert: (TimeSpan from: midnight duration: oneHour) to = (TimeOfDay hours: 1).
	self assert: (TimeSpan from: TimeOfDay noon duration: oneHour) to = (TimeOfDay hours: 13).
	self assert: (TimeSpan from: (TimeOfDay hours: 1) duration: 10 hoursMeasure) to = (TimeOfDay hours: 11)
]

{ #category : #testing }
TimeSpanTest >> testValue [

	self assert: (TimeSpan from: midnight duration: oneHour) value = (TimeSpan from: midnight duration: oneHour).
	self assert: (TimeSpan from: midnight duration: oneHour) value = (TimeSpan from: midnight duration: oneHour)
]
