Class {
	#name : #TimelineFilterTest,
	#superclass : #TestCase,
	#category : #'Chalten-Tests-Filter'
}

{ #category : #test }
TimelineFilterTest >> testAddArgentineLaw23555Rule [

	| timeLineFilter |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addArgentineLaw23555Rule: September fifteenth.

	self assert: (timeLineFilter includes: September nineteenth, 2005).
	self deny: (timeLineFilter includes: September fifteenth, 2005)
]

{ #category : #test }
TimelineFilterTest >> testAddDateRule [

	| timeLineFilter |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addDateRule: January third, 2004.

	self assert: (timeLineFilter includes: January third, 2004).
	self deny: (timeLineFilter includes: January fourth, 2004)
]

{ #category : #test }
TimelineFilterTest >> testAddDayOfMonthRule [

	| timeLineFilter |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayOfMonthRule: January third.

	self assert: (timeLineFilter includes: January third, 2004).
	self assert: (timeLineFilter includes: January third, 2005).
	self deny: (timeLineFilter includes: January fourth, 2004)
]

{ #category : #test }
TimelineFilterTest >> testAddDayRule [

	| timeLineFilter |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: GregorianCalendar saturday.

	self assert: (timeLineFilter includes: January third, 2004).
	self deny: (timeLineFilter includes: January fourth, 2004)
]

{ #category : #test }
TimelineFilterTest >> testAddMonthOfYearRule [

	| timeLineFilter |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addMonthOfYearRule: (January of: 2004).

	self assert: (timeLineFilter includes: January third, 2004).
	self deny: (timeLineFilter includes: January third, 2005)
]

{ #category : #test }
TimelineFilterTest >> testAddMonthRule [

	| timeLineFilter |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addMonthRule: January.

	self assert: (timeLineFilter includes: January third, 2004).
	self assert: (timeLineFilter includes: January third, 2005).
	self deny: (timeLineFilter includes: February third, 2005)
]

{ #category : #test }
TimelineFilterTest >> testAddOrdinalDayMonthRuleRule [

	| timeLineFilter |

	timeLineFilter := TimelineFilter new.
	timeLineFilter
		addOrdinal: 3
		day: GregorianCalendar monday
		monthRule: GregorianCalendar september.

	self assert: (timeLineFilter includes: September nineteenth, 2005).
	self deny: (timeLineFilter includes: September fifteenth, 2005)
]

{ #category : #test }
TimelineFilterTest >> testAddRuleFrom [

	| timeLineFilter |

	timeLineFilter := TimelineFilter new.
	timeLineFilter
		addRule: (timeLineFilter dayRule: GregorianCalendar saturday)
		from: January first, 2004.

	self assert: (timeLineFilter includes: January third, 2004).
	self assert: (timeLineFilter includes: January tenth, 2004).
	self deny: (timeLineFilter includes: December twentyseventh, 2004)
]

{ #category : #test }
TimelineFilterTest >> testAddRuleFromTo [

	| timeLineFilter |

	timeLineFilter := TimelineFilter new.
	timeLineFilter
		addRule: (timeLineFilter dayRule: GregorianCalendar saturday)
		from: January first, 2004
		to: January ninth, 2004.

	self assert: (timeLineFilter includes: January third, 2004).
	self deny: (timeLineFilter includes: December twentyseventh, 2004).
	self deny: (timeLineFilter includes: January tenth, 2004)
]

{ #category : #test }
TimelineFilterTest >> testAddRules [

	| timeLineFilter rule1 rule2 rule3 september14Of2005 september15Of2005 september16Of2005 |

	september14Of2005 := September fourteenth, 2005.
	september15Of2005 := September fifteenth, 2005.
	september16Of2005 := September sixteenth, 2005.
	timeLineFilter := TimelineFilter new.
	rule1 := timeLineFilter dateRule: september14Of2005.
	rule2 := timeLineFilter dateRule: september15Of2005.
	rule3 := timeLineFilter dateRule: september16Of2005.
	timeLineFilter addRules: (OrderedCollection with: rule1 with: rule2 with: rule3).

	self assert: (timeLineFilter includes: september14Of2005).
	self assert: (timeLineFilter includes: september15Of2005).
	self assert: (timeLineFilter includes: september16Of2005)
]

{ #category : #test }
TimelineFilterTest >> testAddRulesFrom [

	| timeLineFilter |

	timeLineFilter := TimelineFilter new.
	timeLineFilter
		addRules: (
			Array
				with: (timeLineFilter dayRule: GregorianCalendar saturday)
				with: (timeLineFilter dayRule: GregorianCalendar sunday))
		from: January first, 2004.

	self assert: (timeLineFilter includes: January third, 2004).
	self assert: (timeLineFilter includes: January fourth, 2004).
	self deny: (timeLineFilter includes: December twentyseventh,2004).
	self deny: (timeLineFilter includes: December twentyeighth, 2003)
]

{ #category : #test }
TimelineFilterTest >> testAddRulesFromTo [

	| timeLineFilter |

	timeLineFilter := TimelineFilter new.
	timeLineFilter
		addRules: (
			Array
				with: (timeLineFilter dayRule: GregorianCalendar saturday)
				with: (timeLineFilter dayRule: GregorianCalendar sunday))
		from: January first, 2004
		to: January ninth, 2004.

	self assert: (timeLineFilter includes: January third, 2004).
	self assert: (timeLineFilter includes: January fourth, 2004).
	self deny: (timeLineFilter includes: December twentyseventh, 2003).
	self deny: (timeLineFilter includes: December twentyeighth, 2003).
	self deny: (timeLineFilter includes: December tenth, 2003).
	self deny: (timeLineFilter includes: January eleventh, 2004)
]

{ #category : #test }
TimelineFilterTest >> testAddYearRule [

	| timeLineFilter |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addYearRule: 2004 asGregorianYear.

	self assert: (timeLineFilter includes: January third, 2004).
	self assert: (timeLineFilter includes: June third, 2004).
	self deny: (timeLineFilter includes: February third, 2005)
]

{ #category : #test }
TimelineFilterTest >> testDateRule [

	| rule |

	rule := TimelineFilter dateRule: January first, 2004.
	self assert: (rule includes: January first, 2004).
	self deny: (rule includes: January first, 2005)
]

{ #category : #test }
TimelineFilterTest >> testDayOfMonthRule [

	| rule |

	rule := TimelineFilter dayOfMonthRule: January first.
	self assert: (rule includes: January first, 2004).
	self assert: (rule includes: January first, 2005).
	self deny: (rule includes: January second, 2004)
]

{ #category : #test }
TimelineFilterTest >> testDayRule [

	| rule |

	rule := TimelineFilter dayRule: GregorianCalendar saturday.
	self assert: (rule includes: January third, 2004).
	self deny: (rule includes: January fourth, 2004)
]

{ #category : #test }
TimelineFilterTest >> testDaysBetween [

	| timeLineFilter days |

	timeLineFilter := TimelineFilter new.
	timeLineFilter
		addRules: (
			Array
				with: (timeLineFilter dayRule: GregorianCalendar saturday)
				with: (timeLineFilter dayRule: GregorianCalendar sunday))
		from: January first, 2004.
	days :=
		timeLineFilter
			daysBetween: December twentyseventh, 2003
			and: January fifth, 2004.

	self assert: days size = 2.
	self assert: (days includes: January third, 2004).
	self assert: (days includes: January fourth, 2004)
]

{ #category : #test }
TimelineFilterTest >> testEqual [

	self assert: (TimelineFilter named: 'Pedro Duque') = (TimelineFilter named: 'Pedro Duque')
]

{ #category : #test }
TimelineFilterTest >> testExcludedFromTo [

	| timeLineFilter excluded january4Of2004 january11Of2004 |

	january4Of2004 := January fourth, 2004.
	january11Of2004 := January eleventh, 2004.
	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: GregorianCalendar saturday.
	excluded := timeLineFilter excludedFrom: january4Of2004 to: january11Of2004.

	self assert: excluded size = 7.
	self assert: (excluded includes: january4Of2004).
	self assert: (excluded includes: January fifth, 2004).
	self assert: (excluded includes: January sixth, 2004).
	self assert: (excluded includes: January seventh, 2004).
	self assert: (excluded includes: January eighth, 2004).
	self assert: (excluded includes: January ninth, 2004).
	self assert: (excluded includes: january11Of2004)
]

{ #category : #test }
TimelineFilterTest >> testExcludedIn [

	| timeLineFilter excluded january4Of2004 january11Of2004 |

	january4Of2004 := January fourth, 2004.
	january11Of2004 := January eleventh, 2004.
	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: GregorianCalendar saturday.
	excluded := timeLineFilter excludedIn: (january4Of2004 to: january11Of2004).

	self assert: excluded size = 7.
	self assert: (excluded includes: january4Of2004).
	self assert: (excluded includes: January fifth, 2004).
	self assert: (excluded includes: January sixth, 2004).
	self assert: (excluded includes: January seventh, 2004).
	self assert: (excluded includes: January eighth, 2004).
	self assert: (excluded includes: January ninth, 2004).
	self assert: (excluded includes: january11Of2004)
]

{ #category : #test }
TimelineFilterTest >> testExcludes [

	| timeLineFilter |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: GregorianCalendar saturday.

	self assert: (timeLineFilter excludes: January fourth, 2004).
	self assert: (timeLineFilter excludes: January fifth, 2004).
	self assert: (timeLineFilter excludes: January sixth, 2004).
	self assert: (timeLineFilter excludes: January seventh, 2004).
	self assert: (timeLineFilter excludes: January eighth, 2004).
	self assert: (timeLineFilter excludes: January ninth, 2004).
	self deny: (timeLineFilter excludes: January tenth, 2004).
	self assert: (timeLineFilter excludes: January eleventh, 2004)
]

{ #category : #test }
TimelineFilterTest >> testExcludesAll [

	| timeLineFilter excluded |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: GregorianCalendar saturday.
	excluded := timeLineFilter excludedIn: (January fourth, 2004 to: January eleventh, 2004).
	self assert: (timeLineFilter excludesAll: excluded)
]

{ #category : #test }
TimelineFilterTest >> testHash [

	self assert: (TimelineFilter named: 'Pedro Duque') hash = (TimelineFilter named: 'Pedro Duque') hash
]

{ #category : #test }
TimelineFilterTest >> testIncludedFromTo [

	| timeLineFilter included |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: GregorianCalendar saturday.
	included :=
		timeLineFilter
			includedFrom: January first, 2004
			to: January eleventh, 2004.

	self assert: included size = 2.
	self assert: (included includes: January third, 2004).
	self assert: (included includes: January tenth, 2004)
]

{ #category : #test }
TimelineFilterTest >> testIncludedIn [

	| timeLineFilter included |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: GregorianCalendar saturday.
	included := timeLineFilter includedIn: (January first, 2004 to: January eleventh, 2004).

	self assert: included size = 2.
	self assert: (included includes: January third, 2004).
	self assert: (included includes: January tenth, 2004)
]

{ #category : #test }
TimelineFilterTest >> testIncludes [

	| timeLineFilter |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: GregorianCalendar saturday.

	self assert: (timeLineFilter includes: January third, 2004).
	self assert: (timeLineFilter includes: January tenth, 2004)
]

{ #category : #test }
TimelineFilterTest >> testIncludesAll [

	| timeLineFilter included |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: GregorianCalendar saturday.
	included := timeLineFilter includedIn: (January first, 2004 to: January eleventh, 2004).
	self assert: (timeLineFilter includesAll: included)
]

{ #category : #test }
TimelineFilterTest >> testMonthOfYearRule [

	| rule |

	rule := TimelineFilter monthOfYearRule: (January of: 2004).
	self assert: (rule includes: January third, 2004).
	self deny: (rule includes: January third, 2005)
]

{ #category : #test }
TimelineFilterTest >> testMonthRule [

	| rule |

	rule := TimelineFilter monthRule: January.
	self assert: (rule includes: January third, 2004).
	self assert: (rule includes: January third, 2005).
	self deny: (rule includes: February fourth, 2004)
]

{ #category : #test }
TimelineFilterTest >> testNegatedIncludes [

	| timeLineFilter |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: GregorianCalendar saturday.

	self assert: (timeLineFilter negated excludes: January third, 2004).
	self assert: (timeLineFilter negated includes: January fourth, 2004).
	self assert: (timeLineFilter negated includes: January fifth, 2004).
	self assert: (timeLineFilter negated includes: January sixth, 2004).
	self assert: (timeLineFilter negated includes: January seventh, 2004).
	self assert: (timeLineFilter negated includes: January eighth, 2004).
	self assert: (timeLineFilter negated includes: January ninth, 2004).
	self assert: (timeLineFilter negated excludes: January tenth, 2004)
]

{ #category : #test }
TimelineFilterTest >> testNegatedNext [
	| timeLineFilter timespan nextDate |
	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: GregorianCalendar saturday.
	timespan := TimeSpan from: January first , 2004 duration: 2 daysMeasure.
	nextDate := timeLineFilter negated next: timespan.
	self assert: nextDate = (January fourth , 2004)
]

{ #category : #test }
TimelineFilterTest >> testNextNegativeDuration [
	| timeLineFilter date |
	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: GregorianCalendar saturday.
	date := January thirtyfirst , 2004.
	self
		assert:
			(timeLineFilter next: (TimeSpan from: date duration: -1 dayMeasure)) = (date previousDay: GregorianCalendar saturday).
	self
		assert:
			(timeLineFilter next: (TimeSpan from: date duration: -2 daysMeasure))
				= ((date previousDay: GregorianCalendar saturday) previousDay: GregorianCalendar saturday)
]

{ #category : #test }
TimelineFilterTest >> testNextPositiveDuration [
	| timeLineFilter date |
	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: GregorianCalendar saturday.
	date := January first , 2004.
	self
		assert:
			(timeLineFilter next: (TimeSpan from: date duration: 1 dayMeasure)) = (date nextDay: GregorianCalendar saturday).
	self
		assert:
			(timeLineFilter next: (TimeSpan from: date duration: 2 daysMeasure))
				= ((date nextDay: GregorianCalendar saturday) nextDay: GregorianCalendar saturday).
	self assert: (timeLineFilter next: (TimeSpan from: date duration: 0 daysMeasure)) = date
]

{ #category : #test }
TimelineFilterTest >> testNumberOfDaysBetweenTwoDates [
	| timeLineFilter rule1 rule2 rule3 |
	timeLineFilter := TimelineFilter new.
	rule1 := timeLineFilter dateRule: September fourteenth , 2005.
	rule2 := timeLineFilter dateRule: September fifteenth , 2005.
	rule3 := timeLineFilter dateRule: September sixteenth , 2005.
	timeLineFilter addRules: (OrderedCollection with: rule1 with: rule2 with: rule3).
	self
		assert:
			(timeLineFilter negated numberOfDaysBetween: September first , 2005 and: September twentieth , 2005) = 17 daysMeasure
]

{ #category : #test }
TimelineFilterTest >> testPrintOn [

	| timeLineFilterUnnamed timeLineFilterNamed |

	timeLineFilterUnnamed := TimelineFilter new.
	timeLineFilterNamed := TimelineFilter named: 'Argentino'.

	self assert: timeLineFilterUnnamed printString = 'Unnamed'.
	self assert: timeLineFilterNamed printString = 'Argentino'
]

{ #category : #test }
TimelineFilterTest >> testRemoveAllRules [

	| timeLineFilter date anotherDate |

	date := January third. 2004.
	anotherDate := January fourth, 2004.
	timeLineFilter := TimelineFilter new.
	timeLineFilter addDateRule: date.
	timeLineFilter addDateRule: anotherDate.
	self assert: (timeLineFilter includes: date).
	self assert: (timeLineFilter includes: anotherDate).
	timeLineFilter removeAllRules.
	self deny: (timeLineFilter includes: date).
	self deny: (timeLineFilter includes: anotherDate).
	self assert: timeLineFilter rules isEmpty
]

{ #category : #test }
TimelineFilterTest >> testRemoveRule [

	| timeLineFilter rule |

	timeLineFilter := TimelineFilter new.
	rule := timeLineFilter dayRule: GregorianCalendar saturday.
	timeLineFilter addRule: rule.

	self assert: (timeLineFilter includes: January third, 2004).
	self deny: (timeLineFilter includes: January fourth, 2004).
	timeLineFilter removeRule: rule.
	self deny: (timeLineFilter includes: January third, 2004)
]

{ #category : #test }
TimelineFilterTest >> testRuleFromTo [

	| rule |

	rule :=
		TimelineFilter
			rule: (TimelineFilter dayOfMonthRule: January first)
			from: January first, 2004
			to: January first, 2006.

	self assert: (rule includes: January first, 2004).
	self assert: (rule includes: January first, 2005).
	self assert: (rule includes: January first, 2006).
	self deny: (rule includes: January second, 2004).
	self deny: (rule includes: January first, 2007).
	self deny: (rule includes: January first, 2003)
]

{ #category : #test }
TimelineFilterTest >> testRules [

	| timeLineFilter rule1 rule2 rule3 rulesCollection |

	timeLineFilter := TimelineFilter new.
	rule1 := timeLineFilter dateRule: September fourteenth, 2005.
	rule2 := timeLineFilter dateRule: September fifteenth, 2005.
	rule3 := timeLineFilter dateRule: September sixteenth, 2005.
	rulesCollection := OrderedCollection with: rule1 with: rule2 with: rule3.
	timeLineFilter addRules: rulesCollection.
	self assert: (timeLineFilter includesAll: (rulesCollection collect: [ :rule | rule date ]))
]

{ #category : #test }
TimelineFilterTest >> testRulesThatIncludeADate [

	| timeLineFilter rule1 rule2 rule3 september14Of2005 september15Of2005 september16Of2005 |

	september14Of2005 := September fourteenth, 2005.
	september15Of2005 := September fifteenth, 2005.
	september16Of2005 := September sixteenth, 2005.
	timeLineFilter := TimelineFilter new.
	rule1 := timeLineFilter dateRule: september14Of2005.
	rule2 := timeLineFilter dateRule: september15Of2005.
	rule3 := timeLineFilter dateRule: september16Of2005.
	timeLineFilter addRules: (OrderedCollection with: rule1 with: rule2 with: rule3).

	self assert: (timeLineFilter rulesThatInclude: september14Of2005) asOrderedCollection = (OrderedCollection with: rule1).
	self deny: (timeLineFilter rulesThatInclude: september15Of2005) asOrderedCollection = (OrderedCollection with: rule1).
	self deny: (timeLineFilter rulesThatInclude: september16Of2005) asOrderedCollection = (OrderedCollection with: rule1).
	self deny: (timeLineFilter rulesThatInclude: september14Of2005) asOrderedCollection = (OrderedCollection with: rule2).
	self assert: (timeLineFilter rulesThatInclude: september15Of2005) asOrderedCollection = (OrderedCollection with: rule2).
	self deny: (timeLineFilter rulesThatInclude: september16Of2005) asOrderedCollection = (OrderedCollection with: rule2).
	self deny: (timeLineFilter rulesThatInclude: september14Of2005) asOrderedCollection = (OrderedCollection with: rule3).
	self deny: (timeLineFilter rulesThatInclude: september15Of2005) asOrderedCollection = (OrderedCollection with: rule3).
	self assert: (timeLineFilter rulesThatInclude: september16Of2005) asOrderedCollection = (OrderedCollection with: rule3)
]

{ #category : #test }
TimelineFilterTest >> testStream [

	| timeLineFilter stream |

	timeLineFilter := TimelineFilter new.
	timeLineFilter addDayRule: GregorianCalendar saturday.
	stream := timeLineFilter streamFrom: January first, 2004.
	3 timesRepeat: [self assert: stream next day = GregorianCalendar saturday]
]

{ #category : #test }
TimelineFilterTest >> testYearRule [

	| rule |

	rule := TimelineFilter yearRule: 2004 asGregorianYear.
	self assert: (rule includes: January third, 2004).
	self assert: (rule includes: June third, 2004).
	self deny: (rule includes: January third, 2005)
]
