"
An InstantTest is a test class for testing the behavior of Instant
"
Class {
	#name : 'InstantTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Core-Tests',
	#package : 'Chalten-Core-Tests'
}

{ #category : 'private - asserting' }
InstantTest >> assertJulianDayNumberConversionOf: instant [

  self assert: ( Instant fromJulianDayNumber: instant julianDayNumber ) equals: instant
]

{ #category : 'private - asserting' }
InstantTest >> assertJulianDayNumberOf: instant minusOneHalfIs: number [

  self assert: instant julianDayNumber - ( 1 / 2 ) equals: number
]

{ #category : 'private' }
InstantTest >> oneDay [

  ^ 1 * ( self unit: #day )
]

{ #category : 'private' }
InstantTest >> oneSecond [

  ^ 1 * ( self unit: #second )
]

{ #category : 'tests' }
InstantTest >> testAccessing [

  | instant |
  instant := Instant epoch next: 1 * ( self unit: #day ).
  self
    assert: instant secondsSinceEpoch equals: 86400 * ( self unit: #second );
    assert: instant milisecondsSinceEpoch equals: 86400000 * ( self unit: #millisecond );
    assert: instant daysSinceEpoch equals: 1 * ( self unit: #day )
]

{ #category : 'tests' }
InstantTest >> testAsUnixTime [

  self
    assert: Instant epoch asUnixTime equals: 0;
    assert: ( Instant fromUnixTime: 1262304000 ) asUnixTime equals: 1262304000;
    assert: ( Instant fromUnixTime: 31536000 ) asUnixTime equals: 31536000;
    assert: ( Instant epoch next: 365 * ( self unit: #day ) )
    equals: ( Instant fromUnixTime: 31536000 )
]

{ #category : 'tests' }
InstantTest >> testComparing [

  self
    assert: Instant epoch equals: Instant epoch;
    assert: Instant epoch hash equals: Instant epoch hash;
    assert: ( Instant fromUnixTime: 1262304000 ) equals: ( Instant fromUnixTime: 1262304000 );
    assert: ( Instant fromUnixTime: 1262304000 ) hash
    equals: ( Instant fromUnixTime: 1262304000 ) hash;
    deny: ( Instant fromUnixTime: 1262304000 ) equals: Instant epoch;
    deny: Instant now equals: 0;
    deny: 0 equals: Instant now
]

{ #category : 'tests' }
InstantTest >> testConverting [

  | instant |
  instant := Instant epoch next: 1 * ( self unit: #day ).
  self assert: instant asInstant equals: instant
]

{ #category : 'tests' }
InstantTest >> testFromJulianDayNumber [

  self
    assertJulianDayNumberConversionOf: Instant epoch;
    assertJulianDayNumberConversionOf: ( Instant fromUnixTime: 1357000200 );
    assertJulianDayNumberConversionOf: ( Instant epoch next: self oneDay );
    assertJulianDayNumberConversionOf: ( Instant epoch previous: self oneSecond );
    assertJulianDayNumberConversionOf: ( Instant epoch previous: self oneSecond + self oneDay );
    assertJulianDayNumberConversionOf:
      ( Instant epoch previous: self oneSecond + self threeHours + self oneDay );
    assertJulianDayNumberConversionOf: ( Instant fromUnixTime: 1262304000 );
    assertJulianDayNumberConversionOf: ( Instant epoch next: 365 * ( self unit: #day ) );
    assertJulianDayNumberConversionOf: ( Instant fromUnixTime: -31536000 );
    assertJulianDayNumberConversionOf: ( Instant fromUnixTime: 119731017 );
    assertJulianDayNumberConversionOf: ( Instant fromUnixTime: 1000000000 );
    assertJulianDayNumberConversionOf: ( Instant fromUnixTime: 1234567890 );
    assertJulianDayNumberConversionOf: ( Instant fromUnixTime: -2208985200 )
]

{ #category : 'tests' }
InstantTest >> testFromUnixTime [

  self assert: ( Instant fromUnixTime: 0 ) equals: Instant epoch
]

{ #category : 'tests' }
InstantTest >> testJulianDayNumber [

  self
    assertJulianDayNumberOf: Instant epoch minusOneHalfIs: 2440587;
    assert: ( Instant fromUnixTime: 1357000200 ) julianDayNumber equals: (117902089/48)"~2456293.520833";
    assertJulianDayNumberOf: ( Instant epoch next: self oneDay ) 
    minusOneHalfIs: 2440588;
    assert: ( Instant epoch previous: self oneSecond ) julianDayNumber
    equals:  (210866759999/86400) "~2440587.4999884";
    assert:
      ( Instant epoch previous: self oneSecond + self oneDay ) julianDayNumber
    equals: (210866673599/86400) "~2440586.4999884";
    assert:
      ( Instant epoch previous: self oneSecond + self threeHours + self oneDay ) julianDayNumber
    equals: (210866662799/86400) "~2440586.3749884";
    assertJulianDayNumberOf: ( Instant fromUnixTime: 1262304000 )  
    minusOneHalfIs: 2455197;
    assertJulianDayNumberOf: ( Instant epoch next: 365 * ( self unit: #day ) )  
    minusOneHalfIs: 2440952;
    assertJulianDayNumberOf: ( Instant fromUnixTime: -31536000 )  
    minusOneHalfIs: 2440222;
    assert: ( Instant fromUnixTime: 119731017 ) julianDayNumber
    equals: (70328830339/28800)"~2441973.2756597";
    assert: ( Instant fromUnixTime: 1000000000 ) julianDayNumber
    equals: (132416725/54)"~2452161.5740741";
    assert: ( Instant fromUnixTime: 1234567890 ) julianDayNumber
    equals: (2356681421/960)"~2454876.4802083";
assert: (Instant fromUnixTime: -2208985200 ) julianDayNumber
equals: (57960493/24)"~2415020.5416667"
]

{ #category : 'tests' }
InstantTest >> testMagnitudeProtocol [

  | epoch now |
  epoch := Instant epoch.
  now := Instant now.

  self
    assert: now > epoch;
    assert: now >= epoch;
    assert: epoch < now;
    assert: epoch <= now;
    deny: epoch equals: now;
    assert: now equals: now;
    assert: now hash equals: now hash
]

{ #category : 'tests' }
InstantTest >> testPrintString [

  self
    assert: Instant epoch printString equals: '1970-01-01T00:00:00.000000Z';
    assert: ( Instant epoch next: self oneDay ) printString equals: '1970-01-02T00:00:00.000000Z';
    assert: ( Instant epoch previous: self oneSecond ) printString
    equals: '1969-12-31T23:59:59.000000Z';
    assert: ( Instant daysSinceEpoch: self oneDay ) printString
    equals: '1970-01-02T00:00:00.000000Z';
    assert: ( Instant epoch previous: self oneSecond + self oneDay ) printString
    equals: '1969-12-30T23:59:59.000000Z';
    assert: ( Instant epoch previous: self oneSecond + self threeHours + self oneDay ) printString
    equals: '1969-12-30T20:59:59.000000Z';
    assert: ( Instant fromUnixTime: 1262304000 ) printString equals: '2010-01-01T00:00:00.000000Z';
    assert: ( Instant epoch next: 365 * ( self unit: #day ) ) printString
    equals: '1971-01-01T00:00:00.000000Z';
    assert: ( Instant fromUnixTime: 31536000 ) printString equals: '1971-01-01T00:00:00.000000Z';
    assert: ( Instant fromUnixTime: -31536000 ) printString equals: '1969-01-01T00:00:00.000000Z';
    assert: ( Instant fromUnixTime: 119731017 ) printString equals: '1973-10-17T18:36:57.000000Z';
    assert: ( Instant fromUnixTime: 1000000000 ) printString equals: '2001-09-09T01:46:40.000000Z';
    assert: ( Instant fromUnixTime: 1234567890 ) printString equals: '2009-02-13T23:31:30.000000Z';
    assert: ( Instant fromUnixTime: -2208985200 ) printString equals: '1900-01-01T01:00:00.000000Z'
]

{ #category : 'private' }
InstantTest >> threeHours [

  ^ 3 * ( self unit: #hour )
]

{ #category : 'private' }
InstantTest >> unit: symbol [

  ^ InternationalSystemOfUnits units >> symbol
]
