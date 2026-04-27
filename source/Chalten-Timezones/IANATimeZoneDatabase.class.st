"
I provide access to the IANA Time zone database.

The location of the database files can be configured sending `zoneInfoLocation:`.
On Windows the users need to configure this location because there's no standard place where this database is located.
On Unix if the `zoneInfoLocation` is not configured, lookup the value on the `TZDIR` environment variable, if the variable
is not defined default to `/usr/share/zoneinfo/`.

To access the available time zones send `IANATimeZoneDatabase current timeZoneIdentifiers` and to access a specific
time zone ruleset send `IANATimeZoneDatabase current at: {timeZoneId}`.

To reload the database send `IANATimeZoneDatabase current reloadAllTimeZoneRulesets`
"
Class {
	#name : 'IANATimeZoneDatabase',
	#superclass : 'Object',
	#instVars : [
		'timeZoneIdentifiers',
		'timeZoneRulesets'
	],
	#classInstVars : [
		'Current',
		'ZoneInfoLocation'
	],
	#category : 'Chalten-Timezones',
	#package : 'Chalten-Timezones'
}

{ #category : 'accessing' }
IANATimeZoneDatabase class >> current [

  Current ifNil: [ Current := self new ].
  ^ Current
]

{ #category : 'accessing' }
IANATimeZoneDatabase class >> zoneInfoLocation [

  ^ ZoneInfoLocation
      ifNil: [ "On Unix-like systems there's an standard location for the timezone database"
          LanguagePlatform current os
            environmentAt: 'TZDIR'
            ifPresent: [ :directory | directory asFileReference ]
            ifAbsent: [ '/usr/share/zoneinfo/' asFileReference ]
        ]
      ifNotNil: [ :location | location ]
]

{ #category : 'accessing' }
IANATimeZoneDatabase class >> zoneInfoLocation: directory [
  "Allow to configure the location of the zone info database for OS
	that don't have an standard one like Windows"

  <ignoreForCoverage>
  ZoneInfoLocation := directory asFileReference
]

{ #category : 'accessing' }
IANATimeZoneDatabase >> at: timeZoneIdentifier [

  AssertionChecker
    enforce: [ timeZoneIdentifiers includes: timeZoneIdentifier ]
    because: [ '{1} is not a valid time zone identifier' localizedWithAll: { timeZoneIdentifier } ]
    raising: ObjectNotFound.

  ^ timeZoneRulesets
      at: timeZoneIdentifier
      ifAbsentPut: [ self loadRulesetIdentifiedBy: timeZoneIdentifier ]
]

{ #category : 'initialization' }
IANATimeZoneDatabase >> initialize [

  super initialize.
  self reloadTimeZoneIdentifiers.
  timeZoneRulesets := Dictionary new
]

{ #category : 'private - initialization' }
IANATimeZoneDatabase >> loadRulesetIdentifiedBy: identifier [

  | rulesetLocation |
  rulesetLocation := self class zoneInfoLocation.
  ( $/ split: identifier ) do: [ :each | rulesetLocation := rulesetLocation / each ].
  ^ rulesetLocation binaryReadStreamDo: [ :stream |
        self loadRulesetIdentifiedBy: identifier from: stream ]
]

{ #category : 'private - initialization' }
IANATimeZoneDatabase >> loadRulesetIdentifiedBy: identifier from: binaryStream [

  | parsedData |
  parsedData := IANATimeZoneDatabaseParser new parse: binaryStream.
  ^ TimeZoneRuleset
      identifiedBy: identifier
      withAll: ( parsedData at: #rulesets )
      transitioningOn: ( parsedData at: #transitions )
]

{ #category : 'initialization' }
IANATimeZoneDatabase >> reloadAllTimeZoneRulesets [

  self timeZoneIdentifiers do: [ :id |
      timeZoneRulesets at: id put: ( self loadRulesetIdentifiedBy: id ) ]
]

{ #category : 'initialization' }
IANATimeZoneDatabase >> reloadTimeZoneIdentifiers [

  | zoneInfo identifiers |
  identifiers := OrderedCollection new.
  zoneInfo := ( self class zoneInfoLocation / 'zone1970.tab' ) contents.
  zoneInfo linesDo: [ :line |
      [ "zone1970 format is tab-separated columns per-line
		The first column are the country codes in which this time zone is used separated by commas.
		The second are the coordinates
		The third column is the time zone name
		The fourt column (if available) includes comments"
        identifiers add: ( line substrings: String tab ) third ] unless: ( line beginsWith: '#' )
    ].
  timeZoneIdentifiers := identifiers sorted asArray
]

{ #category : 'accessing' }
IANATimeZoneDatabase >> timeZoneIdentifiers [

  ^ timeZoneIdentifiers
]
