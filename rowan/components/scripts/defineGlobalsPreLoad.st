| symbolDictionary |
symbolDictionary := Rowan image 
	symbolDictNamed: 'Chalten'
	ifAbsent: [
			Rowan image symbolList createDictionaryNamed: 'Chalten' at: Rowan image symbolList size + 1.
			Rowan image symbolDictNamed: 'Chalten'
	].

"Preliminar definition of global variables for source code to compile.
 These will be properly replaced later in the post load script."

symbolDictionary at: #ChaltenEnvironment put: nil.
symbolDictionary at: #TimeUnits put: nil.
symbolDictionary at: #TimeZones put: nil.
symbolDictionary at: #TheBeginningOfTime put: nil.
symbolDictionary at: #TheEndOfTime put: nil.

"Gregorian calendar specific globals"

symbolDictionary at: #Monday put: nil.
symbolDictionary at: #Tuesday put: nil.
symbolDictionary at: #Wednesday put: nil.
symbolDictionary at: #Thursday put: nil.
symbolDictionary at: #Friday put: nil.
symbolDictionary at: #Saturday put: nil.
symbolDictionary at: #Sunday put: nil.

"Gregorian calendar specifics - months"
symbolDictionary at: #January put: nil.
symbolDictionary at: #February put: nil.
symbolDictionary at: #March put: nil.
symbolDictionary at: #April put: nil.
symbolDictionary at: #May put: nil.
symbolDictionary at: #June put: nil.
symbolDictionary at: #July put: nil.
symbolDictionary at: #August put: nil.
symbolDictionary at: #September put: nil.
symbolDictionary at: #October put: nil.
symbolDictionary at: #November put: nil.
symbolDictionary at: #December put: nil.
