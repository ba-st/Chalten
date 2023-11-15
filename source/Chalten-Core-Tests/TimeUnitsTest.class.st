Class {
	#name : 'TimeUnitsTest',
	#superclass : 'TestCase',
	#instVars : [
		'timeUnits'
	],
	#category : 'Chalten-Core-Tests-Time',
	#package : 'Chalten-Core-Tests',
	#tag : 'Time'
}

{ #category : 'test' }
TimeUnitsTest >> testAllUnits [

	self assert: (TimeUnits allUnits includes: TimeUnits day).
	self assert: (TimeUnits allUnits includes: TimeUnits hour).
	self assert: (TimeUnits allUnits includes: TimeUnits minute).
	self assert: (TimeUnits allUnits includes: TimeUnits second).
	self assert: (TimeUnits allUnits includes: TimeUnits millisecond).
	self assert: (TimeUnits allUnits includes: TimeUnits week).
	self assert: (TimeUnits allUnits includes: TimeUnits month).
	self assert: (TimeUnits allUnits includes: TimeUnits year)
]

{ #category : 'test units' }
TimeUnitsTest >> testCentury [

	self assert: TimeUnits century equals: TimeUnits century.
	self assert: TimeUnits century name equals: 'century'
]

{ #category : 'test units' }
TimeUnitsTest >> testDay [

	self assert: TimeUnits day equals: TimeUnits day.
	self assert: TimeUnits day name equals: 'day'
]

{ #category : 'test units' }
TimeUnitsTest >> testDecade [

	self assert: TimeUnits decade equals: TimeUnits decade.
	self assert: TimeUnits decade name equals: 'decade'
]

{ #category : 'test units' }
TimeUnitsTest >> testHour [

	self assert: TimeUnits hour equals: TimeUnits hour.
	self assert: TimeUnits hour name equals: 'hour'
]

{ #category : 'test units' }
TimeUnitsTest >> testMillennium [

	self assert: TimeUnits millennium equals: TimeUnits millennium.
	self assert: TimeUnits millennium name equals: 'millennium'
]

{ #category : 'test units' }
TimeUnitsTest >> testMillisecond [

	self assert: TimeUnits millisecond equals: TimeUnits millisecond.
	self assert: TimeUnits millisecond name equals: 'millisecond'
]

{ #category : 'test units' }
TimeUnitsTest >> testMinute [

	self assert: TimeUnits minute equals: TimeUnits minute.
	self assert: TimeUnits minute name equals: 'minute'
]

{ #category : 'test units' }
TimeUnitsTest >> testMonth [

	self assert: TimeUnits month equals: TimeUnits month.
	self assert: TimeUnits month name equals: 'month'
]

{ #category : 'test units' }
TimeUnitsTest >> testSecond [

	self assert: TimeUnits second equals: TimeUnits second.
	self assert: TimeUnits second name equals: 'second'
]

{ #category : 'test units' }
TimeUnitsTest >> testWeek [

	self assert: TimeUnits week equals: TimeUnits week.
	self assert: TimeUnits week name equals: 'week'
]

{ #category : 'test units' }
TimeUnitsTest >> testYear [

	self assert: TimeUnits year equals: TimeUnits year.
	self assert: TimeUnits year name equals: 'year'
]
