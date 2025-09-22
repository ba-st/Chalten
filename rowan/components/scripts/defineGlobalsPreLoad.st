| symbolDictionary |
symbolDictionary := Rowan image 
	symbolDictNamed: 'Chalten'
	ifAbsent: [
			Rowan image symbolList createDictionaryNamed: 'Chalten' at: Rowan image symbolList size + 1.
			Rowan image symbolDictNamed: 'Chalten'
	].

"Preliminar definition of global variables for source code to compile.
 These will be properly replaced later in the post load script."

symbolDictionary at: #ChaltenEnvironment ifAbsentPut: [ nil ].
symbolDictionary at: #TimeUnits ifAbsentPut: [ nil ].
symbolDictionary at: #TimeZones ifAbsentPut: [ nil ].
symbolDictionary at: #TheBeginningOfTime ifAbsentPut: [ nil ].
symbolDictionary at: #TheEndOfTime ifAbsentPut: [ nil ].

"Gregorian calendar specific globals"

symbolDictionary at: #Monday ifAbsentPut: [ nil ].
symbolDictionary at: #Tuesday ifAbsentPut: [ nil ].
symbolDictionary at: #Wednesday ifAbsentPut: [ nil ].
symbolDictionary at: #Thursday ifAbsentPut: [ nil ].
symbolDictionary at: #Friday ifAbsentPut: [ nil ].
symbolDictionary at: #Saturday ifAbsentPut: [ nil ].
symbolDictionary at: #Sunday ifAbsentPut: [ nil ].

"Gregorian calendar specifics - months"
symbolDictionary at: #January ifAbsentPut: [ nil ].
symbolDictionary at: #February ifAbsentPut: [ nil ].
symbolDictionary at: #March ifAbsentPut: [ nil ].
symbolDictionary at: #April ifAbsentPut: [ nil ].
symbolDictionary at: #May ifAbsentPut: [ nil ].
symbolDictionary at: #June ifAbsentPut: [ nil ].
symbolDictionary at: #July ifAbsentPut: [ nil ].
symbolDictionary at: #August ifAbsentPut: [ nil ].
symbolDictionary at: #September ifAbsentPut: [ nil ].
symbolDictionary at: #October ifAbsentPut: [ nil ].
symbolDictionary at: #November ifAbsentPut: [ nil ].
symbolDictionary at: #December ifAbsentPut: [ nil ].
