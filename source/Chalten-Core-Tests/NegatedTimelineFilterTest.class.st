Class {
	#name : #NegatedTimelineFilterTest,
	#superclass : #TestCase,
	#category : #'Chalten-Core-Tests-Filter'
}

{ #category : #'test enumeration' }
NegatedTimelineFilterTest >> testDaysBetween [

	| timeLineFilter days |

	timeLineFilter := TimelineFilter new.
	timeLineFilter
		addRules: (
			Array
				with: (timeLineFilter dayRule: GregorianCalendar saturday)
				with: (timeLineFilter dayRule: GregorianCalendar sunday))
		from: January first, 2004.
	days :=
		timeLineFilter negated
			daysBetween: December twentyseventh, 2003
			and: January fifth, 2004.

	self assert: days size = 8.
	self deny: (days includes: January third, 2004).
	self deny: (days includes: January fourth, 2004)
]

{ #category : #'test querying excludes' }
NegatedTimelineFilterTest >> testExcludedFromTo [

	| timeLineFilter excluded |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: GregorianCalendar saturday.
	excluded :=
		timeLineFilter negated
			excludedFrom: January first, 2004
			to: January eleventh, 2004.

	self assert: excluded size = 2.
	self assert: (excluded includes: January third, 2004).
	self assert: (excluded includes: January tenth, 2004)
]

{ #category : #'test querying excludes' }
NegatedTimelineFilterTest >> testExcludedIn [

	| timeLineFilter excluded |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: GregorianCalendar saturday.
	excluded := timeLineFilter negated excludedIn: (January first, 2004 to: January eleventh, 2004).

	self assert: excluded size = 2.
	self assert: (excluded includes: January third, 2004).
	self assert: (excluded includes: January tenth, 2004)
]

{ #category : #'test querying excludes' }
NegatedTimelineFilterTest >> testExcludes [

	| timeLineFilter |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: GregorianCalendar saturday.
	self assert: (timeLineFilter negated excludes: January third, 2004).
	self assert: (timeLineFilter negated excludes: January tenth, 2004)
]

{ #category : #'test querying excludes' }
NegatedTimelineFilterTest >> testExcludesAll [

	| timeLineFilter excluded |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: GregorianCalendar saturday.
	excluded := timeLineFilter negated excludedIn: (January first, 2004 to: January eleventh, 2004).
	self assert: (timeLineFilter negated excludesAll: excluded)
]

{ #category : #'test querying includes' }
NegatedTimelineFilterTest >> testIncludedFromTo [

	| timeLineFilter included |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: GregorianCalendar saturday.
	included := timeLineFilter negated includedFrom: January fourth, 2004 to: January eleventh, 2004.

	self assert: included size = 7.
	self assert: (included includes: January fourth, 2004).
	self assert: (included includes: January fifth, 2004).
	self assert: (included includes: January sixth, 2004).
	self assert: (included includes: January seventh, 2004).
	self assert: (included includes: January eighth, 2004).
	self assert: (included includes: January ninth, 2004).
	self deny: (included includes: January tenth, 2004).
	self assert: (included includes: January eleventh, 2004)
]

{ #category : #'test querying includes' }
NegatedTimelineFilterTest >> testIncludedIn [

	| timeLineFilter included |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: GregorianCalendar saturday.
	included := timeLineFilter negated includedIn: (January fourth, 2004 to: January eleventh, 2004).

	self assert: included size = 7.
	self assert: (included includes: January fourth, 2004).
	self assert: (included includes: January fifth, 2004).
	self assert: (included includes: January sixth, 2004).
	self assert: (included includes: January seventh, 2004).
	self assert: (included includes: January eighth, 2004).
	self assert: (included includes: January ninth, 2004).
	self deny: (included includes: January tenth, 2004).
	self assert: (included includes: January eleventh, 2004)
]

{ #category : #'test querying includes' }
NegatedTimelineFilterTest >> testIncludes [

	| timeLineFilter |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: GregorianCalendar saturday.
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

{ #category : #'test querying includes' }
NegatedTimelineFilterTest >> testIncludesAll [

	| timeLineFilter included |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: GregorianCalendar saturday.
	included := timeLineFilter negated includedIn: (January fourth, 2004 to: January eleventh, 2004).

	self assert: (timeLineFilter negated includesAll: included).
	self assert: (timeLineFilter excludesAll: included)
]

{ #category : #test }
NegatedTimelineFilterTest >> testName [

	| timeLineFilter |

	timeLineFilter := TimelineFilter named: 'K Lendar' filtering: GregorianCalendar.
	self assert: timeLineFilter negated name = 'K Lendar'.
	self assert: timeLineFilter negated negated name = 'K Lendar'
]

{ #category : #'test negated calendar' }
NegatedTimelineFilterTest >> testNegated [

	| timeLineFilter |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: GregorianCalendar saturday.

	"I want to be sure that it is the same object, not just equal"
	self assert: timeLineFilter negated negated == timeLineFilter
]

{ #category : #'test enumeration' }
NegatedTimelineFilterTest >> testNextNegativeDuration [
	| timeLineFilter date |
	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: GregorianCalendar saturday.
	date := January thirtyfirst , 2004.
	self assert: (timeLineFilter negated next: (TimeSpan from: date duration: -1 dayMeasure)) = date previous.
	self
		assert: (timeLineFilter negated next: (TimeSpan from: date duration: -2 daysMeasure)) = (date previous: 2 daysMeasure)
]

{ #category : #'test enumeration' }
NegatedTimelineFilterTest >> testNextPositiveDuration [
	| timeLineFilter date |
	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: GregorianCalendar saturday.
	date := January first , 2004.
	self assert: (timeLineFilter negated next: (TimeSpan from: date duration: 1 dayMeasure)) = date next.
	self assert: (timeLineFilter negated next: (TimeSpan from: date duration: 2 daysMeasure)) = (date next: 3 daysMeasure).
	self assert: (timeLineFilter negated next: (TimeSpan from: date duration: 0 daysMeasure)) = date
]

{ #category : #test }
NegatedTimelineFilterTest >> testPrintOn [

	| timeLineFilterUnnamed timeLineFilterNamed negatedTimeLineFilterUnnamed
	  negatedTimeLineFilterNamed |

	timeLineFilterUnnamed := TimelineFilter new.
	timeLineFilterNamed := TimelineFilter named: 'Argentino'.
	negatedTimeLineFilterUnnamed := timeLineFilterUnnamed negated.
	negatedTimeLineFilterNamed := timeLineFilterNamed negated.

	self assert: negatedTimeLineFilterUnnamed printString = 'Unnamed'.
	self assert: negatedTimeLineFilterNamed printString = 'Argentino'
]

{ #category : #'test streaming' }
NegatedTimelineFilterTest >> testStream [

	| timeLineFilter stream |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: GregorianCalendar saturday.
	stream := timeLineFilter negated streamFrom: January first, 2004.

	self assert: stream next = (January second, 2004).
	self assert: stream next = (January fourth, 2004).
	self assert: stream next = (January fifth, 2004).
	self assert: stream next = (January sixth, 2004).
	self assert: stream next = (January seventh, 2004).
	self assert: stream next = (January eighth, 2004).
	self assert: stream next = (January ninth, 2004).
	self assert: stream next = (January eleventh, 2004)
]
