"
An ArgentineLaw23555Rule is an inclusion rule defined by the Argentine Law 23555 wich says that when one national nonworking date is in tuesday or wednesday the nonworking day will be transferred to the previous monday and, when the nonworking date is in thursday or friday it will be transferred to the next monday.

Instance Variables
	dayOfMonth:		<DayOfMonth>

dayOfMonth
	- The national nonworking day.

"
Class {
	#name : 'ArgentineLaw23555Rule',
	#superclass : 'InclusionRule',
	#instVars : [
		'dayOfMonth'
	],
	#category : 'Chalten-Core-Filter',
	#package : 'Chalten-Core',
	#tag : 'Filter'
}

{ #category : 'instance creation' }
ArgentineLaw23555Rule class >> dayOfMonth: aDayOfMonth [ 

	^self new initializeDayOfMonth: aDayOfMonth
]

{ #category : 'instance creation' }
ArgentineLaw23555Rule class >> monthNumber: aMonthNumber dayNumber: aDayNumber [

	^ self dayOfMonth: (DayOfMonth
			   monthNumber: aMonthNumber
			   dayNumber: aDayNumber
			   calendar: (ChaltenEnvironment calendarNamed: #GregorianCalendar))
]

{ #category : 'accessing' }
ArgentineLaw23555Rule >> dayOfMonth [
	
	^dayOfMonth
]

{ #category : 'querying - private' }
ArgentineLaw23555Rule >> goToNextMondayIfNeeded: aGregorianDate [

	^(self mustGoToNextMonday: aGregorianDate)
		ifTrue: [aGregorianDate nextDay: (ChaltenEnvironment calendarNamed: #GregorianCalendar) monday]
		ifFalse: [aGregorianDate]
]

{ #category : 'querying - private' }
ArgentineLaw23555Rule >> goToPreviousMondayIfNeeded: aGregorianDate [

	^(self mustGoToPreviousMonday: aGregorianDate)
		ifTrue: [aGregorianDate previousDay: (ChaltenEnvironment calendarNamed: #GregorianCalendar) monday]
		ifFalse: [aGregorianDate]
]

{ #category : 'querying - private' }
ArgentineLaw23555Rule >> goToPreviousOrNextMonday: aGregorianDate [

	| gregorianDate |

	gregorianDate := self goToPreviousMondayIfNeeded: aGregorianDate.
	gregorianDate := self goToNextMondayIfNeeded: gregorianDate.

	^gregorianDate
]

{ #category : 'querying' }
ArgentineLaw23555Rule >> includes: aGregorianDate [

	| includedDate |

	includedDate := self dayOfMonth ofYear: aGregorianDate year.
	includedDate := self goToPreviousOrNextMonday: includedDate.

	^aGregorianDate = includedDate
]

{ #category : 'initialization' }
ArgentineLaw23555Rule >> initializeDayOfMonth: aGregorianDayOfMonth [

	dayOfMonth := aGregorianDayOfMonth
]

{ #category : 'querying - private' }
ArgentineLaw23555Rule >> mustGoToNextMonday: aGregorianDate [

	^aGregorianDate day = (ChaltenEnvironment calendarNamed: #GregorianCalendar) thursday
		or: [aGregorianDate day = (ChaltenEnvironment calendarNamed: #GregorianCalendar) friday]
]

{ #category : 'querying - private' }
ArgentineLaw23555Rule >> mustGoToPreviousMonday: aGregorianDate [

	^aGregorianDate day = (ChaltenEnvironment calendarNamed: #GregorianCalendar) tuesday
		or: [aGregorianDate day = (ChaltenEnvironment calendarNamed: #GregorianCalendar) wednesday]
]

{ #category : 'printing' }
ArgentineLaw23555Rule >> printOn: aStream [

	self dayOfMonth printOn: aStream.
	aStream nextPutAll: ' transferable holiday by Argentine Law 23555'
]
