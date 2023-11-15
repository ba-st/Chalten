Class {
	#name : 'HebrewNewYearDelayTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Hebrew-Calendar-Tests',
	#package : 'Chalten-Hebrew-Calendar-Tests'
}

{ #category : 'test' }
HebrewNewYearDelayTest >> testValue [

	self
		assert: (HebrewNewYearDelay for: 5767 asHebrewYear) value
		equals: 0.
	self
		assert: (HebrewNewYearDelay for: 5766 asHebrewYear) value
		equals: 1.
	self
		assert: (HebrewNewYearDelay for: 5789 asHebrewYear) value
		equals: 2
]
