Class {
	#name : 'JulianYearNumberFromFixedTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Julian-Calendar-Tests',
	#package : 'Chalten-Julian-Calendar-Tests'
}

{ #category : 'test' }
JulianYearNumberFromFixedTest >> testValue [

	| julianCalendar |
	julianCalendar := ChaltenEnvironment calendarNamed: #JulianCalendar.
	self
		assert: (YearNumberFromFixed for: 1 using: julianCalendar) value
		equals: 1.
	self
		assert: (YearNumberFromFixed for: 360 using: julianCalendar) value
		equals: 1.
	self
		assert: (YearNumberFromFixed for: 366 using: julianCalendar) value
		equals: 2.
	self
		assert: (YearNumberFromFixed for: 730 using: julianCalendar) value
		equals: 3.
	self
		assert: (YearNumberFromFixed for: 800 using: julianCalendar) value
		equals: 3.
	self
		assert: (YearNumberFromFixed for: 76500 using: julianCalendar) value
		equals: 210.
	self
		assert:
		(YearNumberFromFixed for: 777000 using: julianCalendar) value
		equals: 2128
]
