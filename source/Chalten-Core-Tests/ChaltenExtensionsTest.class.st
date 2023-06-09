Class {
	#name : #ChaltenExtensionsTest,
	#superclass : #TestCase,
	#category : #'Chalten-Core-Tests-Time'
}

{ #category : #'test arithmetic object interval' }
ChaltenExtensionsTest >> testAsTimeSpan [

	| timespan interval |

	timespan := TimeSpan from: TimeOfDay midnight duration: 12 hoursMeasure.
	interval :=
		ArithmeticObjectInterval
			from: TimeOfDay midnight
			to: TimeOfDay noon
			by: 1 hourMeasure
			intervalStrategy: PointInTimeIntervalStrategy new.
	self assert: interval asTimeSpan = timespan
]

{ #category : #'test number' }
ChaltenExtensionsTest >> testDayMeasure [

	self assert: 1 dayMeasure = (TimeUnits day with: 1)
]

{ #category : #'test number' }
ChaltenExtensionsTest >> testDaysMeasure [

	self assert: 15 daysMeasure = (TimeUnits day with: 15)
]

{ #category : #'test interval' }
ChaltenExtensionsTest >> testFrom [

	| interval |
	interval := 1 to: 10.
	self assert: interval from = 1
]

{ #category : #'test number' }
ChaltenExtensionsTest >> testHourMeasure [

	self assert: 1 hourMeasure = (TimeUnits hour with: 1)
]

{ #category : #'test number' }
ChaltenExtensionsTest >> testHoursMeasure [

	self assert: 24 hoursMeasure = (TimeUnits hour with: 24)
]

{ #category : #'test infinity' }
ChaltenExtensionsTest >> testInfinityDaysMeasure [

	self assert: Infinity daysMeasure = (TimeUnits day with: Infinity).
	self assert: Infinity daysMeasure > 365 daysMeasure.
	self assert: 1500 daysMeasure < Infinity daysMeasure
]

{ #category : #'test number' }
ChaltenExtensionsTest >> testMillisecondMeasure [

	self assert: 1 millisecondMeasure = (TimeUnits millisecond with: 1)
]

{ #category : #'test number' }
ChaltenExtensionsTest >> testMillisecondsMeasure [

	self assert: 1000 millisecondsMeasure = (TimeUnits millisecond with: 1000)
]

{ #category : #'test minus infinity' }
ChaltenExtensionsTest >> testMinusInfinityDaysMeasure [

	self assert: MinusInfinity daysMeasure = (TimeUnits day with: MinusInfinity).
	self assert: MinusInfinity daysMeasure < 365 daysMeasure.
	self assert: -1500 daysMeasure > MinusInfinity daysMeasure
]

{ #category : #'test number' }
ChaltenExtensionsTest >> testMinuteMeasure [

	self assert: 1 minuteMeasure = (TimeUnits minute with: 1)
]

{ #category : #'test number' }
ChaltenExtensionsTest >> testMinutesMeasure [

	self assert: 60 minutesMeasure = (TimeUnits minute with: 60)
]

{ #category : #'test number' }
ChaltenExtensionsTest >> testSecondMeasure [

	self assert: 1 secondMeasure = (TimeUnits second with: 1)
]

{ #category : #'test number' }
ChaltenExtensionsTest >> testSecondsMeasure [

	self assert: 60 secondsMeasure = (TimeUnits second with: 60)
]

{ #category : #'test interval' }
ChaltenExtensionsTest >> testTo [

	| interval |
	interval := 1 to: 10.
	self assert: interval to = 10
]
