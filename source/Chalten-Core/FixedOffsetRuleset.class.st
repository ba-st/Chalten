"
A ruleset that always returns a fixed offset to UTC
"
Class {
	#name : 'FixedOffsetRuleset',
	#superclass : 'TimeOffsetRuleset',
	#instVars : [
		'offsetToUniversalCoordinatedTime'
	],
	#category : 'Chalten-Core',
	#package : 'Chalten-Core'
}

{ #category : 'instance creation' }
FixedOffsetRuleset class >> for: anOffset [

  AssertionChecker
    enforce: [ anOffset between: -16 * TimeOfDay hour and: 16 * TimeOfDay hour ]
    because: [
      '{1} is out of range. UTC offsets range from -16:00 to +16:00' localizedWithAll: { anOffset printString } ]
    raising: InstanceCreationFailed.
  ^ self new initializeFor: anOffset
]

{ #category : 'converting' }
FixedOffsetRuleset >> convertGregorianDateTime: aGregorianDateTime [

  ^ self convertToGregorianDate: aGregorianDateTime withOffset: offsetToUniversalCoordinatedTime
]

{ #category : 'querying' }
FixedOffsetRuleset >> identifier [

  ^ self printString
]

{ #category : 'initialization' }
FixedOffsetRuleset >> initializeFor: anOffset [

  offsetToUniversalCoordinatedTime := anOffset
]

{ #category : 'querying' }
FixedOffsetRuleset >> offsetToUniversalCoordinatedTimeAt: anInstant [

  ^ offsetToUniversalCoordinatedTime
]

{ #category : 'printing' }
FixedOffsetRuleset >> printOn: stream [

  stream nextPutAll: 'UTC'.
  self printOffset: offsetToUniversalCoordinatedTime on: stream
]
