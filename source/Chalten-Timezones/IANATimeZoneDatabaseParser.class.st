"
I'm a parser of the binary tzfile format data and return timezone rules
"
Class {
	#name : 'IANATimeZoneDatabaseParser',
	#superclass : 'Object',
	#category : 'Chalten-Timezones',
	#package : 'Chalten-Timezones'
}

{ #category : 'private - asserting' }
IANATimeZoneDatabaseParser >> assertIsExpectedVersion: byte [

  AssertionChecker
    enforce: [ '23' includes: byte asCharacter ]
    because: [ 'Invalid timezone information file version. Expected "2" or "3"' localized ]
]

{ #category : 'private - asserting' }
IANATimeZoneDatabaseParser >> assertIsMagicConstant: bytes [
  "The magic four-byte ASCII sequence “TZif” identifies the file as a timezone information file"

  AssertionChecker
    enforce: [ bytes = 'TZif' utf8Encoded ]
    because: ['Invalid timezone information file. Expected TZif constant' localized]
]

{ #category : 'parsing' }
IANATimeZoneDatabaseParser >> parse: binaryStream [
  "Parse binary tzfile format data from the stream and return timezone rules"

  | header transitions rulesets |
  header := self parseHeaderFrom: binaryStream.
  transitions := self parseTransitionTimesIn: binaryStream accordingTo: header.
  rulesets := self parseRulesetsIn: binaryStream accordingTo: header.
  ^ { #rulesets -> rulesets . #transitions -> transitions } asDictionary
]

{ #category : 'private - parsing' }
IANATimeZoneDatabaseParser >> parseHeaderFrom: stream [
  "The format begins with a 44-byte header containing the following fields:
	- The magic four-byte ASCII sequence “TZif” identifies the file as a timezone information file.
	- A byte identifying the version of the file's format (as of 2021, either an ASCII NUL, “2”, “3”, or “4”).
	- Fifteen bytes containing zeros reserved for future use.
	- Six four-byte integer values, in the following order:
 		- tzh_ttisutcnt : The number of UT/local indicators stored in the file.  (UT is Universal Time.)
		- tzh_ttisstdcnt : The number of standard/wall indicators stored in the file.
		- tzh_leapcnt : The number of leap seconds for which data entries are stored in the file.
		- tzh_timecnt : The number of transition times for which data entries are stored in the file.
		- tzh_typecnt : The number of local time types for which data entries are stored in the file (must not be zero).
		- tzh_charcnt: The number of bytes of time zone abbreviation strings stored in the file."

  | header |
  self
    assertIsMagicConstant: ( stream next: 4 );
    assertIsExpectedVersion: stream next.
  stream skip: 15.
  header := Dictionary new.
  #( #utcIndicatorCount #wallIndicatorCount leapSecondsCount transitionCount localTimeTypeCount
     abbreviationByteCount ) do: [ :key | header at: key put: stream uint32 ].
  ^ header
]

{ #category : 'private - parsing' }
IANATimeZoneDatabaseParser >> parseOffsetIndicesIn: binaryStream accordingTo: header [
  "One-byte unsigned integer values; each one but the last tells which of the
	different types of local time types described in the file is associated with the time
	period starting with the same-indexed transition time and continuing up to but not
	including the next transition time.
	These values serve as indices into the next field."

  ^ ( binaryStream next: ( header at: #transitionCount ) ) asArray
]

{ #category : 'private - parsing' }
IANATimeZoneDatabaseParser >> parseOffsetRulesetsIn: binaryStream accordingTo: header [
  "Each entry is written as a four-byte signed integer value
	for the offset as a number of seconds, in network byte order,
	followed by a one-byteboolean indicating if the offset is DST
	and a one-byte value for indexing into the array of time zone
	abbreviation bytes"

  | count |
  count := header at: #localTimeTypeCount.

  ^ Array new: count streamContents: [ :out |
        count timesRepeat: [
            | offset |
            offset := binaryStream int32.
            out nextPut: ( FixedOffsetRuleset for: offset * TimeOfDay second ).
            "Skip the following two values"
            binaryStream
              next;
              next
          ]
      ]
]

{ #category : 'private - parsing' }
IANATimeZoneDatabaseParser >> parseRulesetsIn: binaryStream accordingTo: header [

  | offsetIndices offsetRulesets rulesets |
  offsetIndices := self parseOffsetIndicesIn: binaryStream accordingTo: header.
  offsetRulesets := self parseOffsetRulesetsIn: binaryStream accordingTo: header.
  rulesets := offsetIndices
                collect: [ :zeroBasedInxed | offsetRulesets at: zeroBasedInxed + 1 ]
                as: OrderedCollection.
  rulesets addFirst: offsetRulesets first.
  ^ rulesets
]

{ #category : 'private - parsing' }
IANATimeZoneDatabaseParser >> parseTransitionTimesIn: binaryStream accordingTo: header [

  | transitionCount |
  transitionCount := header at: #transitionCount.
  ^ Array
      new: transitionCount
      streamContents: [ :out |
		 " Four-byte signed integer values sorted in ascending order.  These values are written in network byte
            order.  Each is used as a transition time at which the rules for computing local time change."
          transitionCount timesRepeat: [ out nextPut: ( Instant fromUnixTime: binaryStream int32 ) ] ]
]
