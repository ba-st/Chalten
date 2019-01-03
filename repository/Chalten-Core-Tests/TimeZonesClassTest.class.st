Class {
	#name : #TimeZonesClassTest,
	#superclass : #TestCase,
	#instVars : [
		'hourInBsAs',
		'hourInGreenwich'
	],
	#category : #'Chalten-Core-Tests-Time'
}

{ #category : #'test accessing' }
TimeZonesClassTest >> testAccessingTimeZones [

	self assert: TimeZones local = (TimeZones timeZoneNamed: TimeZones localTimeZoneName).
	self assert: TimeZones buenosAires = (TimeZones timeZoneNamed: TimeZones buenosAiresTimeZoneName).
	self assert: TimeZones greenwich = (TimeZones timeZoneNamed: TimeZones greenwichTimeZoneName).
	self assert: TimeZones pacificStandardTime = (TimeZones timeZoneNamed: TimeZones pacificStandardTimeZoneName).
	self assert: TimeZones universalTime = (TimeZones timeZoneNamed: TimeZones universalTimeZoneName).
	self assert: TimeZones britishSummerTime = (TimeZones timeZoneNamed: TimeZones britishSummerTimeZoneName).
	self assert: TimeZones buenosAiresSummerTime = (TimeZones timeZoneNamed: TimeZones buenosAiresSummerTimeZoneName).
	self assert: TimeZones pacificDaylightTime = (TimeZones timeZoneNamed: TimeZones pacificDaylightTimeZoneName)
]

{ #category : #'test accessing' }
TimeZonesClassTest >> testAccessingTimeZonesNames [

	self assert: TimeZones localTimeZoneName = 'Local Time'.
	self assert: TimeZones buenosAiresTimeZoneName = 'Buenos Aires, Georgetown'.
	self assert: TimeZones greenwichTimeZoneName = 'Greenwich'.
	self assert: TimeZones pacificStandardTimeZoneName = 'PST Pacific Standard Time'.
	self assert: TimeZones universalTimeZoneName = 'Universal Time'.
	self assert: TimeZones britishSummerTimeZoneName = 'BST British Summer Time'.
	self assert: TimeZones buenosAiresSummerTimeZoneName = 'DST Buenos Aires, Georgetown'.
	self assert: TimeZones pacificDaylightTimeZoneName = 'PDT Pacific Daylight Time'
]

{ #category : #'test accessing' }
TimeZonesClassTest >> testAccessingTimeZonesOffsets [

	self assert: TimeZones localTimeZoneOffset = (Offset of: ChaltenEnvironment localTimeOffset).
	self assert: TimeZones buenosAiresTimeZoneOffset = (Offset of: -3).
	self assert: TimeZones greenwichTimeZoneOffset = (Offset of: 0).
	self assert: TimeZones pacificStandardTimeZoneOffset = (Offset of: -8).
	self assert: TimeZones universalTimeZoneOffset = (Offset of: 0).
	self assert: TimeZones britishSummerTimeZoneOffset = (Offset of: 1).
	self assert: TimeZones buenosAiresSummerTimeZoneOffset = (Offset of: -2).
	self assert: TimeZones pacificDaylightTimeZoneOffset = (Offset of: -7)
]

{ #category : #'test timezones creation' }
TimeZonesClassTest >> testCreateTimeZoneNamedOfsset [
	| zone |
	zone := TimeZones createTimeZoneNamed: 'Test Time Zone' offset: (Offset of: -3).
	self assert: zone offset = (Offset ofHours: -3 hoursMeasure).
	self assert: zone printString = '(GMT-03:00) Test Time Zone'
]
