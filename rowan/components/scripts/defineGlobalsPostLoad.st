| symbolDictionary |
symbolDictionary := Rowan image 
	symbolDictNamed: 'Chalten'
	ifAbsent: [Error signal: 'Chalten symbol dictionary missing' ].

"Global variables definition"

symbolDictionary at: #ChaltenEnvironment put: ChaltenEnvironmentBehavior initializeEnvironment new.
symbolDictionary at: #TimeUnits put: (TimeUnitsGlobals initializeUniqueInstance; new).
TimeOfDay initializeTimesOfDay. "Cannot be invoked from TimeOfDay class>>initialize because depends on TimeUnits global"
CalendarDefinition allSubclassesDo: [ :each | each subclasses ifEmpty: [ each initializeCalendar ] ].
symbolDictionary at: #TheBeginningOfTime put: (TheBeginningOfTimeClass initializeUniqueInstance; new).
symbolDictionary at: #TheEndOfTime put: (TheEndOfTimeClass initializeUniqueInstance; new).
symbolDictionary at: #TimeZones put: (TimeZonesGlobals initializeUniqueInstance; new).

"Gregorian calendar specific globals"

symbolDictionary at: #Monday put: (ChaltenEnvironment calendarNamed: #GregorianCalendar) monday.
symbolDictionary at: #Tuesday put: (ChaltenEnvironment calendarNamed: #GregorianCalendar) tuesday.
symbolDictionary at: #Wednesday put: (ChaltenEnvironment calendarNamed: #GregorianCalendar) wednesday.
symbolDictionary at: #Thursday put: (ChaltenEnvironment calendarNamed: #GregorianCalendar) thursday.
symbolDictionary at: #Friday put: (ChaltenEnvironment calendarNamed: #GregorianCalendar) friday.
symbolDictionary at: #Saturday put: (ChaltenEnvironment calendarNamed: #GregorianCalendar) saturday.
symbolDictionary at: #Sunday put: (ChaltenEnvironment calendarNamed: #GregorianCalendar) sunday.

symbolDictionary at: #January put: (ChaltenEnvironment calendarNamed: #GregorianCalendar) january.
symbolDictionary at: #February put: (ChaltenEnvironment calendarNamed: #GregorianCalendar) february.
symbolDictionary at: #March put: (ChaltenEnvironment calendarNamed: #GregorianCalendar) march.
symbolDictionary at: #April put: (ChaltenEnvironment calendarNamed: #GregorianCalendar) april.
symbolDictionary at: #May put: (ChaltenEnvironment calendarNamed: #GregorianCalendar) may.
symbolDictionary at: #June put: (ChaltenEnvironment calendarNamed: #GregorianCalendar) june.
symbolDictionary at: #July put: (ChaltenEnvironment calendarNamed: #GregorianCalendar) july.
symbolDictionary at: #August put: (ChaltenEnvironment calendarNamed: #GregorianCalendar) august.
symbolDictionary at: #September put: (ChaltenEnvironment calendarNamed: #GregorianCalendar) september.
symbolDictionary at: #October put: (ChaltenEnvironment calendarNamed: #GregorianCalendar) october.
symbolDictionary at: #November put: (ChaltenEnvironment calendarNamed: #GregorianCalendar) november.
symbolDictionary at: #December put: (ChaltenEnvironment calendarNamed: #GregorianCalendar) december.
