"
A TimeZoneAwareGregorianDateTimeTest is a test class for testing the behavior of TimeZoneAwareGregorianDateTime
"
Class {
	#name : 'TimeOffsetAwareGregorianDateTimeTest',
	#superclass : 'ChaltenTest',
	#instVars : [
		'utcPlus3',
		'utcMinus6'
	],
	#category : 'Chalten-Core-Tests',
	#package : 'Chalten-Core-Tests'
}

{ #category : 'running' }
TimeOffsetAwareGregorianDateTimeTest >> setUp [

  super setUp.
  utcPlus3 := FixedOffsetRuleset for: 3 * hour.
  utcMinus6 := FixedOffsetRuleset for: -6 * hour
]

{ #category : 'tests' }
TimeOffsetAwareGregorianDateTimeTest >> testAsRelativePointInTime [

  | unixEpoch relativeDateTime |
  unixEpoch := Instant epoch asGregorianDateTimeInCoordinatedUniversalTime.

  relativeDateTime := unixEpoch asRelativePointInTime.
  self assert: relativeDateTime equals: ( GregorianMonth january first , 1970 ) atMidnight.


  unixEpoch := Instant epoch asGregorianDateTimeIn: utcPlus3.

  relativeDateTime := unixEpoch asRelativePointInTime.
  self
    assert: relativeDateTime
    equals: ( GregorianMonth january first , 1970 at: ( TimeOfDay hours: 3 ) )
]

{ #category : 'tests' }
TimeOffsetAwareGregorianDateTimeTest >> testCreationFromInstant [

  | unixEpoch |
  unixEpoch := Instant epoch.

  self
    assert: unixEpoch asGregorianDateTimeInCoordinatedUniversalTime asInstant equals: unixEpoch;
    assert: unixEpoch asGregorianDateTimeInCoordinatedUniversalTime equals: unixEpoch;
    assert: unixEpoch equals: unixEpoch asGregorianDateTimeInCoordinatedUniversalTime;
    assert: unixEpoch asGregorianDateTimeInCoordinatedUniversalTime printString
    equals: '1970-01-01T00:00:00.000000Z'
]

{ #category : 'tests' }
TimeOffsetAwareGregorianDateTimeTest >> testCreationFromInstantWithFixedOffset [

  | unixEpoch |
  unixEpoch := Instant epoch asGregorianDateTimeIn: utcPlus3.
  self
    assert: unixEpoch asInstant equals: Instant epoch;
    assert: unixEpoch equals: Instant epoch;
    assert: unixEpoch printString equals: '1970-01-01T03:00:00.000000+03:00'
]

{ #category : 'tests' }
TimeOffsetAwareGregorianDateTimeTest >> testIn [

  | unixEpoch |
  unixEpoch := Instant epoch asGregorianDateTimeInCoordinatedUniversalTime.

  self
    assert: ( unixEpoch in: utcPlus3 ) printString equals: '1970-01-01T03:00:00.000000+03:00';
    assert: ( unixEpoch in: utcPlus3 ) equals: unixEpoch.

  self
    assert: ( unixEpoch in: utcMinus6 ) printString equals: '1969-12-31T18:00:00.000000-06:00';
    assert: ( unixEpoch in: utcMinus6 ) equals: unixEpoch;
    assert: ( unixEpoch in: utcMinus6 ) equals: ( unixEpoch in: utcPlus3 )
]

{ #category : 'tests' }
TimeOffsetAwareGregorianDateTimeTest >> testInCoordinatedUniversalTime [

  | unixEpoch |
  unixEpoch := Instant epoch asGregorianDateTimeInCoordinatedUniversalTime.

  self
    assert: unixEpoch inCoordinatedUniversalTime printString
    equals: '1970-01-01T00:00:00.000000Z'.

  unixEpoch := Instant epoch asGregorianDateTimeIn: utcPlus3.
  self
    assert: unixEpoch printString equals: '1970-01-01T03:00:00.000000+03:00';
    assert: unixEpoch inCoordinatedUniversalTime printString equals: '1970-01-01T00:00:00.000000Z'
]
