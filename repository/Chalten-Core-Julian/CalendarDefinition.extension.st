Extension { #name : #CalendarDefinition }

{ #category : #'*Chalten-Core-Julian' }
CalendarDefinition >> convertToJulianDate: aDate [

	^JulianCalendar dateFromDays: aDate dayNumberFromEpoch
]

{ #category : #'*Chalten-Core-Julian' }
CalendarDefinition >> convertToJulianDateTime: aDateTime [

	^DateTime
		date: (self convertToJulianDate: aDateTime date)
		timeOfDay: aDateTime timeOfDay
]
