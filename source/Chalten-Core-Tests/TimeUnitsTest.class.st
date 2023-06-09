Class {
	#name : #TimeUnitsTest,
	#superclass : #TestCase,
	#instVars : [
		'timeUnits'
	],
	#category : #'Chalten-Core-Tests-Time'
}

{ #category : #'test units' }
TimeUnitsTest >> testDay [

	self assert: TimeUnits day = TimeUnits day.
	self assert: TimeUnits day name = 'day'


]

{ #category : #'test units' }
TimeUnitsTest >> testHour [

	self assert: TimeUnits hour=TimeUnits hour.
	self assert: TimeUnits hour name = 'hour'
	
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
TimeUnitsTest >> testSecond [

	self assert: TimeUnits second = TimeUnits second.
	self assert: TimeUnits second name = 'second'
]
