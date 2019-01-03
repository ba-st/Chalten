Class {
	#name : #RelativeDateTest,
	#superclass : #TestCase,
	#instVars : [
		'absoluteDate',
		'relativeDate',
		'twoDays',
		'timelineFilter'
	],
	#category : #'Chalten-Core-Tests-Filter'
}

{ #category : #initialization }
RelativeDateTest >> setUp [
	timelineFilter := TimelineFilter new.
	timelineFilter addDayRule: GregorianCalendar saturday.
	timelineFilter addDayRule: GregorianCalendar sunday.
	relativeDate := RelativeDate
		timespan: (TimeSpan from: January first , 2004 duration: 72 hoursMeasure)
		using: timelineFilter negated.
	absoluteDate := January sixth , 2004.
	twoDays := 2 daysMeasure
]

{ #category : #'test absolute date' }
RelativeDateTest >> testAbsoluteDate [

	| absolute |

	absolute := relativeDate absoluteDate.
	self assert: absolute = relativeDate absoluteDate.
	timelineFilter addDateRule: January sixth, 2004.
	self deny: absolute = relativeDate absoluteDate.
	self assert: absolute next = relativeDate absoluteDate
]

{ #category : #'test converting' }
RelativeDateTest >> testAsGregorian [

	self assert: relativeDate asGregorian = absoluteDate asGregorian
]

{ #category : #'test converting' }
RelativeDateTest >> testAsSmalltalkDate [

	self assert: relativeDate asSmalltalkDate = absoluteDate asSmalltalkDate
]

{ #category : #'test accessing' }
RelativeDateTest >> testAtMidnight [

	self assert: relativeDate atMidnight = absoluteDate atMidnight
]

{ #category : #'test accessing' }
RelativeDateTest >> testAtNoon [

	self assert: relativeDate atNoon = absoluteDate atNoon
]

{ #category : #'test accessing' }
RelativeDateTest >> testAtTimeOfDay [

	self assert:
		(relativeDate atTimeOfDay: (TimeOfDay hours: 1)) =
			(absoluteDate atTimeOfDay: (TimeOfDay hours: 1))
]

{ #category : #'test accessing' }
RelativeDateTest >> testCalendar [

	self assert: relativeDate calendar = GregorianCalendar
]

{ #category : #'test accessing' }
RelativeDateTest >> testDay [

	self assert: relativeDate day = absoluteDate day
]

{ #category : #'test accessing' }
RelativeDateTest >> testDayNumber [

	self assert: relativeDate dayNumber = absoluteDate dayNumber
]

{ #category : #'test accessing' }
RelativeDateTest >> testDayOfMonth [

	self assert: relativeDate dayOfMonth = absoluteDate dayOfMonth
]

{ #category : #'test accessing' }
RelativeDateTest >> testDaysFrom [

	self assert: (relativeDate distanceFrom: January first, 2004) = (absoluteDate distanceFrom: January first, 2004)
]

{ #category : #'test accessing' }
RelativeDateTest >> testDaysTo [

	self assert: (relativeDate distanceTo: January first, 2004) = (absoluteDate distanceTo: January first, 2004)
]

{ #category : #'test interval protocol' }
RelativeDateTest >> testDefaultIntervalIncrement [

	self assert: relativeDate defaultIntervalIncrement = absoluteDate defaultIntervalIncrement
]

{ #category : #'test comparing' }
RelativeDateTest >> testEqual [

	self assert: relativeDate = absoluteDate.
	self assert: absoluteDate = relativeDate
]

{ #category : #'test accessing datetime' }
RelativeDateTest >> testFirstTimeOfDay [

	self assert: relativeDate firstTimeOfDay = (January sixth, 2004) firstTimeOfDay
]

{ #category : #'test comparing' }
RelativeDateTest >> testGreaterThan [

	self assert: (January first, 2004) > relativeDate = ((January first, 2004) > absoluteDate).
	self assert: (January tenth, 2004) > relativeDate = ((January tenth, 2004) > absoluteDate)
]

{ #category : #'test comparing' }
RelativeDateTest >> testHash [
	| anotherRelativeDate |
	anotherRelativeDate := RelativeDate
		timespan: (TimeSpan from: January first , 2004 duration: 72 hoursMeasure)
		using: timelineFilter negated.
	self
		assert: relativeDate hash = anotherRelativeDate hash;
		assert: relativeDate hash = absoluteDate hash
]

{ #category : #'test interval protocol' }
RelativeDateTest >> testIntervalStrategy [

	self assert: relativeDate intervalStrategy = absoluteDate intervalStrategy
]

{ #category : #'test querying' }
RelativeDateTest >> testIsFirstDayOfMonth [

	self assert: relativeDate isFirstDayOfMonth = absoluteDate isFirstDayOfMonth
]

{ #category : #'test querying' }
RelativeDateTest >> testIsFirstDayOfYear [

	self assert: relativeDate isFirstDayOfYear = absoluteDate isFirstDayOfYear
]

{ #category : #'test querying' }
RelativeDateTest >> testIsLastDayOfMonth [

	self assert: relativeDate isLastDayOfMonth = absoluteDate isLastDayOfMonth
]

{ #category : #'test querying' }
RelativeDateTest >> testIsLastDayOfYear [

	self assert: relativeDate isLastDayOfYear = absoluteDate isLastDayOfYear
]

{ #category : #'test accessing datetime' }
RelativeDateTest >> testLastTimeOfDay [

	self assert: relativeDate lastTimeOfDay = (January sixth, 2004) lastTimeOfDay
]

{ #category : #'test comparing' }
RelativeDateTest >> testLessThan [

	self assert: relativeDate < (January first, 2004) = (absoluteDate < (January first, 2004)).
	self assert: relativeDate < (January tenth, 2004) = (absoluteDate < (January tenth, 2004))
]

{ #category : #'test accessing' }
RelativeDateTest >> testMonth [

	self assert: relativeDate month = absoluteDate month
]

{ #category : #'test accessing' }
RelativeDateTest >> testMonthNumber [

	self assert: relativeDate monthNumber = absoluteDate monthNumber
]

{ #category : #'test accessing' }
RelativeDateTest >> testMonthOfYear [

	self assert: relativeDate monthOfYear = absoluteDate monthOfYear
]

{ #category : #'test enumerating' }
RelativeDateTest >> testNext [

	self assert: relativeDate next = absoluteDate next.
	self assert: (relativeDate next: twoDays) = (absoluteDate next: twoDays)
]

{ #category : #'test enumerating' }
RelativeDateTest >> testNextDay [

	self assert:
		(relativeDate nextDay: GregorianCalendar saturday) =
			(absoluteDate nextDay: GregorianCalendar saturday)
]

{ #category : #'test accessing' }
RelativeDateTest >> testNumberOfDaysFromBeginningOfMonth [

	self assert:
		relativeDate numberOfDaysFromBeginningOfMonth = absoluteDate numberOfDaysFromBeginningOfMonth
]

{ #category : #'test accessing' }
RelativeDateTest >> testNumberOfDaysFromBeginningOfYear [

	self assert:
		relativeDate numberOfDaysFromBeginningOfYear = absoluteDate numberOfDaysFromBeginningOfYear
]

{ #category : #'test accessing' }
RelativeDateTest >> testNumberOfDaysFromEpoch [

	self assert: relativeDate numberOfDaysFromEpoch = absoluteDate numberOfDaysFromEpoch
]

{ #category : #'test accessing' }
RelativeDateTest >> testNumberOfDaysToEndOfMonth [

	self assert: relativeDate numberOfDaysToEndOfMonth = absoluteDate numberOfDaysToEndOfMonth
]

{ #category : #'test accessing' }
RelativeDateTest >> testNumberOfDaysToEndOfYear [

	self assert: relativeDate numberOfDaysToEndOfYear = absoluteDate numberOfDaysToEndOfYear
]

{ #category : #'test enumerating' }
RelativeDateTest >> testPrevious [

	self assert: relativeDate previous = absoluteDate previous.
	self assert: (relativeDate previous: twoDays) = (absoluteDate previous: twoDays)
]

{ #category : #'test enumerating' }
RelativeDateTest >> testPreviousDay [

	self assert:
		(relativeDate previousDay: GregorianCalendar saturday) =
			(absoluteDate previousDay: GregorianCalendar saturday)
]

{ #category : #'test printing' }
RelativeDateTest >> testPrintOn [

	self assert: relativeDate printString = 'January 6, 2004'
]

{ #category : #'test accessing' }
RelativeDateTest >> testTimelineFilter [

	self assert: relativeDate timelineFilter = timelineFilter negated
]

{ #category : #'test accessing' }
RelativeDateTest >> testTimespan [

	self assert: relativeDate timespan = (TimeSpan from: January first , 2004 duration: 72 hoursMeasure)
]

{ #category : #'test interval protocol' }
RelativeDateTest >> testToEvery [

	| dates1 dates2 |

	dates1 := relativeDate to: January thirtyfirst, 2004 every: (Array with: GregorianCalendar monday with: GregorianCalendar tuesday).
	dates2 := absoluteDate to: January thirtyfirst, 2004 every: (Array with: GregorianCalendar monday with: GregorianCalendar tuesday).
	self assert: dates1 = dates2
]

{ #category : #'test interval protocol' }
RelativeDateTest >> testToEveryDay [

	| dates1 dates2 |

	dates1 := relativeDate to: January thirtyfirst, 2004 everyDay: GregorianCalendar monday.
	dates2 := absoluteDate to: January thirtyfirst, 2004 everyDay: GregorianCalendar monday.
	self assert: dates1 = dates2
]

{ #category : #'test interval protocol' }
RelativeDateTest >> testToEveryDayNumber [

	| dates1 dates2 |

	dates1 := relativeDate to: January thirtyfirst, 2004 everyDayNumber: 15.
	dates2 := absoluteDate to: January thirtyfirst, 2004 everyDayNumber: 15.
	self assert: dates1 = dates2
]

{ #category : #'test interval protocol' }
RelativeDateTest >> testToEveryDayNumbers [

	| dates1 dates2 |

	dates1 := relativeDate to: January thirtyfirst, 2004 everyDayNumbers: (Array with: 15 with: 20).
	dates2 := absoluteDate to: January thirtyfirst, 2004 everyDayNumbers: (Array with: 15 with: 20).
	self assert: dates1 = dates2
]

{ #category : #'test evaluating' }
RelativeDateTest >> testValue [

	self assert: relativeDate value = (January sixth, 2004)
]

{ #category : #'test accessing' }
RelativeDateTest >> testYear [

	self assert: relativeDate year = absoluteDate year
]

{ #category : #'test accessing' }
RelativeDateTest >> testYearNumber [

	self assert: relativeDate yearNumber = absoluteDate yearNumber
]
