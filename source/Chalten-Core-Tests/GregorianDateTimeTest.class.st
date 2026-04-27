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

  | januaryFirst januarySecond |
  januaryFirst := january first , 2024.
  januarySecond := january second , 2024.

  self
    assert: ( januaryFirst atNoon between: januaryFirst atMidnight and: januarySecond atMidnight );
    assert:
      ( januaryFirst atMidnight between: januaryFirst atMidnight and: januarySecond atMidnight );
    assert:
      ( januarySecond atMidnight between: januaryFirst atMidnight and: januarySecond atMidnight );
    deny: ( januaryFirst atMidnight between: januaryFirst atNoon and: januaryFirst atNoon );
    deny: ( januarySecond atNoon between: januaryFirst atNoon and: januaryFirst atNoon )
]

{ #category : 'tests' }
GregorianDateTimeTest >> testComparing [

  self
    assert: ( june first , 2025 ) atNoon equals: ( june first , 2025 ) atNoon;
    deny: ( june first , 2025 ) atNoon equals: ( june first , 2025 ) atMidnight;
    deny: ( june first , 2026 ) atNoon equals: ( june first , 2025 ) atNoon;
    deny: ( june first , 2026 ) atNoon equals: ( june second , 2026 ) atNoon
]

{ #category : 'tests' }
GregorianDateTimeTest >> testConverting [

  | datetime |
  datetime := GregorianDateTime on: june first , 2025 at: TimeOfDay halfOfDay.
  self assert: datetime asGregorianDateTime equals: datetime
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

  | januaryFirst februaryFirst |
  januaryFirst := january first , 2025.
  februaryFirst := february first , 2025.

  self
    assert: januaryFirst atNoon isGreaterThan: januaryFirst atMidnight;
    assert: januaryFirst atNoon isGreaterThanOrEqualTo: januaryFirst atMidnight;
    assert: januaryFirst atMidnight isGreaterThanOrEqualTo: januaryFirst atMidnight;
    assert: februaryFirst atMidnight isGreaterThan: januaryFirst atMidnight;
    assert: februaryFirst atMidnight isGreaterThanOrEqualTo: januaryFirst atMidnight;
    assert: februaryFirst atMidnight isGreaterThanOrEqualTo: februaryFirst atMidnight;
    deny: februaryFirst atMidnight isGreaterThan: februaryFirst atNoon
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
    assert: ( january first , 2024 ) atMidnight isLessThan: ( january first , 2024 ) atNoon;
    assert: ( january first , 2024 ) atMidnight isLessThanOrEqualTo: ( january first , 2024 ) atNoon;
    assert: ( january first , 2024 ) atMidnight
    isLessThanOrEqualTo: ( january first , 2024 ) atMidnight;
    assert: ( january first , 2025 ) atMidnight isLessThan: ( february first , 2025 ) atMidnight;
    assert: ( january first , 2025 ) atMidnight
    isLessThanOrEqualTo: ( february first , 2025 ) atMidnight;
    deny: ( january first , 2025 ) atMidnight isLessThan: ( january first , 0 ) atMidnight;
    deny: ( february first , 2025 ) atNoon isLessThan: ( january first , 2025 ) atNoon
]

{ #category : 'tests' }
GregorianDateTimeTest >> testPrintString [

  self assert: ( june first , 2025 ) atNoon printString equals: 'June 1, 2025 at 12:00:00.000000'
]

{ #category : 'tests' }
GregorianDateTimeTest >> testPrintStringInISO8601 [

  self assert: ( june first , 2025 ) atNoon printAsISO8601String equals: '2025-06-01T12:00:00.000000'
]
