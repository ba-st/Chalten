Class {
	#name : 'HebrewMonthOfYearTest',
	#superclass : 'HebrewCalendarTest',
	#category : 'Chalten-Hebrew-Calendar-Tests',
	#package : 'Chalten-Hebrew-Calendar-Tests'
}

{ #category : 'tests' }
HebrewMonthOfYearTest >> testBetweenAnd [

  | year2 year3 |
  year2 := 2 asHebrewYear.
  year3 := 3 asHebrewYear.

  self
    assert: ( year2 tishrei between: year2 tishrei and: year3 tishrei );
    assert: ( year3 tishrei between: year2 tishrei and: year3 tishrei );
    assert: ( year3 tishrei between: year2 tishrei and: 4 asHebrewYear tishrei );
    assert: ( year2 cheshvan between: year2 tishrei and: year2 cheshvan );
    assert: ( year2 cheshvan between: year2 tishrei and: year2 cheshvan );
    assert: ( year2 cheshvan between: year2 tishrei and: year2 tevet );
    deny: ( 4 asHebrewYear tishrei between: year2 tishrei and: year3 tishrei );
    deny: ( 1 asHebrewYear tishrei between: year2 tishrei and: year3 tishrei )
]

{ #category : 'tests' }
HebrewMonthOfYearTest >> testComparing [

  self
    assert: 5786 asHebrewYear tishrei equals: 5786 asHebrewYear tishrei;
    deny: 5788 asHebrewYear tishrei equals: 5786 asHebrewYear tishrei;
    deny: 5788 asHebrewYear tishrei equals: 5788 asHebrewYear kislev
]

{ #category : 'tests' }
HebrewMonthOfYearTest >> testCreation [

  | monthOfYear |
  monthOfYear := 5786 asHebrewYear tevet.

  self
    assert: monthOfYear year equals: 5786 asHebrewYear;
    assert: monthOfYear month equals: tevet
]

{ #category : 'tests' }
HebrewMonthOfYearTest >> testCreationShortcut [

  | monthOfYear |
  monthOfYear := tevet , 5786.

  self
    assert: monthOfYear year equals: 5786 asHebrewYear;
    assert: monthOfYear month equals: tevet.

  self
    should: [ adar , 5787 ]
    raise: InstanceCreationFailed
    withMessageText: 'Adar only exists on common years'
]

{ #category : 'tests' }
HebrewMonthOfYearTest >> testCreationShortcutOnLeapYear [
  "Some months like Adar II only exists on leap years"

  | monthOfYear |
  self
    should: [ adarII , 5786 ]
    raise: InstanceCreationFailed
    withMessageText: 'Adar II only exists on leap years'.

  monthOfYear := adarII , 5787.

  self
    assert: monthOfYear year equals: 5787 asHebrewYear;
    assert: monthOfYear month equals: adarII
]

{ #category : 'tests' }
HebrewMonthOfYearTest >> testGreaterThan [

  self
    assert: tishrei , 2 isGreaterThan: tishrei , 1;
    assert: tishrei , 2 isGreaterThanOrEquals: tishrei , 1;
    assert: tishrei , 1 isGreaterThanOrEquals: tishrei , 1;
    assert: cheshvan , 1 isGreaterThan: tishrei , 1;
    assert: cheshvan , 1 isGreaterThanOrEquals: tishrei , 1;
    assert: cheshvan , 2 isGreaterThan: tishrei , 1;
    deny: tishrei , 1 isGreaterThan: tishrei , 2025;
    deny: tishrei , 1 isGreaterThan: cheshvan , 1
]

{ #category : 'tests' }
HebrewMonthOfYearTest >> testLessThan [

  self
    assert: tishrei , 1 isLessThan: tishrei , 2;
    assert: tishrei , 1 isLessThanOrEquals: tishrei , 2;
    assert: tishrei , 1 isLessThanOrEquals: tishrei , 1;
    assert: tishrei , 1 isLessThanOrEquals: cheshvan , 1;
    assert: cheshvan , 1 isLessThanOrEquals: tishrei , 2;
    deny: tishrei , 2025 isLessThan: tishrei , 1;
    deny: cheshvan , 1 isLessThan: tishrei , 1
]

{ #category : 'tests' }
HebrewMonthOfYearTest >> testNext [

  | baseYear nextToBaseYear |
  baseYear := 5678 asHebrewYear.
  nextToBaseYear := baseYear next.
  self
    deny: baseYear isLeapYear;
    assert: baseYear isCompleteYear;
    assert: nextToBaseYear isLeapYear;
    assert: nextToBaseYear isDeficientYear.

  self
    assertNextOf: baseYear tishrei is: baseYear cheshvan;
    assertNextOf: baseYear cheshvan is: baseYear kislev;
    assertNextOf: baseYear kislev is: baseYear tevet;
    assertNextOf: baseYear tevet is: baseYear shevat;
    assertNextOf: baseYear shevat is: baseYear adar;
    assertNextOf: baseYear adar is: baseYear nisan;
    assertNextOf: baseYear nisan is: baseYear iyar;
    assertNextOf: baseYear iyar is: baseYear sivan;
    assertNextOf: baseYear sivan is: baseYear tammuz;
    assertNextOf: baseYear tammuz is: baseYear av;
    assertNextOf: baseYear av is: baseYear elul;
    assertNextOf: baseYear elul is: nextToBaseYear tishrei;
    assertNextOf: nextToBaseYear tishrei is: nextToBaseYear cheshvan;
    assertNextOf: nextToBaseYear cheshvan is: nextToBaseYear kislev;
    assertNextOf: nextToBaseYear kislev is: nextToBaseYear tevet;
    assertNextOf: nextToBaseYear tevet is: nextToBaseYear shevat;
    assertNextOf: nextToBaseYear shevat is: nextToBaseYear adarI;
    assertNextOf: nextToBaseYear adarI is: nextToBaseYear adarII;
    assertNextOf: nextToBaseYear adarII is: nextToBaseYear nisan;
    assertNextOf: nextToBaseYear nisan is: nextToBaseYear iyar;
    assertNextOf: nextToBaseYear iyar is: nextToBaseYear sivan;
    assertNextOf: nextToBaseYear sivan is: nextToBaseYear tammuz;
    assertNextOf: nextToBaseYear tammuz is: nextToBaseYear av;
    assertNextOf: nextToBaseYear av is: nextToBaseYear elul;
    assertNextOf: nextToBaseYear elul is: nextToBaseYear next tishrei.

  self
    assert: ( baseYear tishrei next: 12 * hebrewMonth ) equals: nextToBaseYear tishrei;
    assert: ( nextToBaseYear tishrei next: -12 * hebrewMonth ) equals: baseYear tishrei;
    assert: ( baseYear tishrei next: 18 * hebrewMonth ) equals: nextToBaseYear adarII;
    assert: ( baseYear tishrei next: 25 * hebrewMonth ) equals: nextToBaseYear next tishrei;
    assert: ( baseYear tishrei next: 235 * hebrewMonth )
    equals: ( baseYear next: 19 * hebrewYear ) tishrei
]

{ #category : 'tests' }
HebrewMonthOfYearTest >> testNumberOfDaysOnCommonCompleteYear [

  | commonYear |
  commonYear := 5678 asHebrewYear.
  self
    deny: commonYear isLeapYear;
    assert: commonYear isCompleteYear.

  self
    assert: commonYear tishrei numberOfDays equals: 30 * day;
    assert: commonYear cheshvan numberOfDays equals: 30 * day;
    assert: commonYear kislev numberOfDays equals: 30 * day;
    assert: commonYear tevet numberOfDays equals: 29 * day;
    assert: commonYear shevat numberOfDays equals: 30 * day;
    assert: commonYear adar numberOfDays equals: 29 * day;
    assert: commonYear nisan numberOfDays equals: 30 * day;
    assert: commonYear iyar numberOfDays equals: 29 * day;
    assert: commonYear sivan numberOfDays equals: 30 * day;
    assert: commonYear tammuz numberOfDays equals: 29 * day;
    assert: commonYear av numberOfDays equals: 30 * day;
    assert: commonYear elul numberOfDays equals: 29 * day
]

{ #category : 'tests' }
HebrewMonthOfYearTest >> testNumberOfDaysOnCommonDeficientYear [

  | commonYear |
  commonYear := 5675 asHebrewYear.
  self
    deny: commonYear isLeapYear;
    assert: commonYear isDeficientYear.

  self
    assert: commonYear tishrei numberOfDays equals: 30 * day;
    assert: commonYear cheshvan numberOfDays equals: 29 * day;
    assert: commonYear kislev numberOfDays equals: 29 * day;
    assert: commonYear tevet numberOfDays equals: 29 * day;
    assert: commonYear shevat numberOfDays equals: 30 * day;
    assert: commonYear adar numberOfDays equals: 29 * day;
    assert: commonYear nisan numberOfDays equals: 30 * day;
    assert: commonYear iyar numberOfDays equals: 29 * day;
    assert: commonYear sivan numberOfDays equals: 30 * day;
    assert: commonYear tammuz numberOfDays equals: 29 * day;
    assert: commonYear av numberOfDays equals: 30 * day;
    assert: commonYear elul numberOfDays equals: 29 * day
]

{ #category : 'tests' }
HebrewMonthOfYearTest >> testNumberOfDaysOnCommonRegularYear [

  | commonYear |
  commonYear := 5674 asHebrewYear.
  self
    deny: commonYear isLeapYear;
    assert: commonYear isRegularYear.

  self
    assert: commonYear tishrei numberOfDays equals: 30 * day;
    assert: commonYear cheshvan numberOfDays equals: 29 * day;
    assert: commonYear kislev numberOfDays equals: 30 * day;
    assert: commonYear tevet numberOfDays equals: 29 * day;
    assert: commonYear shevat numberOfDays equals: 30 * day;
    assert: commonYear adar numberOfDays equals: 29 * day;
    assert: commonYear nisan numberOfDays equals: 30 * day;
    assert: commonYear iyar numberOfDays equals: 29 * day;
    assert: commonYear sivan numberOfDays equals: 30 * day;
    assert: commonYear tammuz numberOfDays equals: 29 * day;
    assert: commonYear av numberOfDays equals: 30 * day;
    assert: commonYear elul numberOfDays equals: 29 * day
]

{ #category : 'tests' }
HebrewMonthOfYearTest >> testNumberOfDaysOnLeapCompleteYear [

  | leapYear |
  leapYear := 5676 asHebrewYear.
  self
    assert: leapYear isLeapYear;
    assert: leapYear isCompleteYear.

  self
    assert: leapYear tishrei numberOfDays equals: 30 * day;
    assert: leapYear cheshvan numberOfDays equals: 30 * day;
    assert: leapYear kislev numberOfDays equals: 30 * day;
    assert: leapYear tevet numberOfDays equals: 29 * day;
    assert: leapYear shevat numberOfDays equals: 30 * day;
    assert: leapYear adarI numberOfDays equals: 30 * day;
    assert: leapYear adarII numberOfDays equals: 29 * day;
    assert: leapYear nisan numberOfDays equals: 30 * day;
    assert: leapYear iyar numberOfDays equals: 29 * day;
    assert: leapYear sivan numberOfDays equals: 30 * day;
    assert: leapYear tammuz numberOfDays equals: 29 * day;
    assert: leapYear av numberOfDays equals: 30 * day;
    assert: leapYear elul numberOfDays equals: 29 * day
]

{ #category : 'tests' }
HebrewMonthOfYearTest >> testNumberOfDaysOnLeapDeficientYear [

  | leapYear |
  leapYear := 5679 asHebrewYear.
  self
    assert: leapYear isLeapYear;
    assert: leapYear isDeficientYear.

  self
    assert: leapYear tishrei numberOfDays equals: 30 * day;
    assert: leapYear cheshvan numberOfDays equals: 29 * day;
    assert: leapYear kislev numberOfDays equals: 29 * day;
    assert: leapYear tevet numberOfDays equals: 29 * day;
    assert: leapYear shevat numberOfDays equals: 30 * day;
    assert: leapYear adarI numberOfDays equals: 30 * day;
    assert: leapYear adarII numberOfDays equals: 29 * day;
    assert: leapYear nisan numberOfDays equals: 30 * day;
    assert: leapYear iyar numberOfDays equals: 29 * day;
    assert: leapYear sivan numberOfDays equals: 30 * day;
    assert: leapYear tammuz numberOfDays equals: 29 * day;
    assert: leapYear av numberOfDays equals: 30 * day;
    assert: leapYear elul numberOfDays equals: 29 * day
]

{ #category : 'tests' }
HebrewMonthOfYearTest >> testNumberOfDaysOnLeapRegularYear [

  | leapYear |
  leapYear := 5684 asHebrewYear.
  self
    assert: leapYear isLeapYear;
    assert: leapYear isRegularYear.

  self
    assert: leapYear tishrei numberOfDays equals: 30 * day;
    assert: leapYear cheshvan numberOfDays equals: 29 * day;
    assert: leapYear kislev numberOfDays equals: 30 * day;
    assert: leapYear tevet numberOfDays equals: 29 * day;
    assert: leapYear shevat numberOfDays equals: 30 * day;
    assert: leapYear adarI numberOfDays equals: 30 * day;
    assert: leapYear adarII numberOfDays equals: 29 * day;
    assert: leapYear nisan numberOfDays equals: 30 * day;
    assert: leapYear iyar numberOfDays equals: 29 * day;
    assert: leapYear sivan numberOfDays equals: 30 * day;
    assert: leapYear tammuz numberOfDays equals: 29 * day;
    assert: leapYear av numberOfDays equals: 30 * day;
    assert: leapYear elul numberOfDays equals: 29 * day
]

{ #category : 'tests' }
HebrewMonthOfYearTest >> testPrevious [

  | baseYear previousToBaseYear |
  baseYear := 5679 asHebrewYear.
  previousToBaseYear := baseYear previous.
  self
    assert: baseYear isLeapYear;
    assert: baseYear isDeficientYear;
    deny: previousToBaseYear isLeapYear;
    assert: previousToBaseYear isCompleteYear.

  self
    assertPreviousOf: baseYear cheshvan is: baseYear tishrei;
    assertPreviousOf: baseYear kislev is: baseYear cheshvan;
    assertPreviousOf: baseYear tevet is: baseYear kislev;
    assertPreviousOf: baseYear shevat is: baseYear tevet;
    assertPreviousOf: baseYear adarI is: baseYear shevat;
    assertPreviousOf: baseYear adarII is: baseYear adarI;
    assertPreviousOf: baseYear nisan is: baseYear adarII;
    assertPreviousOf: baseYear iyar is: baseYear nisan;
    assertPreviousOf: baseYear sivan is: baseYear iyar;
    assertPreviousOf: baseYear tammuz is: baseYear sivan;
    assertPreviousOf: baseYear av is: baseYear tammuz;
    assertPreviousOf: baseYear elul is: baseYear av;
    assertPreviousOf: baseYear tishrei is: previousToBaseYear elul;
    assertPreviousOf: previousToBaseYear cheshvan is: previousToBaseYear tishrei;
    assertPreviousOf: previousToBaseYear kislev is: previousToBaseYear cheshvan;
    assertPreviousOf: previousToBaseYear tevet is: previousToBaseYear kislev;
    assertPreviousOf: previousToBaseYear shevat is: previousToBaseYear tevet;
    assertPreviousOf: previousToBaseYear adar is: previousToBaseYear shevat;
    assertPreviousOf: previousToBaseYear nisan is: previousToBaseYear adar;
    assertPreviousOf: previousToBaseYear iyar is: previousToBaseYear nisan;
    assertPreviousOf: previousToBaseYear sivan is: previousToBaseYear iyar;
    assertPreviousOf: previousToBaseYear tammuz is: previousToBaseYear sivan;
    assertPreviousOf: previousToBaseYear av is: previousToBaseYear tammuz;
    assertPreviousOf: previousToBaseYear elul is: previousToBaseYear av;
    assertPreviousOf: previousToBaseYear next tishrei is: previousToBaseYear elul.

  self
    assert: ( baseYear tishrei previous: 12 * hebrewMonth ) equals: previousToBaseYear tishrei;
    assert: ( previousToBaseYear tishrei previous: -12 * hebrewMonth ) equals: baseYear tishrei;
    assert: ( baseYear adarII previous: 18 * hebrewMonth ) equals: previousToBaseYear tishrei;
    assert: ( baseYear tishrei previous: 24 * hebrewMonth )
    equals: previousToBaseYear previous tishrei;
    assert: ( baseYear elul previous: 25 * hebrewMonth ) equals: previousToBaseYear previous elul;
    assert: ( baseYear tishrei previous: 235 * hebrewMonth )
    equals: ( baseYear previous: 19 * hebrewYear ) tishrei
]

{ #category : 'tests' }
HebrewMonthOfYearTest >> testPrintString [

  self assert: ( tevet , 1412 ) printString equals: 'Tevet, 1412 AM'
]
