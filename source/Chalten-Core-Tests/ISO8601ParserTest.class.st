"
An ISO8601ParserTest is a test class for testing the behavior of ISO8601Parser
"
Class {
	#name : 'ISO8601ParserTest',
	#superclass : 'ChaltenTest',
	#instVars : [
		'week',
		'minute',
		'second'
	],
	#category : 'Chalten-Core-Tests',
	#package : 'Chalten-Core-Tests'
}

{ #category : 'running' }
ISO8601ParserTest >> parseDuration: string [

  ^ ISO8601Parser new parseDuration: string
]

{ #category : 'running' }
ISO8601ParserTest >> parseTimePeriods: string [

  ^ ISO8601Parser new parseDuration: string allowingSeveralTimePeriods: true
]

{ #category : 'running' }
ISO8601ParserTest >> setUp [

  super setUp.
  week := InternationalSystemOfUnits units >> #week.
  minute := InternationalSystemOfUnits units >> #minute.
  second := InternationalSystemOfUnits units >> #second
]

{ #category : 'tests' }
ISO8601ParserTest >> testCannotParseInvalidDuration [

  self
    should: [ self parseDuration: 'X' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''X'' is invalid.';
    should: [ self parseDuration: 'PP' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''PP'' is invalid.';
    should: [ self parseDuration: 'PT' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''PT'' is invalid.';
    should: [ self parseDuration: '15T' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''15T'' is invalid.'
]

{ #category : 'tests' }
ISO8601ParserTest >> testMixedTimePeriods [

  | timePeriods |
  self
    should: [ self parseDuration: 'P3Y6M4DT12H30M5S' ]
    raise: InstanceCreationFailed
    withMessageText: 'Durations with several time periods are disallowed'.

  timePeriods := self parseTimePeriods: 'P3Y6M4DT12H30M5S'.
  self
    assert: timePeriods size equals: 6;
    assert: timePeriods includes: 3 * year;
    assert: timePeriods includes: 6 * month;
    assert: timePeriods includes: 4 * day;
    assert: timePeriods includes: 12 * hour;
    assert: timePeriods includes: 30 * minute;
    assert: timePeriods includes: 5 * second.

  timePeriods := self parseTimePeriods: 'P3Y'.
  self
    assert: timePeriods size equals: 1;
    assert: timePeriods includes: 3 * year
]

{ #category : 'tests' }
ISO8601ParserTest >> testParseDayDuration [

  self
    assert: ( self parseDuration: 'P0D' ) equals: 0 * day;
    assert: ( self parseDuration: 'P1D' ) equals: 1 * day;
    assert: ( self parseDuration: 'P6D' ) equals: 6 * day;
    assert: ( self parseDuration: 'P6.5D' ) equals: 6.5 * day.

  self
    should: [ self parseDuration: '1D' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''1D'' is invalid.';
    should: [ self parseDuration: 'P-1D' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''P-1D'' is invalid.';
    should: [ self parseDuration: 'P$D' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''P$D'' is invalid.';
    should: [ self parseDuration: 'PD' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''PD'' is invalid.'
]

{ #category : 'tests' }
ISO8601ParserTest >> testParseHourDuration [

  self
    assert: ( self parseDuration: 'PT0H' ) equals: 0 * hour;
    assert: ( self parseDuration: 'PT1H' ) equals: 1 * hour;
    assert: ( self parseDuration: 'PT6H' ) equals: 6 * hour.

  self
    should: [ self parseDuration: 'P1H' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''P1H'' is invalid.';
    should: [ self parseDuration: '1H' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''1H'' is invalid.';
    should: [ self parseDuration: 'P-1H' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''P-1H'' is invalid.';
    should: [ self parseDuration: 'P$H' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''P$H'' is invalid.';
    should: [ self parseDuration: 'PH' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''PH'' is invalid.'
]

{ #category : 'tests' }
ISO8601ParserTest >> testParseMinuteDuration [

  self
    assert: ( self parseDuration: 'PT0M' ) equals: 0 * minute;
    assert: ( self parseDuration: 'PT6M' ) equals: 6 * minute.

  self
    should: [ self parseDuration: '1TM' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''1TM'' is invalid.';
    should: [ self parseDuration: 'PT-1M' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''PT-1M'' is invalid.';
    should: [ self parseDuration: 'PT$M' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''PT$M'' is invalid.';
    should: [ self parseDuration: 'PTM' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''PTM'' is invalid.'
]

{ #category : 'tests' }
ISO8601ParserTest >> testParseMonthDuration [

  self
    assert: ( self parseDuration: 'P0M' ) equals: 0 * month;
    assert: ( self parseDuration: 'P1M' ) equals: 1 * month;
    assert: ( self parseDuration: 'P6M' ) equals: 6 * month.

  self
    should: [ self parseDuration: '1M' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''1M'' is invalid.';
    should: [ self parseDuration: 'P-1M' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''P-1M'' is invalid.';
    should: [ self parseDuration: 'P$M' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''P$M'' is invalid.';
    should: [ self parseDuration: 'PM' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''PM'' is invalid.'
]

{ #category : 'tests' }
ISO8601ParserTest >> testParseSecondDuration [

  self
    assert: ( self parseDuration: 'PT0S' ) equals: 0 * second;
    assert: ( self parseDuration: 'PT1S' ) equals: 1 * second;
    assert: ( self parseDuration: 'PT6.154S' ) equals: 6.154 * second.

  self
    should: [ self parseDuration: 'P1S' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''P1S'' is invalid.';
    should: [ self parseDuration: 'T1S' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''T1S'' is invalid.';
    should: [ self parseDuration: 'PT-1S' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''PT-1S'' is invalid.';
    should: [ self parseDuration: 'PT$S' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''PT$S'' is invalid.';
    should: [ self parseDuration: 'PTS' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''PTS'' is invalid.'
]

{ #category : 'tests' }
ISO8601ParserTest >> testParseWeekDuration [

  self
    assert: ( self parseDuration: 'P0W' ) equals: 0 * week;
    assert: ( self parseDuration: 'P1W' ) equals: 1 * week;
    assert: ( self parseDuration: 'P100W' ) equals: 100 * week.

  self
    should: [ self parseDuration: '1W' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''1W'' is invalid.';
    should: [ self parseDuration: 'P-1W' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''-1'' is invalid.';
    should: [ self parseDuration: 'P1D1W' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''1D1'' is invalid.';
    should: [ self parseDuration: 'P$W' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''$'' is invalid.';
    should: [ self parseDuration: 'PW' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration '''' is invalid.'
]

{ #category : 'tests' }
ISO8601ParserTest >> testParseYearDuration [

  self
    assert: ( self parseDuration: 'P0Y' ) equals: 0 * year;
    assert: ( self parseDuration: 'P1Y' ) equals: 1 * year;
    assert: ( self parseDuration: 'P1.5Y' ) equals: 1.5 * year;
    assert: ( self parseDuration: 'P100Y' ) equals: 100 * year.

  self
    should: [ self parseDuration: '1Y' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''1Y'' is invalid.';
    should: [ self parseDuration: 'P-1Y' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''P-1Y'' is invalid.';
    should: [ self parseDuration: 'P$Y' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''P$Y'' is invalid.';
    should: [ self parseDuration: 'PY' ]
    raise: InstanceCreationFailed
    withMessageText: 'The provided duration ''PY'' is invalid.'
]
