Class {
	#name : 'HebrewDateTest',
	#superclass : 'HebrewCalendarTest',
	#category : 'Chalten-Hebrew-Calendar-Tests',
	#package : 'Chalten-Hebrew-Calendar-Tests'
}

{ #category : 'private - asserting' }
HebrewDateTest >> assert: dayCount daysAfter: date is: anotherDate [

  self assert: ( date next: dayCount * day ) equals: anotherDate
]

{ #category : 'private - asserting' }
HebrewDateTest >> assert: dayCount daysBefore: date is: anotherDate [

  self assert: ( date previous: dayCount * day ) equals: anotherDate
]

{ #category : 'tests' }
HebrewDateTest >> testAccessing [

  | date |
  date := adarI first , 2025.
  self
    assert: date dayNumber equals: 1;
    assert: date year equals: 2025 asHebrewYear;
    assert: date yearNumber equals: 2025;
    assert: date monthOfYear equals: adarI , 2025;
    assert: date month equals: adarI;
    assert: date monthNumber equals: 6
]

{ #category : 'tests' }
HebrewDateTest >> testBetweenAnd [

  self
    assert: ( tishrei first , 5675 between: tishrei first , 5675 and: tishrei second , 5675 );
    assert: ( tishrei second , 5675 between: tishrei first , 5675 and: tishrei second , 5675 );
    assert: ( tishrei second , 5675 between: tishrei first , 5675 and: tishrei third , 5675 );
    assert: ( cheshvan first , 5675 between: tishrei first , 5675 and: cheshvan first , 5675 );
    assert: ( cheshvan first , 5675 between: tishrei first , 5675 and: cheshvan third , 5675 );
    assert: ( cheshvan first , 5675 between: tishrei first , 5675 and: adar fifth , 5675 );
    deny: ( tishrei eleventh , 5675 between: tishrei twelfth , 5675 and: tishrei thirtieth , 5675 );
    deny: ( tishrei twentieth , 5675 between: tishrei first , 5675 and: tishrei eleventh , 5675 )
]

{ #category : 'tests' }
HebrewDateTest >> testCannotComputeDateDistanceWhenTheSecondIsGreater [

  self
    should: [ tishrei second , 2025 - ( tishrei third , 2025 ) ]
    raise: ArithmeticError
    withMessageText: 'Cannot subtract two dates when the second one is greater than the first one.'
]

{ #category : 'tests' }
HebrewDateTest >> testComparing [

  self
    assert: tishrei first , 5786 equals: tishrei first , 5786;
    deny: tishrei first , 5786 equals: tishrei second , 5786;
    deny: tishrei first , 5786 equals: cheshvan first , 5786;
    deny: tishrei first , 5786 equals: tishrei first , 2024;
    deny: tishrei first , 5786 equals: january first , 5786
]

{ #category : 'tests' }
HebrewDateTest >> testDayOfWeek [

  self
    assert: ( tevet seventeenth , 5786 ) dayOfWeek equals: HebrewDayOfWeek yomShlishi;
    assert: ( tevet eighteenth , 5786 ) dayOfWeek equals: HebrewDayOfWeek yomRevii;
    assert: ( tevet nineteenth , 5786 ) dayOfWeek equals: HebrewDayOfWeek yomHamishi;
    assert: ( tevet twentieth , 5786 ) dayOfWeek equals: HebrewDayOfWeek yomShishi;
    assert: ( tevet twentyFirst , 5786 ) dayOfWeek equals: HebrewDayOfWeek yomShabbat;
    assert: ( tevet twentySecond , 5786 ) dayOfWeek equals: HebrewDayOfWeek yomRishon;
    assert: ( tevet twentyThird , 5786 ) dayOfWeek equals: HebrewDayOfWeek yomSheni;
    assert: ( tevet twentyFourth , 5786 ) dayOfWeek equals: HebrewDayOfWeek yomShlishi
]

{ #category : 'tests' }
HebrewDateTest >> testDaysBetweenTwoDates [

  self
    assert: ( tishrei first , 2025 - ( tishrei first , 2025 ) ) isZero;
    assert: tishrei second , 2025 - ( tishrei first , 2025 ) equals: 1 * day;
    assert: cheshvan first , 2025 - ( tishrei first , 2025 ) equals: 30 * day;
    assert: kislev first , 2025 - ( tishrei first , 2025 ) equals: 30 + 29 * day;
    assert: tishrei first , 2026 - ( tishrei first , 2025 ) equals: 383 * day;
    assert: elul twentyNinth , 5675 - ( tishrei first , 5675 ) equals: 352 * day;
    assert: tishrei first , 5676 - ( tishrei first , 5675 ) equals: 353 * day
]

{ #category : 'tests' }
HebrewDateTest >> testGreaterThan [

  self
    assert: tishrei first , 2025 isGreaterThan: tishrei first , 2024;
    assert: tishrei first , 2025 isGreaterThanOrEqualTo: tishrei first , 2024;
    assert: tishrei first , 2025 isGreaterThanOrEqualTo: tishrei first , 2025;
    assert: cheshvan first , 2025 isGreaterThan: tishrei first , 2025;
    assert: cheshvan first , 2025 isGreaterThanOrEqualTo: tishrei first , 2025;
    assert: tishrei first , 2025 isGreaterThanOrEqualTo: elul first , 2024;
    assert: cheshvan second , 2025 isGreaterThan: cheshvan first , 2025;
    assert: cheshvan second , 2025 isGreaterThanOrEqualTo: cheshvan first , 2025;
    deny: tishrei first , 1 isGreaterThan: tishrei first , 2025;
    deny: tishrei first , 2025 isGreaterThan: cheshvan first , 2025
]

{ #category : 'tests' }
HebrewDateTest >> testInstanceCreationFor29DaysMonth [

  self
    assert: ( tevet first , 2025 ) dayNumber equals: 1;
    assert: ( tevet second , 2025 ) dayNumber equals: 2;
    assert: ( tevet third , 2025 ) dayNumber equals: 3;
    assert: ( tevet fourth , 2025 ) dayNumber equals: 4;
    assert: ( tevet fifth , 2025 ) dayNumber equals: 5;
    assert: ( tevet sixth , 2025 ) dayNumber equals: 6;
    assert: ( tevet seventh , 2025 ) dayNumber equals: 7;
    assert: ( tevet eighth , 2025 ) dayNumber equals: 8;
    assert: ( tevet ninth , 2025 ) dayNumber equals: 9;
    assert: ( tevet tenth , 2025 ) dayNumber equals: 10;
    assert: ( tevet eleventh , 2025 ) dayNumber equals: 11;
    assert: ( tevet twelfth , 2025 ) dayNumber equals: 12;
    assert: ( tevet thirteenth , 2025 ) dayNumber equals: 13;
    assert: ( tevet fourteenth , 2025 ) dayNumber equals: 14;
    assert: ( tevet fifteenth , 2025 ) dayNumber equals: 15;
    assert: ( tevet sixteenth , 2025 ) dayNumber equals: 16;
    assert: ( tevet seventeenth , 2025 ) dayNumber equals: 17;
    assert: ( tevet eighteenth , 2025 ) dayNumber equals: 18;
    assert: ( tevet nineteenth , 2025 ) dayNumber equals: 19;
    assert: ( tevet twentieth , 2025 ) dayNumber equals: 20;
    assert: ( tevet twentyFirst , 2025 ) dayNumber equals: 21;
    assert: ( tevet twentySecond , 2025 ) dayNumber equals: 22;
    assert: ( tevet twentyThird , 2025 ) dayNumber equals: 23;
    assert: ( tevet twentyFourth , 2025 ) dayNumber equals: 24;
    assert: ( tevet twentyFifth , 2025 ) dayNumber equals: 25;
    assert: ( tevet twentySixth , 2025 ) dayNumber equals: 26;
    assert: ( tevet twentySeventh , 2025 ) dayNumber equals: 27;
    assert: ( tevet twentyEighth , 2025 ) dayNumber equals: 28;
    assert: ( tevet twentyNinth , 2025 ) dayNumber equals: 29.
  self should: [ tevet thirtieth , 2025 ] raise: MessageNotUnderstood
]

{ #category : 'tests' }
HebrewDateTest >> testInstanceCreationFor30DaysMonth [

  self
    assert: ( nisan first , 2025 ) dayNumber equals: 1;
    assert: ( nisan second , 2025 ) dayNumber equals: 2;
    assert: ( nisan third , 2025 ) dayNumber equals: 3;
    assert: ( nisan fourth , 2025 ) dayNumber equals: 4;
    assert: ( nisan fifth , 2025 ) dayNumber equals: 5;
    assert: ( nisan sixth , 2025 ) dayNumber equals: 6;
    assert: ( nisan seventh , 2025 ) dayNumber equals: 7;
    assert: ( nisan eighth , 2025 ) dayNumber equals: 8;
    assert: ( nisan ninth , 2025 ) dayNumber equals: 9;
    assert: ( nisan tenth , 2025 ) dayNumber equals: 10;
    assert: ( nisan eleventh , 2025 ) dayNumber equals: 11;
    assert: ( nisan twelfth , 2025 ) dayNumber equals: 12;
    assert: ( nisan thirteenth , 2025 ) dayNumber equals: 13;
    assert: ( nisan fourteenth , 2025 ) dayNumber equals: 14;
    assert: ( nisan fifteenth , 2025 ) dayNumber equals: 15;
    assert: ( nisan sixteenth , 2025 ) dayNumber equals: 16;
    assert: ( nisan seventeenth , 2025 ) dayNumber equals: 17;
    assert: ( nisan eighteenth , 2025 ) dayNumber equals: 18;
    assert: ( nisan nineteenth , 2025 ) dayNumber equals: 19;
    assert: ( nisan twentieth , 2025 ) dayNumber equals: 20;
    assert: ( nisan twentyFirst , 2025 ) dayNumber equals: 21;
    assert: ( nisan twentySecond , 2025 ) dayNumber equals: 22;
    assert: ( nisan twentyThird , 2025 ) dayNumber equals: 23;
    assert: ( nisan twentyFourth , 2025 ) dayNumber equals: 24;
    assert: ( nisan twentyFifth , 2025 ) dayNumber equals: 25;
    assert: ( nisan twentySixth , 2025 ) dayNumber equals: 26;
    assert: ( nisan twentySeventh , 2025 ) dayNumber equals: 27;
    assert: ( nisan twentyEighth , 2025 ) dayNumber equals: 28;
    assert: ( nisan twentyNinth , 2025 ) dayNumber equals: 29;
    assert: ( nisan thirtieth , 2025 ) dayNumber equals: 30
]

{ #category : 'tests' }
HebrewDateTest >> testInstanceCreationForCheshvanOnCompleteYear [

  self assert: 5678 asHebrewYear isCompleteYear.

  self
    assert: ( cheshvan first , 5678 ) dayNumber equals: 1;
    assert: ( cheshvan second , 5678 ) dayNumber equals: 2;
    assert: ( cheshvan third , 5678 ) dayNumber equals: 3;
    assert: ( cheshvan fourth , 5678 ) dayNumber equals: 4;
    assert: ( cheshvan fifth , 5678 ) dayNumber equals: 5;
    assert: ( cheshvan sixth , 5678 ) dayNumber equals: 6;
    assert: ( cheshvan seventh , 5678 ) dayNumber equals: 7;
    assert: ( cheshvan eighth , 5678 ) dayNumber equals: 8;
    assert: ( cheshvan ninth , 5678 ) dayNumber equals: 9;
    assert: ( cheshvan tenth , 5678 ) dayNumber equals: 10;
    assert: ( cheshvan eleventh , 5678 ) dayNumber equals: 11;
    assert: ( cheshvan twelfth , 5678 ) dayNumber equals: 12;
    assert: ( cheshvan thirteenth , 5678 ) dayNumber equals: 13;
    assert: ( cheshvan fourteenth , 5678 ) dayNumber equals: 14;
    assert: ( cheshvan fifteenth , 5678 ) dayNumber equals: 15;
    assert: ( cheshvan sixteenth , 5678 ) dayNumber equals: 16;
    assert: ( cheshvan seventeenth , 5678 ) dayNumber equals: 17;
    assert: ( cheshvan eighteenth , 5678 ) dayNumber equals: 18;
    assert: ( cheshvan nineteenth , 5678 ) dayNumber equals: 19;
    assert: ( cheshvan twentieth , 5678 ) dayNumber equals: 20;
    assert: ( cheshvan twentyFirst , 5678 ) dayNumber equals: 21;
    assert: ( cheshvan twentySecond , 5678 ) dayNumber equals: 22;
    assert: ( cheshvan twentyThird , 5678 ) dayNumber equals: 23;
    assert: ( cheshvan twentyFourth , 5678 ) dayNumber equals: 24;
    assert: ( cheshvan twentyFifth , 5678 ) dayNumber equals: 25;
    assert: ( cheshvan twentySixth , 5678 ) dayNumber equals: 26;
    assert: ( cheshvan twentySeventh , 5678 ) dayNumber equals: 27;
    assert: ( cheshvan twentyEighth , 5678 ) dayNumber equals: 28;
    assert: ( cheshvan twentyNinth , 5678 ) dayNumber equals: 29;
    assert: ( cheshvan thirtieth , 5678 ) dayNumber equals: 30
]

{ #category : 'tests' }
HebrewDateTest >> testInstanceCreationForCheshvanOnDeficientYear [

  self assert: 5675 asHebrewYear isDeficientYear.

  self
    assert: ( cheshvan first , 5675 ) dayNumber equals: 1;
    assert: ( cheshvan second , 5675 ) dayNumber equals: 2;
    assert: ( cheshvan third , 5675 ) dayNumber equals: 3;
    assert: ( cheshvan fourth , 5675 ) dayNumber equals: 4;
    assert: ( cheshvan fifth , 5675 ) dayNumber equals: 5;
    assert: ( cheshvan sixth , 5675 ) dayNumber equals: 6;
    assert: ( cheshvan seventh , 5675 ) dayNumber equals: 7;
    assert: ( cheshvan eighth , 5675 ) dayNumber equals: 8;
    assert: ( cheshvan ninth , 5675 ) dayNumber equals: 9;
    assert: ( cheshvan tenth , 5675 ) dayNumber equals: 10;
    assert: ( cheshvan eleventh , 5675 ) dayNumber equals: 11;
    assert: ( cheshvan twelfth , 5675 ) dayNumber equals: 12;
    assert: ( cheshvan thirteenth , 5675 ) dayNumber equals: 13;
    assert: ( cheshvan fourteenth , 5675 ) dayNumber equals: 14;
    assert: ( cheshvan fifteenth , 5675 ) dayNumber equals: 15;
    assert: ( cheshvan sixteenth , 5675 ) dayNumber equals: 16;
    assert: ( cheshvan seventeenth , 5675 ) dayNumber equals: 17;
    assert: ( cheshvan eighteenth , 5675 ) dayNumber equals: 18;
    assert: ( cheshvan nineteenth , 5675 ) dayNumber equals: 19;
    assert: ( cheshvan twentieth , 5675 ) dayNumber equals: 20;
    assert: ( cheshvan twentyFirst , 5675 ) dayNumber equals: 21;
    assert: ( cheshvan twentySecond , 5675 ) dayNumber equals: 22;
    assert: ( cheshvan twentyThird , 5675 ) dayNumber equals: 23;
    assert: ( cheshvan twentyFourth , 5675 ) dayNumber equals: 24;
    assert: ( cheshvan twentyFifth , 5675 ) dayNumber equals: 25;
    assert: ( cheshvan twentySixth , 5675 ) dayNumber equals: 26;
    assert: ( cheshvan twentySeventh , 5675 ) dayNumber equals: 27;
    assert: ( cheshvan twentyEighth , 5675 ) dayNumber equals: 28;
    assert: ( cheshvan twentyNinth , 5675 ) dayNumber equals: 29.

  self should: [ ( cheshvan , 5675 ) thirtieth ] raise: MessageNotUnderstood
]

{ #category : 'tests' }
HebrewDateTest >> testInstanceCreationForCheshvanOnRegularYear [

  self assert: 5674 asHebrewYear isRegularYear.

  self
    assert: ( cheshvan first , 5674 ) dayNumber equals: 1;
    assert: ( cheshvan second , 5674 ) dayNumber equals: 2;
    assert: ( cheshvan third , 5674 ) dayNumber equals: 3;
    assert: ( cheshvan fourth , 5674 ) dayNumber equals: 4;
    assert: ( cheshvan fifth , 5674 ) dayNumber equals: 5;
    assert: ( cheshvan sixth , 5674 ) dayNumber equals: 6;
    assert: ( cheshvan seventh , 5674 ) dayNumber equals: 7;
    assert: ( cheshvan eighth , 5674 ) dayNumber equals: 8;
    assert: ( cheshvan ninth , 5674 ) dayNumber equals: 9;
    assert: ( cheshvan tenth , 5674 ) dayNumber equals: 10;
    assert: ( cheshvan eleventh , 5674 ) dayNumber equals: 11;
    assert: ( cheshvan twelfth , 5674 ) dayNumber equals: 12;
    assert: ( cheshvan thirteenth , 5674 ) dayNumber equals: 13;
    assert: ( cheshvan fourteenth , 5674 ) dayNumber equals: 14;
    assert: ( cheshvan fifteenth , 5674 ) dayNumber equals: 15;
    assert: ( cheshvan sixteenth , 5674 ) dayNumber equals: 16;
    assert: ( cheshvan seventeenth , 5674 ) dayNumber equals: 17;
    assert: ( cheshvan eighteenth , 5674 ) dayNumber equals: 18;
    assert: ( cheshvan nineteenth , 5674 ) dayNumber equals: 19;
    assert: ( cheshvan twentieth , 5674 ) dayNumber equals: 20;
    assert: ( cheshvan twentyFirst , 5674 ) dayNumber equals: 21;
    assert: ( cheshvan twentySecond , 5674 ) dayNumber equals: 22;
    assert: ( cheshvan twentyThird , 5674 ) dayNumber equals: 23;
    assert: ( cheshvan twentyFourth , 5674 ) dayNumber equals: 24;
    assert: ( cheshvan twentyFifth , 5674 ) dayNumber equals: 25;
    assert: ( cheshvan twentySixth , 5674 ) dayNumber equals: 26;
    assert: ( cheshvan twentySeventh , 5674 ) dayNumber equals: 27;
    assert: ( cheshvan twentyEighth , 5674 ) dayNumber equals: 28;
    assert: ( cheshvan twentyNinth , 5674 ) dayNumber equals: 29.

  self should: [ ( cheshvan , 5674 ) thirtieth ] raise: MessageNotUnderstood
]

{ #category : 'tests' }
HebrewDateTest >> testInstanceCreationForKislevOnCompleteYear [

  self assert: 5678 asHebrewYear isCompleteYear.

  self
    assert: ( kislev first , 5678 ) dayNumber equals: 1;
    assert: ( kislev second , 5678 ) dayNumber equals: 2;
    assert: ( kislev third , 5678 ) dayNumber equals: 3;
    assert: ( kislev fourth , 5678 ) dayNumber equals: 4;
    assert: ( kislev fifth , 5678 ) dayNumber equals: 5;
    assert: ( kislev sixth , 5678 ) dayNumber equals: 6;
    assert: ( kislev seventh , 5678 ) dayNumber equals: 7;
    assert: ( kislev eighth , 5678 ) dayNumber equals: 8;
    assert: ( kislev ninth , 5678 ) dayNumber equals: 9;
    assert: ( kislev tenth , 5678 ) dayNumber equals: 10;
    assert: ( kislev eleventh , 5678 ) dayNumber equals: 11;
    assert: ( kislev twelfth , 5678 ) dayNumber equals: 12;
    assert: ( kislev thirteenth , 5678 ) dayNumber equals: 13;
    assert: ( kislev fourteenth , 5678 ) dayNumber equals: 14;
    assert: ( kislev fifteenth , 5678 ) dayNumber equals: 15;
    assert: ( kislev sixteenth , 5678 ) dayNumber equals: 16;
    assert: ( kislev seventeenth , 5678 ) dayNumber equals: 17;
    assert: ( kislev eighteenth , 5678 ) dayNumber equals: 18;
    assert: ( kislev nineteenth , 5678 ) dayNumber equals: 19;
    assert: ( kislev twentieth , 5678 ) dayNumber equals: 20;
    assert: ( kislev twentyFirst , 5678 ) dayNumber equals: 21;
    assert: ( kislev twentySecond , 5678 ) dayNumber equals: 22;
    assert: ( kislev twentyThird , 5678 ) dayNumber equals: 23;
    assert: ( kislev twentyFourth , 5678 ) dayNumber equals: 24;
    assert: ( kislev twentyFifth , 5678 ) dayNumber equals: 25;
    assert: ( kislev twentySixth , 5678 ) dayNumber equals: 26;
    assert: ( kislev twentySeventh , 5678 ) dayNumber equals: 27;
    assert: ( kislev twentyEighth , 5678 ) dayNumber equals: 28;
    assert: ( kislev twentyNinth , 5678 ) dayNumber equals: 29;
    assert: ( kislev thirtieth , 5678 ) dayNumber equals: 30
]

{ #category : 'tests' }
HebrewDateTest >> testInstanceCreationForKislevOnDeficientYear [

  self assert: 5675 asHebrewYear isDeficientYear.

  self
    assert: ( kislev first , 5675 ) dayNumber equals: 1;
    assert: ( kislev second , 5675 ) dayNumber equals: 2;
    assert: ( kislev third , 5675 ) dayNumber equals: 3;
    assert: ( kislev fourth , 5675 ) dayNumber equals: 4;
    assert: ( kislev fifth , 5675 ) dayNumber equals: 5;
    assert: ( kislev sixth , 5675 ) dayNumber equals: 6;
    assert: ( kislev seventh , 5675 ) dayNumber equals: 7;
    assert: ( kislev eighth , 5675 ) dayNumber equals: 8;
    assert: ( kislev ninth , 5675 ) dayNumber equals: 9;
    assert: ( kislev tenth , 5675 ) dayNumber equals: 10;
    assert: ( kislev eleventh , 5675 ) dayNumber equals: 11;
    assert: ( kislev twelfth , 5675 ) dayNumber equals: 12;
    assert: ( kislev thirteenth , 5675 ) dayNumber equals: 13;
    assert: ( kislev fourteenth , 5675 ) dayNumber equals: 14;
    assert: ( kislev fifteenth , 5675 ) dayNumber equals: 15;
    assert: ( kislev sixteenth , 5675 ) dayNumber equals: 16;
    assert: ( kislev seventeenth , 5675 ) dayNumber equals: 17;
    assert: ( kislev eighteenth , 5675 ) dayNumber equals: 18;
    assert: ( kislev nineteenth , 5675 ) dayNumber equals: 19;
    assert: ( kislev twentieth , 5675 ) dayNumber equals: 20;
    assert: ( kislev twentyFirst , 5675 ) dayNumber equals: 21;
    assert: ( kislev twentySecond , 5675 ) dayNumber equals: 22;
    assert: ( kislev twentyThird , 5675 ) dayNumber equals: 23;
    assert: ( kislev twentyFourth , 5675 ) dayNumber equals: 24;
    assert: ( kislev twentyFifth , 5675 ) dayNumber equals: 25;
    assert: ( kislev twentySixth , 5675 ) dayNumber equals: 26;
    assert: ( kislev twentySeventh , 5675 ) dayNumber equals: 27;
    assert: ( kislev twentyEighth , 5675 ) dayNumber equals: 28;
    assert: ( kislev twentyNinth , 5675 ) dayNumber equals: 29.

  self should: [ ( kislev , 5675 ) thirtieth ] raise: MessageNotUnderstood
]

{ #category : 'tests' }
HebrewDateTest >> testInstanceCreationForKislevOnRegularYear [

  self assert: 5674 asHebrewYear isRegularYear.

  self
    assert: ( kislev first , 5674 ) dayNumber equals: 1;
    assert: ( kislev second , 5674 ) dayNumber equals: 2;
    assert: ( kislev third , 5674 ) dayNumber equals: 3;
    assert: ( kislev fourth , 5674 ) dayNumber equals: 4;
    assert: ( kislev fifth , 5674 ) dayNumber equals: 5;
    assert: ( kislev sixth , 5674 ) dayNumber equals: 6;
    assert: ( kislev seventh , 5674 ) dayNumber equals: 7;
    assert: ( kislev eighth , 5674 ) dayNumber equals: 8;
    assert: ( kislev ninth , 5674 ) dayNumber equals: 9;
    assert: ( kislev tenth , 5674 ) dayNumber equals: 10;
    assert: ( kislev eleventh , 5674 ) dayNumber equals: 11;
    assert: ( kislev twelfth , 5674 ) dayNumber equals: 12;
    assert: ( kislev thirteenth , 5674 ) dayNumber equals: 13;
    assert: ( kislev fourteenth , 5674 ) dayNumber equals: 14;
    assert: ( kislev fifteenth , 5674 ) dayNumber equals: 15;
    assert: ( kislev sixteenth , 5674 ) dayNumber equals: 16;
    assert: ( kislev seventeenth , 5674 ) dayNumber equals: 17;
    assert: ( kislev eighteenth , 5674 ) dayNumber equals: 18;
    assert: ( kislev nineteenth , 5674 ) dayNumber equals: 19;
    assert: ( kislev twentieth , 5674 ) dayNumber equals: 20;
    assert: ( kislev twentyFirst , 5674 ) dayNumber equals: 21;
    assert: ( kislev twentySecond , 5674 ) dayNumber equals: 22;
    assert: ( kislev twentyThird , 5674 ) dayNumber equals: 23;
    assert: ( kislev twentyFourth , 5674 ) dayNumber equals: 24;
    assert: ( kislev twentyFifth , 5674 ) dayNumber equals: 25;
    assert: ( kislev twentySixth , 5674 ) dayNumber equals: 26;
    assert: ( kislev twentySeventh , 5674 ) dayNumber equals: 27;
    assert: ( kislev twentyEighth , 5674 ) dayNumber equals: 28;
    assert: ( kislev twentyNinth , 5674 ) dayNumber equals: 29;
    assert: ( kislev thirtieth , 5674 ) dayNumber equals: 30
]

{ #category : 'tests' }
HebrewDateTest >> testInterval [

  | interval |
  interval := tishrei first , 5786 to: tishrei thirtieth , 5786.
  self assert: interval size equals: 30.
  interval doWithIndex: [ :date :index |
      self
        assert: date dayNumber equals: index;
        assert: date monthOfYear equals: tishrei , 5786
    ]
]

{ #category : 'tests' }
HebrewDateTest >> testIntervalWithStep [

  | interval |
  interval := tishrei first , 5786 to: tishrei thirtieth , 5786 by: 2 * day.
  self assert: interval size equals: 15.
  interval doWithIndex: [ :date :index |
      self
        assert: date dayNumber equals: index * 2 - 1;
        assert: date monthOfYear equals: tishrei , 5786
    ]
]

{ #category : 'tests' }
HebrewDateTest >> testIsLastDayOfMonth [

  self
    assert: ( tevet twentyNinth , 2025 ) isLastDayOfMonth;
    assert: ( nisan thirtieth , 2025 ) isLastDayOfMonth;
    assert: ( cheshvan thirtieth , 5678 ) isLastDayOfMonth;
    deny: ( cheshvan twentyNinth , 5678 ) isLastDayOfMonth;
    assert: ( cheshvan twentyNinth , 5675 ) isLastDayOfMonth;
    assert: ( cheshvan twentyNinth , 5674 ) isLastDayOfMonth;
    assert: ( kislev thirtieth , 5678 ) isLastDayOfMonth;
    deny: ( kislev twentyNinth , 5678 ) isLastDayOfMonth;
    assert: ( kislev twentyNinth , 5675 ) isLastDayOfMonth;
    assert: ( kislev thirtieth , 5674 ) isLastDayOfMonth;
    deny: ( kislev twentyNinth , 5674 ) isLastDayOfMonth
]

{ #category : 'tests' }
HebrewDateTest >> testLessThan [

  self
    assert: tishrei first , 2024 isLessThan: tishrei first , 2025;
    assert: tishrei first , 2024 isLessThanOrEqualTo: tishrei first , 2025;
    assert: tishrei first , 2025 isLessThanOrEqualTo: tishrei first , 2025;
    assert: tishrei first , 2025 isLessThan: cheshvan first , 2025;
    assert: tishrei first , 2025 isLessThanOrEqualTo: cheshvan first , 2025;
    assert: elul first , 2024 isLessThanOrEqualTo: tishrei first , 2025;
    assert: cheshvan first , 2025 isLessThan: cheshvan second , 2025;
    assert: cheshvan first , 2025 isLessThanOrEqualTo: cheshvan second , 2025;
    deny: tishrei first , 2025 isLessThan: tishrei first , 1;
    deny: cheshvan first , 2025 isLessThan: tishrei first , 2025.

  self
    should: [ tishrei first , 2025 < ( january first , 2025 ) ]
    raise: ArithmeticError
    withMessageText: 'Years in different time scales are incommensurable'
]

{ #category : 'tests' }
HebrewDateTest >> testNext [

  self
    assertNextOf: adarI first , 2025 is: adarI second , 2025;
    assertNextOf: adarI thirtieth , 2025 is: adarII first , 2025;
    assertNextOf: elul twentyNinth , 2025 is: tishrei first , 2026;
    assertNextOf: cheshvan twentyEighth , 2020 is: cheshvan twentyNinth , 2020;
    assertNextOf: elul twentyNinth , 1442 is: tishrei first , 1443.

  self
    assert: 10 daysAfter: tishrei first , 1443 is: tishrei eleventh , 1443;
    assert: 29 daysAfter: tishrei first , 1443 is: tishrei thirtieth , 1443;
    assert: 30 daysAfter: tishrei first , 1443 is: cheshvan first , 1443;
    assert: 355 daysAfter: tishrei first , 1443 is: tishrei first , 1444;
    assert: 383 daysAfter: tishrei first , 1442 is: tishrei first , 1443;
    assert: 0 daysAfter: tishrei first , 1443 is: tishrei first , 1443.

  self
    assert: 354 + 383 + 355 + 385 daysAfter: tishrei first , 1441 is: tishrei first , 1445;
    assert: 354 + 383 + 355 + 385 + 30 + 29 daysAfter: tishrei first , 1441 is: kislev first , 1445
]

{ #category : 'tests' }
HebrewDateTest >> testPrevious [

  self
    assertPreviousOf: adarI second , 2025 is: adarI first , 2025;
    assertPreviousOf: adarI first , 2025 is: shevat thirtieth , 2025;
    assertPreviousOf: tishrei first , 2025 is: elul twentyNinth , 2024;
    assertPreviousOf: tishrei first , 1443 is: elul twentyNinth , 1442;
    assertPreviousOf: elul twentyNinth , 1442 is: elul twentyEighth , 1442.
  self
    assert: 10 daysBefore: elul twentyNinth , 2008 is: elul nineteenth , 2008;
    assert: 28 daysBefore: elul twentyNinth , 2008 is: elul first , 2008;
    assert: 29 daysBefore: elul twentyNinth , 2008 is: av thirtieth , 2008;
    assert: 382 daysBefore: elul twentyNinth , 1442 is: tishrei first , 1442;
    assert: 383 daysBefore: tishrei first , 1443 is: tishrei first , 1442;
    assert: 0 daysBefore: elul twentyNinth , 2008 is: elul twentyNinth , 2008.

  self
    assert: 354 + 383 + 355 + 385 daysBefore: tishrei first , 1445 is: tishrei first , 1441;
    assert: 354 + 383 + 355 + 385 + 30 + 29
    daysBefore: kislev first , 1445
    is: tishrei first , 1441
]

{ #category : 'tests' }
HebrewDateTest >> testPrintString [

  self
    assert: ( adarII , 2025 ) first printString equals: 'Adar II 1, 2025 AM';
    assert: ( tishrei , 2025 ) twelfth printString equals: 'Tishrei 12, 2025 AM'
]

{ #category : 'tests' }
HebrewDateTest >> testSubtraction [

  self
    assert: tishrei first , 5786 - ( tishrei first , 5786 ) equals: 0 * day;
    assert: tishrei second , 5786 - ( tishrei first , 5786 ) equals: 1 * day;
    assert: tishrei first , 5787 - ( tishrei first , 5786 ) equals: 354 * day
]
