Extension { #name : #Number }

{ #category : #'*Chalten-Core-Islamic' }
Number >> asIslamicYear [

	^ChaltenYear number: self calendar: IslamicCalendar
]
