Extension { #name : #Number }

{ #category : #'*Chalten-Core-Gregorian' }
Number >> asGregorianYear [

	^ChaltenYear number: self calendar: GregorianCalendar
]
