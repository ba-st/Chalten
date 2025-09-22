
  | symbolDictionary gregorianCalendar assignmentCommand |
  symbolDictionary := Rowan image
                        symbolDictNamed: 'Chalten'
                        ifAbsent: [ Error signal: 'Chalten symbol dictionary missing' ].
  assignmentCommand := [ :key :contentBlock |
                         symbolDictionary
                           at: key
                           ifPresent: [ :current |
                             current ifNil: [ symbolDictionary at: key put: contentBlock value ] ]
                           ifAbsentPut: contentBlock
                       ].

  "Global variables definition"

  assignmentCommand
    value: #ChaltenEnvironment
    value: [ ChaltenEnvironmentBehavior initializeEnvironment new ].
  assignmentCommand value: #TimeUnits value: [
      TimeUnitsGlobals
        initializeUniqueInstance;
        new
    ].
  TimeOfDay initializeTimesOfDay. "Cannot be invoked from TimeOfDay class>>initialize because depends on TimeUnits global"
  CalendarDefinition allSubclassesDo: [ :each |
      each subclasses ifEmpty: [ each initializeCalendar ] ].
  assignmentCommand value: #TheBeginningOfTime value: [
      TheBeginningOfTimeClass
        initializeUniqueInstance;
        new
    ].
  assignmentCommand value: #TheEndOfTime value: [
      TheEndOfTimeClass
        initializeUniqueInstance;
        new
    ].
  assignmentCommand value: #TimeZones value: [
      TimeZonesGlobals
        initializeUniqueInstance;
        new
    ].

  "Gregorian calendar specific globals"

  gregorianCalendar := ChaltenEnvironment calendarNamed: #GregorianCalendar.
  assignmentCommand value: #Monday value: [ gregorianCalendar monday ].
  assignmentCommand value: #Tuesday value: [ gregorianCalendar tuesday ].
  assignmentCommand value: #Wednesday value: [ gregorianCalendar wednesday ].
  assignmentCommand value: #Thursday value: [ gregorianCalendar thursday ].
  assignmentCommand value: #Friday value: [ gregorianCalendar friday ].
  assignmentCommand value: #Saturday value: [ gregorianCalendar saturday ].
  assignmentCommand value: #Sunday value: [ gregorianCalendar sunday ].

  assignmentCommand value: #January value: [ gregorianCalendar january ].
  assignmentCommand value: #February value: [ gregorianCalendar february ].
  assignmentCommand value: #March value: [ gregorianCalendar march ].
  assignmentCommand value: #April value: [ gregorianCalendar april ].
  assignmentCommand value: #May value: [ gregorianCalendar may ].
  assignmentCommand value: #June value: [ gregorianCalendar june ].
  assignmentCommand value: #July value: [ gregorianCalendar july ].
  assignmentCommand value: #August value: [ gregorianCalendar august ].
  assignmentCommand value: #September value: [ gregorianCalendar september ].
  assignmentCommand value: #October value: [ gregorianCalendar october ].
  assignmentCommand value: #November value: [ gregorianCalendar november ].
  assignmentCommand value: #December value: [ gregorianCalendar december ]