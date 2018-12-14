Extension { #name : #CalendarDefinition }

{ #category : #'*Chalten-Core-Islamic' }
CalendarDefinition >> convertToIslamicDate: aDate [

	^IslamicCalendar dateFromDays: aDate dayNumberFromEpoch
]

{ #category : #'*Chalten-Core-Islamic' }
CalendarDefinition >> convertToIslamicDateTime: aDateTime [

	^DateTime
		date: (self convertToIslamicDate: aDateTime date)
		timeOfDay: aDateTime timeOfDay
]
