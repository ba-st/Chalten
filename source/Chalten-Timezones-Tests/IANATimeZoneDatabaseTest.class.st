"
An IANATimeZoneDatabaseTest is a test class for testing the behavior of IANATimeZoneDatabase
"
Class {
	#name : 'IANATimeZoneDatabaseTest',
	#superclass : 'ChaltenTest',
	#instVars : [
		'buenosAiresTimeZoneRuleset'
	],
	#category : 'Chalten-Timezones-Tests',
	#package : 'Chalten-Timezones-Tests'
}

{ #category : 'private' }
IANATimeZoneDatabaseTest >> offsetInBuenosAiresAtUnixTime: secondCount [

  ^ buenosAiresTimeZoneRuleset offsetToUniversalCoordinatedTimeAt:
      ( Instant fromUnixTime: secondCount )
]

{ #category : 'running' }
IANATimeZoneDatabaseTest >> setUp [

  super setUp.
  buenosAiresTimeZoneRuleset := IANATimeZoneDatabase current at: 'America/Argentina/Buenos_Aires'
]

{ #category : 'tests' }
IANATimeZoneDatabaseTest >> testAt [

  self assert: buenosAiresTimeZoneRuleset identifier equals: 'America/Argentina/Buenos_Aires'
]

{ #category : 'tests' }
IANATimeZoneDatabaseTest >> testAtInvalidTimeZone [

  self
    should: [ IANATimeZoneDatabase current at: 'XXX' ]
    raise: ObjectNotFound
    withMessageText: 'XXX is not a valid time zone identifier'
]

{ #category : 'tests' }
IANATimeZoneDatabaseTest >> testOffsetToUniversalCoordinatedTimeAt [

  self
    assert: ( buenosAiresTimeZoneRuleset offsetToUniversalCoordinatedTimeAt: Instant now )
    equals: -3 * hour;
    assert: ( buenosAiresTimeZoneRuleset offsetToUniversalCoordinatedTimeAt: Instant epoch )
    equals: -3 * hour
]

{ #category : 'tests' }
IANATimeZoneDatabaseTest >> testOffsetToUniversalCoordinatedTimeAtTransitionMoment [

  "There was a transition at  2008-10-19T03:00:00.000000Z from UTC-3 to UTC-2 (Unix Time: 1224385200)"
  self
    assert: ( self offsetInBuenosAiresAtUnixTime: 1224385199 ) equals: -3 * hour;
    assert: ( self offsetInBuenosAiresAtUnixTime: 1224385200 ) equals: -2 * hour;
    assert: ( self offsetInBuenosAiresAtUnixTime: 1224385201 ) equals: -2 * hour
]

{ #category : 'tests' }
IANATimeZoneDatabaseTest >> testOffsetToUniversalCoordinatedTimeBeforeFirstTransition [

  self
    assert: ( self offsetInBuenosAiresAtUnixTime: -2208988800 )
    equals: -3 * hour - ( 53 * TimeOfDay minute ) - ( 48 * TimeOfDay second )
]

{ #category : 'tests' }
IANATimeZoneDatabaseTest >> testTimeZoneIdentifiers [

  self
    assert: IANATimeZoneDatabase current timeZoneIdentifiers notEmpty;
    assert: IANATimeZoneDatabase current timeZoneIdentifiers includes: 'Africa/Johannesburg';
    assert: IANATimeZoneDatabase current timeZoneIdentifiers
    includes: 'America/Argentina/Buenos_Aires';
    assert: IANATimeZoneDatabase current timeZoneIdentifiers includes: 'America/Lima';
    assert: IANATimeZoneDatabase current timeZoneIdentifiers includes: 'America/Los_Angeles';
    assert: IANATimeZoneDatabase current timeZoneIdentifiers includes: 'America/New_York';
    assert: IANATimeZoneDatabase current timeZoneIdentifiers includes: 'America/Vancouver';
    assert: IANATimeZoneDatabase current timeZoneIdentifiers includes: 'Asia/Dubai';
    assert: IANATimeZoneDatabase current timeZoneIdentifiers includes: 'Asia/Hong_Kong';
    assert: IANATimeZoneDatabase current timeZoneIdentifiers includes: 'Asia/Seoul';
    assert: IANATimeZoneDatabase current timeZoneIdentifiers includes: 'Asia/Shanghai';
    assert: IANATimeZoneDatabase current timeZoneIdentifiers includes: 'Asia/Singapore';
    assert: IANATimeZoneDatabase current timeZoneIdentifiers includes: 'Asia/Tokyo';
    assert: IANATimeZoneDatabase current timeZoneIdentifiers includes: 'Australia/Melbourne';
    assert: IANATimeZoneDatabase current timeZoneIdentifiers includes: 'Europe/Athens';
    assert: IANATimeZoneDatabase current timeZoneIdentifiers includes: 'Europe/Berlin';
    assert: IANATimeZoneDatabase current timeZoneIdentifiers includes: 'Europe/Brussels';
    assert: IANATimeZoneDatabase current timeZoneIdentifiers includes: 'Europe/London';
    assert: IANATimeZoneDatabase current timeZoneIdentifiers includes: 'Europe/Madrid';
    assert: IANATimeZoneDatabase current timeZoneIdentifiers includes: 'Europe/Paris';
    assert: IANATimeZoneDatabase current timeZoneIdentifiers includes: 'Europe/Rome';
    assert: IANATimeZoneDatabase current timeZoneIdentifiers includes: 'Europe/Zurich';
    assert: IANATimeZoneDatabase current timeZoneIdentifiers includes: 'Pacific/Honolulu'
]
