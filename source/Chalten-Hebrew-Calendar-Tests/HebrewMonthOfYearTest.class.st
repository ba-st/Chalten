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
    assert: tishrei , 2 greaterThan: tishrei , 1;
    assert: tishrei , 2 greaterThanOrEquals: tishrei , 1;
    assert: tishrei , 1 greaterThanOrEquals: tishrei , 1;
    assert: cheshvan , 1 greaterThan: tishrei , 1;
    assert: cheshvan , 1 greaterThanOrEquals: tishrei , 1;
    assert: cheshvan , 2 greaterThan: tishrei , 1;
    deny: tishrei , 1 greaterThan: tishrei , 2025;
    deny: tishrei , 1 greaterThan: cheshvan , 1
]

{ #category : 'tests' }
HebrewMonthOfYearTest >> testLessThan [

  self
    assert: tishrei , 1 lessThan: tishrei , 2;
    assert: tishrei , 1 lessThanOrEquals: tishrei , 2;
    assert: tishrei , 1 lessThanOrEquals: tishrei , 1;
    assert: tishrei , 1 lessThanOrEquals: cheshvan , 1;
    assert: cheshvan , 1 lessThanOrEquals: tishrei , 2;
    deny: tishrei , 2025 lessThan: tishrei , 1;
    deny: cheshvan , 1 lessThan: tishrei , 1
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
    assert: baseYear tishrei nextIs: baseYear cheshvan;
    assert: baseYear cheshvan nextIs: baseYear kislev;
    assert: baseYear kislev nextIs: baseYear tevet;
    assert: baseYear tevet nextIs: baseYear shevat;
    assert: baseYear shevat nextIs: baseYear adar;
    assert: baseYear adar nextIs: baseYear nisan;
    assert: baseYear nisan nextIs: baseYear iyar;
    assert: baseYear iyar nextIs: baseYear sivan;
    assert: baseYear sivan nextIs: baseYear tammuz;
    assert: baseYear tammuz nextIs: baseYear av;
    assert: baseYear av nextIs: baseYear elul;
    assert: baseYear elul nextIs: nextToBaseYear tishrei;
    assert: nextToBaseYear tishrei nextIs: nextToBaseYear cheshvan;
    assert: nextToBaseYear cheshvan nextIs: nextToBaseYear kislev;
    assert: nextToBaseYear kislev nextIs: nextToBaseYear tevet;
    assert: nextToBaseYear tevet nextIs: nextToBaseYear shevat;
    assert: nextToBaseYear shevat nextIs: nextToBaseYear adarI;
    assert: nextToBaseYear adarI nextIs: nextToBaseYear adarII;
    assert: nextToBaseYear adarII nextIs: nextToBaseYear nisan;
    assert: nextToBaseYear nisan nextIs: nextToBaseYear iyar;
    assert: nextToBaseYear iyar nextIs: nextToBaseYear sivan;
    assert: nextToBaseYear sivan nextIs: nextToBaseYear tammuz;
    assert: nextToBaseYear tammuz nextIs: nextToBaseYear av;
    assert: nextToBaseYear av nextIs: nextToBaseYear elul;
    assert: nextToBaseYear elul nextIs: nextToBaseYear next tishrei.

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
    assert: baseYear cheshvan previousIs: baseYear tishrei;
    assert: baseYear kislev previousIs: baseYear cheshvan;
    assert: baseYear tevet previousIs: baseYear kislev;
    assert: baseYear shevat previousIs: baseYear tevet;
    assert: baseYear adarI previousIs: baseYear shevat;
    assert: baseYear adarII previousIs: baseYear adarI;
    assert: baseYear nisan previousIs: baseYear adarII;
    assert: baseYear iyar previousIs: baseYear nisan;
    assert: baseYear sivan previousIs: baseYear iyar;
    assert: baseYear tammuz previousIs: baseYear sivan;
    assert: baseYear av previousIs: baseYear tammuz;
    assert: baseYear elul previousIs: baseYear av;
    assert: baseYear tishrei previousIs: previousToBaseYear elul;
    assert: previousToBaseYear cheshvan previousIs: previousToBaseYear tishrei;
    assert: previousToBaseYear kislev previousIs: previousToBaseYear cheshvan;
    assert: previousToBaseYear tevet previousIs: previousToBaseYear kislev;
    assert: previousToBaseYear shevat previousIs: previousToBaseYear tevet;
    assert: previousToBaseYear adar previousIs: previousToBaseYear shevat;
    assert: previousToBaseYear nisan previousIs: previousToBaseYear adar;
    assert: previousToBaseYear iyar previousIs: previousToBaseYear nisan;
    assert: previousToBaseYear sivan previousIs: previousToBaseYear iyar;
    assert: previousToBaseYear tammuz previousIs: previousToBaseYear sivan;
    assert: previousToBaseYear av previousIs: previousToBaseYear tammuz;
    assert: previousToBaseYear elul previousIs: previousToBaseYear av;
    assert: previousToBaseYear next tishrei previousIs: previousToBaseYear elul.

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
