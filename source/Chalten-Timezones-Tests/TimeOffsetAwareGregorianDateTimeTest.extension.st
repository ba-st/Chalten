Extension { #name : 'TimeOffsetAwareGregorianDateTimeTest' }

{ #category : '*Chalten-Timezones-Tests' }
TimeOffsetAwareGregorianDateTimeTest >> testInTimeZone [

  | unixEpoch buenosAires tokyo |
  unixEpoch := Instant epoch asGregorianDateTimeInCoordinatedUniversalTime.
  buenosAires := IANATimeZoneDatabase current at: 'America/Argentina/Buenos_Aires'.
  tokyo := IANATimeZoneDatabase current at: 'Asia/Tokyo'.
  self
    assert: ( unixEpoch in: buenosAires ) printString equals: '1969-12-31T21:00:00.000000-03:00';
    assert: ( unixEpoch in: buenosAires ) equals: unixEpoch;
    assert: ( unixEpoch in: buenosAires ) equals: ( unixEpoch in: utcMinus6 );
    assert: ( unixEpoch in: tokyo ) printString equals: '1970-01-01T09:00:00.000000+09:00';
    assert: ( unixEpoch in: buenosAires ) equals: ( unixEpoch in: tokyo )
]

{ #category : '*Chalten-Timezones-Tests' }
TimeOffsetAwareGregorianDateTimeTest >> testInTimeZoneWhenLocalTimeIsAmbiguous [

  | first second newYork |
  first := ( Instant fromUnixTime: 1762061400 ) asGregorianDateTimeInCoordinatedUniversalTime.
  second := ( Instant fromUnixTime: 1762065000 ) asGregorianDateTimeInCoordinatedUniversalTime.
  newYork := IANATimeZoneDatabase current at: 'America/New_York'.

  self
    assert: ( first in: newYork ) printString equals: '2025-11-02T01:30:00.000000-04:00';
    assert: ( second in: newYork ) printString equals: '2025-11-02T01:30:00.000000-05:00'.

  "When using the local time scale the same local time happens twice a day
	but at different absolute instants "
  self
    assert: ( first in: newYork ) asRelativePointInTime printAsISO8601String
    equals: '2025-11-02T01:30:00.000000';
    assert: ( second in: newYork ) asRelativePointInTime printAsISO8601String
    equals: '2025-11-02T01:30:00.000000';
    assert: ( first in: newYork ) asRelativePointInTime
    equals: ( second in: newYork ) asRelativePointInTime
]
