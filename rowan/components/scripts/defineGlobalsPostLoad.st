| symbolDictionary gregorianCalendar |

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

gregorianCalendar := ChaltenEnvironment calendarNamed: #GregorianCalendar.
symbolDictionary at: #Monday put: gregorianCalendar monday.
symbolDictionary at: #Tuesday put: gregorianCalendar tuesday.
symbolDictionary at: #Wednesday put: gregorianCalendar wednesday.
symbolDictionary at: #Thursday put: gregorianCalendar thursday.
symbolDictionary at: #Friday put: gregorianCalendar friday.
symbolDictionary at: #Saturday put: gregorianCalendar saturday.
symbolDictionary at: #Sunday put: gregorianCalendar sunday.

symbolDictionary at: #January put: gregorianCalendar january.
symbolDictionary at: #February put: gregorianCalendar february.
symbolDictionary at: #March put: gregorianCalendar march.
symbolDictionary at: #April put: gregorianCalendar april.
symbolDictionary at: #May put: gregorianCalendar may.
symbolDictionary at: #June put: gregorianCalendar june.
symbolDictionary at: #July put: gregorianCalendar july.
symbolDictionary at: #August put: gregorianCalendar august.
symbolDictionary at: #September put: gregorianCalendar september.
symbolDictionary at: #October put: gregorianCalendar october.
symbolDictionary at: #November put: gregorianCalendar november.
symbolDictionary at: #December put: gregorianCalendar december.
