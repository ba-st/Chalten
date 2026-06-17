"
A GregorianDateTest is a test class for testing the behavior of GregorianDate
"
Class {
	#name : 'GregorianDateTest',
	#superclass : 'ChaltenTest',
	#category : 'Chalten-Core-Tests',
	#package : 'Chalten-Core-Tests'
}

{ #category : 'private - asserting' }
GregorianDateTest >> assert: dayCount daysAfter: date is: anotherDate [

  self assert: ( date next: dayCount * day ) equals: anotherDate
]

{ #category : 'private - asserting' }
GregorianDateTest >> assert: dayCount daysBefore: date is: anotherDate [

  self assert: ( date previous: dayCount * day ) equals: anotherDate
]

{ #category : 'tests' }
GregorianDateTest >> testAccessing [

  | date |
  date := june first , 2025.
  self
    assert: date dayNumber equals: 1;
    assert: date year equals: 2025 asGregorianYear;
    assert: date yearNumber equals: 2025;
    assert: date monthOfYear equals: june , 2025;
    assert: date month equals: june;
    assert: date monthNumber equals: 6
]

{ #category : 'tests' }
GregorianDateTest >> testBetweenAnd [

  self
    assert: ( january first , 2025 between: january first , 2025 and: january second , 2025 );
    assert: ( january second , 2025 between: january first , 2025 and: january second , 2025 );
    assert: ( january second , 2025 between: january first , 2025 and: january third , 2025 );
    assert: ( february first , 2025 between: january first , 2025 and: february first , 2025 );
    assert: ( february first , 2025 between: january first , 2025 and: february third , 2025 );
    assert: ( february first , 2025 between: january first , 2025 and: july fifth , 2025 );
    deny: ( january eleventh , 2025 between: january twelfth , 2025 and: january thirtieth , 2025 );
    deny: ( january twentieth , 2025 between: january first , 2025 and: january eleventh , 2025 )
]

{ #category : 'tests' }
GregorianDateTest >> testCannotComputeDateDistanceWhenTheSecondIsGreater [

  self
    should: [ ( january second , 2025 ) - ( january third , 2025 ) ]
    raise: ArithmeticError
    withMessageText: 'Cannot subtract two dates when the second one is greater than the first one.'
]

{ #category : 'tests' }
GregorianDateTest >> testComparing [

  self
    assert: january first , 2025 equals: january first , 2025;
    assert: ( january first , 2025 ) hash equals: ( january first , 2025 ) hash;
    deny: january first , 2025 equals: january second , 2025;
    deny: january first , 2025 equals: february first , 2025;
    deny: january first , 2025 equals: january first , 2024
]

{ #category : 'tests' }
GregorianDateTest >> testDayOfWeek [

  self
    assert: ( january first , 2025 ) dayOfWeek equals: DayOfWeek wednesday;
    assert: ( january second , 2025 ) dayOfWeek equals: DayOfWeek thursday;
    assert: ( february first , 2025 ) dayOfWeek equals: DayOfWeek saturday;
    assert: ( march first , 2025 ) dayOfWeek equals: DayOfWeek saturday;
    assert: ( january first , 2026 ) dayOfWeek equals: DayOfWeek thursday;
    assert: ( december thirtyFirst , 2008 ) dayOfWeek equals: DayOfWeek wednesday;
    assert: ( january first , 2009 ) dayOfWeek equals: DayOfWeek thursday;
    assert: ( january second , 2009 ) dayOfWeek equals: DayOfWeek friday;
    assert: ( january third , 2009 ) dayOfWeek equals: DayOfWeek saturday;
    assert: ( january fourth , 2009 ) dayOfWeek equals: DayOfWeek sunday;
    assert: ( january fifth , 2009 ) dayOfWeek equals: DayOfWeek monday;
    assert: ( january sixth , 2009 ) dayOfWeek equals: DayOfWeek tuesday;
    assert: ( january seventh , 2009 ) dayOfWeek equals: DayOfWeek wednesday
]

{ #category : 'tests' }
GregorianDateTest >> testDaysBetweenTwoDates [

  self
    assert: ( ( january first , 2025 ) - ( january first , 2025 ) ) isZero;
    assert: ( january second , 2025 ) - ( january first , 2025 ) equals: 1 * day;
    assert: ( february first , 2025 ) - ( january first , 2025 ) equals: 31 * day;
    assert: ( march first , 2025 ) - ( january first , 2025 ) equals: 31 + 28 * day;
    assert: ( january first , 2026 ) - ( january first , 2025 ) equals: 365 * day;
    assert: ( december thirtyFirst , 2008 ) - ( january first , 2008 ) equals: 365 * day;
    assert: ( january first , 2009 ) - ( january first , 2008 ) equals: 366 * day
]

{ #category : 'tests' }
GregorianDateTest >> testGreaterThan [

  self
    assert: january first , 2025 isGreaterThan: january first , 2024;
    assert: january first , 2025 isGreaterThanOrEqualTo: january first , 2024;
    assert: january first , 2025 isGreaterThanOrEqualTo: january first , 2025;
    assert: february first , 2025 isGreaterThan: january first , 2025;
    assert: february first , 2025 isGreaterThanOrEqualTo: january first , 2025;
    assert: january first , 2025 isGreaterThanOrEqualTo: december first , 2024;
    assert: february second , 2025 isGreaterThan: february first , 2025;
    assert: february second , 2025 isGreaterThanOrEqualTo: february first , 2025;
    deny: january first , 0 isGreaterThan: january first , 2025;
    deny: january first , 2025 isGreaterThan: february first , 2025
]

{ #category : 'tests' }
GregorianDateTest >> testISO8601Printing [

  self
    assert: ( self printAsISO8601String: ( january , 2025 ) twelfth ) equals: '2025-01-12';
    assert: ( self printAsISO8601String: ( april , 2025 ) first ) equals: '2025-04-01';
    assert: ( self printAsISO8601String: ( april , 0 ) first ) equals: '0000-04-01';
    assert: ( self printAsISO8601String: ( april , 150 ) first ) equals: '0150-04-01';
    assert: ( self printAsISO8601String: ( april , -1 ) first ) equals: '-0001-04-01';
    assert: ( self printAsISO8601String: ( april , 10000 ) first ) equals: '+010000-04-01';
    assert: ( self printAsISO8601String: ( april , -54000 ) first ) equals: '-054000-04-01';
    assert: ( self printAsISO8601String: ( april , 9999000 ) first ) equals: '+9999000-04-01';
    assert: ( self printAsISO8601String: ( april , -9999000 ) first ) equals: '-9999000-04-01'
]

{ #category : 'tests' }
GregorianDateTest >> testInstanceCreationFor30DaysMonth [

  self
    assert: ( april first , 2025 ) dayNumber equals: 1;
    assert: ( april second , 2025 ) dayNumber equals: 2;
    assert: ( april third , 2025 ) dayNumber equals: 3;
    assert: ( april fourth , 2025 ) dayNumber equals: 4;
    assert: ( april fifth , 2025 ) dayNumber equals: 5;
    assert: ( april sixth , 2025 ) dayNumber equals: 6;
    assert: ( april seventh , 2025 ) dayNumber equals: 7;
    assert: ( april eighth , 2025 ) dayNumber equals: 8;
    assert: ( april ninth , 2025 ) dayNumber equals: 9;
    assert: ( april tenth , 2025 ) dayNumber equals: 10;
    assert: ( april eleventh , 2025 ) dayNumber equals: 11;
    assert: ( april twelfth , 2025 ) dayNumber equals: 12;
    assert: ( april thirteenth , 2025 ) dayNumber equals: 13;
    assert: ( april fourteenth , 2025 ) dayNumber equals: 14;
    assert: ( april fifteenth , 2025 ) dayNumber equals: 15;
    assert: ( april sixteenth , 2025 ) dayNumber equals: 16;
    assert: ( april seventeenth , 2025 ) dayNumber equals: 17;
    assert: ( april eighteenth , 2025 ) dayNumber equals: 18;
    assert: ( april nineteenth , 2025 ) dayNumber equals: 19;
    assert: ( april twentieth , 2025 ) dayNumber equals: 20;
    assert: ( april twentyFirst , 2025 ) dayNumber equals: 21;
    assert: ( april twentySecond , 2025 ) dayNumber equals: 22;
    assert: ( april twentyThird , 2025 ) dayNumber equals: 23;
    assert: ( april twentyFourth , 2025 ) dayNumber equals: 24;
    assert: ( april twentyFifth , 2025 ) dayNumber equals: 25;
    assert: ( april twentySixth , 2025 ) dayNumber equals: 26;
    assert: ( april twentySeventh , 2025 ) dayNumber equals: 27;
    assert: ( april twentyEighth , 2025 ) dayNumber equals: 28;
    assert: ( april twentyNinth , 2025 ) dayNumber equals: 29;
    assert: ( april thirtieth , 2025 ) dayNumber equals: 30.
  self should: [ april thirtyFirst ] raise: MessageNotUnderstood
]

{ #category : 'tests' }
GregorianDateTest >> testInstanceCreationFor31DaysMonth [

  self
    assert: ( january first , 2025 ) dayNumber equals: 1;
    assert: ( january second , 2025 ) dayNumber equals: 2;
    assert: ( january third , 2025 ) dayNumber equals: 3;
    assert: ( january fourth , 2025 ) dayNumber equals: 4;
    assert: ( january fifth , 2025 ) dayNumber equals: 5;
    assert: ( january sixth , 2025 ) dayNumber equals: 6;
    assert: ( january seventh , 2025 ) dayNumber equals: 7;
    assert: ( january eighth , 2025 ) dayNumber equals: 8;
    assert: ( january ninth , 2025 ) dayNumber equals: 9;
    assert: ( january tenth , 2025 ) dayNumber equals: 10;
    assert: ( january eleventh , 2025 ) dayNumber equals: 11;
    assert: ( january twelfth , 2025 ) dayNumber equals: 12;
    assert: ( january thirteenth , 2025 ) dayNumber equals: 13;
    assert: ( january fourteenth , 2025 ) dayNumber equals: 14;
    assert: ( january fifteenth , 2025 ) dayNumber equals: 15;
    assert: ( january sixteenth , 2025 ) dayNumber equals: 16;
    assert: ( january seventeenth , 2025 ) dayNumber equals: 17;
    assert: ( january eighteenth , 2025 ) dayNumber equals: 18;
    assert: ( january nineteenth , 2025 ) dayNumber equals: 19;
    assert: ( january twentieth , 2025 ) dayNumber equals: 20;
    assert: ( january twentyFirst , 2025 ) dayNumber equals: 21;
    assert: ( january twentySecond , 2025 ) dayNumber equals: 22;
    assert: ( january twentyThird , 2025 ) dayNumber equals: 23;
    assert: ( january twentyFourth , 2025 ) dayNumber equals: 24;
    assert: ( january twentyFifth , 2025 ) dayNumber equals: 25;
    assert: ( january twentySixth , 2025 ) dayNumber equals: 26;
    assert: ( january twentySeventh , 2025 ) dayNumber equals: 27;
    assert: ( january twentyEighth , 2025 ) dayNumber equals: 28;
    assert: ( january twentyNinth , 2025 ) dayNumber equals: 29;
    assert: ( january thirtieth , 2025 ) dayNumber equals: 30;
    assert: ( january thirtyFirst , 2025 ) dayNumber equals: 31
]

{ #category : 'tests' }
GregorianDateTest >> testInstanceCreationForFebruaryOnCommonYear [

  self
    assert: ( february first , 2025 ) dayNumber equals: 1;
    assert: ( february second , 2025 ) dayNumber equals: 2;
    assert: ( february third , 2025 ) dayNumber equals: 3;
    assert: ( february fourth , 2025 ) dayNumber equals: 4;
    assert: ( february fifth , 2025 ) dayNumber equals: 5;
    assert: ( february sixth , 2025 ) dayNumber equals: 6;
    assert: ( february seventh , 2025 ) dayNumber equals: 7;
    assert: ( february eighth , 2025 ) dayNumber equals: 8;
    assert: ( february ninth , 2025 ) dayNumber equals: 9;
    assert: ( february tenth , 2025 ) dayNumber equals: 10;
    assert: ( february eleventh , 2025 ) dayNumber equals: 11;
    assert: ( february twelfth , 2025 ) dayNumber equals: 12;
    assert: ( february thirteenth , 2025 ) dayNumber equals: 13;
    assert: ( february fourteenth , 2025 ) dayNumber equals: 14;
    assert: ( february fifteenth , 2025 ) dayNumber equals: 15;
    assert: ( february sixteenth , 2025 ) dayNumber equals: 16;
    assert: ( february seventeenth , 2025 ) dayNumber equals: 17;
    assert: ( february eighteenth , 2025 ) dayNumber equals: 18;
    assert: ( february nineteenth , 2025 ) dayNumber equals: 19;
    assert: ( february twentieth , 2025 ) dayNumber equals: 20;
    assert: ( february twentyFirst , 2025 ) dayNumber equals: 21;
    assert: ( february twentySecond , 2025 ) dayNumber equals: 22;
    assert: ( february twentyThird , 2025 ) dayNumber equals: 23;
    assert: ( february twentyFourth , 2025 ) dayNumber equals: 24;
    assert: ( february twentyFifth , 2025 ) dayNumber equals: 25;
    assert: ( february twentySixth , 2025 ) dayNumber equals: 26;
    assert: ( february twentySeventh , 2025 ) dayNumber equals: 27;
    assert: ( february twentyEighth , 2025 ) dayNumber equals: 28.
  self
    should: [ february twentyNinth , 2025 ]
    raise: InstanceCreationFailed
    withMessageText: '29 is an invalid day number in February, 2025';
    should: [ february thirtieth ] raise: MessageNotUnderstood;
    should: [ february thirtyFirst ] raise: MessageNotUnderstood
]

{ #category : 'tests' }
GregorianDateTest >> testInstanceCreationForFebruaryOnLeapYear [

  self
    assert: ( february first , 2020 ) dayNumber equals: 1;
    assert: ( february second , 2020 ) dayNumber equals: 2;
    assert: ( february third , 2020 ) dayNumber equals: 3;
    assert: ( february fourth , 2020 ) dayNumber equals: 4;
    assert: ( february fifth , 2020 ) dayNumber equals: 5;
    assert: ( february sixth , 2020 ) dayNumber equals: 6;
    assert: ( february seventh , 2020 ) dayNumber equals: 7;
    assert: ( february eighth , 2020 ) dayNumber equals: 8;
    assert: ( february ninth , 2020 ) dayNumber equals: 9;
    assert: ( february tenth , 2020 ) dayNumber equals: 10;
    assert: ( february eleventh , 2020 ) dayNumber equals: 11;
    assert: ( february twelfth , 2020 ) dayNumber equals: 12;
    assert: ( february thirteenth , 2020 ) dayNumber equals: 13;
    assert: ( february fourteenth , 2020 ) dayNumber equals: 14;
    assert: ( february fifteenth , 2020 ) dayNumber equals: 15;
    assert: ( february sixteenth , 2020 ) dayNumber equals: 16;
    assert: ( february seventeenth , 2020 ) dayNumber equals: 17;
    assert: ( february eighteenth , 2020 ) dayNumber equals: 18;
    assert: ( february nineteenth , 2020 ) dayNumber equals: 19;
    assert: ( february twentieth , 2020 ) dayNumber equals: 20;
    assert: ( february twentyFirst , 2020 ) dayNumber equals: 21;
    assert: ( february twentySecond , 2020 ) dayNumber equals: 22;
    assert: ( february twentyThird , 2020 ) dayNumber equals: 23;
    assert: ( february twentyFourth , 2020 ) dayNumber equals: 24;
    assert: ( february twentyFifth , 2020 ) dayNumber equals: 25;
    assert: ( february twentySixth , 2020 ) dayNumber equals: 26;
    assert: ( february twentySeventh , 2020 ) dayNumber equals: 27;
    assert: ( february twentyEighth , 2020 ) dayNumber equals: 28;
    assert: ( february twentyNinth , 2020 ) dayNumber equals: 29.
  self
    should: [ february thirtieth ] raise: MessageNotUnderstood;
    should: [ february thirtyFirst ] raise: MessageNotUnderstood
]

{ #category : 'tests' }
GregorianDateTest >> testInterval [

  | interval |
  interval := january first , 2025 to: january thirtyFirst , 2025.
  self assert: interval size equals: 31.
  interval doWithIndex: [ :date :index |
      self
        assert: date dayNumber equals: index;
        assert: date monthOfYear equals: january , 2025
    ]
]

{ #category : 'tests' }
GregorianDateTest >> testIntervalWithStep [

  | interval |
  interval := january first , 2025 to: january thirtieth , 2025 by: 2 * day.
  self assert: interval size equals: 15.
  interval doWithIndex: [ :date :index |
      self
        assert: date dayNumber equals: index * 2 - 1;
        assert: date monthOfYear equals: january , 2025
    ]
]

{ #category : 'tests' }
GregorianDateTest >> testLessThan [

  self
    assert: january first , 2024 isLessThan: january first , 2025;
    assert: january first , 2024 isLessThanOrEqualTo: january first , 2025;
    assert: january first , 2025 isLessThanOrEqualTo: january first , 2025;
    assert: january first , 2025 isLessThan: february first , 2025;
    assert: january first , 2025 isLessThanOrEqualTo: february first , 2025;
    assert: december first , 2024 isLessThanOrEqualTo: january first , 2025;
    assert: february first , 2025 isLessThan: february second , 2025;
    assert: february first , 2025 isLessThanOrEqualTo: february second , 2025;
    deny: january first , 2025 isLessThan: january first , 0;
    deny: february first , 2025 isLessThan: january first , 2025
]

{ #category : 'tests' }
GregorianDateTest >> testNext [

  self
    assertNextOf: june first , 2025 is: june second , 2025;
    assertNextOf: june thirtieth , 2025 is: july first , 2025;
    assertNextOf: december thirtyFirst , 2025 is: january first , 2026;
    assertNextOf: february twentyEighth , 2020 is: february twentyNinth , 2020;
    assertNextOf: february twentyEighth , 2025 is: march first , 2025.

  self
    assert: 10 daysAfter: january first , 2027 is: january eleventh , 2027;
    assert: 30 daysAfter: january first , 2027 is: january thirtyFirst , 2027;
    assert: 31 daysAfter: january first , 2027 is: february first , 2027;
    assert: 365 daysAfter: january first , 2027 is: january first , 2028;
    assert: 366 daysAfter: january first , 2024 is: january first , 2025;
    assert: 0 daysAfter: january first , 2027 is: january first , 2027.

  self
    assert: 365 + 366 + 365 + 365 daysAfter: january first , 2007 is: january first , 2011;
    assert: 365 + 366 + 365 + 365 + 31 + 28 daysAfter: january first , 2007 is: march first , 2011
]

{ #category : 'tests' }
GregorianDateTest >> testPrevious [

  self
    assertPreviousOf: june second , 2025 is: june first , 2025;
    assertPreviousOf: june first , 2025 is: may thirtyFirst , 2025;
    assertPreviousOf: january first , 2025 is: december thirtyFirst , 2024;
    assertPreviousOf: february twentyNinth , 2020 is: february twentyEighth , 2020;
    assertPreviousOf: march first , 2025 is: february twentyEighth , 2025.
  self
    assert: 10 daysBefore: december thirtyFirst , 2008 is: december twentyFirst , 2008;
    assert: 30 daysBefore: december thirtyFirst , 2008 is: december first , 2008;
    assert: 31 daysBefore: december thirtyFirst , 2008 is: november thirtieth , 2008;
    assert: 365 daysBefore: december thirtyFirst , 2008 is: january first , 2008;
    assert: 366 daysBefore: january first , 2005 is: january first , 2004;
    assert: 0 daysBefore: december thirtyFirst , 2008 is: december thirtyFirst , 2008.

  self
    assert: 365 + 366 + 365 + 365 daysBefore: january first , 2011 is: january first , 2007;
    assert: 365 + 366 + 365 + 365 + 31 + 28 daysBefore: march first , 2011 is: january first , 2007
]

{ #category : 'tests' }
GregorianDateTest >> testPrintString [

  self
    assert: ( GregorianMonth april , 2025 ) first printString equals: 'April 1, 2025';
    assert: ( GregorianMonth january , 2025 ) twelfth printString equals: 'January 12, 2025'
]

{ #category : 'tests' }
GregorianDateTest >> testSubtraction [

  self
    assert: 2026 asGregorianYear lastDate - 2026 asGregorianYear firstDate equals: 364 * day;
    assert: 2027 asGregorianYear lastDate - 2026 asGregorianYear lastDate equals: 365 * day;
    assert: 2027 asGregorianYear lastDate - 2023 asGregorianYear lastDate equals: 1461 * day
]
