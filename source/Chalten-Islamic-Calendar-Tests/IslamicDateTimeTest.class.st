"
An IslamicDateTimeTest is a test class for testing the behavior of IslamicDateTime
"
Class {
	#name : 'IslamicDateTimeTest',
	#superclass : 'IslamicCalendarTest',
	#category : 'Chalten-Islamic-Calendar-Tests',
	#package : 'Chalten-Islamic-Calendar-Tests'
}

{ #category : 'tests' }
IslamicDateTimeTest >> testAccessing [

  | datetime |
  datetime := IslamicDateTime on: rabiAlAwwal first , 1447 at: TimeOfDay halfOfDay.
  self
    assert: datetime date equals: rabiAlAwwal first , 1447;
    assert: datetime dayNumber equals: 1;
    assert: datetime year equals: 1447 asIslamicYear;
    assert: datetime yearNumber equals: 1447;
    assert: datetime monthOfYear equals: rabiAlAwwal , 1447;
    assert: datetime month equals: rabiAlAwwal;
    assert: datetime monthNumber equals: 3;
    assert: datetime timeOfDay equals: TimeOfDay halfOfDay
]

{ #category : 'tests' }
IslamicDateTimeTest >> testAtMidnight [

  self
    assert: ( jumadaAlAwwal first , 4875 ) atMidnight printString
    equals: 'Jumada al-Awwal 1, 4875 AH at 06:00:00.000000'
]

{ #category : 'tests' }
IslamicDateTimeTest >> testAtNoon [ 

  self
    assert: ( jumadaAlAwwal first , 4875 ) atNoon printString
    equals: 'Jumada al-Awwal 1, 4875 AH at 18:00:00.000000'
]

{ #category : 'tests' }
IslamicDateTimeTest >> testAtStartOfDay [

  self
    assert: ( jumadaAlAwwal first , 4875 ) atStartOfDay printString
    equals: 'Jumada al-Awwal 1, 4875 AH at 00:00:00.000000'
]

{ #category : 'tests' }
IslamicDateTimeTest >> testBetweenAnd [

  self assert: ( ( rabiAlThani first , 1447 ) atNoon
        between: ( rabiAlThani first , 1447 ) atMidnight
        and: ( rabiAlThani second , 1447 ) atMidnight )
]

{ #category : 'tests' }
IslamicDateTimeTest >> testComparing [

  self
    assert: ( rabiAlThani first , 1447 ) atNoon equals: ( rabiAlThani first , 1447 ) atNoon;
    deny: ( rabiAlThani first , 1447 ) atNoon equals: ( rabiAlThani first , 1447 ) atMidnight;
    deny: ( rabiAlThani first , 1446 ) atNoon equals: ( rabiAlThani first , 1447 ) atNoon
]

{ #category : 'tests' }
IslamicDateTimeTest >> testCreationShortcut [

  | datetime |
  datetime := rabiAlAwwal first , 1447 at: ( TimeOfDay hours: 18 ).
  self
    assert: datetime date equals: rabiAlAwwal first , 1447;
    assert: datetime timeOfDay equals: ( TimeOfDay hours: 18 );
    assert: datetime equals: ( rabiAlAwwal first , 1447 ) atNoon.

  datetime := ( rabiAlThani sixth , 1447 ) atMidnight.
  self
    assert: datetime date equals: rabiAlThani sixth , 1447;
    assert: datetime timeOfDay equals: ( TimeOfDay hours: 6 )
]

{ #category : 'tests' }
IslamicDateTimeTest >> testGreaterThan [

  self
    assert: ( muharram first , 1447 ) atNoon greaterThan: ( muharram first , 1447 ) atMidnight;
    assert: ( muharram first , 1447 ) atNoon
    greaterThanOrEquals: ( muharram first , 1447 ) atMidnight;
    assert: ( muharram first , 1447 ) atMidnight
    greaterThanOrEquals: ( muharram first , 1447 ) atMidnight;
    assert: ( safar first , 1447 ) atMidnight greaterThan: ( muharram first , 1447 ) atMidnight;
    assert: ( safar first , 1447 ) atMidnight
    greaterThanOrEquals: ( muharram first , 1447 ) atMidnight;
    assert: ( safar first , 1447 ) atMidnight
    greaterThanOrEquals: ( safar first , 1447 ) atMidnight
]

{ #category : 'tests' }
IslamicDateTimeTest >> testIn [

  | utcPlus3 utcMinus6 |
  utcPlus3 := FixedOffsetRuleset for: 3 * hour.
  utcMinus6 := FixedOffsetRuleset for: -6 * hour.

  self
    assert: ( ( shaban twentyFirst , 1447 ) atStartOfDay in: utcPlus3 ) printString
    equals: '2026-02-09T18:00:00.000000+03:00';
    assert: ( ( shaban twentyFirst , 1447 ) atStartOfDay in: utcMinus6 ) printString
    equals: '2026-02-09T18:00:00.000000-06:00'
]

{ #category : 'tests' }
IslamicDateTimeTest >> testInCoordinatedUniversalTime [

  self
    assert: ( muharram first , 1 ) atStartOfDay inCoordinatedUniversalTime
    equals: ( july nineteenth , 622 at: ( TimeOfDay hours: 18 ) ) inCoordinatedUniversalTime;
    assert: ( muharram first , 1 ) atMidnight inCoordinatedUniversalTime
    equals: ( july twentieth , 622 ) atMidnight inCoordinatedUniversalTime;
    assert: ( muharram first , 1 ) atNoon inCoordinatedUniversalTime
    equals: ( july twentieth , 622 ) atNoon inCoordinatedUniversalTime;
    assert: ( shaban twentyFirst , 1447 ) atStartOfDay inCoordinatedUniversalTime
    equals: ( february ninth , 2026 at: ( TimeOfDay hours: 18 ) ) inCoordinatedUniversalTime
]

{ #category : 'tests' }
IslamicDateTimeTest >> testLessThan [

  self
    assert: ( muharram first , 1446 ) atMidnight lessThan: ( muharram first , 1446 ) atNoon;
    assert: ( muharram first , 1446 ) atMidnight lessThanOrEquals: ( muharram first , 1446 ) atNoon;
    assert: ( muharram first , 1446 ) atMidnight
    lessThanOrEquals: ( muharram first , 1446 ) atMidnight;
    assert: ( muharram first , 1447 ) atMidnight lessThan: ( safar first , 1447 ) atMidnight;
    assert: ( muharram first , 1447 ) atMidnight
    lessThanOrEquals: ( safar first , 1447 ) atMidnight;
    deny: ( muharram first , 1447 ) atMidnight lessThan: ( muharram first , 1 ) atMidnight;
    deny: ( safar first , 1447 ) atNoon lessThan: ( muharram first , 1447 ) atNoon
]

{ #category : 'tests' }
IslamicDateTimeTest >> testPrintString [

  self
    assert: ( jumadaAlThani first , 1447 ) atNoon printString
    equals: 'Jumada al-Thani 1, 1447 AH at 18:00:00.000000'
]
