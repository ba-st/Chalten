Extension { #name : #Number }

{ #category : #'*Chalten-Core-Julian' }
Number >> asJulianYear [

	^ChaltenYear number: self calendar: JulianCalendar
]
