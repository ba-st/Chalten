Class {
	#name : 'HebrewLastMonthNumberInYearTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Hebrew-Calendar-Tests',
	#package : 'Chalten-Hebrew-Calendar-Tests'
}

{ #category : 'test' }
HebrewLastMonthNumberInYearTest >> testValue [

	| leapYear nonleapYear |
	leapYear := 5768 asHebrewYear.
	nonleapYear := 5767 asHebrewYear.
	self
		assert: (HebrewLastMonthNumberInYearBehavior for: leapYear) value
		equals: 13.
	self
		assert: (HebrewLastMonthNumberInYearBehavior for: nonleapYear) value
		equals: 12
]
