"
A TimeOfDayTest is a test class for testing the behavior of TimeOfDay
"
Class {
	#name : 'TimeOfDayTest',
	#superclass : 'TestCase',
	#instVars : [
		'hour',
		'microsecond',
		'minute',
		'second'
	],
	#category : 'Chalten-Core-Tests',
	#package : 'Chalten-Core-Tests'
}

{ #category : 'parsing' }
TimeOfDayTest >> parseISO8601: string [

  ^ ISO8601Parser new parseTimeOfDay: string
]

{ #category : 'printing' }
TimeOfDayTest >> printAsISO8601String: calendarMagnitude [

  ^ String streamContents: [ :stream | calendarMagnitude printAsISO8601On: stream ]
]

{ #category : 'running' }
TimeOfDayTest >> setUp [

  super setUp.
  hour := TimeOfDay hour.
  minute := TimeOfDay minute.
  second := TimeOfDay second.
  microsecond := TimeOfDay microsecond
]

{ #category : 'tests' }
TimeOfDayTest >> testAccessing [

  | timeOfDay |
  timeOfDay := TimeOfDay
                 hours: 16
                 minutes: 15
                 seconds: 12
                 microseconds: 1640.

  self
    assert: timeOfDay hours equals: 16 * hour;
    assert: timeOfDay minutes equals: 15 * minute;
    assert: timeOfDay seconds equals: 12 * second;
    assert: timeOfDay microseconds equals: 1640 * microsecond
]

{ #category : 'tests' }
TimeOfDayTest >> testAddition [

  | baseTimeOfDay timeOfDay |
  baseTimeOfDay := TimeOfDay
                     hours: 16
                     minutes: 15
                     seconds: 12
                     microseconds: 1640.
  timeOfDay := baseTimeOfDay + ( 4 * hour ).
  self
    assert: timeOfDay hours equals: 20 * hour;
    assert: timeOfDay minutes equals: 15 * minute;
    assert: timeOfDay seconds equals: 12 * second;
    assert: timeOfDay microseconds equals: 1640 * microsecond
]

{ #category : 'tests' }
TimeOfDayTest >> testAdditionCannotExceed24Hours [

  | timeOfDay |
  timeOfDay := TimeOfDay hours: 16.
  self
    should: [ timeOfDay + ( 8 * hour ) ]
    raise: InstanceCreationFailed
    withMessageText: 'A time of day must be between 0 and 24 hours'
]

{ #category : 'tests' }
TimeOfDayTest >> testAdditionOfLessThanOneHour [

  | baseTimeOfDay timeOfDay |
  baseTimeOfDay := TimeOfDay
                     hours: 16
                     minutes: 15
                     seconds: 12
                     microseconds: 1640.
  timeOfDay := baseTimeOfDay + ( 20 * minute + ( 10 * second ) + ( 15 * microsecond ) ).
  self
    assert: timeOfDay hours equals: 16 * hour;
    assert: timeOfDay minutes equals: 35 * minute;
    assert: timeOfDay seconds equals: 22 * second;
    assert: timeOfDay microseconds equals: 1655 * microsecond
]

{ #category : 'tests' }
TimeOfDayTest >> testComparing [

  self
    assert: TimeOfDay halfOfDay equals: TimeOfDay halfOfDay;
    assert: TimeOfDay halfOfDay hash equals: TimeOfDay halfOfDay hash;
    deny: TimeOfDay halfOfDay equals: TimeOfDay startOfDay;

    assert: TimeOfDay startOfDay < TimeOfDay halfOfDay;
    assert: TimeOfDay startOfDay <= TimeOfDay halfOfDay;
    deny: TimeOfDay startOfDay < TimeOfDay startOfDay;
    assert: TimeOfDay startOfDay <= TimeOfDay startOfDay;

    assert: TimeOfDay halfOfDay > TimeOfDay startOfDay;
    assert: TimeOfDay halfOfDay >= TimeOfDay startOfDay;
    deny: TimeOfDay halfOfDay > TimeOfDay halfOfDay;
    assert: TimeOfDay halfOfDay >= TimeOfDay halfOfDay
]

{ #category : 'tests' }
TimeOfDayTest >> testISO8601Printing [

  self
    assert: ( self printAsISO8601String: TimeOfDay halfOfDay ) equals: 'T12:00:00.000000';
    assert: ( self printAsISO8601String: TimeOfDay startOfDay ) equals: 'T00:00:00.000000';
    assert: ( self printAsISO8601String: ( TimeOfDay hours: 16 ) ) equals: 'T16:00:00.000000';
    assert: ( self printAsISO8601String: ( TimeOfDay
                hours: 16
                minutes: 15
                seconds: 12
                microseconds: 1640 ) )
    equals: 'T16:15:12.001640'
]

{ #category : 'tests' }
TimeOfDayTest >> testInvalidCreation [

  self
    should: [ TimeOfDay hours: 24 ]
    raise: InstanceCreationFailed
    withMessageText: 'Hours must be in the range 0-23'.
  self
    should: [ TimeOfDay hours: 23 minutes: -1 ]
    raise: InstanceCreationFailed
    withMessageText: 'Minutes must be in the range 0-59'.
  self
    should: [ TimeOfDay hours: 23 minutes: 0 seconds: 60 ]
    raise: InstanceCreationFailed
    withMessageText: 'Seconds must be in the range 0-59'.
  self
    should: [
        TimeOfDay
          hours: 23
          minutes: 0
          seconds: 0
          microseconds: 1000000
      ]
    raise: InstanceCreationFailed
    withMessageText: 'Microseconds must be in the range 0-999999'
]

{ #category : 'tests' }
TimeOfDayTest >> testParseISO8601 [

  self
    assert: ( self parseISO8601: 'T12:00:00.000000' ) equals: TimeOfDay halfOfDay;
    assert: ( self parseISO8601: 'T12' ) equals: TimeOfDay halfOfDay;
    assert: ( self parseISO8601: 'T12:00' ) equals: TimeOfDay halfOfDay;
    assert: ( self parseISO8601: 'T12:00:00' ) equals: TimeOfDay halfOfDay;
    assert: ( self parseISO8601: 'T00:00:00.000000' ) equals: TimeOfDay startOfDay;
    assert: ( self parseISO8601: 'T16:00:00.000000' ) equals: ( TimeOfDay hours: 16 );
    assert: ( self parseISO8601: 'T16:15:12.001640' ) equals: ( TimeOfDay
          hours: 16
          minutes: 15
          seconds: 12
          microseconds: 1640 );
    assert: ( self parseISO8601: 'T23:59:59.999999' ) equals: ( TimeOfDay
          hours: 23
          minutes: 59
          seconds: 59
          microseconds: 999999 ).

  #( 'T' 'T1' 'T12:' 'T12:1' 'T12:12:' 'T12:12:1' 'T12:12:12.' 'TXX:' 'T12:XX' 'T12:12:XX'
     'T12:12:12.X' '00:00:00.000000' ) do: [ :invalidString |
      self
        should: [ self parseISO8601: invalidString ]
        raise: InstanceCreationFailed
        withMessageText:
          ( 'The provided time ''<1s>'' is invalid. Ensure it follows ISO 8601 (e.g., ''T14:30:00'').'
              expandMacrosWith: invalidString )
    ].
  #( 'T-1:00:00.000000' 'T24:00:00.000000' ) do: [ :invalidString |
      self
        should: [ self parseISO8601: invalidString ]
        raise: InstanceCreationFailed
        withMessageText: 'Hours must be in the range 0-23'
    ].
  #( 'T10:60:00.000000' ) do: [ :invalidString |
      self
        should: [ self parseISO8601: invalidString ]
        raise: InstanceCreationFailed
        withMessageText: 'Minutes must be in the range 0-59'
    ].

  #( 'T10:00:60.000000' ) do: [ :invalidString |
      self
        should: [ self parseISO8601: invalidString ]
        raise: InstanceCreationFailed
        withMessageText: 'Seconds must be in the range 0-59'
    ].
  #( 'T10:00:00.0000001' ) do: [ :invalidString |
      self
        should: [ self parseISO8601: invalidString ]
        raise: InstanceCreationFailed
        withMessageText:
          ( 'The provided time ''<1s>'' is invalid. Ensure it follows ISO 8601 (e.g., ''T14:30:00'').'
              expandMacrosWith: invalidString )
    ]
]

{ #category : 'tests' }
TimeOfDayTest >> testPrintString [

  self
    assert: TimeOfDay halfOfDay printString equals: '12:00:00.000000';
    assert: TimeOfDay startOfDay printString equals: '00:00:00.000000';
    assert: ( TimeOfDay hours: 16 ) printString equals: '16:00:00.000000';
    assert: ( TimeOfDay
          hours: 16
          minutes: 15
          seconds: 12
          microseconds: 1640 ) printString
    equals: '16:15:12.001640'
]

{ #category : 'tests' }
TimeOfDayTest >> testSubtraction [

  | baseTimeOfDay timeOfDay |
  baseTimeOfDay := TimeOfDay
                     hours: 16
                     minutes: 15
                     seconds: 12
                     microseconds: 1640.
  timeOfDay := baseTimeOfDay - ( 30 * minute ).
  self
    assert: timeOfDay hours equals: 15 * hour;
    assert: timeOfDay minutes equals: 45 * minute;
    assert: timeOfDay seconds equals: 12 * second;
    assert: timeOfDay microseconds equals: 1640 * microsecond
]

{ #category : 'tests' }
TimeOfDayTest >> testSubtractionCannotExceed0Hours [

  | timeOfDay |
  timeOfDay := TimeOfDay hours: 16.
  self
    should: [ timeOfDay - ( 16.1 * hour ) ]
    raise: InstanceCreationFailed
    withMessageText: 'A time of day must be between 0 and 24 hours'
]

{ #category : 'tests' }
TimeOfDayTest >> testSubtractionToZero [

  | baseTimeOfDay timeOfDay |
  baseTimeOfDay := TimeOfDay hours: 16.
  timeOfDay := baseTimeOfDay - ( 16 * hour ).
  self
    assert: timeOfDay hours isZero;
    assert: timeOfDay minutes isZero;
    assert: timeOfDay seconds isZero;
    assert: timeOfDay microseconds isZero
]
