Extension { #name : #CalendarDefinition }

{ #category : #'*Chalten-Core-Gregorian' }
CalendarDefinition >> convertToGregorianDate: aDate [

	^GregorianCalendar dateFromDays: aDate dayNumberFromEpoch
]

{ #category : #'*Chalten-Core-Gregorian' }
CalendarDefinition >> convertToGregorianDateTime: aDateTime [

	^DateTime
		date: (self convertToGregorianDate: aDateTime date)
		timeOfDay: aDateTime timeOfDay
]
