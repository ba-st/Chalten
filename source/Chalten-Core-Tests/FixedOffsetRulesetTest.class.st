"
A FixedOffsetRulesetTest is a test class for testing the behavior of FixedOffsetRuleset
"
Class {
	#name : 'FixedOffsetRulesetTest',
	#superclass : 'ChaltenTest',
	#category : 'Chalten-Core-Tests',
	#package : 'Chalten-Core-Tests'
}

{ #category : 'tests' }
FixedOffsetRulesetTest >> testCantCreateOutOfRange [

  self
    should: [ FixedOffsetRuleset for: -16.1 * hour ]
    raise: InstanceCreationFailed
    withMessageText: '-16.1 h is out of range. UTC offsets range from -16:00 to +16:00'
]

{ #category : 'tests' }
FixedOffsetRulesetTest >> testIdentifier [

  { 10 . -12 . -21 / 2 . 0 . 23 / 4 . 14 }
    with: #( 'UTC+10:00' 'UTC-12:00' 'UTC-10:30' 'UTC+00:00' 'UTC+05:45' 'UTC+14:00' )
    do: [ :hourCount :expectedString |
        | ruleset |
        ruleset := FixedOffsetRuleset for: hourCount * hour.
        self assert: ruleset identifier equals: expectedString
      ]
]

{ #category : 'tests' }
FixedOffsetRulesetTest >> testOffsetToUniversalCoordinatedTimeAt [

  self
    assert:
    ( ( FixedOffsetRuleset for: -3 * hour ) offsetToUniversalCoordinatedTimeAt: Instant now )
    equals: -3 * hour
]

{ #category : 'tests' }
FixedOffsetRulesetTest >> testPrintString [

  { 10 . -12 . -21 / 2 . 0 . 23 / 4 . 14 }
    with: #( 'UTC+10:00' 'UTC-12:00' 'UTC-10:30' 'UTC+00:00' 'UTC+05:45' 'UTC+14:00' )
    do: [ :hourCount :expectedString |
        | ruleset |
        ruleset := FixedOffsetRuleset for: hourCount * hour.
        self assert: ruleset printString equals: expectedString
      ]
]
