"
An IslamicYearTest is a test class for testing the behavior of IslamicYear
"
Class {
	#name : 'IslamicYearTest',
	#superclass : 'IslamicCalendarTest',
	#category : 'Chalten-Islamic-Calendar-Tests',
	#package : 'Chalten-Islamic-Calendar-Tests'
}

{ #category : 'tests' }
IslamicYearTest >> testBetweenAnd [

  self
    assert: ( 1 asIslamicYear between: 1 asIslamicYear and: 2 asIslamicYear );
    assert: ( 2 asIslamicYear between: 1 asIslamicYear and: 2 asIslamicYear );
    assert: ( 2 asIslamicYear between: 1 asIslamicYear and: 3 asIslamicYear );
    deny: ( 3 asIslamicYear between: 1 asIslamicYear and: 2 asIslamicYear );
    deny: ( 1 asIslamicYear between: 2 asIslamicYear and: 3 asIslamicYear )
]

{ #category : 'tests' }
IslamicYearTest >> testComparing [

  self
    assert: 1 asIslamicYear equals: 1 asIslamicYear;
    assert: 2125 asIslamicYear equals: 2125 asIslamicYear;
    deny: 1 asIslamicYear equals: 2125 asIslamicYear;
    deny: 1 asIslamicYear equals: 1 asGregorianYear;
    deny: 1 asGregorianYear equals: 1 asIslamicYear
]

{ #category : 'tests' }
IslamicYearTest >> testGreaterThan [

  self
    assert: 2 asIslamicYear greaterThan: 1 asIslamicYear;
    assert: 2 asIslamicYear greaterThanOrEquals: 1 asIslamicYear;
    assert: 1 asIslamicYear greaterThanOrEquals: 1 asIslamicYear;
    deny: 1 asIslamicYear greaterThan: 2025 asIslamicYear.

  self
    should: [ 2 asIslamicYear > 1 asGregorianYear ]
    raise: ArithmeticError
    withMessageText: 'Years in different time scales are incommensurable';
    should: [ 1 asGregorianYear > 2 asIslamicYear ]
    raise: ArithmeticError
    withMessageText: 'Years in different time scales are incommensurable'
]

{ #category : 'tests' }
IslamicYearTest >> testInstanceCreation [

  self
    assert: ( IslamicYear number: 2025 ) number equals: 2025;
    should: [ IslamicYear number: 0 ]
    raise: InstanceCreationFailed
    withMessageText: 'Negative years are unsupported for the Islamic calendar';
    should: [ IslamicYear number: -13 ]
    raise: InstanceCreationFailed
    withMessageText: 'Negative years are unsupported for the Islamic calendar';
    should: [ IslamicYear number: 1.5 ]
    raise: InstanceCreationFailed
    withMessageText: '1.5 is an invalid number for a year in the Islamic calendar'
]

{ #category : 'tests' }
IslamicYearTest >> testInstanceCreationShortcut [

  self
    assert: 2025 asIslamicYear number equals: 2025;
    should: [ 0 asIslamicYear ] raise: InstanceCreationFailed;
    should: [ -13 asIslamicYear ] raise: InstanceCreationFailed
]

{ #category : 'tests' }
IslamicYearTest >> testIsLeapYear [

  #( 1442 1445 1447 1450 1453 1456 1458 1461 1464 1466 ) do: [ :number |
      self assert: number asIslamicYear isLeapYear ].

  #( 1443 1444 1446 1448 1449 1451 1452 1454 1455 1457 ) do: [ :number |
      self deny: number asIslamicYear isLeapYear ]
]

{ #category : 'tests' }
IslamicYearTest >> testLessThan [

  self
    assert: 1 asIslamicYear lessThan: 2 asIslamicYear;
    assert: 1 asIslamicYear lessThanOrEquals: 2 asIslamicYear;
    assert: 1 asIslamicYear lessThanOrEquals: 1 asIslamicYear;
    deny: 2025 asIslamicYear lessThan: 1 asIslamicYear.

  self
    should: [ 2 asIslamicYear < 1 asGregorianYear ]
    raise: ArithmeticError
    withMessageText: 'Years in different time scales are incommensurable';
    should: [ 0 asGregorianYear < 1 asIslamicYear ]
    raise: ArithmeticError
    withMessageText: 'Years in different time scales are incommensurable'
]

{ #category : 'tests' }
IslamicYearTest >> testNext [

  self
    assert: 1 asIslamicYear nextIs: 2 asIslamicYear;
    assert: 2 asIslamicYear nextIs: 3 asIslamicYear;
    assert: 2025 asIslamicYear nextIs: 2026 asIslamicYear.

  self
    assert: ( 1 asIslamicYear next: 2025 * islamicYear ) equals: 2026 asIslamicYear;
    assert: ( 2025 asIslamicYear next: 12 * islamicMonth ) equals: 2026 asIslamicYear;
    assert: ( 2025 asIslamicYear next: -1 * islamicYear ) equals: 2024 asIslamicYear;
    assert: ( 2020 asIslamicYear next: 10 * islamicYear ) equals: 2030 asIslamicYear.

  self should: [ 1 asIslamicYear next: 1 / 2 * islamicYear ] raise: InstanceCreationFailed
]

{ #category : 'tests' }
IslamicYearTest >> testNumberOfDays [

  self assert: 1442 asIslamicYear numberOfDays equals: 355 * day.
  self assert: 1443 asIslamicYear numberOfDays equals: 354 * day
]

{ #category : 'tests' }
IslamicYearTest >> testNumberOfMonths [

  self assert: 1432 asIslamicYear numberOfMonths equals: 12 * islamicMonth.
  self assert: 1433 asIslamicYear numberOfMonths equals: 12 * islamicMonth
]

{ #category : 'tests' }
IslamicYearTest >> testPrevious [

  self
    assert: 2 asIslamicYear previousIs: 1 asIslamicYear;
    assert: 3 asIslamicYear previousIs: 2 asIslamicYear;
    assert: 2025 asIslamicYear previousIs: 2024 asIslamicYear.

  self
    assert: ( 4050 asIslamicYear previous: 2025 * islamicYear ) equals: 2025 asIslamicYear;
    assert: ( 2025 asIslamicYear previous: 12 * islamicMonth ) equals: 2024 asIslamicYear;
    assert: ( 2025 asIslamicYear previous: -1 * islamicYear ) equals: 2026 asIslamicYear.

  self should: [ 1 asIslamicYear previous: 1 / 2 * islamicYear ] raise: InstanceCreationFailed
]

{ #category : 'tests' }
IslamicYearTest >> testPrintString [

  self
    assert: 1445 asIslamicYear printString equals: '1445 AH';
    assert: 1 asIslamicYear printString equals: '1 AH'
]
