"
A TimelineStreamTest is xxxxxxxxx.

"
Class {
	#name : 'TimelineStreamTest',
	#superclass : 'TestCase',
	#instVars : [
		'gregorianCalendar'
	],
	#category : 'Chalten-Core-Tests-Filter',
	#package : 'Chalten-Core-Tests',
	#tag : 'Filter'
}

{ #category : 'running' }
TimelineStreamTest >> setUp [

	gregorianCalendar := ChaltenEnvironment calendarNamed: #GregorianCalendar
]

{ #category : 'testing' }
TimelineStreamTest >> testAtEnd [

	| timeLineFilter stream |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addRule: (timeLineFilter dayRule: gregorianCalendar saturday).
	stream :=
		TimelineStream
			from: January thirtyfirst, 2004
			using: timeLineFilter.
	"It never reaches the end..."
	10 timesRepeat: [self deny: stream atEnd]
]

{ #category : 'testing' }
TimelineStreamTest >> testCurrent [

	| timeLineFilter stream januaryThirdOf2004 januaryTenOf2004 |
	januaryThirdOf2004 := January third , 2004.
	januaryTenOf2004 := January tenth , 2004.
	timeLineFilter := TimelineFilter new.
	timeLineFilter addRule:
		(timeLineFilter dayRule: gregorianCalendar saturday).
	stream := TimelineStream
		          from: januaryThirdOf2004
		          using: timeLineFilter.
	self assert: stream current equals: januaryThirdOf2004.
	self assert: stream next equals: januaryTenOf2004.
	self assert: stream current equals: januaryTenOf2004
]

{ #category : 'testing' }
TimelineStreamTest >> testDo [

	| timeLineFilter stream date |
	timeLineFilter := TimelineFilter new.
	timeLineFilter addRule:
		(timeLineFilter dayRule: gregorianCalendar saturday).
	stream := TimelineStream
		          from: January first , 2004
		          using: timeLineFilter.
	date := January first , 2004 previousDay: gregorianCalendar saturday.
	stream do: [ :aDate |
		date := date nextDay: gregorianCalendar saturday.
		self assert: aDate equals: date.
		"This is ugly... but I have to doit this way because the stream has no end"
		date month = gregorianCalendar february ifTrue: [ ^ self ] ]
]

{ #category : 'testing' }
TimelineStreamTest >> testNext [

	| timeLineFilter stream |
	timeLineFilter := TimelineFilter new.
	timeLineFilter addRule:
		(timeLineFilter dayRule: gregorianCalendar saturday).
	stream := TimelineStream
		          from: January thirtyfirst , 2004
		          using: timeLineFilter.
	stream skip: 5 daysMeasure.
	self assert: stream next equals: March thirteenth , 2004
]

{ #category : 'testing' }
TimelineStreamTest >> testPeek [

	| timeLineFilter stream |
	timeLineFilter := TimelineFilter new.
	timeLineFilter addRule:
		(timeLineFilter dayRule: gregorianCalendar saturday).
	stream := TimelineStream
		          from: January thirtyfirst , 2004
		          using: timeLineFilter.
	stream skip: 5 daysMeasure.
	self assert: stream peek equals: March thirteenth , 2004
]

{ #category : 'testing' }
TimelineStreamTest >> testPeekPrevious [

	| timeLineFilter stream |
	timeLineFilter := TimelineFilter new.
	timeLineFilter addRule:
		(timeLineFilter dayRule: gregorianCalendar saturday).
	stream := TimelineStream
		          from: January thirtyfirst , 2004
		          using: timeLineFilter.
	stream skip: 5 daysMeasure.
	self assert: stream peekPrevious equals: February twentyeighth , 2004
]

{ #category : 'testing' }
TimelineStreamTest >> testPrevious [

	| timeLineFilter stream |
	timeLineFilter := TimelineFilter new.
	timeLineFilter addRule:
		(timeLineFilter dayRule: gregorianCalendar saturday).
	stream := TimelineStream
		          from: January thirtyfirst , 2004
		          using: timeLineFilter.
	stream skip: 5 daysMeasure.
	self assert: stream previous equals: February twentyeighth , 2004
]

{ #category : 'testing' }
TimelineStreamTest >> testReset [

	| timeLineFilter stream januaryFirstOf2004 januaryThirdOf2004 januaryTenOf2004 |
	januaryFirstOf2004 := January first , 2004.
	januaryThirdOf2004 := January third , 2004.
	januaryTenOf2004 := January tenth , 2004.
	timeLineFilter := TimelineFilter new.
	timeLineFilter addRule:
		(timeLineFilter dayRule: gregorianCalendar saturday).
	stream := TimelineStream
		          from: januaryFirstOf2004
		          using: timeLineFilter.
	self assert: stream next equals: januaryThirdOf2004.
	self assert: stream next equals: januaryTenOf2004.
	stream reset.
	self assert: stream next equals: januaryThirdOf2004.
	self assert: stream next equals: januaryTenOf2004
]

{ #category : 'testing' }
TimelineStreamTest >> testSkip [

	| timeLineFilter stream |
	timeLineFilter := TimelineFilter new.
	timeLineFilter addRule:
		(timeLineFilter dayRule: gregorianCalendar saturday).
	stream := TimelineStream
		          from: January thirtyfirst , 2004
		          using: timeLineFilter.
	stream skip: 5 daysMeasure.
	self assert: stream current equals: March sixth , 2004
]
