"
A DateBehavior is an abstract class wich defines common protocol for objects representing dates.

"
Class {
	#name : 'DateBehavior',
	#superclass : 'PointInTime',
	#category : 'Chalten-Core-Time',
	#package : 'Chalten-Core',
	#tag : 'Time'
}

{ #category : 'accessing datetime' }
DateBehavior >> atLastTimeOfDay [

	^self atTimeOfDay: TimeOfDay lastTimeOfDay
]

{ #category : 'accessing datetime' }
DateBehavior >> atMidnight [

	^self atTimeOfDay: TimeOfDay midnight
]

{ #category : 'accessing datetime' }
DateBehavior >> atNoon [

	^self atTimeOfDay: TimeOfDay noon
]

{ #category : 'accessing datetime' }
DateBehavior >> atTimeOfDay: aTimeOfDay [

	self subclassResponsibility
]

{ #category : 'accessing' }
DateBehavior >> calendar [

	self subclassResponsibility
]

{ #category : 'accessing days' }
DateBehavior >> day [

	self subclassResponsibility
]

{ #category : 'accessing' }
DateBehavior >> dayNumber [

	self subclassResponsibility
]

{ #category : 'accessing days' }
DateBehavior >> dayNumberFromEpoch [

	self subclassResponsibility
]

{ #category : 'accessing' }
DateBehavior >> dayOfMonth [

	self subclassResponsibility
]

{ #category : 'interval protocol - private' }
DateBehavior >> defaultIntervalIncrement [
	^ 1 dayMeasure
]

{ #category : 'enumerating - private' }
DateBehavior >> distanceInDaysFrom: aDayOfMonth [

	| fromYear |
	
	fromYear := self dayOfMonth >= aDayOfMonth
		ifTrue: [self year]
		ifFalse: [self year previous].
	^self distanceFrom: (aDayOfMonth ofYear: fromYear)
]

{ #category : 'enumerating - private' }
DateBehavior >> distanceInDaysTo: aDayOfMonth [

	| toYear |
	
	toYear := self dayOfMonth <= aDayOfMonth
		ifTrue: [self year]
		ifFalse: [self year next].
	^self distanceTo: (aDayOfMonth ofYear: toYear)
]

{ #category : 'querying' }
DateBehavior >> distanceTo: aDate [

	^aDate numberOfDaysFromEpoch - self numberOfDaysFromEpoch
]

{ #category : 'accessing datetime' }
DateBehavior >> firstTimeOfDay [

	self subclassResponsibility
]

{ #category : 'interval protocol - private' }
DateBehavior >> intervalStrategy [

	^PointInTimeIntervalStrategy new
]

{ #category : 'testing' }
DateBehavior >> is: aDay [

	^self day is: aDay
]

{ #category : 'testing' }
DateBehavior >> isFirstDayOfMonth [

	self subclassResponsibility
]

{ #category : 'testing' }
DateBehavior >> isFirstDayOfYear [

	self subclassResponsibility
]

{ #category : 'testing' }
DateBehavior >> isFirstMonthOfYear [

	^self month isFirstMonthOfYear
]

{ #category : 'testing' }
DateBehavior >> isIn: aMonth [

	^self month is: aMonth
]

{ #category : 'testing' }
DateBehavior >> isLastDayOfMonth [

	self subclassResponsibility
]

{ #category : 'testing' }
DateBehavior >> isLastDayOfYear [

	self subclassResponsibility
]

{ #category : 'accessing datetime' }
DateBehavior >> lastTimeOfDay [

	self subclassResponsibility
]

{ #category : 'accessing' }
DateBehavior >> month [
	
	^self monthOfYear month
]

{ #category : 'accessing' }
DateBehavior >> monthNumber [

	^self month number
]

{ #category : 'accessing' }
DateBehavior >> monthOfYear [

	self subclassResponsibility
]

{ #category : 'enumerating' }
DateBehavior >> nextDay: aDay [

	| day |

	day := self day.
	^day = aDay
		ifTrue: [self next: self calendar numberOfDaysPerWeek]
		ifFalse: [self next: (day distanceTo: aDay)]
]

{ #category : 'enumerating' }
DateBehavior >> nextDayOfMonth: aDayOfMonth [

	^self next: (self distanceInDaysTo: aDayOfMonth)
]

{ #category : 'accessing days' }
DateBehavior >> numberOfDaysFromBeginningOfMonth [

	self subclassResponsibility
]

{ #category : 'accessing days' }
DateBehavior >> numberOfDaysFromBeginningOfYear [

	self subclassResponsibility
]

{ #category : 'accessing days' }
DateBehavior >> numberOfDaysFromEpoch [

	self subclassResponsibility
]

{ #category : 'accessing days' }
DateBehavior >> numberOfDaysToEndOfMonth [

	self subclassResponsibility
]

{ #category : 'accessing days' }
DateBehavior >> numberOfDaysToEndOfYear [

	self subclassResponsibility
]

{ #category : 'enumerating' }
DateBehavior >> previousDay: aDay [

	| day |

	day := self day.
	^day = aDay
		ifTrue: [self previous: self calendar numberOfDaysPerWeek]
		ifFalse: [self previous: (day distanceFrom: aDay)]
]

{ #category : 'enumerating' }
DateBehavior >> previousDayOfMonth: aDayOfMonth [

	^self previous: (self distanceInDaysFrom: aDayOfMonth)
]

{ #category : 'interval protocol' }
DateBehavior >> to: aDate every: aCollectionOfDays [

	^(self to: aDate) select: [:date | aCollectionOfDays includes: date day]
]

{ #category : 'interval protocol' }
DateBehavior >> to: aDate everyDay: aDay [

	^self to: aDate every: (Array with: aDay)
]

{ #category : 'interval protocol' }
DateBehavior >> to: aDate everyDayNumber: aDayNumber [

	^self to: aDate everyDayNumbers: (Array with: aDayNumber)
]

{ #category : 'interval protocol' }
DateBehavior >> to: aDate everyDayNumbers: aCollectionOfDayNumbers [

	^(self to: aDate) select: [:date | aCollectionOfDayNumbers includes: date dayNumber]
]

{ #category : 'interval protocol' }
DateBehavior >> to: aDate everyDayOfMonth: aDayOfMonth [

	^self to: aDate everyDayOfMonths: (Array with: aDayOfMonth)
]

{ #category : 'interval protocol' }
DateBehavior >> to: aDate everyDayOfMonths: aCollectionOfDayOfMonths [

	^(self to: aDate)
		select: [:date | aCollectionOfDayOfMonths includes: date dayOfMonth]
]

{ #category : 'accessing' }
DateBehavior >> year [

	^self monthOfYear year
]

{ #category : 'accessing' }
DateBehavior >> yearNumber [

	^self year number
]
