Extension { #name : #Number }

{ #category : #'*Chalten-Hebrew-Calendar' }
Number >> asHebrewYear [

	^ChaltenYear number: self calendar: HebrewCalendar
]
