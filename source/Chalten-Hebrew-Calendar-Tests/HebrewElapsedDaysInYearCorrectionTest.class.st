Class {
	#name : 'HebrewElapsedDaysInYearCorrectionTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Hebrew-Calendar-Tests',
	#package : 'Chalten-Hebrew-Calendar-Tests'
}

{ #category : 'test' }
HebrewElapsedDaysInYearCorrectionTest >> testValue [

	self
		assert:
		(HebrewElapsedDaysInYearCorrectionBehavior for: 209500) value
		equals: 1.
	self
		assert:
		(HebrewElapsedDaysInYearCorrectionBehavior for: 2106004) value
		equals: 0
]
