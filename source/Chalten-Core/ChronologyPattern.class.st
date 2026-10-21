"
I'm a date and time pattern, as defined by the Unicode CLDR, like `d 'de' MMMM 'de' y` or `h:mm:ss a z`.

I hold my elements in order: the literal strings to write as they are, and the names of the fields to write in their place, as symbols.

The fields I support are:

- `y`, `yy`: `#year`, `#twoDigitYear`
- `M`, `L`: `#month`; `MM`, `LL`: `#twoDigitMonth`; `MMM`: `#monthShortName`; `MMMM`: `#monthName`
- `d`: `#day`; `dd`: `#twoDigitDay`
- `E`, `EE`, `EEE`, `ccc`: `#dayOfWeekShortName`; `EEEE`, `cccc`: `#dayOfWeekName`
- `h`: `#hourOf12HourClock`; `hh`: `#twoDigitHourOf12HourClock`; `H`: `#hourOf24HourClock`; `HH`: `#twoDigitHourOf24HourClock`; `a`: `#dayPeriod`
- `m`: `#minute`; `mm`: `#twoDigitMinute`; `s`: `#second`; `ss`: `#twoDigitSecond`
- `z`, `zz`, `zzz`, `O`: `#shortOffset`; `zzzz`, `OOOO`: `#longOffset`
- `{1}`: `#date` and `{0}`: `#time`, the placeholders of the patterns combining a date and a time, replaced by `replacingDateWith:andTimeWith:`

Text between single quotes is literal, and two single quotes stand for one. Any other ASCII letter is a field I don't support, and I refuse to be created with it.

Reference: https://unicode.org/reports/tr35/tr35-dates.html#Date_Format_Patterns
"
Class {
	#name : 'ChronologyPattern',
	#superclass : 'Object',
	#instVars : [
		'elements'
	],
	#category : 'Chalten-Core',
	#package : 'Chalten-Core'
}

