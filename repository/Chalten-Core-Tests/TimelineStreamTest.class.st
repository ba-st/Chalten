"
A TimelineStreamTest is xxxxxxxxx.

"
Class {
	#name : #TimelineStreamTest,
	#superclass : #TestCase,
	#category : #'Chalten-Core-Tests-Filter'
}

{ #category : #testing }
TimelineStreamTest >> testAtEnd [

	| timeLineFilter stream |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addRule: (timeLineFilter dayRule: GregorianCalendar saturday).
	stream :=
		TimelineStream
			from: January thirtyfirst, 2004
			using: timeLineFilter.
	"It never reaches the end..."
	10 timesRepeat: [self deny: stream atEnd]
]

{ #category : #testing }
TimelineStreamTest >> testCurrent [

	| timeLineFilter stream januaryThirdOf2004 januaryTenOf2004 |

	januaryThirdOf2004 := January third, 2004.
	januaryTenOf2004 := January tenth, 2004.
	timeLineFilter := TimelineFilter new.
	timeLineFilter addRule: (timeLineFilter dayRule: GregorianCalendar saturday).
	stream := TimelineStream from: januaryThirdOf2004 using: timeLineFilter.

	self assert: stream current = januaryThirdOf2004.
	self assert: stream next = januaryTenOf2004.
	self assert: stream current = januaryTenOf2004
]

{ #category : #testing }
TimelineStreamTest >> testDo [

	| timeLineFilter stream date |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addRule: (timeLineFilter dayRule: GregorianCalendar saturday).
	stream :=
		TimelineStream
			from: January first, 2004
			using: timeLineFilter.
	date := January first, 2004 previousDay: GregorianCalendar saturday.
	stream do: [:aDate |
		date := date nextDay: GregorianCalendar saturday.
		self assert: aDate = date.
		"This is ugly... but I have to doit this way because the stream has no end"
		date month = GregorianCalendar february ifTrue: [^self]]
]

{ #category : #testing }
TimelineStreamTest >> testNext [

	| timeLineFilter stream |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addRule: (timeLineFilter dayRule: GregorianCalendar saturday).
	stream :=
		TimelineStream
			from: January thirtyfirst, 2004
			using: timeLineFilter.
	stream skip: 5 daysMeasure.
	self assert: stream next = (March thirteenth, 2004)
]

{ #category : #testing }
TimelineStreamTest >> testPeek [

	| timeLineFilter stream |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addRule: (timeLineFilter dayRule: GregorianCalendar saturday).
	stream :=
		TimelineStream
			from: January thirtyfirst, 2004
			using: timeLineFilter.
	stream skip: 5 daysMeasure.
	self assert: stream peek = (March thirteenth, 2004)
]

{ #category : #testing }
TimelineStreamTest >> testPeekPrevious [

	| timeLineFilter stream |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addRule: (timeLineFilter dayRule: GregorianCalendar saturday).
	stream :=
		TimelineStream
			from: January thirtyfirst, 2004
			using: timeLineFilter.
	stream skip: 5 daysMeasure.
	self assert: stream peekPrevious = (February twentyeighth, 2004)
]

{ #category : #testing }
TimelineStreamTest >> testPrevious [

	| timeLineFilter stream |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addRule: (timeLineFilter dayRule: GregorianCalendar saturday).
	stream :=
		TimelineStream
			from: January thirtyfirst, 2004
			using: timeLineFilter.
	stream skip: 5 daysMeasure.
	self assert: stream previous = (February twentyeighth, 2004)
]

{ #category : #testing }
TimelineStreamTest >> testReset [

	| timeLineFilter stream januaryFirstOf2004 januaryThirdOf2004 januaryTenOf2004 |

	januaryFirstOf2004 := January first, 2004.
	januaryThirdOf2004 := January third, 2004.
	januaryTenOf2004 := January tenth, 2004.
	timeLineFilter := TimelineFilter new.
	timeLineFilter addRule: (timeLineFilter dayRule: GregorianCalendar saturday).
	stream := TimelineStream from: januaryFirstOf2004 using: timeLineFilter.
	self assert: stream next = januaryThirdOf2004.
	self assert: stream next = januaryTenOf2004.
	stream reset.
	self assert: stream next = januaryThirdOf2004.
	self assert: stream next = januaryTenOf2004
]

{ #category : #testing }
TimelineStreamTest >> testSkip [

	| timeLineFilter stream |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addRule: (timeLineFilter dayRule: GregorianCalendar saturday).
	stream :=
		TimelineStream
			from: January thirtyfirst, 2004
			using: timeLineFilter.
	stream skip: 5 daysMeasure.
	self assert: stream current = (March sixth, 2004)
]
