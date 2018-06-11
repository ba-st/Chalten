test offset aplying
testApplyOffsetToFrom

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
