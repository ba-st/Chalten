Class {
	#name : 'TimeZonesClassTest',
	#superclass : 'TestCase',
	#instVars : [
		'hourInBsAs',
		'hourInGreenwich'
	],
	#category : 'Chalten-Core-Tests-Time',
	#package : 'Chalten-Core-Tests',
	#tag : 'Time'
}

{ #category : 'test accessing' }
TimeZonesClassTest >> testAccessingTimeZones [

	self
		assert: TimeZones local
		equals: (TimeZones timeZoneNamed: TimeZones localTimeZoneName).
	self
		assert: TimeZones buenosAires
		equals: (TimeZones timeZoneNamed: TimeZones buenosAiresTimeZoneName).
	self
		assert: TimeZones greenwich
		equals: (TimeZones timeZoneNamed: TimeZones greenwichTimeZoneName).
	self
		assert: TimeZones pacificStandardTime
		equals:
		(TimeZones timeZoneNamed: TimeZones pacificStandardTimeZoneName).
	self
		assert: TimeZones universalTime
		equals: (TimeZones timeZoneNamed: TimeZones universalTimeZoneName).
	self
		assert: TimeZones britishSummerTime
		equals:
		(TimeZones timeZoneNamed: TimeZones britishSummerTimeZoneName).
	self
		assert: TimeZones buenosAiresSummerTime
		equals:
		(TimeZones timeZoneNamed: TimeZones buenosAiresSummerTimeZoneName).
	self
		assert: TimeZones pacificDaylightTime
		equals:
		(TimeZones timeZoneNamed: TimeZones pacificDaylightTimeZoneName)
]

{ #category : 'test accessing' }
TimeZonesClassTest >> testAccessingTimeZonesNames [

	self assert: TimeZones localTimeZoneName equals: 'Local Time'.
	self
		assert: TimeZones buenosAiresTimeZoneName
		equals: 'Buenos Aires, Georgetown'.
	self assert: TimeZones greenwichTimeZoneName equals: 'Greenwich'.
	self
		assert: TimeZones pacificStandardTimeZoneName
		equals: 'PST Pacific Standard Time'.
	self assert: TimeZones universalTimeZoneName equals: 'Universal Time'.
	self
		assert: TimeZones britishSummerTimeZoneName
		equals: 'BST British Summer Time'.
	self
		assert: TimeZones buenosAiresSummerTimeZoneName
		equals: 'DST Buenos Aires, Georgetown'.
	self
		assert: TimeZones pacificDaylightTimeZoneName
		equals: 'PDT Pacific Daylight Time'
]

{ #category : 'test accessing' }
TimeZonesClassTest >> testAccessingTimeZonesOffsets [

	self
		assert: TimeZones localTimeZoneOffset
		equals: (Offset of: ChaltenEnvironment localTimeOffset).
	self
		assert: TimeZones buenosAiresTimeZoneOffset
		equals: (Offset of: -3).
	self assert: TimeZones greenwichTimeZoneOffset equals: (Offset of: 0).
	self
		assert: TimeZones pacificStandardTimeZoneOffset
		equals: (Offset of: -8).
	self assert: TimeZones universalTimeZoneOffset equals: (Offset of: 0).
	self
		assert: TimeZones britishSummerTimeZoneOffset
		equals: (Offset of: 1).
	self
		assert: TimeZones buenosAiresSummerTimeZoneOffset
		equals: (Offset of: -2).
	self
		assert: TimeZones pacificDaylightTimeZoneOffset
		equals: (Offset of: -7)
]

{ #category : 'test timezones creation' }
TimeZonesClassTest >> testCreateTimeZoneNamedOfsset [

	| zone |
	zone := TimeZones
		        createTimeZoneNamed: 'Test Time Zone'
		        offset: (Offset of: -3).
	self assert: zone offset equals: (Offset ofHours: -3 hoursMeasure).
	self assert: zone printString equals: '(GMT-03:00) Test Time Zone'
]
