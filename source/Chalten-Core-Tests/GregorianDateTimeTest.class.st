"
A GregorianDateTimeTest is a test class for testing the behavior of GregorianDateTime
"
Class {
	#name : 'GregorianDateTimeTest',
	#superclass : 'ChaltenTest',
	#category : 'Chalten-Core-Tests',
	#package : 'Chalten-Core-Tests'
}

{ #category : 'tests' }
GregorianDateTimeTest >> testAccessing [

  | datetime |
  datetime := GregorianDateTime on: june first , 2025 at: TimeOfDay halfOfDay.
  self
    assert: datetime date equals: june first , 2025;
    assert: datetime dayNumber equals: 1;
    assert: datetime year equals: 2025 asGregorianYear;
    assert: datetime yearNumber equals: 2025;
    assert: datetime monthOfYear equals: june , 2025;
    assert: datetime month equals: june;
    assert: datetime monthNumber equals: 6;
    assert: datetime timeOfDay equals: TimeOfDay halfOfDay
]

{ #category : 'tests' }
GregorianDateTimeTest >> testAtMidnight [

  self
    assert: ( june first , 2025 ) atMidnight printString
    equals: 'June 1, 2025 at 00:00:00.000000'
]

{ #category : 'tests' }
GregorianDateTimeTest >> testAtNoon [

  self
    assert: ( june first , 2025 ) atNoon printString
    equals: 'June 1, 2025 at 12:00:00.000000'
]

{ #category : 'tests' }
GregorianDateTimeTest >> testAtStartOfDay [

  self
    assert: ( june first , 2025 ) atStartOfDay printString
    equals: 'June 1, 2025 at 00:00:00.000000'
]

{ #category : 'tests' }
GregorianDateTimeTest >> testBetweenAnd [

  self assert: ( ( january first , 2024 ) atNoon
        between: ( january first , 2024 ) atMidnight
        and: ( january second , 2024 ) atMidnight )
]

{ #category : 'tests' }
GregorianDateTimeTest >> testComparing [

  self
    assert: ( june first , 2025 ) atNoon equals: ( june first , 2025 ) atNoon;
    deny: ( june first , 2025 ) atNoon equals: ( june first , 2025 ) atMidnight;
    deny: ( june first , 2026 ) atNoon equals: ( june first , 2025 ) atNoon
]

{ #category : 'tests' }
GregorianDateTimeTest >> testCreationShortcut [

  | datetime |
  datetime := june first , 2025 at: TimeOfDay halfOfDay.
  self
    assert: datetime date equals: june first , 2025;
    assert: datetime timeOfDay equals: TimeOfDay halfOfDay;
    assert: datetime equals: ( june first , 2025 ) atNoon.

  datetime := ( december thirtyFirst , 2025 ) atMidnight.
  self
    assert: datetime date equals: december thirtyFirst , 2025;
    assert: datetime timeOfDay equals: TimeOfDay startOfDay
]

{ #category : 'tests' }
GregorianDateTimeTest >> testGreaterThan [

  self
    assert: ( january first , 2025 ) atNoon greaterThan: ( january first , 2025 ) atMidnight;
    assert: ( january first , 2025 ) atNoon
    greaterThanOrEquals: ( january first , 2025 ) atMidnight;
    assert: ( january first , 2025 ) atMidnight
    greaterThanOrEquals: ( january first , 2025 ) atMidnight;
    assert: ( february first , 2025 ) atMidnight greaterThan: ( january first , 2025 ) atMidnight;
    assert: ( february first , 2025 ) atMidnight
    greaterThanOrEquals: ( january first , 2025 ) atMidnight;
    assert: ( february first , 2025 ) atMidnight
    greaterThanOrEquals: ( february first , 2025 ) atMidnight
]

{ #category : 'tests' }
GregorianDateTimeTest >> testIn [

  | utcPlus3 utcMinus6 |
  utcPlus3 := FixedOffsetRuleset for: 3 * hour.
  utcMinus6 := FixedOffsetRuleset for: -6 * hour.

  self
    assert: ( ( january first , 1970 ) atMidnight in: utcPlus3 ) printString
    equals: '1970-01-01T00:00:00.000000+03:00';
    assert: ( ( january first , 1970 ) atMidnight in: utcMinus6 ) printString
    equals: '1970-01-01T00:00:00.000000-06:00'
]

{ #category : 'tests' }
GregorianDateTimeTest >> testInCoordinatedUniversalTime [

  self
    assert: ( january first , 1970 ) atMidnight inCoordinatedUniversalTime equals: Instant epoch;
    assert: ( june twentySixth , 1982 ) atNoon inCoordinatedUniversalTime
    equals: ( Instant fromUnixTime: 393940800 )
]

{ #category : 'tests' }
GregorianDateTimeTest >> testJulianDayNumber [

  self
    assert: ( january first , 1970 ) atMidnight julianDayNumber
    equals: Instant epoch julianDayNumber;
    assert: ( january first , 1970 ) atNoon julianDayNumber equals: 2440588;
    assert: ( january second , 1970 ) atMidnight julianDayNumber equals: 2440588 + ( 1 / 2 );
    assert:
      ( december thirtyFirst , 1969 at: ( TimeOfDay hours: 23 minutes: 59 seconds: 59 ) )
        julianDayNumber
    equals: 210866759999 / 86400;
    assert:
      ( december thirtieth , 1969 at: ( TimeOfDay hours: 23 minutes: 59 seconds: 59 ) )
        julianDayNumber
    equals: 210866673599 / 86400;
    assert: ( january first , 2010 ) atMidnight julianDayNumber equals: 2455197 + ( 1 / 2 );
    assert: ( january first , 1971 ) atMidnight julianDayNumber equals: 2440952 + ( 1 / 2 );
    assert:
      ( october seventeenth , 1973 at: ( TimeOfDay hours: 18 minutes: 36 seconds: 57 ) )
        julianDayNumber
    equals: 70328830339 / 28800;
    assert:
      ( september ninth , 2001 at: ( TimeOfDay hours: 1 minutes: 46 seconds: 40 ) ) julianDayNumber
    equals: 132416725 / 54;
    assert:
      ( february thirteenth , 2009 at: ( TimeOfDay hours: 23 minutes: 31 seconds: 30 ) )
        julianDayNumber
    equals: 2356681421 / 960;
    assert: ( january first , 1900 at: ( TimeOfDay hours: 1 ) ) julianDayNumber
    equals: 57960493 / 24
]

{ #category : 'tests' }
GregorianDateTimeTest >> testLessThan [

  self
    assert: ( january first , 2024 ) atMidnight lessThan: ( january first , 2024 ) atNoon;
    assert: ( january first , 2024 ) atMidnight lessThanOrEquals: ( january first , 2024 ) atNoon;
    assert: ( january first , 2024 ) atMidnight
    lessThanOrEquals: ( january first , 2024 ) atMidnight;
    assert: ( january first , 2025 ) atMidnight lessThan: ( february first , 2025 ) atMidnight;
    assert: ( january first , 2025 ) atMidnight
    lessThanOrEquals: ( february first , 2025 ) atMidnight;
    deny: ( january first , 2025 ) atMidnight lessThan: ( january first , 0 ) atMidnight;
    deny: ( february first , 2025 ) atNoon lessThan: ( january first , 2025 ) atNoon
]

{ #category : 'tests' }
GregorianDateTimeTest >> testPrintString [

  self assert: ( june first , 2025 ) atNoon printString equals: 'June 1, 2025 at 12:00:00.000000'
]

{ #category : 'tests' }
GregorianDateTimeTest >> testPrintStringInISO8601 [

  self assert: ( june first , 2025 ) atNoon printAsISO8601String equals: '2025-06-01T12:00:00.000000'
]