{ #category : 'accessing' }
ChronologyPattern class >> fieldNamesByLetters [

  ^ Dictionary new
      at: 'y' put: #year;
      at: 'yy' put: #twoDigitYear;
      at: 'M' put: #month;
      at: 'L' put: #month;
      at: 'MM' put: #twoDigitMonth;
      at: 'LL' put: #twoDigitMonth;
      at: 'MMM' put: #monthShortName;
      at: 'MMMM' put: #monthName;
      at: 'd' put: #day;
      at: 'dd' put: #twoDigitDay;
      at: 'E' put: #dayOfWeekShortName;
      at: 'EE' put: #dayOfWeekShortName;
      at: 'EEE' put: #dayOfWeekShortName;
      at: 'ccc' put: #dayOfWeekShortName;
      at: 'EEEE' put: #dayOfWeekName;
      at: 'cccc' put: #dayOfWeekName;
      at: 'h' put: #hourOf12HourClock;
      at: 'hh' put: #twoDigitHourOf12HourClock;
      at: 'H' put: #hourOf24HourClock;
      at: 'HH' put: #twoDigitHourOf24HourClock;
      at: 'a' put: #dayPeriod;
      at: 'm' put: #minute;
      at: 'mm' put: #twoDigitMinute;
      at: 's' put: #second;
      at: 'ss' put: #twoDigitSecond;
      at: 'z' put: #shortOffset;
      at: 'zz' put: #shortOffset;
      at: 'zzz' put: #shortOffset;
      at: 'O' put: #shortOffset;
      at: 'zzzz' put: #longOffset;
      at: 'OOOO' put: #longOffset;
      yourself
]

{ #category : 'instance creation' }
ChronologyPattern class >> fromString: aString [

  ^ self new initializeFromString: aString
]

{ #category : 'private - instance creation' }
ChronologyPattern class >> withElements: anArray [

  ^ self new initializeWithElements: anArray
]

{ #category : 'accessing' }
ChronologyPattern >> elements [
  "Answers the literal strings and the field names, in order"

  ^ elements
]

{ #category : 'private' }
ChronologyPattern >> enforce: aBlock because: anExplanation [

  AssertionChecker enforce: aBlock because: anExplanation raising: InstanceCreationFailed
]

{ #category : 'initialization' }
ChronologyPattern >> initializeFromString: aString [

  | stream fieldNamesByLetters literalStream |
  stream := aString readStream.
  fieldNamesByLetters := self class fieldNamesByLetters.
  elements := OrderedCollection new.
  literalStream := WriteStream on: String new.
  [ stream atEnd ] whileFalse: [
      | character |
      character := stream next.
      character = $'
        ifTrue: [ self parseQuotedLiteralFrom: stream on: literalStream ]
        ifFalse: [
            ( character = ${ or: [ self isLetter: character ] )
              ifTrue: [
                  literalStream contents ifNotEmpty: [ :literal | elements add: literal ].
                  literalStream := WriteStream on: String new.
                  elements add: ( character = ${
                        ifTrue: [ self parsePlaceholderFrom: stream ]
                        ifFalse: [
                          self
                            parseFieldStartingWith: character
                            from: stream
                            using: fieldNamesByLetters ] )
                ]
              ifFalse: [ literalStream nextPut: character ]
          ]
    ].
  literalStream contents ifNotEmpty: [ :literal | elements add: literal ].
  elements := elements asArray
]

{ #category : 'initialization' }
ChronologyPattern >> initializeWithElements: anArray [

  elements := anArray
]

{ #category : 'private' }
ChronologyPattern >> isLetter: aCharacter [
  "Only ASCII letters are fields: other letters, as in 'y年M月d日', are literal"

  ^ 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ' includes: aCharacter
]

{ #category : 'private' }
ChronologyPattern >> parseFieldStartingWith: aLetter from: stream using: fieldNamesByLetters [

  | letters |
  letters := String streamContents: [ :field |
                 field nextPut: aLetter.
                 [ stream atEnd not and: [ stream peek = aLetter ] ] whileTrue: [
                     field nextPut: stream next ]
               ].
  ^ fieldNamesByLetters at: letters ifAbsent: [
        InstanceCreationFailed signal:
          'The field ' , letters , ' is not supported in date and time patterns'
      ]
]

{ #category : 'private' }
ChronologyPattern >> parsePlaceholderFrom: stream [
  "Called after an opening brace"

  | placeholder |
  placeholder := String streamContents: [ :contents |
                     [ stream atEnd or: [ stream peek = $} ] ] whileFalse: [
                         contents nextPut: stream next ] ].
  self enforce: [ stream atEnd not ] because: 'Missing closing brace in date and time pattern'.
  stream next.
  placeholder = '0' ifTrue: [ ^ #time ].
  placeholder = '1' ifTrue: [ ^ #date ].
  ^ InstanceCreationFailed signal:
      'The placeholder {' , placeholder , '} is not supported in date and time patterns'
]

{ #category : 'private' }
ChronologyPattern >> parseQuotedLiteralFrom: stream on: literalStream [
  "Called after an opening quote. Two consecutive quotes stand for a quote;
	otherwise everything up to the closing quote is literal, with doubled quotes inside standing for one."

  stream peek = $' ifTrue: [ ^ literalStream nextPut: stream next ].
  [
    self enforce: [ stream atEnd not ] because: 'Missing closing quote in date and time pattern'.
    stream peek = $' and: [
        stream next.
        stream peek ~= $'
      ]
  ] whileFalse: [ literalStream nextPut: stream next ]
]

{ #category : 'combining' }
ChronologyPattern >> replacingDateWith: aDatePattern andTimeWith: aTimePattern [
  "Answers the pattern combining a date and a time with its placeholders replaced by the elements of the given patterns"

  | replacements combined |
  replacements := IdentityDictionary new
                    at: #date put: aDatePattern elements;
                    at: #time put: aTimePattern elements;
                    yourself.
  combined := OrderedCollection new.
  elements do: [ :element |
      combined addAll: ( replacements at: element ifAbsent: [ Array with: element ] ) ].
  ^ self class withElements: combined asArray
]
