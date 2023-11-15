Extension { #name : 'GregorianCalendarDefinition' }

{ #category : '*Chalten-Core-Pharo-Extensions' }
GregorianCalendarDefinition >> initializeDaysGlobalVariables [

	Smalltalk at: #Monday put: self monday.
	Smalltalk at: #Tuesday put: self tuesday.
	Smalltalk at: #Wednesday put: self wednesday.
	Smalltalk at: #Thursday put: self thursday.
	Smalltalk at: #Friday put: self friday.
	Smalltalk at: #Saturday put: self saturday.
	Smalltalk at: #Sunday put: self sunday
]

{ #category : '*Chalten-Core-Pharo-Extensions' }
GregorianCalendarDefinition >> initializeMonthsGlobalVariables [

	Smalltalk at: #January put: self january.
	Smalltalk at: #February put: self february.
	Smalltalk at: #March put: self march.
	Smalltalk at: #April put: self april.
	Smalltalk at: #May put: self may.
	Smalltalk at: #June put: self june.
	Smalltalk at: #July put: self july.
	Smalltalk at: #August put: self august.
	Smalltalk at: #September put: self september.
	Smalltalk at: #October put: self october.
	Smalltalk at: #November put: self november.
	Smalltalk at: #December put: self december
]
