Extension { #name : #Number }

{ #category : #'*Chalten-Julian-Calendar' }
Number >> asJulianYear [

	^ChaltenYear number: self calendar: JulianCalendar
]
