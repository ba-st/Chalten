Class {
	#name : 'ChaltenExtensionsTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Core-Tests-Time',
	#package : 'Chalten-Core-Tests',
	#tag : 'Time'
}

{ #category : 'test arithmetic object interval' }
ChaltenExtensionsTest >> testAsTimeSpan [

	| timespan interval |
	timespan := TimeSpan
		            from: TimeOfDay midnight
		            duration: 12 hoursMeasure.
	interval := ArithmeticObjectInterval
		            from: TimeOfDay midnight
		            to: TimeOfDay noon
		            by: 1 hourMeasure
		            intervalStrategy: PointInTimeIntervalStrategy new.
	self assert: interval asTimeSpan equals: timespan
]

{ #category : 'test number' }
ChaltenExtensionsTest >> testCenturiesMeasure [

	self assert: 12 centuriesMeasure equals: (TimeUnits century with: 12)
]

{ #category : 'test number' }
ChaltenExtensionsTest >> testCenturyMeasure [

	self assert: 1 centuryMeasure equals: (TimeUnits century with: 1)
]

{ #category : 'test number' }
ChaltenExtensionsTest >> testDayMeasure [

	self assert: 1 dayMeasure equals: (TimeUnits day with: 1)
]

{ #category : 'test number' }
ChaltenExtensionsTest >> testDaysMeasure [

	self assert: 15 daysMeasure equals: (TimeUnits day with: 15)
]

{ #category : 'test number' }
ChaltenExtensionsTest >> testDecadeMeasure [

	self assert: 1 decadeMeasure equals: (TimeUnits decade with: 1)
]

{ #category : 'test number' }
ChaltenExtensionsTest >> testDecadesMeasure [

	self assert: 20 decadesMeasure equals: (TimeUnits decade with: 20)
]

{ #category : 'test interval' }
ChaltenExtensionsTest >> testFrom [

	| interval |
	interval := 1 to: 10.
	self assert: interval from equals: 1
]

{ #category : 'test number' }
ChaltenExtensionsTest >> testHourMeasure [

	self assert: 1 hourMeasure equals: (TimeUnits hour with: 1)
]

{ #category : 'test number' }
ChaltenExtensionsTest >> testHoursMeasure [

	self assert: 24 hoursMeasure equals: (TimeUnits hour with: 24)
]

{ #category : 'test infinity' }
ChaltenExtensionsTest >> testInfinityDaysMeasure [

	self
		assert: ArithmeticObject infinity daysMeasure
		equals: (TimeUnits day with: ArithmeticObject infinity).
	self assert: ArithmeticObject infinity daysMeasure > 365 daysMeasure.
	self assert: 1500 daysMeasure < ArithmeticObject infinity daysMeasure
]

{ #category : 'test number' }
ChaltenExtensionsTest >> testMillenniumMeasure [

	self
		assert: 1 millenniumMeasure
		equals: (TimeUnits millennium with: 1)
]

{ #category : 'test number' }
ChaltenExtensionsTest >> testMillenniumsMeasure [

	self
		assert: 5 millenniumsMeasure
		equals: (TimeUnits millennium with: 5)
]

{ #category : 'test number' }
ChaltenExtensionsTest >> testMillisecondMeasure [

	self
		assert: 1 millisecondMeasure
		equals: (TimeUnits millisecond with: 1)
]

{ #category : 'test number' }
ChaltenExtensionsTest >> testMillisecondsMeasure [

	self
		assert: 1000 millisecondsMeasure
		equals: (TimeUnits millisecond with: 1000)
]

{ #category : 'test minus infinity' }
ChaltenExtensionsTest >> testMinusInfinityDaysMeasure [

	self
		assert: ArithmeticObject minusInfinity daysMeasure
		equals: (TimeUnits day with: ArithmeticObject minusInfinity).
	self assert:
		ArithmeticObject minusInfinity daysMeasure < 365 daysMeasure.
	self assert:
		-1500 daysMeasure > ArithmeticObject minusInfinity daysMeasure
]

{ #category : 'test number' }
ChaltenExtensionsTest >> testMinuteMeasure [

	self assert: 1 minuteMeasure equals: (TimeUnits minute with: 1)
]

{ #category : 'test number' }
ChaltenExtensionsTest >> testMinutesMeasure [

	self assert: 60 minutesMeasure equals: (TimeUnits minute with: 60)
]

{ #category : 'test number' }
ChaltenExtensionsTest >> testMonthMeasure [

	self assert: 1 monthMeasure equals: (TimeUnits month with: 1)
]

{ #category : 'test number' }
ChaltenExtensionsTest >> testMonthsMeasure [

	self assert: 12 monthsMeasure equals: (TimeUnits month with: 12)
]

{ #category : 'test number' }
ChaltenExtensionsTest >> testSecondMeasure [

	self assert: 1 secondMeasure equals: (TimeUnits second with: 1)
]

{ #category : 'test number' }
ChaltenExtensionsTest >> testSecondsMeasure [

	self assert: 60 secondsMeasure equals: (TimeUnits second with: 60)
]

{ #category : 'test interval' }
ChaltenExtensionsTest >> testTo [

	| interval |
	interval := 1 to: 10.
	self assert: interval to equals: 10
]

{ #category : 'test number' }
ChaltenExtensionsTest >> testWeekMeasure [

	self assert: 1 weekMeasure equals: (TimeUnits week with: 1)
]

{ #category : 'test number' }
ChaltenExtensionsTest >> testWeeksMeasure [

	self assert: 1 weekMeasure equals: (TimeUnits week with: 1)
]

{ #category : 'test number' }
ChaltenExtensionsTest >> testYearMeasure [

	self assert: 1 yearMeasure equals: (TimeUnits year with: 1)
]

{ #category : 'test number' }
ChaltenExtensionsTest >> testYearsMeasure [

	self assert: 10 yearsMeasure equals: (TimeUnits year with: 10)
]
