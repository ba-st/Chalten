Class {
	#name : 'IslamicDateTest',
	#superclass : 'IslamicCalendarTest',
	#category : 'Chalten-Islamic-Calendar-Tests',
	#package : 'Chalten-Islamic-Calendar-Tests'
}

{ #category : 'private - asserting' }
IslamicDateTest >> assert: dayCount daysAfter: date is: anotherDate [

  self assert: ( date next: dayCount * day ) equals: anotherDate
]

{ #category : 'private - asserting' }
IslamicDateTest >> assert: dayCount daysBefore: date is: anotherDate [

  self assert: ( date previous: dayCount * day ) equals: anotherDate
]

{ #category : 'tests' }
IslamicDateTest >> testAccessing [

  | date |
  date := jumadaAlThani first , 2025.
  self
    assert: date dayNumber equals: 1;
    assert: date year equals: 2025 asIslamicYear;
    assert: date yearNumber equals: 2025;
    assert: date monthOfYear equals: jumadaAlThani , 2025;
    assert: date month equals: jumadaAlThani;
    assert: date monthNumber equals: 6
]

{ #category : 'tests' }
IslamicDateTest >> testBetweenAnd [

  self
    assert: ( muharram first , 2025 between: muharram first , 2025 and: muharram second , 2025 );
    assert: ( muharram second , 2025 between: muharram first , 2025 and: muharram second , 2025 );
    assert: ( muharram second , 2025 between: muharram first , 2025 and: muharram third , 2025 );
    assert: ( safar first , 2025 between: muharram first , 2025 and: safar first , 2025 );
    assert: ( safar first , 2025 between: muharram first , 2025 and: safar third , 2025 );
    assert: ( safar first , 2025 between: muharram first , 2025 and: jumadaAlThani fifth , 2025 );
    deny:
      ( muharram eleventh , 2025 between: muharram twelfth , 2025 and: muharram thirtieth , 2025 );
    deny: ( muharram twentieth , 2025 between: muharram first , 2025 and: muharram eleventh , 2025 )
]

{ #category : 'tests' }
IslamicDateTest >> testCannotComputeDateDistanceWhenTheSecondIsGreater [

  self
    should: [ muharram second , 2025 - ( muharram third , 2025 ) ]
    raise: ArithmeticError
    withMessageText: 'Cannot subtract two dates when the second one is greater than the first one.'
]

{ #category : 'tests' }
IslamicDateTest >> testComparing [

  self
    assert: muharram first , 2025 equals: muharram first , 2025;
    deny: muharram first , 2025 equals: muharram second , 2025;
    deny: muharram first , 2025 equals: safar first , 2025;
    deny: muharram first , 2025 equals: muharram first , 2024;
    deny: muharram first , 2025 equals: january first , 2025
]

{ #category : 'tests' }
IslamicDateTest >> testDayOfWeek [

  self
    assert: ( rajab first , 1428 ) dayOfWeek equals: IslamicDayOfWeek yawnAlIthnayn;
    assert: ( rajab second , 1428 ) dayOfWeek equals: IslamicDayOfWeek yawnAthThulatha;
    assert: ( rajab third , 1428 ) dayOfWeek equals: IslamicDayOfWeek yawnAlArbaa;
    assert: ( rajab fourth , 1428 ) dayOfWeek equals: IslamicDayOfWeek yawnAlKhamees;
    assert: ( rajab fifth , 1428 ) dayOfWeek equals: IslamicDayOfWeek yawnAlJumuha;
    assert: ( rajab sixth , 1428 ) dayOfWeek equals: IslamicDayOfWeek yawnAsSabt;
    assert: ( rajab seventh , 1428 ) dayOfWeek equals: IslamicDayOfWeek yawnAlAhad;
    assert: ( rajab eighth , 1428 ) dayOfWeek equals: IslamicDayOfWeek yawnAlIthnayn
]

{ #category : 'tests' }
IslamicDateTest >> testDaysBetweenTwoDates [

  self
    assert: ( muharram first , 2025 - ( muharram first , 2025 ) ) isZero;
    assert: muharram second , 2025 - ( muharram first , 2025 ) equals: 1 * day;
    assert: safar first , 2025 - ( muharram first , 2025 ) equals: 30 * day;
    assert: rabiAlAwwal first , 2025 - ( muharram first , 2025 ) equals: 30 + 29 * day;
    assert: muharram first , 2026 - ( muharram first , 2025 ) equals: 354 * day;
    assert: duAlHijjah thirtieth , 1442 - ( muharram first , 1442 ) equals: 354 * day;
    assert: muharram first , 1443 - ( muharram first , 1442 ) equals: 355 * day
]

{ #category : 'tests' }
IslamicDateTest >> testGreaterThan [

  self
    assert: muharram first , 2025 isGreaterThan: muharram first , 2024;
    assert: muharram first , 2025 isGreaterThanOrEqualTo: muharram first , 2024;
    assert: muharram first , 2025 isGreaterThanOrEqualTo: muharram first , 2025;
    assert: safar first , 2025 isGreaterThan: muharram first , 2025;
    assert: safar first , 2025 isGreaterThanOrEqualTo: muharram first , 2025;
    assert: muharram first , 2025 isGreaterThanOrEqualTo: duAlHijjah first , 2024;
    assert: safar second , 2025 isGreaterThan: safar first , 2025;
    assert: safar second , 2025 isGreaterThanOrEqualTo: safar first , 2025;
    deny: muharram first , 1 isGreaterThan: muharram first , 2025;
    deny: muharram first , 2025 isGreaterThan: safar first , 2025
]

{ #category : 'tests' }
IslamicDateTest >> testInstanceCreationFor29DaysMonth [

  self
    assert: ( shawwal first , 2025 ) dayNumber equals: 1;
    assert: ( shawwal second , 2025 ) dayNumber equals: 2;
    assert: ( shawwal third , 2025 ) dayNumber equals: 3;
    assert: ( shawwal fourth , 2025 ) dayNumber equals: 4;
    assert: ( shawwal fifth , 2025 ) dayNumber equals: 5;
    assert: ( shawwal sixth , 2025 ) dayNumber equals: 6;
    assert: ( shawwal seventh , 2025 ) dayNumber equals: 7;
    assert: ( shawwal eighth , 2025 ) dayNumber equals: 8;
    assert: ( shawwal ninth , 2025 ) dayNumber equals: 9;
    assert: ( shawwal tenth , 2025 ) dayNumber equals: 10;
    assert: ( shawwal eleventh , 2025 ) dayNumber equals: 11;
    assert: ( shawwal twelfth , 2025 ) dayNumber equals: 12;
    assert: ( shawwal thirteenth , 2025 ) dayNumber equals: 13;
    assert: ( shawwal fourteenth , 2025 ) dayNumber equals: 14;
    assert: ( shawwal fifteenth , 2025 ) dayNumber equals: 15;
    assert: ( shawwal sixteenth , 2025 ) dayNumber equals: 16;
    assert: ( shawwal seventeenth , 2025 ) dayNumber equals: 17;
    assert: ( shawwal eighteenth , 2025 ) dayNumber equals: 18;
    assert: ( shawwal nineteenth , 2025 ) dayNumber equals: 19;
    assert: ( shawwal twentieth , 2025 ) dayNumber equals: 20;
    assert: ( shawwal twentyFirst , 2025 ) dayNumber equals: 21;
    assert: ( shawwal twentySecond , 2025 ) dayNumber equals: 22;
    assert: ( shawwal twentyThird , 2025 ) dayNumber equals: 23;
    assert: ( shawwal twentyFourth , 2025 ) dayNumber equals: 24;
    assert: ( shawwal twentyFifth , 2025 ) dayNumber equals: 25;
    assert: ( shawwal twentySixth , 2025 ) dayNumber equals: 26;
    assert: ( shawwal twentySeventh , 2025 ) dayNumber equals: 27;
    assert: ( shawwal twentyEighth , 2025 ) dayNumber equals: 28;
    assert: ( shawwal twentyNinth , 2025 ) dayNumber equals: 29.
  self should: [ shawwal thirtieth , 2025 ] raise: MessageNotUnderstood
]

{ #category : 'tests' }
IslamicDateTest >> testInstanceCreationFor30DaysMonth [

  self
    assert: ( ramadan first , 2025 ) dayNumber equals: 1;
    assert: ( ramadan second , 2025 ) dayNumber equals: 2;
    assert: ( ramadan third , 2025 ) dayNumber equals: 3;
    assert: ( ramadan fourth , 2025 ) dayNumber equals: 4;
    assert: ( ramadan fifth , 2025 ) dayNumber equals: 5;
    assert: ( ramadan sixth , 2025 ) dayNumber equals: 6;
    assert: ( ramadan seventh , 2025 ) dayNumber equals: 7;
    assert: ( ramadan eighth , 2025 ) dayNumber equals: 8;
    assert: ( ramadan ninth , 2025 ) dayNumber equals: 9;
    assert: ( ramadan tenth , 2025 ) dayNumber equals: 10;
    assert: ( ramadan eleventh , 2025 ) dayNumber equals: 11;
    assert: ( ramadan twelfth , 2025 ) dayNumber equals: 12;
    assert: ( ramadan thirteenth , 2025 ) dayNumber equals: 13;
    assert: ( ramadan fourteenth , 2025 ) dayNumber equals: 14;
    assert: ( ramadan fifteenth , 2025 ) dayNumber equals: 15;
    assert: ( ramadan sixteenth , 2025 ) dayNumber equals: 16;
    assert: ( ramadan seventeenth , 2025 ) dayNumber equals: 17;
    assert: ( ramadan eighteenth , 2025 ) dayNumber equals: 18;
    assert: ( ramadan nineteenth , 2025 ) dayNumber equals: 19;
    assert: ( ramadan twentieth , 2025 ) dayNumber equals: 20;
    assert: ( ramadan twentyFirst , 2025 ) dayNumber equals: 21;
    assert: ( ramadan twentySecond , 2025 ) dayNumber equals: 22;
    assert: ( ramadan twentyThird , 2025 ) dayNumber equals: 23;
    assert: ( ramadan twentyFourth , 2025 ) dayNumber equals: 24;
    assert: ( ramadan twentyFifth , 2025 ) dayNumber equals: 25;
    assert: ( ramadan twentySixth , 2025 ) dayNumber equals: 26;
    assert: ( ramadan twentySeventh , 2025 ) dayNumber equals: 27;
    assert: ( ramadan twentyEighth , 2025 ) dayNumber equals: 28;
    assert: ( ramadan twentyNinth , 2025 ) dayNumber equals: 29;
    assert: ( ramadan thirtieth , 2025 ) dayNumber equals: 30
]

{ #category : 'tests' }
IslamicDateTest >> testInstanceCreationForDuAlhijjahOnCommonYear [

  self
    assert: ( duAlHijjah first , 1443 ) dayNumber equals: 1;
    assert: ( duAlHijjah second , 1443 ) dayNumber equals: 2;
    assert: ( duAlHijjah third , 1443 ) dayNumber equals: 3;
    assert: ( duAlHijjah fourth , 1443 ) dayNumber equals: 4;
    assert: ( duAlHijjah fifth , 1443 ) dayNumber equals: 5;
    assert: ( duAlHijjah sixth , 1443 ) dayNumber equals: 6;
    assert: ( duAlHijjah seventh , 1443 ) dayNumber equals: 7;
    assert: ( duAlHijjah eighth , 1443 ) dayNumber equals: 8;
    assert: ( duAlHijjah ninth , 1443 ) dayNumber equals: 9;
    assert: ( duAlHijjah tenth , 1443 ) dayNumber equals: 10;
    assert: ( duAlHijjah eleventh , 1443 ) dayNumber equals: 11;
    assert: ( duAlHijjah twelfth , 1443 ) dayNumber equals: 12;
    assert: ( duAlHijjah thirteenth , 1443 ) dayNumber equals: 13;
    assert: ( duAlHijjah fourteenth , 1443 ) dayNumber equals: 14;
    assert: ( duAlHijjah fifteenth , 1443 ) dayNumber equals: 15;
    assert: ( duAlHijjah sixteenth , 1443 ) dayNumber equals: 16;
    assert: ( duAlHijjah seventeenth , 1443 ) dayNumber equals: 17;
    assert: ( duAlHijjah eighteenth , 1443 ) dayNumber equals: 18;
    assert: ( duAlHijjah nineteenth , 1443 ) dayNumber equals: 19;
    assert: ( duAlHijjah twentieth , 1443 ) dayNumber equals: 20;
    assert: ( duAlHijjah twentyFirst , 1443 ) dayNumber equals: 21;
    assert: ( duAlHijjah twentySecond , 1443 ) dayNumber equals: 22;
    assert: ( duAlHijjah twentyThird , 1443 ) dayNumber equals: 23;
    assert: ( duAlHijjah twentyFourth , 1443 ) dayNumber equals: 24;
    assert: ( duAlHijjah twentyFifth , 1443 ) dayNumber equals: 25;
    assert: ( duAlHijjah twentySixth , 1443 ) dayNumber equals: 26;
    assert: ( duAlHijjah twentySeventh , 1443 ) dayNumber equals: 27;
    assert: ( duAlHijjah twentyEighth , 1443 ) dayNumber equals: 28;
    assert: ( duAlHijjah twentyNinth , 1443 ) dayNumber equals: 29.

  self should: [ ( duAlHijjah , 1443 ) thirtieth ] raise: MessageNotUnderstood
]

{ #category : 'tests' }
IslamicDateTest >> testInstanceCreationForDuAlhijjahOnLeapYear [

  self
    assert: ( duAlHijjah first , 1442 ) dayNumber equals: 1;
    assert: ( duAlHijjah second , 1442 ) dayNumber equals: 2;
    assert: ( duAlHijjah third , 1442 ) dayNumber equals: 3;
    assert: ( duAlHijjah fourth , 1442 ) dayNumber equals: 4;
    assert: ( duAlHijjah fifth , 1442 ) dayNumber equals: 5;
    assert: ( duAlHijjah sixth , 1442 ) dayNumber equals: 6;
    assert: ( duAlHijjah seventh , 1442 ) dayNumber equals: 7;
    assert: ( duAlHijjah eighth , 1442 ) dayNumber equals: 8;
    assert: ( duAlHijjah ninth , 1442 ) dayNumber equals: 9;
    assert: ( duAlHijjah tenth , 1442 ) dayNumber equals: 10;
    assert: ( duAlHijjah eleventh , 1442 ) dayNumber equals: 11;
    assert: ( duAlHijjah twelfth , 1442 ) dayNumber equals: 12;
    assert: ( duAlHijjah thirteenth , 1442 ) dayNumber equals: 13;
    assert: ( duAlHijjah fourteenth , 1442 ) dayNumber equals: 14;
    assert: ( duAlHijjah fifteenth , 1442 ) dayNumber equals: 15;
    assert: ( duAlHijjah sixteenth , 1442 ) dayNumber equals: 16;
    assert: ( duAlHijjah seventeenth , 1442 ) dayNumber equals: 17;
    assert: ( duAlHijjah eighteenth , 1442 ) dayNumber equals: 18;
    assert: ( duAlHijjah nineteenth , 1442 ) dayNumber equals: 19;
    assert: ( duAlHijjah twentieth , 1442 ) dayNumber equals: 20;
    assert: ( duAlHijjah twentyFirst , 1442 ) dayNumber equals: 21;
    assert: ( duAlHijjah twentySecond , 1442 ) dayNumber equals: 22;
    assert: ( duAlHijjah twentyThird , 1442 ) dayNumber equals: 23;
    assert: ( duAlHijjah twentyFourth , 1442 ) dayNumber equals: 24;
    assert: ( duAlHijjah twentyFifth , 1442 ) dayNumber equals: 25;
    assert: ( duAlHijjah twentySixth , 1442 ) dayNumber equals: 26;
    assert: ( duAlHijjah twentySeventh , 1442 ) dayNumber equals: 27;
    assert: ( duAlHijjah twentyEighth , 1442 ) dayNumber equals: 28;
    assert: ( duAlHijjah twentyNinth , 1442 ) dayNumber equals: 29;
    assert: ( duAlHijjah thirtieth , 1442 ) dayNumber equals: 30
]

{ #category : 'tests' }
IslamicDateTest >> testInterval [

  | interval |
  interval := muharram first , 2025 to: muharram thirtieth , 2025.
  self assert: interval size equals: 30.
  interval doWithIndex: [ :date :index |
      self
        assert: date dayNumber equals: index;
        assert: date monthOfYear equals: muharram , 2025
    ]
]

{ #category : 'tests' }
IslamicDateTest >> testIntervalWithStep [

  | interval |
  interval := muharram first , 1443 to: muharram thirtieth , 1443 by: 2 * day.
  self assert: interval size equals: 15.
  interval doWithIndex: [ :date :index |
      self
        assert: date dayNumber equals: index * 2 - 1;
        assert: date monthOfYear equals: muharram , 1443
    ]
]

{ #category : 'tests' }
IslamicDateTest >> testLessThan [

  self
    assert: muharram first , 2024 isLessThan: muharram first , 2025;
    assert: muharram first , 2024 isLessThanOrEqualTo: muharram first , 2025;
    assert: muharram first , 2025 isLessThanOrEqualTo: muharram first , 2025;
    assert: muharram first , 2025 isLessThan: safar first , 2025;
    assert: muharram first , 2025 isLessThanOrEqualTo: safar first , 2025;
    assert: duAlHijjah first , 2024 isLessThanOrEqualTo: muharram first , 2025;
    assert: safar first , 2025 isLessThan: safar second , 2025;
    assert: safar first , 2025 isLessThanOrEqualTo: safar second , 2025;
    deny: muharram first , 2025 isLessThan: muharram first , 1;
    deny: safar first , 2025 isLessThan: muharram first , 2025.

  self
    should: [ muharram first , 2025 < ( january first , 2025 ) ]
    raise: ArithmeticError
    withMessageText: 'Years in different time scales are incommensurable'
]

{ #category : 'tests' }
IslamicDateTest >> testNext [

  self
    assertNextOf: jumadaAlThani first , 2025 is: jumadaAlThani second , 2025;
    assertNextOf: jumadaAlThani twentyNinth , 2025 is: rajab first , 2025;
    assertNextOf: duAlHijjah twentyNinth , 2025 is: muharram first , 2026;
    assertNextOf: safar twentyEighth , 2020 is: safar twentyNinth , 2020;
    assertNextOf: duAlHijjah twentyNinth , 1442 is: duAlHijjah thirtieth , 1442.

  self
    assert: 10 daysAfter: muharram first , 1443 is: muharram eleventh , 1443;
    assert: 29 daysAfter: muharram first , 1443 is: muharram thirtieth , 1443;
    assert: 30 daysAfter: muharram first , 1443 is: safar first , 1443;
    assert: 354 daysAfter: muharram first , 1443 is: muharram first , 1444;
    assert: 355 daysAfter: muharram first , 1442 is: muharram first , 1443;
    assert: 0 daysAfter: muharram first , 1443 is: muharram first , 1443.

  self
    assert: 354 + 355 + 354 + 354 daysAfter: muharram first , 1441 is: muharram first , 1445;
    assert: 354 + 355 + 354 + 354 + 30 + 29
    daysAfter: muharram first , 1441
    is: rabiAlAwwal first , 1445
]

{ #category : 'tests' }
IslamicDateTest >> testPrevious [

  self
    assertPreviousOf: jumadaAlThani second , 2025 is: jumadaAlThani first , 2025;
    assertPreviousOf: jumadaAlThani first , 2025 is: jumadaAlAwwal thirtieth , 2025;
    assertPreviousOf: muharram first , 2025 is: duAlHijjah twentyNinth , 2024;
    assertPreviousOf: muharram first , 1443 is: duAlHijjah thirtieth , 1442;
    assertPreviousOf: duAlHijjah thirtieth , 1442 is: duAlHijjah twentyNinth , 1442.
  self
    assert: 10 daysBefore: duAlHijjah twentyNinth , 2008 is: duAlHijjah nineteenth , 2008;
    assert: 28 daysBefore: duAlHijjah twentyNinth , 2008 is: duAlHijjah first , 2008;
    assert: 29 daysBefore: duAlHijjah twentyNinth , 2008 is: duAlQiDah thirtieth , 2008;
    assert: 354 daysBefore: duAlHijjah thirtieth , 1442 is: muharram first , 1442;
    assert: 355 daysBefore: muharram first , 1443 is: muharram first , 1442;
    assert: 0 daysBefore: duAlHijjah twentyNinth , 2008 is: duAlHijjah twentyNinth , 2008.

  self
    assert: 354 + 355 + 354 + 354 daysBefore: muharram first , 1445 is: muharram first , 1441;
    assert: 354 + 355 + 354 + 354 + 30 + 29
    daysBefore: rabiAlAwwal first , 1445
    is: muharram first , 1441
]

{ #category : 'tests' }
IslamicDateTest >> testPrintString [

  self
    assert: ( rabiAlAwwal , 2025 ) first printString equals: 'Rabi'' al-Awwal 1, 2025 AH';
    assert: ( muharram , 2025 ) twelfth printString equals: 'Muharram 12, 2025 AH'
]

{ #category : 'tests' }
IslamicDateTest >> testSubtraction [

  self
    assert: muharram first , 2025 - ( muharram first , 2025 ) equals: 0 * day;
    assert: muharram second , 2025 - ( muharram first , 2025 ) equals: 1 * day;
    assert: muharram first , 2026 - ( muharram first , 2025 ) equals: 354 * day
]
