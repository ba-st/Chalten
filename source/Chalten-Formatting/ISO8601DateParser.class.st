Class {
	#name : 'ISO8601DateParser',
	#superclass : 'Object',
	#category : 'Chalten-Formatting',
	#package : 'Chalten-Formatting'
}

{ #category : 'parsing' }
ISO8601DateParser >> dateFrom: aString [

  | smalltalkDate month |
  smalltalkDate := self parseAsSmalltalkDate: aString.
  month := ( GregorianYear number: smalltalkDate year ) monthAt: smalltalkDate monthIndex.
  ^ month dateAt: smalltalkDate dayOfMonth
]

{ #category : 'private - parsing' }
ISO8601DateParser >> parseAsSmalltalkDate: jsonString [

  ^ [
      Date
        perform: #year:month:day:
        withArguments: ( ( jsonString substrings: '-' ) collect: #asNumber ) ]
      on: Error
      do: [ :error |
        AssertionFailed signal: ( 'Could not parse date: <1s>' expandMacrosWith: jsonString ) ]
]
