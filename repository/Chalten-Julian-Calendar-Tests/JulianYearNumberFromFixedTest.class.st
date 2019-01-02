Class {
	#name : #JulianYearNumberFromFixedTest,
	#superclass : #TestCase,
	#category : #'Chalten-Julian-Calendar-Tests'
}

{ #category : #test }
JulianYearNumberFromFixedTest >> testValue [

	self assert: (YearNumberFromFixed for: 1 using: JulianCalendar) value = 1.
	self assert: (YearNumberFromFixed for: 360 using: JulianCalendar) value = 1.
	self assert: (YearNumberFromFixed for: 366 using: JulianCalendar) value = 2.
	self assert: (YearNumberFromFixed for: 730 using: JulianCalendar) value = 3.
	self assert: (YearNumberFromFixed for: 800 using: JulianCalendar) value = 3.
	self assert: (YearNumberFromFixed for: 76500 using: JulianCalendar) value = 210.
	self assert: (YearNumberFromFixed for: 777000 using: JulianCalendar) value = 2128
]
