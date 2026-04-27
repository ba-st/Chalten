"
An IslamicMonthOfYearTest is a test class for testing the behavior of IslamicMonthOfYear
"
Class {
	#name : 'IslamicMonthOfYearTest',
	#superclass : 'IslamicCalendarTest',
	#category : 'Chalten-Islamic-Calendar-Tests',
	#package : 'Chalten-Islamic-Calendar-Tests'
}

{ #category : 'tests' }
IslamicMonthOfYearTest >> testBetweenAnd [

  | year2 year3 |
  year2 := 2 asIslamicYear .
  year3 := 3 asIslamicYear.

  self
    assert: ( year2 muharram between: year2 muharram and: year3 muharram );
    assert: ( year3 muharram between: year2 muharram and: year3 muharram );
    assert: ( year3 muharram between: year2 muharram and: 4 asIslamicYear muharram );
    assert: ( year2 safar between: year2 muharram and: year2 safar );
    assert: ( year2 safar between: year2 muharram and: year2 safar );
    assert: ( year2 safar between: year2 muharram and: year2 rajab );
    deny: ( 4 asIslamicYear muharram between: year2 muharram and: year3 muharram );
    deny: ( 1 asIslamicYear muharram between: year2 muharram and: year3 muharram )
]

{ #category : 'tests' }
IslamicMonthOfYearTest >> testComparing [

  self
    assert: 1433 asIslamicYear muharram equals: 1433 asIslamicYear muharram;
    deny: 1435 asIslamicYear muharram equals: 1433 asIslamicYear muharram;
    deny: 1435 asIslamicYear muharram equals: 1435 asIslamicYear safar
]

{ #category : 'tests' }
IslamicMonthOfYearTest >> testCreation [

  | monthOfYear |
  monthOfYear := 1433 asIslamicYear jumadaAlAwwal.

  self
    assert: monthOfYear year equals: 1433 asIslamicYear;
    assert: monthOfYear month equals: jumadaAlAwwal
]

{ #category : 'tests' }
IslamicMonthOfYearTest >> testCreationShortcut [

  | monthOfYear |
  monthOfYear := muharram , 2025.

  self
    assert: monthOfYear year equals: 2025 asIslamicYear;
    assert: monthOfYear month equals: muharram
]

{ #category : 'tests' }
IslamicMonthOfYearTest >> testDateCreation [

  | monthOfYear |
  monthOfYear := muharram , 2025.

  self assert: monthOfYear twentyNinth equals: muharram twentyNinth , 2025
]

{ #category : 'tests' }
IslamicMonthOfYearTest >> testGreaterThan [

  self
    assert: muharram , 2 isGreaterThan: muharram , 1;
    assert: muharram , 2 isGreaterThanOrEqualsTo: muharram , 1;
    assert: muharram , 1 isGreaterThanOrEqualsTo: muharram , 1;
    assert: safar , 1 isGreaterThan: muharram , 1;
    assert: safar , 1 isGreaterThanOrEqualsTo: muharram , 1;
    assert: safar , 2 isGreaterThan: muharram , 1;
    deny: muharram , 1 isGreaterThan: muharram , 2025;
    deny: muharram , 1 isGreaterThan: safar , 1
]

{ #category : 'tests' }
IslamicMonthOfYearTest >> testLessThan [

  self
    assert: muharram , 1 isLessThan: muharram , 2;
    assert: muharram , 1 isLessThanOrEqualsTo: muharram , 2;
    assert: muharram , 1 isLessThanOrEqualsTo: muharram , 1;
    assert: muharram , 1 isLessThanOrEqualsTo: safar , 1;
    assert: safar , 1 isLessThanOrEqualsTo: muharram , 2;
    deny: muharram , 2025 isLessThan: muharram , 1;
    deny: safar , 1 isLessThan: muharram , 1
]

{ #category : 'tests' }
IslamicMonthOfYearTest >> testNext [

  | baseYear |
  baseYear := 2025 asIslamicYear.

  self
    assertNextOf: baseYear muharram is: baseYear safar;
    assertNextOf: baseYear duAlHijjah is: 2026 asIslamicYear muharram.

  self
    assert: ( 1 asIslamicYear muharram next: 2024 * islamicYear ) equals: baseYear muharram;
    assert: ( baseYear rabiAlThani next: 12 * islamicMonth ) equals: 2026 asIslamicYear rabiAlThani;
    assert: ( baseYear rajab next: -1 * islamicYear ) equals: 2024 asIslamicYear rajab;
    assert: ( baseYear rajab next: -1 / 2 * islamicYear ) equals: baseYear muharram;
    assert: ( 2020 asIslamicYear jumadaAlThani next: 10 * islamicYear )
    equals: 2030 asIslamicYear jumadaAlThani;
    assert: ( baseYear ramadan next: 1 / 2 * islamicYear ) equals: 2026 asIslamicYear rabiAlAwwal.

  self
    should: [ baseYear ramadan next: 30 * day ]
    raise: ArithmeticError
    withMessageText: 'Cannot convert incommensurable units';
    should: [ baseYear ramadan next: 1 * year ]
    raise: ArithmeticError
    withMessageText: 'Cannot convert incommensurable units'
]

{ #category : 'tests' }
IslamicMonthOfYearTest >> testNumberOfDays [

  self
    assert: 1443 asIslamicYear muharram numberOfDays equals: 30 * day;
    assert: 1442 asIslamicYear muharram numberOfDays equals: 30 * day;
    assert: 1443 asIslamicYear safar numberOfDays equals: 29 * day;
    assert: 1442 asIslamicYear safar numberOfDays equals: 29 * day;
    assert: 1443 asIslamicYear rabiAlAwwal numberOfDays equals: 30 * day;
    assert: 1442 asIslamicYear rabiAlAwwal numberOfDays equals: 30 * day;
    assert: 1443 asIslamicYear rabiAlThani numberOfDays equals: 29 * day;
    assert: 1442 asIslamicYear rabiAlThani numberOfDays equals: 29 * day;
    assert: 1443 asIslamicYear jumadaAlAwwal numberOfDays equals: 30 * day;
    assert: 1442 asIslamicYear jumadaAlAwwal numberOfDays equals: 30 * day;
    assert: 1443 asIslamicYear jumadaAlThani numberOfDays equals: 29 * day;
    assert: 1442 asIslamicYear jumadaAlThani numberOfDays equals: 29 * day;
    assert: 1443 asIslamicYear rajab numberOfDays equals: 30 * day;
    assert: 1442 asIslamicYear rajab numberOfDays equals: 30 * day;
    assert: 1443 asIslamicYear shaban numberOfDays equals: 29 * day;
    assert: 1442 asIslamicYear shaban numberOfDays equals: 29 * day;
    assert: 1443 asIslamicYear ramadan numberOfDays equals: 30 * day;
    assert: 1442 asIslamicYear ramadan numberOfDays equals: 30 * day;
    assert: 1443 asIslamicYear shawwal numberOfDays equals: 29 * day;
    assert: 1442 asIslamicYear shawwal numberOfDays equals: 29 * day;
    assert: 1443 asIslamicYear duAlQiDah numberOfDays equals: 30 * day;
    assert: 1442 asIslamicYear duAlQiDah numberOfDays equals: 30 * day;
    assert: 1443 asIslamicYear duAlHijjah numberOfDays equals: 29 * day;
    assert: 1442 asIslamicYear duAlHijjah numberOfDays equals: 30 * day
]

{ #category : 'tests' }
IslamicMonthOfYearTest >> testPrevious [

  | baseYear |
  baseYear := 2025 asIslamicYear.

  self
    assertPreviousOf: baseYear muharram is: 2024 asIslamicYear duAlHijjah;
    assertPreviousOf: baseYear duAlHijjah is: baseYear duAlQiDah.

  self
    assert: ( baseYear muharram previous: 2024 * islamicYear ) equals: 1 asIslamicYear muharram;
    assert: ( baseYear rabiAlThani previous: 12 * islamicMonth ) equals: 2024 asIslamicYear rabiAlThani;
    assert: ( baseYear rajab previous: -1 * islamicYear ) equals: 2026 asIslamicYear rajab;
    assert: ( baseYear rajab previous: -1 / 2 * islamicYear ) equals: 2026 asIslamicYear muharram;
    assert: ( 2020 asIslamicYear jumadaAlThani previous: 10 * islamicYear )
    equals: 2010 asIslamicYear jumadaAlThani;
    assert: ( baseYear rabiAlAwwal previous: 1 / 2 * islamicYear ) equals: 2024 asIslamicYear ramadan.

  self
    should: [ baseYear muharram previous: 30 * day ]
    raise: ArithmeticError
    withMessageText: 'Cannot convert incommensurable units';
    should: [ baseYear muharram previous: 1 * year ]
    raise: ArithmeticError
    withMessageText: 'Cannot convert incommensurable units'
]

{ #category : 'tests' }
IslamicMonthOfYearTest >> testPrintString [

  self assert: ( muharram , 1412 ) printString equals: 'Muharram, 1412 AH'
]
