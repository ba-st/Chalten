Extension { #name : #Number }

{ #category : #'*Chalten-Islamic-Calendar' }
Number >> asIslamicYear [

	^ChaltenYear number: self calendar: IslamicCalendar
]

{ #category : #'*Chalten-Islamic-Calendar' }
Number >> islamicMonth [

	^ IslamicCalendar monthUnit with: self
]

{ #category : #'*Chalten-Islamic-Calendar' }
Number >> islamicMonths [

	^ self islamicMonth 
]

{ #category : #'*Chalten-Islamic-Calendar' }
Number >> islamicWeek [

	^ ( IslamicTimeConcepts bindingOf: #IslamicTimeUnits ) value >> #week with: self
]

{ #category : #'*Chalten-Islamic-Calendar' }
Number >> islamicYear [

	^ IslamicCalendar yearUnit with: self
]

{ #category : #'*Chalten-Islamic-Calendar' }
Number >> islamicYears [

	^ self islamicYear
]
