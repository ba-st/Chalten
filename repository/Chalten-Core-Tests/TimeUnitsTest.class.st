Class {
	#name : #TimeUnitsTest,
	#superclass : #TestCase,
	#instVars : [
		'timeUnits'
	],
	#category : #'Chalten-Core-Tests-Time'
}

{ #category : #test }
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

{ #category : #'test units' }
TimeUnitsTest >> testCentury [

	self assert: TimeUnits century = TimeUnits century.
	self assert: TimeUnits century name = 'century'


]

{ #category : #'test units' }
TimeUnitsTest >> testDay [

	self assert: TimeUnits day = TimeUnits day.
	self assert: TimeUnits day name = 'day'


]

{ #category : #'test units' }
TimeUnitsTest >> testDecade [

	self assert: TimeUnits decade = TimeUnits decade.
	self assert: TimeUnits decade name = 'decade'


]

{ #category : #'test units' }
TimeUnitsTest >> testHour [

	self assert: TimeUnits hour=TimeUnits hour.
	self assert: TimeUnits hour name = 'hour'
	
]

{ #category : #'test units' }
TimeUnitsTest >> testMillennium [

	self assert: TimeUnits millennium = TimeUnits millennium.
	self assert: TimeUnits millennium name = 'millennium'


]

{ #category : #'test units' }
TimeUnitsTest >> testMillisecond [

	self assert: TimeUnits millisecond = TimeUnits millisecond.
	self assert: TimeUnits millisecond name = 'millisecond'	
]

{ #category : #'test units' }
TimeUnitsTest >> testMinute [

	self assert: TimeUnits minute = TimeUnits minute.
	self assert: TimeUnits minute name = 'minute'	
]

{ #category : #'test units' }
TimeUnitsTest >> testMonth [

	self assert: TimeUnits month = TimeUnits month.
	self assert: TimeUnits month name = 'month'
]

{ #category : #'test units' }
TimeUnitsTest >> testSecond [

	self assert: TimeUnits second = TimeUnits second.
	self assert: TimeUnits second name = 'second'
]

{ #category : #'test units' }
TimeUnitsTest >> testWeek [

	self assert: TimeUnits week = TimeUnits week.
	self assert: TimeUnits week name = 'week'
]

{ #category : #'test units' }
TimeUnitsTest >> testYear [

	self assert: TimeUnits year = TimeUnits year.
	self assert: TimeUnits year name = 'year'
]
