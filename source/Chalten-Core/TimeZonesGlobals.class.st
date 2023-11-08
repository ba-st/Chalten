"
A TimeZonesGlobals is a helper object with some time zones. Use it calling to TimeZones, for example TimeZones buenosAires.

Instance Variables
	timeZones:		<Collection>

timeZones
	- A collection of time zones.

"
Class {
	#name : 'TimeZonesGlobals',
	#superclass : 'Object',
	#instVars : [
		'timeZones'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Chalten-Core-Time',
	#package : 'Chalten-Core',
	#tag : 'Time'
}

{ #category : 'class initialization' }
TimeZonesGlobals class >> initialize [

	<ignoreForCoverage>
	self initializeUniqueInstance
]

{ #category : 'initialization' }
TimeZonesGlobals class >> initializeUniqueInstance [
	"cannot be invoked by initialize, because environment must be defined"

	uniqueInstance := super new initialize
]

{ #category : 'instance creation' }
TimeZonesGlobals class >> new [

	^uniqueInstance
]

{ #category : 'accessing timezones dst' }
TimeZonesGlobals >> britishSummerTime [

	^self timeZoneNamed: self britishSummerTimeZoneName
]

{ #category : 'accessing timezones names' }
TimeZonesGlobals >> britishSummerTimeZoneName [

	^'BST British Summer Time'
]

{ #category : 'accessing timezones offsets' }
TimeZonesGlobals >> britishSummerTimeZoneOffset [

	^Offset of: 1
]

{ #category : 'accessing timezones' }
TimeZonesGlobals >> buenosAires [

	^self timeZoneNamed: self buenosAiresTimeZoneName
]

{ #category : 'accessing timezones dst' }
TimeZonesGlobals >> buenosAiresSummerTime [

	^self timeZoneNamed: self buenosAiresSummerTimeZoneName
]

{ #category : 'accessing timezones names' }
TimeZonesGlobals >> buenosAiresSummerTimeZoneName [

	^'DST Buenos Aires, Georgetown'
]

{ #category : 'accessing timezones offsets' }
TimeZonesGlobals >> buenosAiresSummerTimeZoneOffset [

	^Offset of: -2
]

{ #category : 'accessing timezones names' }
TimeZonesGlobals >> buenosAiresTimeZoneName [

	^'Buenos Aires, Georgetown'
]

{ #category : 'accessing timezones offsets' }
TimeZonesGlobals >> buenosAiresTimeZoneOffset [

	^Offset of: -3
]

{ #category : 'initialization - private' }
TimeZonesGlobals >> createBritishSummerTimeZone [

	^ self 
		createTimeZoneNamed: self britishSummerTimeZoneName
		offset: self britishSummerTimeZoneOffset
]

{ #category : 'initialization - private' }
TimeZonesGlobals >> createBuenosAiresSummerTimeZone [

	^ self 
		createTimeZoneNamed: self buenosAiresSummerTimeZoneName
		offset: self buenosAiresSummerTimeZoneOffset
]

{ #category : 'initialization - private' }
TimeZonesGlobals >> createBuenosAiresTimeZone [

	^ self 
		createTimeZoneNamed: self buenosAiresTimeZoneName
		offset: self buenosAiresTimeZoneOffset
]

{ #category : 'initialization - private' }
TimeZonesGlobals >> createGreenwichTimeZone [

	^ self 
		createTimeZoneNamed: self greenwichTimeZoneName
		offset: self greenwichTimeZoneOffset
]

{ #category : 'initialization - private' }
TimeZonesGlobals >> createLocalTimeZone [

	^ self 
		createTimeZoneNamed: self localTimeZoneName
		offset: self localTimeZoneOffset
]

{ #category : 'initialization - private' }
TimeZonesGlobals >> createPacificDaylightTimeZone [

	^ self 
		createTimeZoneNamed: self pacificDaylightTimeZoneName
		offset: self pacificDaylightTimeZoneOffset
]

{ #category : 'initialization - private' }
TimeZonesGlobals >> createPacificStandardTimeZone [

	^ self 
		createTimeZoneNamed: self pacificStandardTimeZoneName
		offset: self pacificStandardTimeZoneOffset
]

{ #category : 'timezones creation' }
TimeZonesGlobals >> createTimeZoneNamed: aName offset: anOffset [

	^ChaltenTimeZone
		named: aName
		offset: anOffset
]

{ #category : 'initialization - private' }
TimeZonesGlobals >> createUniversalTimeZone [

	^ self 
		createTimeZoneNamed: self universalTimeZoneName
		offset: self universalTimeZoneOffset
]

{ #category : 'accessing timezones' }
TimeZonesGlobals >> greenwich [

	^self timeZoneNamed: self greenwichTimeZoneName
]

{ #category : 'accessing timezones names' }
TimeZonesGlobals >> greenwichTimeZoneName [
	^ 'Greenwich'
]

{ #category : 'accessing timezones offsets' }
TimeZonesGlobals >> greenwichTimeZoneOffset [

	^Offset of: 0
]

{ #category : 'initialization' }
TimeZonesGlobals >> initialize [

	self initializeTimeZones
]

{ #category : 'initialization - private' }
TimeZonesGlobals >> initializeTimeZones [

	timeZones := Dictionary new.
	timeZones
		at: self localTimeZoneName put: self createLocalTimeZone;
		at: self universalTimeZoneName put: self createUniversalTimeZone;
		at: self greenwichTimeZoneName put: self createGreenwichTimeZone;
		at: self britishSummerTimeZoneName put: self createBritishSummerTimeZone;
		at: self buenosAiresTimeZoneName put: self createBuenosAiresTimeZone;
		at: self buenosAiresSummerTimeZoneName put: self createBuenosAiresSummerTimeZone;
		at: self pacificStandardTimeZoneName put: self createPacificStandardTimeZone;
		at: self pacificDaylightTimeZoneName put: self createPacificDaylightTimeZone
]

{ #category : 'accessing timezones' }
TimeZonesGlobals >> local [

	^self timeZoneNamed: self localTimeZoneName
]

{ #category : 'accessing timezones names' }
TimeZonesGlobals >> localTimeZoneName [

	^'Local Time'
]

{ #category : 'accessing timezones offsets' }
TimeZonesGlobals >> localTimeZoneOffset [

	^Offset of: ChaltenEnvironment localTimeOffset
]

{ #category : 'accessing timezones dst' }
TimeZonesGlobals >> pacificDaylightTime [

	^self timeZoneNamed: self pacificDaylightTimeZoneName
]

{ #category : 'accessing timezones names' }
TimeZonesGlobals >> pacificDaylightTimeZoneName [
	^ 'PDT Pacific Daylight Time'
]

{ #category : 'accessing timezones offsets' }
TimeZonesGlobals >> pacificDaylightTimeZoneOffset [

	^Offset of: -7
]

{ #category : 'accessing timezones' }
TimeZonesGlobals >> pacificStandardTime [

	^self timeZoneNamed: self pacificStandardTimeZoneName
]

{ #category : 'accessing timezones names' }
TimeZonesGlobals >> pacificStandardTimeZoneName [
	^ 'PST Pacific Standard Time'
]

{ #category : 'accessing timezones offsets' }
TimeZonesGlobals >> pacificStandardTimeZoneOffset [

	^Offset of: -8
]

{ #category : 'accessing timezones' }
TimeZonesGlobals >> timeZoneNamed: aName [

	^timeZones at: aName
]

{ #category : 'accessing timezones' }
TimeZonesGlobals >> universalTime [

	^self timeZoneNamed: self universalTimeZoneName
]

{ #category : 'accessing timezones names' }
TimeZonesGlobals >> universalTimeZoneName [
	^ 'Universal Time'
]

{ #category : 'accessing timezones offsets' }
TimeZonesGlobals >> universalTimeZoneOffset [

	^Offset of: 0
]
