Extension { #name : #Number }

{ #category : #'*Chalten-Hebrew-Calendar' }
Number >> asHebrewYear [

	^ChaltenYear number: self calendar: HebrewCalendar
]

{ #category : #'*Chalten-Hebrew-Calendar' }
Number >> hebrewDay [

	^  TimeUnits day with: self 
]

{ #category : #'*Chalten-Hebrew-Calendar' }
Number >> hebrewMonth [

	^ HebrewCalendar monthUnit with: self
]

{ #category : #'*Chalten-Hebrew-Calendar' }
Number >> hebrewWeek [

	^  ( HebrewTimeConcepts bindingOf: #HebrewTimeUnits ) value >> #week with: self 
]

{ #category : #'*Chalten-Hebrew-Calendar' }
Number >> hebrewYear [
	
	^  ( HebrewTimeConcepts bindingOf: #HebrewTimeUnits ) value >> #year with: self 
]
