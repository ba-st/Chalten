Extension { #name : #Number }

{ #category : #'*Chalten-Gregorian-Calendar' }
Number >> asGregorianYear [

	^ChaltenYear number: self calendar: GregorianCalendar
]

{ #category : #'*Chalten-Gregorian-Calendar' }
Number >> gregorianDay [

	^ self gregorianDays
]

{ #category : #'*Chalten-Gregorian-Calendar' }
Number >> gregorianDays [

	^ TimeUnits day with: self
]

{ #category : #'*Chalten-Gregorian-Calendar' }
Number >> gregorianMonth [
	
	^ GregorianCalendar monthUnit with: self
]

{ #category : #'*Chalten-Gregorian-Calendar' }
Number >> gregorianMonths [

	^ self gregorianMonth
]

{ #category : #'*Chalten-Gregorian-Calendar' }
Number >> gregorianWeek [
	
	^ self gregorianWeeks
]

{ #category : #'*Chalten-Gregorian-Calendar' }
Number >> gregorianWeeks [

	^ ( GregorianTimeConcepts bindingOf: #GregorianTimeUnits ) value >> #week with: self
]

{ #category : #'*Chalten-Gregorian-Calendar' }
Number >> gregorianYear [
	
	^ ( GregorianTimeConcepts bindingOf: #GregorianTimeUnits ) value >> #year with: self
]
