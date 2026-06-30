"
An ISO8601DurationFormatterTest is a test class for testing the behavior of ISO8601DurationFormatter
"
Class {
	#name : 'ISO8601DurationFormatterTest',
	#superclass : 'ChaltenTest',
	#category : 'Chalten-Core-Tests',
	#package : 'Chalten-Core-Tests'
}

{ #category : 'private - asserting' }
ISO8601DurationFormatterTest >> assertFormattingOf: timePeriodOrPeriods equals: expectedString [

  self assert: ( ISO8601DurationFormatter new format: timePeriodOrPeriods ) equals: expectedString
]

{ #category : 'accessing' }
ISO8601DurationFormatterTest >> minute [

  ^ TimeOfDay minute
]

{ #category : 'accessing' }
ISO8601DurationFormatterTest >> second [

  ^ InternationalSystemOfUnits units >> #second
]

{ #category : 'tests' }
ISO8601DurationFormatterTest >> testCannotFormatEmptyMixedDuration [

  self
    should: [ ISO8601DurationFormatter new format: {  } ]
    raise: AssertionFailed
    withMessageText: 'Cannot format empty time periods'
]

{ #category : 'tests' }
ISO8601DurationFormatterTest >> testCannotFormatInvalidFractions [

  self
    should: [ ISO8601DurationFormatter new format: { 1.5 * month . 1 * day } ]
    raise: AssertionFailed
    withMessageText: 'A decimal fraction can only be applied to the lowest-order component';
    should: [ ISO8601DurationFormatter new format: { 1.5 * day . 1.2 * self second } ]
    raise: AssertionFailed
    withMessageText: 'A decimal fraction can only be applied to the lowest-order component'
]

{ #category : 'tests' }
ISO8601DurationFormatterTest >> testCannotFormatMixedDurationWithRepeatedUnits [

  self
    should: [ ISO8601DurationFormatter new format: { 1 * day . 3 * day } ]
    raise: AssertionFailed
    withMessageText: 'Cannot format time periods including invalid units'
]

{ #category : 'tests' }
ISO8601DurationFormatterTest >> testCannotFormatMixedDurationWithWeeks [

  self
    should: [ ISO8601DurationFormatter new format: { 1 * self week . 3 * day } ]
    raise: AssertionFailed
    withMessageText: 'Cannot format time periods including invalid units'
]

{ #category : 'tests' }
ISO8601DurationFormatterTest >> testCannotFormatUnsupportedUnits [

  self
    should: [
      ISO8601DurationFormatter new format: 1 * ( InternationalSystemOfUnits units >> #microsecond ) ]
    raise: AssertionFailed
    withMessageText: 'Cannot format time periods including invalid units'
]

{ #category : 'tests' }
ISO8601DurationFormatterTest >> testFormatDayDuration [

  self
    assertFormattingOf: 0 * day equals: 'P0D';
    assertFormattingOf: 1 * day equals: 'P1D';
    assertFormattingOf: 100 * day equals: 'P100D';
    assertFormattingOf: 1.5 * day equals: 'P1.5D';
    assertFormattingOf: 1.52 * day equals: 'P1.52D'
]

{ #category : 'tests' }
ISO8601DurationFormatterTest >> testFormatHourDuration [

  self
    assertFormattingOf: 0 * hour equals: 'PT0H';
    assertFormattingOf: 1 * hour equals: 'PT1H';
    assertFormattingOf: 100 * hour equals: 'PT100H';
    assertFormattingOf: 1.5 * hour equals: 'PT1.5H';
    assertFormattingOf: 1.52 * hour equals: 'PT1.52H'
]

{ #category : 'tests' }
ISO8601DurationFormatterTest >> testFormatMinuteDuration [

  self
    assertFormattingOf: 0 * self minute equals: 'PT0M';
    assertFormattingOf: 1 * self minute equals: 'PT1M';
    assertFormattingOf: 100 * self minute equals: 'PT100M'; 
    assertFormattingOf: 1.5 * self minute equals: 'PT1.5M';
    assertFormattingOf: 1.52 * self minute equals: 'PT1.52M'
]

{ #category : 'tests' }
ISO8601DurationFormatterTest >> testFormatMixedDuration [

  self
    assertFormattingOf:
      { 1.55 * self second . 3 * self minute . 2 * hour . 5 * month . 3 * year . 4 * day }
    equals: 'P3Y5M4DT2H3M1.55S';
    assertFormattingOf: { 1.55 * self second . 3 * self minute . 2 * hour } equals: 'PT2H3M1.55S'
]

{ #category : 'tests' }
ISO8601DurationFormatterTest >> testFormatMonthDuration [

  self
    assertFormattingOf: 0 * month equals: 'P0M';
    assertFormattingOf: 1 * month equals: 'P1M';
    assertFormattingOf: 100 * month equals: 'P100M'; 
    assertFormattingOf: 1.5 * month equals: 'P1.5M';
    assertFormattingOf: 1.52 * month equals: 'P1.52M' 
]

{ #category : 'tests' }
ISO8601DurationFormatterTest >> testFormatSecondDuration [

  self
    assertFormattingOf: 0 * self second equals: 'PT0S';
    assertFormattingOf: 1 * self second equals: 'PT1S';
    assertFormattingOf: 100 * self second equals: 'PT100S';
    assertFormattingOf: 1.5 * self second equals: 'PT1.5S';
    assertFormattingOf: 1.52 * self second equals: 'PT1.52S'
]

{ #category : 'tests' }
ISO8601DurationFormatterTest >> testFormatWeekDuration [

  self
    assertFormattingOf: 0 * self week equals: 'P0W';
    assertFormattingOf: 1 * self week equals: 'P1W';
    assertFormattingOf: 100 * self week equals: 'P100W';
    assertFormattingOf: 1.5 * self week equals: 'P1.5W';
    assertFormattingOf: 1.52 * self week equals: 'P1.52W'
]

{ #category : 'tests' }
ISO8601DurationFormatterTest >> testFormatYearDuration [

  self
    assertFormattingOf: 0 * year equals: 'P0Y';
    assertFormattingOf: 1 * year equals: 'P1Y';
    assertFormattingOf: 100 * year equals: 'P100Y';
    assertFormattingOf: 1.5 * year equals: 'P1.5Y';
    assertFormattingOf: 1.52 * year equals: 'P1.52Y'
]

{ #category : 'accessing' }
ISO8601DurationFormatterTest >> week [

  ^ InternationalSystemOfUnits units >> #week
]
