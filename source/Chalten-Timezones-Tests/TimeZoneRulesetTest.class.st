"
A TimeZoneRulesetTest is a test class for testing the behavior of TimeZoneRuleset
"
Class {
	#name : 'TimeZoneRulesetTest',
	#superclass : 'ChaltenTest',
	#instVars : [
		'ruleset',
		'firstTransitionTime',
		'secondTransitionTime'
	],
	#category : 'Chalten-Timezones-Tests',
	#package : 'Chalten-Timezones-Tests'
}

{ #category : 'private - asserting' }
TimeZoneRulesetTest >> assertOffsetToUTCAt: instant is: timeQuantity [

  self assert: ( ruleset offsetToUniversalCoordinatedTimeAt: instant ) equals: timeQuantity
]

{ #category : 'running' }
TimeZoneRulesetTest >> setUp [

  super setUp.
  firstTransitionTime := Instant epoch.
  secondTransitionTime := firstTransitionTime next: 365 * day.
  ruleset := TimeZoneRuleset
               identifiedBy: 'Testing/TimeZone'
               withAll:
               ( #( -3 -4 -2 ) collect: [ :number | FixedOffsetRuleset for: number * hour ] )
               transitioningOn: { firstTransitionTime . secondTransitionTime }
]

{ #category : 'tests' }
TimeZoneRulesetTest >> testCantCreateWithInvalidNumberOfTransitions [

  self
    should: [ TimeZoneRuleset identifiedBy: 'Test' withAll: {  } transitioningOn: {  } ]
    raise: InstanceCreationFailed
    withMessageText: 'Must be exactly one more offset ruleset than transitions between them';
    should: [ TimeZoneRuleset identifiedBy: 'Test' withAll: {  } transitioningOn: { Instant epoch } ]
    raise: InstanceCreationFailed
    withMessageText: 'Must be exactly one more offset ruleset than transitions between them';
    should: [
        TimeZoneRuleset
          identifiedBy: 'Test'
          withAll: { FixedOffsetRuleset for: 1 * hour }
          transitioningOn: { Instant epoch }
      ]
    raise: InstanceCreationFailed withMessageText:
      'Must be exactly one more offset ruleset than transitions between them';
    should: [
        TimeZoneRuleset
          identifiedBy: 'Test'
          withAll: { FixedOffsetRuleset for: 1 * hour . FixedOffsetRuleset for: 2 * hour }
          transitioningOn: {  }
      ]
    raise: InstanceCreationFailed withMessageText:
      'Must be exactly one more offset ruleset than transitions between them'
]

{ #category : 'tests' }
TimeZoneRulesetTest >> testIdentifier [

  self assert: ruleset identifier equals: 'Testing/TimeZone'
]

{ #category : 'tests' }
TimeZoneRulesetTest >> testOffsetToUniversalCoordinatedTimeAt [

  self
    assertOffsetToUTCAt: ( firstTransitionTime previous: 1000 * day ) is: -3 * hour;
    assertOffsetToUTCAt: ( firstTransitionTime previous: 1 * day ) is: -3 * hour;
    assertOffsetToUTCAt: firstTransitionTime is: -4 * hour;
    assertOffsetToUTCAt: ( firstTransitionTime next: 1 * day ) is: -4 * hour;
    assertOffsetToUTCAt: ( secondTransitionTime previous: 1 * day ) is: -4 * hour;
    assertOffsetToUTCAt: secondTransitionTime is: -2 * hour;
    assertOffsetToUTCAt: ( secondTransitionTime next: 1 * day ) is: -2 * hour;
    assertOffsetToUTCAt: ( secondTransitionTime next: 1000 * day ) is: -2 * hour
]

{ #category : 'tests' }
TimeZoneRulesetTest >> testPrintString [

  self assert: ruleset printString equals: 'Testing/TimeZone'
]
