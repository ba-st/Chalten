Class {
	#name : #HebrewLastMonthNumberInYearTest,
	#superclass : #TestCase,
	#category : #'Chalten-Hebrew-Calendar-Tests'
}

{ #category : #test }
HebrewLastMonthNumberInYearTest >> testValue [
	| leapYear nonleapYear |
	leapYear := 5768 asHebrewYear.
	nonleapYear := 5767 asHebrewYear.
	self assert: (HebrewLastMonthNumberInYearBehavior for: leapYear) value = 13.
	self assert: (HebrewLastMonthNumberInYearBehavior for: nonleapYear) value = 12
]
