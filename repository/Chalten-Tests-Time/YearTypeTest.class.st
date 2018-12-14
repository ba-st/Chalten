Class {
	#name : #YearTypeTest,
	#superclass : #TestCase,
	#instVars : [
		'leapYearType',
		'nonleapYearType'
	],
	#category : #'Chalten-Tests-Time'
}

{ #category : #'test support' }
YearTypeTest >> amountOfMonthsInLeapYears [
	
	^12
]

{ #category : #'test support' }
YearTypeTest >> amountOfMonthsInNonleapYears [
	
	^12
]

{ #category : #'test support' }
YearTypeTest >> arrayOfMonthsInLeapYears [
	
	| array |
	array := Array new: 3.
	array
		at: 1 put: January;
		at: 2 put: February;
		at: 3 put: March.
	^array
]

{ #category : #'test support' }
YearTypeTest >> arrayOfMonthsInNonleapYears [
	
	| array |
	array := Array new: 3.
	array
		at: 1 put: January;
		at: 2 put: February;
		at: 3 put: March.
	^array
]

{ #category : #'test support' }
YearTypeTest >> monthInLeapYearsNumbered: aNumber [
	
	^May
]

{ #category : #'test support' }
YearTypeTest >> monthInNonleapYearsNumbered: aNumber [
	
	^May
]

{ #category : #'test support' }
YearTypeTest >> numberOfDaysInLeapYear [
	
	^self threeHundredSixtySixDays
]

{ #category : #'test support' }
YearTypeTest >> numberOfDaysInNonleapYear [
	
	^self threeHundredSixtyFiveDays
]

{ #category : #initialization }
YearTypeTest >> setUp [

	leapYearType := LeapYearType new.
	nonleapYearType := NonleapYearType new
]

{ #category : #test }
YearTypeTest >> testAmountOfMonthsIn [

	self assert: (leapYearType amountOfMonthsIn: self) = 12.
	self assert: (nonleapYearType amountOfMonthsIn: self) = 12
]

{ #category : #test }
YearTypeTest >> testArrayOfMonthsOf [

	| array |
	array := Array new: 3.
	array
		at: 1 put: January;
		at: 2 put: February;
		at: 3 put: March.
	self assert: (leapYearType arrayOfMonthsOf: self) = array.
	self assert: (nonleapYearType arrayOfMonthsOf: self) = array
]

{ #category : #test }
YearTypeTest >> testIsLeap [

	self assert: leapYearType isLeap.
	self deny: nonleapYearType isLeap
]

{ #category : #test }
YearTypeTest >> testIsPrintString [

	self assert: leapYearType printString = 'Leap Year'.
	self assert: nonleapYearType printString = 'Nonleap Year'
]

{ #category : #test }
YearTypeTest >> testMonthNumberedIn [

	self assert: (leapYearType monthNumbered: 5 in: self) = May.
	self assert: (nonleapYearType monthNumbered: 5 in: self) = May
]

{ #category : #test }
YearTypeTest >> testNumberOfDaysFor [

	self assert: (leapYearType numberOfDaysFor: self) = self threeHundredSixtySixDays.
	self assert: (nonleapYearType numberOfDaysFor: self) = self threeHundredSixtyFiveDays
]

{ #category : #'test support' }
YearTypeTest >> threeHundredSixtyFiveDays [
	^ 365 daysMeasure
]

{ #category : #'test support' }
YearTypeTest >> threeHundredSixtySixDays [
	^ 366 daysMeasure
]
