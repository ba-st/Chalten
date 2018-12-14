Class {
	#name : #GregorianYearNumberFromFixedTest,
	#superclass : #TestCase,
	#category : #'Chalten-Tests-Gregorian'
}

{ #category : #test }
GregorianYearNumberFromFixedTest >> testValue [

	self assert: (YearNumberFromFixed for: 1 using: GregorianCalendar) value = 1.
	self assert: (YearNumberFromFixed for: 360 using: GregorianCalendar) value = 1.
	self assert: (YearNumberFromFixed for: 366 using: GregorianCalendar) value = 2.
	self assert: (YearNumberFromFixed for: 730 using: GregorianCalendar) value = 2.
	self assert: (YearNumberFromFixed for: 800 using: GregorianCalendar) value = 3.
	self assert: (YearNumberFromFixed for: 76500 using: GregorianCalendar) value = 210.
	self assert: (YearNumberFromFixed for: 777000 using: GregorianCalendar) value = 2128
]
