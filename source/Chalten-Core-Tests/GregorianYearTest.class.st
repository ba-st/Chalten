"
A GregorianYearTest is a test class for testing the behavior of GregorianYear
"
Class {
	#name : 'GregorianYearTest',
	#superclass : 'ChaltenTest',
	#category : 'Chalten-Core-Tests',
	#package : 'Chalten-Core-Tests'
}

{ #category : 'tests' }
GregorianYearTest >> testBetweenAnd [

  self
    assert: ( 0 asGregorianYear between: 0 asGregorianYear and: 1 asGregorianYear );
    assert: ( 1 asGregorianYear between: 0 asGregorianYear and: 1 asGregorianYear );
    assert: ( 1 asGregorianYear between: 0 asGregorianYear and: 2 asGregorianYear );
    deny: ( 2 asGregorianYear between: 0 asGregorianYear and: 1 asGregorianYear );
    deny: ( -1 asGregorianYear between: 0 asGregorianYear and: 1 asGregorianYear )
]

{ #category : 'tests' }
GregorianYearTest >> testComparing [

  self
    assert: 0 asGregorianYear equals: 0 asGregorianYear;
    assert: 0 asGregorianYear hash equals: 0 asGregorianYear hash;
    assert: 2025 asGregorianYear equals: 2025 asGregorianYear;
    assert: 2025 asGregorianYear hash equals: 2025 asGregorianYear hash;
    deny: 0 asGregorianYear equals: 2025 asGregorianYear
]

{ #category : 'tests' }
GregorianYearTest >> testGreaterThan [

  self
    assert: 1 asGregorianYear isGreaterThan: 0 asGregorianYear;
    assert: 1 asGregorianYear isGreaterThanOrEqualsTo: 0 asGregorianYear;
    assert: 0 asGregorianYear isGreaterThanOrEqualsTo: 0 asGregorianYear;
    deny: 0 asGregorianYear isGreaterThan: 2025 asGregorianYear
]

{ #category : 'tests' }
GregorianYearTest >> testInstanceCreation [

  self
    assert: ( GregorianYear number: 2025 ) number equals: 2025;
    assert: ( GregorianYear number: 0 ) number equals: 0;
    assert: ( GregorianYear number: -13 ) number equals: -13.

  self
    should: [ GregorianYear number: 1.5 ]
    raise: InstanceCreationFailed
    withMessageText: '1.5 is an invalid number for a year in the Gregorian calendar'
]

{ #category : 'tests' }
GregorianYearTest >> testInstanceCreationShortcut [

  self
    assert: 2025 asGregorianYear number equals: 2025;
    assert: 0 asGregorianYear number equals: 0;
    assert: -13 asGregorianYear number equals: -13
]

{ #category : 'tests' }
GregorianYearTest >> testIsLeapYear [

  #( -4 0 400 1600 1996 2000 2004 2008 2012 ) do: [ :number |
      self assert: number asGregorianYear isLeapYear ].

  #( -1 100 1700 1800 1900 2007 2009 2025 2100 ) do: [ :number |
      self deny: number asGregorianYear isLeapYear ]
]

{ #category : 'tests' }
GregorianYearTest >> testLessThan [

  self
    assert: 0 asGregorianYear isLessThan: 1 asGregorianYear;
    assert: 0 asGregorianYear isLessThanOrEqualsTo: 1 asGregorianYear;
    assert: 0 asGregorianYear isLessThanOrEqualsTo: 0 asGregorianYear;
    deny: 2025 asGregorianYear isLessThan: 0 asGregorianYear
]

{ #category : 'tests' }
GregorianYearTest >> testNext [

  self
    assertNextOf: 0 asGregorianYear is: 1 asGregorianYear;
    assertNextOf: -1 asGregorianYear is: 0 asGregorianYear;
    assertNextOf: 2025 asGregorianYear is: 2026 asGregorianYear.

  self
    assert: ( 0 asGregorianYear next: 2025 * year ) equals: 2025 asGregorianYear;
    assert: ( 2025 asGregorianYear next: 12 * month ) equals: 2026 asGregorianYear;
    assert: ( 2025 asGregorianYear next: -1 * year ) equals: 2024 asGregorianYear;
    assert: ( 2020 asGregorianYear next: 1 * decade ) equals: 2030 asGregorianYear.

  self should: [ 0 asGregorianYear next: 1 / 2 * year ] raise: InstanceCreationFailed
]

{ #category : 'tests' }
GregorianYearTest >> testNumberOfDays [

  self assert: 2008 asGregorianYear numberOfDays equals: 366 * day.
  self assert: 2007 asGregorianYear numberOfDays equals: 365 * day
]

{ #category : 'tests' }
GregorianYearTest >> testNumberOfMonths [

  self assert: 2008 asGregorianYear numberOfMonths equals: 12 * month.
  self assert: 2007 asGregorianYear numberOfMonths equals: 12 * month
]

{ #category : 'tests' }
GregorianYearTest >> testPrevious [

  self
    assertPreviousOf: 0 asGregorianYear is: -1 asGregorianYear;
    assertPreviousOf: 1 asGregorianYear is: 0 asGregorianYear;
    assertPreviousOf: 2025 asGregorianYear is: 2024 asGregorianYear.

  self
    assert: ( 0 asGregorianYear previous: 2025 * year ) equals: -2025 asGregorianYear;
    assert: ( 2025 asGregorianYear previous: 12 * month ) equals: 2024 asGregorianYear;
    assert: ( 2025 asGregorianYear previous: -1 * year ) equals: 2026 asGregorianYear.

  self should: [ 0 asGregorianYear previous: 1 / 2 * year ] raise: InstanceCreationFailed
]

{ #category : 'tests' }
GregorianYearTest >> testPrintString [

  self
    assert: 2025 asGregorianYear printString equals: '2025';
    assert: 0 asGregorianYear printString equals: '0';
    assert: -1 asGregorianYear printString equals: '-1'
]
