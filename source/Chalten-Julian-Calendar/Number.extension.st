Extension { #name : #Number }

{ #category : #'*Chalten-Julian-Calendar' }
Number >> asJulianYear [

	^ChaltenYear number: self calendar: JulianCalendar
]

{ #category : #'*Chalten-Julian-Calendar' }
Number >> julianMonth [

	^ self julianMonths
]

{ #category : #'*Chalten-Julian-Calendar' }
Number >> julianMonths [

	^ JulianCalendar monthUnit with: self 
]

{ #category : #'*Chalten-Julian-Calendar' }
Number >> julianWeek [

	^ ( JulianTimeConcepts bindingOf: #JulianTimeUnits ) value >> #week with: self
]

{ #category : #'*Chalten-Julian-Calendar' }
Number >> julianYears [

	^ JulianCalendar yearUnit with: self 
]
