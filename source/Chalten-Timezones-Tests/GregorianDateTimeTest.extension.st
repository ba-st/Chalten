Extension { #name : 'GregorianDateTimeTest' }

{ #category : '*Chalten-Timezones-Tests' }
GregorianDateTimeTest >> testInTimeZone [

  | buenosAires tokyo |
  buenosAires := IANATimeZoneDatabase current at: 'America/Argentina/Buenos_Aires'.
  tokyo := IANATimeZoneDatabase current at: 'Asia/Tokyo'.
  self
    assert: ( ( january first , 1970 ) atMidnight in: buenosAires ) printString
    equals: '1970-01-01T00:00:00.000000-03:00';
    assert: ( ( january first , 1970 ) atMidnight in: tokyo ) printString
    equals: '1970-01-01T00:00:00.000000+09:00'
]

{ #category : '*Chalten-Timezones-Tests' }
GregorianDateTimeTest >> testInTimeZoneWhenLocalTimeIsAmbiguous [
  "This occurs for transitions where the clock goes backward (usually by an hour). For example,
	suppose the time zone goes backward at 2am, so the second after 01:59:59 becomes 01:00:00.
	In that case, times such as 01:30:00 occur twice. "

  | newYork |
  newYork := IANATimeZoneDatabase current at: 'America/New_York'.
  self
    should: [ ( november second , 2025 at: ( TimeOfDay hours: 1 minutes: 30 ) ) in: newYork ]
    raise: AmbiguousTimeError
    withExceptionDo: [ :error |
        self
          assert: error earlierDateTime printString equals: '2025-11-02T01:30:00.000000-04:00';
          assert: error laterDateTime printString equals: '2025-11-02T01:30:00.000000-05:00';
          assert: error earlierDateTime < error laterDateTime;
          assert: error messageText
          equals:
            'Cannot convert the local date time into an absolute point in time because it''s ambiguous in this timezone'
      ]
]

{ #category : '*Chalten-Timezones-Tests' }
GregorianDateTimeTest >> testInTimeZoneWhenLocalTimeIsSkipped [
  "This occurs for transitions where the clock goes forward (usually by an hour).
	In these cases some local times are skipped entirely	"

  | newYork |
  newYork := IANATimeZoneDatabase current at: 'America/New_York'.
  self
    should: [ ( march ninth , 2025 at: ( TimeOfDay hours: 2 minutes: 30 ) ) in: newYork ]
    raise: SkippedTimeError
    withMessageText:
    'The local time doesn''t exist in the timezone due to daylight saving time changes.'
]
