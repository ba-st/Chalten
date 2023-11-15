Class {
	#name : 'RelativeDateTest',
	#superclass : 'TestCase',
	#instVars : [
		'absoluteDate',
		'relativeDate',
		'twoDays',
		'timelineFilter',
		'gregorianCalendar'
	],
	#category : 'Chalten-Core-Tests-Filter',
	#package : 'Chalten-Core-Tests',
	#tag : 'Filter'
}

{ #category : 'initialization' }
RelativeDateTest >> setUp [

	gregorianCalendar := ChaltenEnvironment calendarNamed: #GregorianCalendar.
	timelineFilter := TimelineFilter new.
	timelineFilter addDayRule: gregorianCalendar saturday.
	timelineFilter addDayRule: gregorianCalendar sunday.
	relativeDate := RelativeDate
		timespan: (TimeSpan from: January first , 2004 duration: 72 hoursMeasure)
		using: timelineFilter negated.
	absoluteDate := January sixth , 2004.
	twoDays := 2 daysMeasure
]

{ #category : 'test absolute date' }
RelativeDateTest >> testAbsoluteDate [

	| absolute |
	absolute := relativeDate absoluteDate.
	self assert: absolute equals: relativeDate absoluteDate.
	timelineFilter addDateRule: January sixth , 2004.
	self deny: absolute = relativeDate absoluteDate.
	self assert: absolute next equals: relativeDate absoluteDate
]

{ #category : 'test converting' }
RelativeDateTest >> testAsGregorian [

	self
		assert: relativeDate asGregorian
		equals: absoluteDate asGregorian
]

{ #category : 'test converting' }
RelativeDateTest >> testAsSmalltalkDate [

	self
		assert: relativeDate asSmalltalkDate
		equals: absoluteDate asSmalltalkDate
]

{ #category : 'test accessing' }
RelativeDateTest >> testAtMidnight [

	self assert: relativeDate atMidnight equals: absoluteDate atMidnight
]

{ #category : 'test accessing' }
RelativeDateTest >> testAtNoon [

	self assert: relativeDate atNoon equals: absoluteDate atNoon
]

{ #category : 'test accessing' }
RelativeDateTest >> testAtTimeOfDay [

	self
		assert: (relativeDate atTimeOfDay: (TimeOfDay hours: 1))
		equals: (absoluteDate atTimeOfDay: (TimeOfDay hours: 1))
]

{ #category : 'test accessing' }
RelativeDateTest >> testCalendar [

	self assert: relativeDate calendar equals: gregorianCalendar
]

{ #category : 'test accessing' }
RelativeDateTest >> testDay [

	self assert: relativeDate day equals: absoluteDate day
]

{ #category : 'test accessing' }
RelativeDateTest >> testDayNumber [

	self assert: relativeDate dayNumber equals: absoluteDate dayNumber
]

{ #category : 'test accessing' }
RelativeDateTest >> testDayOfMonth [

	self assert: relativeDate dayOfMonth equals: absoluteDate dayOfMonth
]

{ #category : 'test accessing' }
RelativeDateTest >> testDaysFrom [

	self
		assert: (relativeDate distanceFrom: January first , 2004)
		equals: (absoluteDate distanceFrom: January first , 2004)
]

{ #category : 'test accessing' }
RelativeDateTest >> testDaysTo [

	self
		assert: (relativeDate distanceTo: January first , 2004)
		equals: (absoluteDate distanceTo: January first , 2004)
]

{ #category : 'test interval protocol' }
RelativeDateTest >> testDefaultIntervalIncrement [

	self
		assert: relativeDate defaultIntervalIncrement
		equals: absoluteDate defaultIntervalIncrement
]

{ #category : 'test comparing' }
RelativeDateTest >> testEqual [

	self assert: relativeDate equals: absoluteDate.
	self assert: absoluteDate equals: relativeDate
]

{ #category : 'test accessing datetime' }
RelativeDateTest >> testFirstTimeOfDay [

	self
		assert: relativeDate firstTimeOfDay
		equals: (January sixth , 2004) firstTimeOfDay
]

{ #category : 'test comparing' }
RelativeDateTest >> testGreaterThan [

	self
		assert: January first , 2004 > relativeDate
		equals: January first , 2004 > absoluteDate.
	self
		assert: January tenth , 2004 > relativeDate
		equals: January tenth , 2004 > absoluteDate
]

{ #category : 'test comparing' }
RelativeDateTest >> testHash [

	| anotherRelativeDate |
	anotherRelativeDate := RelativeDate
		                       timespan:
		                       (TimeSpan
			                        from: January first , 2004
			                        duration: 72 hoursMeasure)
		                       using: timelineFilter negated.
	self
		assert: relativeDate hash equals: anotherRelativeDate hash;
		assert: relativeDate hash equals: absoluteDate hash
]

{ #category : 'test interval protocol' }
RelativeDateTest >> testIntervalStrategy [

	self
		assert: relativeDate intervalStrategy
		equals: absoluteDate intervalStrategy
]

{ #category : 'test querying' }
RelativeDateTest >> testIsFirstDayOfMonth [

	self
		assert: relativeDate isFirstDayOfMonth
		equals: absoluteDate isFirstDayOfMonth
]

{ #category : 'test querying' }
RelativeDateTest >> testIsFirstDayOfYear [

	self
		assert: relativeDate isFirstDayOfYear
		equals: absoluteDate isFirstDayOfYear
]

{ #category : 'test querying' }
RelativeDateTest >> testIsLastDayOfMonth [

	self
		assert: relativeDate isLastDayOfMonth
		equals: absoluteDate isLastDayOfMonth
]

{ #category : 'test querying' }
RelativeDateTest >> testIsLastDayOfYear [

	self
		assert: relativeDate isLastDayOfYear
		equals: absoluteDate isLastDayOfYear
]

{ #category : 'test accessing datetime' }
RelativeDateTest >> testLastTimeOfDay [

	self
		assert: relativeDate lastTimeOfDay
		equals: (January sixth , 2004) lastTimeOfDay
]

{ #category : 'test comparing' }
RelativeDateTest >> testLessThan [

	self
		assert: relativeDate < (January first , 2004)
		equals: absoluteDate < (January first , 2004).
	self
		assert: relativeDate < (January tenth , 2004)
		equals: absoluteDate < (January tenth , 2004)
]

{ #category : 'test accessing' }
RelativeDateTest >> testMonth [

	self assert: relativeDate month equals: absoluteDate month
]

{ #category : 'test accessing' }
RelativeDateTest >> testMonthNumber [

	self
		assert: relativeDate monthNumber
		equals: absoluteDate monthNumber
]

{ #category : 'test accessing' }
RelativeDateTest >> testMonthOfYear [

	self
		assert: relativeDate monthOfYear
		equals: absoluteDate monthOfYear
]

{ #category : 'test enumerating' }
RelativeDateTest >> testNext [

	self assert: relativeDate next equals: absoluteDate next.
	self
		assert: (relativeDate next: twoDays)
		equals: (absoluteDate next: twoDays)
]

{ #category : 'test enumerating' }
RelativeDateTest >> testNextDay [

	self
		assert: (relativeDate nextDay: gregorianCalendar saturday)
		equals: (absoluteDate nextDay: gregorianCalendar saturday)
]

{ #category : 'test accessing' }
RelativeDateTest >> testNumberOfDaysFromBeginningOfMonth [

	self
		assert: relativeDate numberOfDaysFromBeginningOfMonth
		equals: absoluteDate numberOfDaysFromBeginningOfMonth
]

{ #category : 'test accessing' }
RelativeDateTest >> testNumberOfDaysFromBeginningOfYear [

	self
		assert: relativeDate numberOfDaysFromBeginningOfYear
		equals: absoluteDate numberOfDaysFromBeginningOfYear
]

{ #category : 'test accessing' }
RelativeDateTest >> testNumberOfDaysFromEpoch [

	self
		assert: relativeDate numberOfDaysFromEpoch
		equals: absoluteDate numberOfDaysFromEpoch
]

{ #category : 'test accessing' }
RelativeDateTest >> testNumberOfDaysToEndOfMonth [

	self
		assert: relativeDate numberOfDaysToEndOfMonth
		equals: absoluteDate numberOfDaysToEndOfMonth
]

{ #category : 'test accessing' }
RelativeDateTest >> testNumberOfDaysToEndOfYear [

	self
		assert: relativeDate numberOfDaysToEndOfYear
		equals: absoluteDate numberOfDaysToEndOfYear
]

{ #category : 'test enumerating' }
RelativeDateTest >> testPrevious [

	self assert: relativeDate previous equals: absoluteDate previous.
	self
		assert: (relativeDate previous: twoDays)
		equals: (absoluteDate previous: twoDays)
]

{ #category : 'test enumerating' }
RelativeDateTest >> testPreviousDay [

	self
		assert: (relativeDate previousDay: gregorianCalendar saturday)
		equals: (absoluteDate previousDay: gregorianCalendar saturday)
]

{ #category : 'test printing' }
RelativeDateTest >> testPrintOn [

	self assert: relativeDate printString equals: 'January 6, 2004'
]

{ #category : 'test accessing' }
RelativeDateTest >> testTimelineFilter [

	self
		assert: relativeDate timelineFilter
		equals: timelineFilter negated
]

{ #category : 'test accessing' }
RelativeDateTest >> testTimespan [

	self
		assert: relativeDate timespan
		equals:
		(TimeSpan from: January first , 2004 duration: 72 hoursMeasure)
]

{ #category : 'test interval protocol' }
RelativeDateTest >> testToEvery [

	| dates1 dates2 |
	dates1 := relativeDate
		          to: January thirtyfirst , 2004
		          every:
		          (Array
			           with: gregorianCalendar monday
			           with: gregorianCalendar tuesday).
	dates2 := absoluteDate
		          to: January thirtyfirst , 2004
		          every:
		          (Array
			           with: gregorianCalendar monday
			           with: gregorianCalendar tuesday).
	self assert: dates1 equals: dates2
]

{ #category : 'test interval protocol' }
RelativeDateTest >> testToEveryDay [

	| dates1 dates2 |
	dates1 := relativeDate
		          to: January thirtyfirst , 2004
		          everyDay: gregorianCalendar monday.
	dates2 := absoluteDate
		          to: January thirtyfirst , 2004
		          everyDay: gregorianCalendar monday.
	self assert: dates1 equals: dates2
]

{ #category : 'test interval protocol' }
RelativeDateTest >> testToEveryDayNumber [

	| dates1 dates2 |
	dates1 := relativeDate
		          to: January thirtyfirst , 2004
		          everyDayNumber: 15.
	dates2 := absoluteDate
		          to: January thirtyfirst , 2004
		          everyDayNumber: 15.
	self assert: dates1 equals: dates2
]

{ #category : 'test interval protocol' }
RelativeDateTest >> testToEveryDayNumbers [

	| dates1 dates2 |
	dates1 := relativeDate
		          to: January thirtyfirst , 2004
		          everyDayNumbers: (Array with: 15 with: 20).
	dates2 := absoluteDate
		          to: January thirtyfirst , 2004
		          everyDayNumbers: (Array with: 15 with: 20).
	self assert: dates1 equals: dates2
]

{ #category : 'test evaluating' }
RelativeDateTest >> testValue [

	self assert: relativeDate value equals: January sixth , 2004
]

{ #category : 'test accessing' }
RelativeDateTest >> testYear [

	self assert: relativeDate year equals: absoluteDate year
]

{ #category : 'test accessing' }
RelativeDateTest >> testYearNumber [

	self assert: relativeDate yearNumber equals: absoluteDate yearNumber
]
