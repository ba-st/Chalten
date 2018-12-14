Extension { #name : #CalendarDefinition }

{ #category : #'*Chalten-Core-Hebrew' }
CalendarDefinition >> convertToHebrewDate: aDate [

	^HebrewCalendar dateFromDays: aDate dayNumberFromEpoch
]

{ #category : #'*Chalten-Core-Hebrew' }
CalendarDefinition >> convertToHebrewDateTime: aDateTime [

	^DateTime
		date: (self convertToHebrewDate: aDateTime date)
		timeOfDay: aDateTime timeOfDay
]
