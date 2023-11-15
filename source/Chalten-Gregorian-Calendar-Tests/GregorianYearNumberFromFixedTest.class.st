Class {
	#name : 'GregorianYearNumberFromFixedTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Gregorian-Calendar-Tests',
	#package : 'Chalten-Gregorian-Calendar-Tests'
}

{ #category : 'test' }
GregorianYearNumberFromFixedTest >> testValue [

	| calendar |
	calendar := ChaltenEnvironment calendarNamed: #GregorianCalendar.
	self
		assert: (YearNumberFromFixed for: 1 using: calendar) value
		equals: 1.
	self
		assert: (YearNumberFromFixed for: 360 using: calendar) value
		equals: 1.
	self
		assert: (YearNumberFromFixed for: 366 using: calendar) value
		equals: 2.
	self
		assert: (YearNumberFromFixed for: 730 using: calendar) value
		equals: 2.
	self
		assert: (YearNumberFromFixed for: 800 using: calendar) value
		equals: 3.
	self
		assert: (YearNumberFromFixed for: 76500 using: calendar) value
		equals: 210.
	self
		assert: (YearNumberFromFixed for: 777000 using: calendar) value
		equals: 2128
]
