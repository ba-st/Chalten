"
A GregorianMonthOfYearTest is a test class for testing the behavior of GregorianMonthOfYear
"
Class {
	#name : 'GregorianMonthOfYearTest',
	#superclass : 'ChaltenTest',
	#category : 'Chalten-Core-Tests',
	#package : 'Chalten-Core-Tests'
}

{ #category : 'parsing' }
GregorianMonthOfYearTest >> parseISO8601: string [

  ^ ISO8601Parser new parseMonthOfYear: string
]

{ #category : 'tests' }
GregorianMonthOfYearTest >> testBetweenAnd [

  | year0 year1 |
  year0 := 0 asGregorianYear.
  year1 := 1 asGregorianYear.

  self
    assert: ( year0 january between: year0 january and: year1 january );
    assert: ( year1 january between: year0 january and: year1 january );
    assert: ( year1 january between: year0 january and: 2 asGregorianYear january );
    assert: ( year0 february between: year0 january and: year0 february );
    assert: ( year0 february between: year0 january and: year0 february );
    assert: ( year0 february between: year0 january and: year0 july );
    deny: ( 2 asGregorianYear january between: year0 january and: year1 january );
    deny: ( -1 asGregorianYear january between: year0 january and: year1 january )
]

{ #category : 'tests' }
GregorianMonthOfYearTest >> testComparing [

  self
    assert: 2024 asGregorianYear january equals: 2024 asGregorianYear january;
    deny: 2025 asGregorianYear january equals: 2024 asGregorianYear january;
    deny: 2025 asGregorianYear january equals: 2025 asGregorianYear february
]

{ #category : 'tests' }
GregorianMonthOfYearTest >> testCreation [

  | monthOfYear |
  monthOfYear := 2025 asGregorianYear june.

  self
    assert: monthOfYear year equals: 2025 asGregorianYear;
    assert: monthOfYear month equals: june
]

{ #category : 'tests' }
GregorianMonthOfYearTest >> testCreationShortcut [

  | monthOfYear |
  monthOfYear := january , 2025.

  self
    assert: monthOfYear year equals: 2025 asGregorianYear;
    assert: monthOfYear month equals: january
]

{ #category : 'tests' }
GregorianMonthOfYearTest >> testDateCreation [

  | monthOfYear |
  monthOfYear := december , 2025.

  #( first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth thirteenth
     fourteenth fifteenth sixteenth seventeenth eighteenth nineteenth twentieth twentyFirst
     twentySecond twentyThird twentyFourth twentyFifth twentySixth twentySeventh twentyEighth
     twentyNinth thirtieth thirtyFirst ) do: [ :selector |
      self assert: ( monthOfYear perform: selector ) equals: ( december perform: selector ) , 2025 ]
]

{ #category : 'tests' }
GregorianMonthOfYearTest >> testGreaterThan [

  self
    assert: january , 1 isGreaterThan: january , 0;
    assert: january , 1 isGreaterThanOrEqualTo: january , 0;
    assert: january , 0 isGreaterThanOrEqualTo: january , 0;
    assert: february , 0 isGreaterThan: january , 0;
    assert: february , 0 isGreaterThanOrEqualTo: january , 0;
    assert: february , 1 isGreaterThan: january , 0;
    deny: january , 0 isGreaterThan: january , 2025;
    deny: january , 0 isGreaterThan: february , 0
]

{ #category : 'tests' }
GregorianMonthOfYearTest >> testISO8601Printing [

  self
    assert: ( self printAsISO8601String: october , 2026 ) equals: '2026-10';
    assert: ( self printAsISO8601String: february , 2026 ) equals: '2026-02';
    assert: ( self printAsISO8601String: february , 0 ) equals: '0000-02';
    assert: ( self printAsISO8601String: february , 150 ) equals: '0150-02';
    assert: ( self printAsISO8601String: february , -1 ) equals: '-0001-02';
    assert: ( self printAsISO8601String: february , 10000 ) equals: '+010000-02';
    assert: ( self printAsISO8601String: february , -54000 ) equals: '-054000-02';
    assert: ( self printAsISO8601String: february , 9999000 ) equals: '+9999000-02';
    assert: ( self printAsISO8601String: february , -9999000 ) equals: '-9999000-02'
]

{ #category : 'tests' }
GregorianMonthOfYearTest >> testLessThan [

  self
    assert: january , 0 isLessThan: january , 1;
    assert: january , 0 isLessThanOrEqualTo: january , 1;
    assert: january , 0 isLessThanOrEqualTo: january , 0;
    assert: january , 0 isLessThanOrEqualTo: february , 0;
    assert: february , 0 isLessThanOrEqualTo: january , 1;
    deny: january , 2025 isLessThan: january , 0;
    deny: february , 0 isLessThan: january , 0
]

{ #category : 'tests' }
GregorianMonthOfYearTest >> testNext [

  | baseYear |
  baseYear := 2025 asGregorianYear.

  self
    assertNextOf: baseYear january is: baseYear february;
    assertNextOf: baseYear december is: 2026 asGregorianYear january.

  self
    assert: ( 0 asGregorianYear january next: 2025 * year ) equals: baseYear january;
    assert: ( baseYear april next: 12 * month ) equals: 2026 asGregorianYear april;
    assert: ( baseYear july next: -1 * year ) equals: 2024 asGregorianYear july;
    assert: ( baseYear july next: -1 / 2 * year ) equals: baseYear january;
    assert: ( 2020 asGregorianYear june next: 1 * decade ) equals: 2030 asGregorianYear june;
    assert: ( baseYear september next: 1 / 2 * year ) equals: 2026 asGregorianYear march.

  self
    should: [ baseYear next: 30 * day ]
    raise: ArithmeticError
    withMessageText: 'Cannot convert incommensurable units'
]

{ #category : 'tests' }
GregorianMonthOfYearTest >> testNumberOfDays [

  self
    assert: 2025 asGregorianYear january numberOfDays equals: 31 * day;
    assert: 2020 asGregorianYear january numberOfDays equals: 31 * day;
    assert: 2025 asGregorianYear february numberOfDays equals: 28 * day;
    assert: 2020 asGregorianYear february numberOfDays equals: 29 * day;
    assert: 2025 asGregorianYear march numberOfDays equals: 31 * day;
    assert: 2020 asGregorianYear march numberOfDays equals: 31 * day;
    assert: 2025 asGregorianYear april numberOfDays equals: 30 * day;
    assert: 2020 asGregorianYear april numberOfDays equals: 30 * day;
    assert: 2025 asGregorianYear may numberOfDays equals: 31 * day;
    assert: 2020 asGregorianYear may numberOfDays equals: 31 * day;
    assert: 2025 asGregorianYear june numberOfDays equals: 30 * day;
    assert: 2020 asGregorianYear june numberOfDays equals: 30 * day;
    assert: 2025 asGregorianYear july numberOfDays equals: 31 * day;
    assert: 2020 asGregorianYear july numberOfDays equals: 31 * day;
    assert: 2025 asGregorianYear august numberOfDays equals: 31 * day;
    assert: 2020 asGregorianYear august numberOfDays equals: 31 * day;
    assert: 2025 asGregorianYear september numberOfDays equals: 30 * day;
    assert: 2020 asGregorianYear september numberOfDays equals: 30 * day;
    assert: 2025 asGregorianYear october numberOfDays equals: 31 * day;
    assert: 2020 asGregorianYear october numberOfDays equals: 31 * day;
    assert: 2025 asGregorianYear november numberOfDays equals: 30 * day;
    assert: 2020 asGregorianYear november numberOfDays equals: 30 * day;
    assert: 2025 asGregorianYear december numberOfDays equals: 31 * day;
    assert: 2020 asGregorianYear december numberOfDays equals: 31 * day
]

{ #category : 'tests' }
GregorianMonthOfYearTest >> testParseISO8601 [

  self
    assert: ( self parseISO8601: '2026-01' ) equals: january , 2026;
    assert: ( self parseISO8601: '0000-01' ) equals: january , 0;
    assert: ( self parseISO8601: '0150-01' ) equals: january , 150;
    assert: ( self parseISO8601: '-0001-01' ) equals: january , -1;
    assert: ( self parseISO8601: '+010000-01' ) equals: january , 10000;
    assert: ( self parseISO8601: '-054000-01' ) equals: january , -54000;
    assert: ( self parseISO8601: '+9999000-01' ) equals: january , 9999000;
    assert: ( self parseISO8601: '-9999000-01' ) equals: january , -9999000.

  #( 'A' '1E10' '' '++2026' '--2022' '+X' '2022.1' '-2022-' '1' '11' '111' '-12' '1-01' '11-01'
     '111-01' '2026-' ) do: [ :invalid |
      self
        should: [ self parseISO8601: invalid ]
        raise: InstanceCreationFailed
        withMessageText:
          ( 'The provided month of year ''<1s>'' is invalid. Months of year must be 4 digits (e.g., 2026) or expanded ISO 8601 (e.g., +010000) for the year and exactly 2 digits for the month.'
              expandMacrosWith: invalid )
    ].
  #( '222-010' 'AAAA-01' 'z+a12-01' ) with: #( '222' 'AAAA' 'z+a12' ) do: [ :invalid :yearString |
      self
        should: [ self parseISO8601: invalid ]
        raise: InstanceCreationFailed
        withMessageText:
          ( 'The provided year ''<1s>'' is invalid. Years must be 4 digits (e.g., 2026) or expanded ISO 8601 (e.g., +010000).'
              expandMacrosWith: yearString )
    ].
  #( '2026-A1' '2026-1E' '2026-+2' '2026--2' '2026-+X' '2026-20' '2026-00' '2026-100' '2026-AA'
     '2026-111' )
    with: #( 'A1' '1E' '+2' '2' '+X' '20' '00' '100' 'AA' '111' )
    do: [ :invalid :monthString |
        self
          should: [ self parseISO8601: invalid ]
          raise: InstanceCreationFailed
          withMessageText:
            ( 'The provided month ''<1s>'' is invalid. Months must be 2 digits between 01 and 12 (e.g., 05).'
                expandMacrosWith: monthString )
      ]
]

{ #category : 'tests' }
GregorianMonthOfYearTest >> testPrevious [

  | baseYear |
  baseYear := 2025 asGregorianYear.

  self
    assertPreviousOf: baseYear january is: 2024 asGregorianYear december;
    assertPreviousOf: baseYear december is: baseYear november.

  self
    assert: ( baseYear january previous: 2025 * year ) equals: 0 asGregorianYear january;
    assert: ( baseYear april previous: 12 * month ) equals: 2024 asGregorianYear april;
    assert: ( baseYear july previous: -1 * year ) equals: 2026 asGregorianYear july;
    assert: ( baseYear july previous: -1 / 2 * year ) equals: 2026 asGregorianYear january;
    assert: ( 2020 asGregorianYear june previous: 1 * decade ) equals: 2010 asGregorianYear june;
    assert: ( baseYear march previous: 1 / 2 * year ) equals: 2024 asGregorianYear september.

  self
    should: [ baseYear previous: 30 * day ]
    raise: ArithmeticError
    withMessageText: 'Cannot convert incommensurable units'
]

{ #category : 'tests' }
GregorianMonthOfYearTest >> testPrintString [

  self assert: ( february , 2025 ) printString equals: 'February, 2025'
]
