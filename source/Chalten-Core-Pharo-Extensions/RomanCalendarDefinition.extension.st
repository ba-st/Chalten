Extension { #name : 'RomanCalendarDefinition' }

{ #category : '*Chalten-Core-Pharo-Extensions' }
RomanCalendarDefinition >> initializeGlobalVariables [

	self initializeDaysGlobalVariables.
	self initializeMonthsGlobalVariables
]
