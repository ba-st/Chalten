Class {
	#name : #ChaltenTimeZoneTest,
	#superclass : #TestCase,
	#instVars : [
		'buenosAiresTimeZone',
		'universalTimeZone'
	],
	#category : #'Chalten-Core-Tests-Time'
}

{ #category : #initialization }
ChaltenTimeZoneTest >> setUp [

	buenosAiresTimeZone := ChaltenTimeZone named: 'Buenos Aires, Georgetown' offset: (Offset of: -3).
	universalTimeZone := ChaltenTimeZone named: 'Universal Time Zone' offset: (Offset of: 0)
]

{ #category : #'test offset aplying' }
ChaltenTimeZoneTest >> testApplyOffsetToFrom [

	| otherZone dateTime |
	otherZone := ChaltenTimeZone named: 'Test Time Zone' offset: (Offset of: -11).
	
	dateTime := buenosAiresTimeZone
		applyOffsetTo: (DateTime
			date: August fifteenth, 2008
			timeOfDay: (TimeOfDay hours: 16 minutes: 55 seconds: 45)
			zone: buenosAiresTimeZone)
		from: otherZone.
	self assert: dateTime = (DateTime
		date: August fifteenth, 2008
		timeOfDay: (TimeOfDay hours: 8 minutes: 55 seconds: 45)
		zone: otherZone).
	
	dateTime := universalTimeZone
		applyOffsetTo: (DateTime
			date: August fifteenth, 2008
			timeOfDay: (TimeOfDay hours: 16 minutes: 55 seconds: 45)
			zone: universalTimeZone)
		from: otherZone.
	self assert: dateTime = (DateTime
		date: August fifteenth, 2008
		timeOfDay: (TimeOfDay hours: 5 minutes: 55 seconds: 45)
		zone: otherZone)

]

{ #category : #'test accessing' }
ChaltenTimeZoneTest >> testOffset [

	self assert: buenosAiresTimeZone offset = (Offset of: -3).
	self assert: universalTimeZone offset = (Offset of: 0)
]

{ #category : #'test printing' }
ChaltenTimeZoneTest >> testPrintString [

	self assert: buenosAiresTimeZone printString = '(GMT-03:00) Buenos Aires, Georgetown'.
	self assert: universalTimeZone printString = '(GMT00:00) Universal Time Zone'
]
