Extension { #name : #Number }

{ #category : #'*Chalten-Core-Hebrew' }
Number >> asHebrewYear [

	^ChaltenYear number: self calendar: HebrewCalendar
]
