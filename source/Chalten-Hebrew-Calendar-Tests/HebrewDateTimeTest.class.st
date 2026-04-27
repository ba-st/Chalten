"
A HebrewDateTimeTest is a test class for testing the behavior of HebrewDateTime
"
Class {
	#name : 'HebrewDateTimeTest',
	#superclass : 'HebrewCalendarTest',
	#category : 'Chalten-Hebrew-Calendar-Tests',
	#package : 'Chalten-Hebrew-Calendar-Tests'
}

{ #category : 'tests' }
HebrewDateTimeTest >> testAccessing [

  | datetime |
  datetime := HebrewDateTime on: kislev first , 1447 at: TimeOfDay halfOfDay.
  self
    assert: datetime date equals: kislev first , 1447;
    assert: datetime dayNumber equals: 1;
    assert: datetime year equals: 1447 asHebrewYear;
    assert: datetime yearNumber equals: 1447;
    assert: datetime monthOfYear equals: kislev , 1447;
    assert: datetime month equals: kislev;
    assert: datetime monthNumber equals: 3;
    assert: datetime timeOfDay equals: TimeOfDay halfOfDay
]

{ #category : 'tests' }
HebrewDateTimeTest >> testAtMidnight [

  self
    assert: ( nisan first , 5679 ) atMidnight printString
    equals: 'Nisan 1, 5679 AM at 06:00:00.000000'
]

{ #category : 'tests' }
HebrewDateTimeTest >> testAtNoon [

  self
    assert: ( nisan first , 5679 ) atNoon printString
    equals: 'Nisan 1, 5679 AM at 18:00:00.000000'
]

{ #category : 'tests' }
HebrewDateTimeTest >> testAtStartOfDay [

  self
    assert: ( nisan first , 5679 ) atStartOfDay printString
    equals: 'Nisan 1, 5679 AM at 00:00:00.000000'
]

{ #category : 'tests' }
HebrewDateTimeTest >> testBetweenAnd [

  self assert: ( ( tevet first , 5679 ) atNoon
        between: ( tevet first , 5679 ) atStartOfDay 
        and: ( tevet second , 5679 ) atStartOfDay )
]

{ #category : 'tests' }
HebrewDateTimeTest >> testComparing [

  self
    assert: ( tevet first , 5675 ) atNoon equals: ( tevet first , 5675 ) atNoon;
    deny: ( tevet first , 5675 ) atNoon equals: ( tevet first , 5675 ) atMidnight;
    deny: ( tevet first , 5674 ) atNoon equals: ( tevet first , 5675 ) atNoon
]

{ #category : 'tests' }
HebrewDateTimeTest >> testCreationShortcut [

  | datetime |
  datetime := kislev first , 5675 at: ( TimeOfDay hours: 18 ).
  self
    assert: datetime date equals: kislev first , 5675;
    assert: datetime timeOfDay equals: ( TimeOfDay hours: 18 );
    assert: datetime equals: ( kislev first , 5675 ) atNoon.

  datetime := ( tevet sixth , 5675 ) atMidnight.
  self
    assert: datetime date equals: tevet sixth , 5675;
    assert: datetime timeOfDay equals: ( TimeOfDay hours: 6 )
]

{ #category : 'tests' }
HebrewDateTimeTest >> testGreaterThan [

  self
    assert: ( tishrei first , 5675 ) atNoon isGreaterThan: ( tishrei first , 5675 ) atMidnight;
    assert: ( tishrei first , 5675 ) atNoon
    isGreaterThanOrEqualTo: ( tishrei first , 5675 ) atMidnight;
    assert: ( tishrei first , 5675 ) atMidnight
    isGreaterThanOrEqualTo: ( tishrei first , 5675 ) atMidnight;
    assert: ( cheshvan first , 5675 ) atMidnight isGreaterThan: ( tishrei first , 5675 ) atMidnight;
    assert: ( cheshvan first , 5675 ) atMidnight
    isGreaterThanOrEqualTo: ( tishrei first , 5675 ) atMidnight;
    assert: ( cheshvan first , 5675 ) atMidnight
    isGreaterThanOrEqualTo: ( cheshvan first , 5675 ) atMidnight
]

{ #category : 'tests' }
HebrewDateTimeTest >> testIn [

  | utcPlus3 utcMinus6 |
  utcPlus3 := FixedOffsetRuleset for: 3 * hour.
  utcMinus6 := FixedOffsetRuleset for: -6 * hour.

  self
    assert: ( ( shevat twentySecond , 5786 ) atStartOfDay in: utcPlus3 ) printString
    equals: '2026-02-09T18:00:00.000000+03:00';
    assert: ( ( shevat twentySecond , 5786 ) atStartOfDay in: utcMinus6 ) printString
    equals: '2026-02-09T18:00:00.000000-06:00'
]

{ #category : 'tests' }
HebrewDateTimeTest >> testInCoordinatedUniversalTime [

  self
    assert: ( tishrei first , 1 ) atStartOfDay inCoordinatedUniversalTime
    equals: ( september seventh , -3760 at: ( TimeOfDay hours: 18 ) ) inCoordinatedUniversalTime;
    assert: ( tishrei first , 1 ) atMidnight inCoordinatedUniversalTime
    equals: ( september eighth , -3760 ) atMidnight inCoordinatedUniversalTime;
    assert: ( tishrei first , 1 ) atNoon inCoordinatedUniversalTime
    equals: ( september eighth , -3760 ) atNoon inCoordinatedUniversalTime;
    assert: ( shevat twentySecond , 5786 ) atStartOfDay inCoordinatedUniversalTime
    equals: ( february ninth , 2026 at: ( TimeOfDay hours: 18 ) ) inCoordinatedUniversalTime
]

{ #category : 'tests' }
HebrewDateTimeTest >> testLessThan [

  self
    assert: ( tishrei first , 5679 ) atMidnight isLessThan: ( tishrei first , 5679 ) atNoon;
    assert: ( tishrei first , 5679 ) atMidnight isLessThanOrEqualTo: ( tishrei first , 5679 ) atNoon;
    assert: ( tishrei first , 5679 ) atMidnight
    isLessThanOrEqualTo: ( tishrei first , 5679 ) atMidnight;
    assert: ( tishrei first , 5680 ) atMidnight isLessThan: ( cheshvan first , 5680 ) atMidnight;
    assert: ( tishrei first , 5680 ) atMidnight
    isLessThanOrEqualTo: ( cheshvan first , 5680 ) atMidnight;
    deny: ( tishrei first , 5680 ) atMidnight isLessThan: ( tishrei first , 1 ) atMidnight;
    deny: ( cheshvan first , 5680 ) atNoon isLessThan: ( tishrei first , 5680 ) atNoon
]

{ #category : 'tests' }
HebrewDateTimeTest >> testPrintString [

  self
    assert: ( nisan first , 5679 ) atNoon printString
    equals: 'Nisan 1, 5679 AM at 18:00:00.000000'
]
