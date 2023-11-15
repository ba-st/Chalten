Class {
	#name : 'NegatedTimelineFilterTest',
	#superclass : 'TestCase',
	#instVars : [
		'gregorianCalendar'
	],
	#category : 'Chalten-Core-Tests-Filter',
	#package : 'Chalten-Core-Tests',
	#tag : 'Filter'
}

{ #category : 'running' }
NegatedTimelineFilterTest >> setUp [

	gregorianCalendar := ChaltenEnvironment calendarNamed: #GregorianCalendar
]

{ #category : 'test enumeration' }
NegatedTimelineFilterTest >> testDaysBetween [

	| timeLineFilter days |
	timeLineFilter := TimelineFilter new.
	timeLineFilter
		addRules: (Array
				 with: (timeLineFilter dayRule: gregorianCalendar saturday)
				 with: (timeLineFilter dayRule: gregorianCalendar sunday))
		from: January first , 2004.
	days := timeLineFilter negated
		        daysBetween: December twentyseventh , 2003
		        and: January fifth , 2004.
	self assert: days size equals: 8.
	self deny: (days includes: January third , 2004).
	self deny: (days includes: January fourth , 2004)
]

{ #category : 'test querying excludes' }
NegatedTimelineFilterTest >> testExcludedFromTo [

	| timeLineFilter excluded |
	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: gregorianCalendar saturday.
	excluded := timeLineFilter negated
		            excludedFrom: January first , 2004
		            to: January eleventh , 2004.
	self assert: excluded size equals: 2.
	self assert: (excluded includes: January third , 2004).
	self assert: (excluded includes: January tenth , 2004)
]

{ #category : 'test querying excludes' }
NegatedTimelineFilterTest >> testExcludedIn [

	| timeLineFilter excluded |
	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: gregorianCalendar saturday.
	excluded := timeLineFilter negated excludedIn:
		            (January first , 2004 to: January eleventh , 2004).
	self assert: excluded size equals: 2.
	self assert: (excluded includes: January third , 2004).
	self assert: (excluded includes: January tenth , 2004)
]

{ #category : 'test querying excludes' }
NegatedTimelineFilterTest >> testExcludes [

	| timeLineFilter |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: gregorianCalendar saturday.
	self assert: (timeLineFilter negated excludes: January third, 2004).
	self assert: (timeLineFilter negated excludes: January tenth, 2004)
]

{ #category : 'test querying excludes' }
NegatedTimelineFilterTest >> testExcludesAll [

	| timeLineFilter excluded |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: gregorianCalendar saturday.
	excluded := timeLineFilter negated excludedIn: (January first, 2004 to: January eleventh, 2004).
	self assert: (timeLineFilter negated excludesAll: excluded)
]

{ #category : 'test querying includes' }
NegatedTimelineFilterTest >> testIncludedFromTo [

	| timeLineFilter included |
	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: gregorianCalendar saturday.
	included := timeLineFilter negated
		            includedFrom: January fourth , 2004
		            to: January eleventh , 2004.
	self assert: included size equals: 7.
	self assert: (included includes: January fourth , 2004).
	self assert: (included includes: January fifth , 2004).
	self assert: (included includes: January sixth , 2004).
	self assert: (included includes: January seventh , 2004).
	self assert: (included includes: January eighth , 2004).
	self assert: (included includes: January ninth , 2004).
	self deny: (included includes: January tenth , 2004).
	self assert: (included includes: January eleventh , 2004)
]

{ #category : 'test querying includes' }
NegatedTimelineFilterTest >> testIncludedIn [

	| timeLineFilter included |
	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: gregorianCalendar saturday.
	included := timeLineFilter negated includedIn:
		            (January fourth , 2004 to: January eleventh , 2004).
	self assert: included size equals: 7.
	self assert: (included includes: January fourth , 2004).
	self assert: (included includes: January fifth , 2004).
	self assert: (included includes: January sixth , 2004).
	self assert: (included includes: January seventh , 2004).
	self assert: (included includes: January eighth , 2004).
	self assert: (included includes: January ninth , 2004).
	self deny: (included includes: January tenth , 2004).
	self assert: (included includes: January eleventh , 2004)
]

{ #category : 'test querying includes' }
NegatedTimelineFilterTest >> testIncludes [

	| timeLineFilter |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: gregorianCalendar saturday.
	timeLineFilter := timeLineFilter negated.

	self assert: (timeLineFilter includes: January fourth, 2004).
	self assert: (timeLineFilter includes: January fifth, 2004).
	self assert: (timeLineFilter includes: January sixth, 2004).
	self assert: (timeLineFilter includes: January seventh, 2004).
	self assert: (timeLineFilter includes: January eighth, 2004).
	self assert: (timeLineFilter includes: January ninth, 2004).
	self deny: (timeLineFilter includes: January tenth, 2004).
	self assert: (timeLineFilter includes: January eleventh, 2004)
]

{ #category : 'test querying includes' }
NegatedTimelineFilterTest >> testIncludesAll [

	| timeLineFilter included |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: gregorianCalendar saturday.
	included := timeLineFilter negated includedIn: (January fourth, 2004 to: January eleventh, 2004).

	self assert: (timeLineFilter negated includesAll: included).
	self assert: (timeLineFilter excludesAll: included)
]

{ #category : 'test' }
NegatedTimelineFilterTest >> testName [

	| timeLineFilter |
	timeLineFilter := TimelineFilter named: 'K Lendar'.
	self assert: timeLineFilter negated name equals: 'K Lendar'.
	self assert: timeLineFilter negated negated name equals: 'K Lendar'
]

{ #category : 'test negated calendar' }
NegatedTimelineFilterTest >> testNegated [

	| timeLineFilter |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: gregorianCalendar saturday.

	"I want to be sure that it is the same object, not just equal"
	self assert: timeLineFilter negated negated == timeLineFilter
]

{ #category : 'test enumeration' }
NegatedTimelineFilterTest >> testNextNegativeDuration [

	| timeLineFilter date |
	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: gregorianCalendar saturday.
	date := January thirtyfirst , 2004.
	self
		assert: (timeLineFilter negated next:
				 (TimeSpan from: date duration: -1 dayMeasure))
		equals: date previous.
	self
		assert: (timeLineFilter negated next:
				 (TimeSpan from: date duration: -2 daysMeasure))
		equals: (date previous: 2 daysMeasure)
]

{ #category : 'test enumeration' }
NegatedTimelineFilterTest >> testNextPositiveDuration [

	| timeLineFilter date |
	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: gregorianCalendar saturday.
	date := January first , 2004.
	self
		assert: (timeLineFilter negated next:
				 (TimeSpan from: date duration: 1 dayMeasure))
		equals: date next.
	self
		assert: (timeLineFilter negated next:
				 (TimeSpan from: date duration: 2 daysMeasure))
		equals: (date next: 3 daysMeasure).
	self
		assert: (timeLineFilter negated next:
				 (TimeSpan from: date duration: 0 daysMeasure))
		equals: date
]

{ #category : 'test' }
NegatedTimelineFilterTest >> testPrintOn [

	| timeLineFilterUnnamed timeLineFilterNamed negatedTimeLineFilterUnnamed negatedTimeLineFilterNamed |
	timeLineFilterUnnamed := TimelineFilter new.
	timeLineFilterNamed := TimelineFilter named: 'Argentino'.
	negatedTimeLineFilterUnnamed := timeLineFilterUnnamed negated.
	negatedTimeLineFilterNamed := timeLineFilterNamed negated.
	self
		assert: negatedTimeLineFilterUnnamed printString
		equals: 'Unnamed'.
	self
		assert: negatedTimeLineFilterNamed printString
		equals: 'Argentino'
]

{ #category : 'test streaming' }
NegatedTimelineFilterTest >> testStream [

	| timeLineFilter stream |
	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: gregorianCalendar saturday.
	stream := timeLineFilter negated streamFrom: January first , 2004.
	self assert: stream next equals: January second , 2004.
	self assert: stream next equals: January fourth , 2004.
	self assert: stream next equals: January fifth , 2004.
	self assert: stream next equals: January sixth , 2004.
	self assert: stream next equals: January seventh , 2004.
	self assert: stream next equals: January eighth , 2004.
	self assert: stream next equals: January ninth , 2004.
	self assert: stream next equals: January eleventh , 2004
]
