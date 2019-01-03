"
A TimelineFilter is filter to the timeline.

Instance Variables
	inclusionSet:				<Set>
	name:						<String>
	negatedTimeLineFilter:		<NegtedTimelineFilter>

inclusionSet
	- The rules used to filter dates.

name
	- A name for the filter.

negatedTimeLineFilter
	- The filter negated.

"
Class {
	#name : #TimelineFilter,
	#superclass : #TimelineFilterBehavior,
	#instVars : [
		'inclusionSet',
		'name',
		'negatedTimeLineFilter'
	],
	#category : #'Chalten-Core-Filter'
}

{ #category : #'rules - creating' }
TimelineFilter class >> argentineLaw23555Rule: aGregorianDayOfMonth [

	^ArgentineLaw23555Rule dayOfMonth: aGregorianDayOfMonth
]

{ #category : #'rules - creating' }
TimelineFilter class >> dateRule: aDate [

	^DateRule date: aDate
]

{ #category : #'rules - creating' }
TimelineFilter class >> dayOfMonthRule: aDayOfMonth [

	^DayOfMonthRule dayOfMonth: aDayOfMonth
]

{ #category : #'rules - creating' }
TimelineFilter class >> dayRule: aDay [

	^DayRule day: aDay
]

{ #category : #defaults }
TimelineFilter class >> defaultName [

	^'Unnamed'
]

{ #category : #'rules - creating' }
TimelineFilter class >> monthOfYearRule: aMonthOfYear [

	^MonthOfYearRule monthOfYear: aMonthOfYear
]

{ #category : #'rules - creating' }
TimelineFilter class >> monthRule: aMonth [

	^MonthRule month: aMonth
]

{ #category : #'instance creation' }
TimelineFilter class >> named: aName [

	^super new initializeNamed: aName
]

{ #category : #'instance creation' }
TimelineFilter class >> new [

	^self named: self defaultName
]

{ #category : #'rules - creating' }
TimelineFilter class >> ordinal: aNumber day: aDay monthRule: aMonth [

	^OrdinalDayMonthRule ordinal: aNumber day: aDay month: aMonth
]

{ #category : #'rules - creating' }
TimelineFilter class >> rule: anInclusionRule during: anInterval [

	^IntervalConstrainedInclusionRule on: anInterval apply: anInclusionRule
]

{ #category : #'rules - creating' }
TimelineFilter class >> rule: anInclusionRule from: aDate to: anotherDate [

	^self rule: anInclusionRule during: (aDate to: anotherDate)
]

{ #category : #'rules - creating' }
TimelineFilter class >> yearRule: aYear [

	^YearRule year: aYear
]

{ #category : #comparing }
TimelineFilter >> = anObject [

	^self == anObject or: [
		self class = anObject class and: [
			self name = anObject name
		]
	]
]

{ #category : #'rules - adding specific rules' }
TimelineFilter >> addArgentineLaw23555Rule: aGregorianDayOfMonth [

	^self addRule: (self argentineLaw23555Rule: aGregorianDayOfMonth)
]

{ #category : #'rules - adding specific rules' }
TimelineFilter >> addDateRule: aDate [

	^self addRule: (self dateRule: aDate)
]

{ #category : #'rules - adding specific rules' }
TimelineFilter >> addDayOfMonthRule: aDayOfMonth [

	^self addRule: (self dayOfMonthRule: aDayOfMonth)
]

{ #category : #'rules - adding specific rules' }
TimelineFilter >> addDayRule: aDay [

	^self addRule: (self dayRule: aDay)
]

{ #category : #'rules - adding specific rules' }
TimelineFilter >> addMonthOfYearRule: aMonthOfYear [

	^self addRule: (self monthOfYearRule: aMonthOfYear)
]

{ #category : #'rules - adding specific rules' }
TimelineFilter >> addMonthRule: aMonth [

	^self addRule: (self monthRule: aMonth)
]

{ #category : #'rules - adding specific rules' }
TimelineFilter >> addOrdinal: aNumber day: aDay monthRule: aMonth [

	^self addRule: (self ordinal: aNumber day: aDay monthRule: aMonth)
]

{ #category : #'rules - adding generic rules' }
TimelineFilter >> addRule: anInclusionRule [

	^inclusionSet add: anInclusionRule
]

{ #category : #'rules - adding specific rules' }
TimelineFilter >> addRule: aRule during: anInterval [

	^self addRule: (self rule: aRule during: anInterval)

]

{ #category : #'rules - adding specific rules' }
TimelineFilter >> addRule: aRule from: aDate [

	^self addRule: (self rule: aRule from: aDate to: TheEndOfTime)
]

{ #category : #'rules - adding specific rules' }
TimelineFilter >> addRule: aRule from: aDate to: anotherDate [

	^self addRule: (self rule: aRule from: aDate to: anotherDate)
]

{ #category : #'rules - adding generic rules' }
TimelineFilter >> addRules: aCollectionOfInclusionRules [

	^inclusionSet addAll: aCollectionOfInclusionRules
]

{ #category : #'rules - adding specific rules' }
TimelineFilter >> addRules: aRuleCollection during: anIntervalOfDays [

	aRuleCollection do: [:each | self addRule: each during: anIntervalOfDays]
]

{ #category : #'rules - adding specific rules' }
TimelineFilter >> addRules: aRuleCollection from: aDate [

	self addRules: aRuleCollection from: aDate to: TheEndOfTime
]

{ #category : #'rules - adding specific rules' }
TimelineFilter >> addRules: aRuleCollection from: aDate to: anotherDate [

	self addRules: aRuleCollection during: (aDate to: anotherDate)
]

{ #category : #'rules - adding specific rules' }
TimelineFilter >> addYearRule: aYear [

	^self addRule: (self yearRule: aYear)
]

{ #category : #'rules - creating' }
TimelineFilter >> argentineLaw23555Rule: aGregorianDayOfMonth [

	^self class argentineLaw23555Rule: aGregorianDayOfMonth
]

{ #category : #'rules - creating' }
TimelineFilter >> dateRule: aDate [

	^self class dateRule: aDate
]

{ #category : #'rules - creating' }
TimelineFilter >> dayOfMonthRule: aDayOfMonth [

	^self class dayOfMonthRule: aDayOfMonth
]

{ #category : #'rules - creating' }
TimelineFilter >> dayRule: aDay [

	^self class dayRule: aDay
]

{ #category : #comparing }
TimelineFilter >> hash [

	^name hash
]

{ #category : #'querying - included' }
TimelineFilter >> includes: aDate [

	^inclusionSet anySatisfy: [:anInclusionRule | anInclusionRule includes: aDate]
]

{ #category : #initialization }
TimelineFilter >> initializeNamed: aName [

	name := aName.
	inclusionSet := Set new.
	negatedTimeLineFilter := NegatedTimelineFilter for: self
]

{ #category : #'rules - creating' }
TimelineFilter >> monthOfYearRule: aMonthOfYear [

	^self class monthOfYearRule: aMonthOfYear
]

{ #category : #'rules - creating' }
TimelineFilter >> monthRule: aMonth [

	^self class monthRule: aMonth
]

{ #category : #accessing }
TimelineFilter >> name [

	^name
]

{ #category : #accessing }
TimelineFilter >> negated [

	^negatedTimeLineFilter
]

{ #category : #'rules - creating' }
TimelineFilter >> ordinal: aNumber day: aDay monthRule: aMonth [

	^self class ordinal: aNumber day: aDay monthRule: aMonth
]

{ #category : #'rules - removing' }
TimelineFilter >> removeAllRules [

	^inclusionSet := Set new
]

{ #category : #'rules - removing' }
TimelineFilter >> removeRule: anInclusionRule [

	^inclusionSet remove: anInclusionRule
]

{ #category : #'rules - creating' }
TimelineFilter >> rule: anInclusionRule during: anInterval [

	^self class rule: anInclusionRule during: anInterval
]

{ #category : #'rules - creating' }
TimelineFilter >> rule: anInclusionRule from: aDate to: anotherDate [

	^self class rule: anInclusionRule from: aDate to: anotherDate
]

{ #category : #accessing }
TimelineFilter >> rules [

	^inclusionSet copy
]

{ #category : #'querying - rules' }
TimelineFilter >> rulesThatInclude: aDate [

	^inclusionSet select: [:anInclusionRule | anInclusionRule includes: aDate]
]

{ #category : #'rules - creating' }
TimelineFilter >> yearRule: aYear [

	^self class yearRule: aYear
]
