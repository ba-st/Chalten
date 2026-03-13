"
A time zone is unambiguously defined by the set of time measurement rules determined by
the governing body for a given geographic area.

These rules describe, at a minimum, the base offset from UTC for the time zone, often referred
to as the Standard Time offset.

- Many locations adjust their Standard Time forward or backward by one hour, in order to accommodate
  seasonal changes in number of daylight hours, often referred to as Daylight Saving Time. 
- Some locations adjust their time by a fraction of an hour.
- Standard Time is also known as Winter Time.
- Daylight Saving Time is also known as Advanced Time, Summer Time, or Legal Time in certain countries.


"
Class {
	#name : 'TimeZoneRuleset',
	#superclass : 'TimeOffsetRuleset',
	#instVars : [
		'identifier',
		'fixedOffsetRulesets',
		'transitions'
	],
	#category : 'Chalten-Timezones',
	#package : 'Chalten-Timezones'
}

{ #category : 'instance creation' }
TimeZoneRuleset class >> identifiedBy: anIdentifier withAll: aRulesetCollection transitioningOn: anInstantCollection [

  AssertionChecker
    enforce: [ aRulesetCollection size = ( anInstantCollection size + 1 ) ]
    because: 'Must be exactly one more offset ruleset than transitions between them' localized
    raising: InstanceCreationFailed.

  ^ self new
      identifiedBy: anIdentifier
      withAll: aRulesetCollection
      transitioningOn: anInstantCollection
]

{ #category : 'converting' }
TimeZoneRuleset >> convertGregorianDateTime: aGregorianDateTime [

  | instantInUTC earlierOffset laterOffset |
  instantInUTC := aGregorianDateTime inCoordinatedUniversalTime asInstant.
  earlierOffset := self offsetToUniversalCoordinatedTimeAt: ( instantInUTC previous: self oneDay ).
  laterOffset := self offsetToUniversalCoordinatedTimeAt: ( instantInUTC next: self oneDay ).

  ^ earlierOffset = laterOffset
      then: [ self convertToGregorianDate: aGregorianDateTime withOffset: earlierOffset ]
      otherwise: [
          earlierOffset < laterOffset
            then: [ self signalSkippedTimeError ]
            otherwise: [
              self
                signalAmbiguousTimeErrorFor: aGregorianDateTime
                between: earlierOffset
                and: laterOffset ]
        ]
]

{ #category : 'initialization' }
TimeZoneRuleset >> identifiedBy: anIndenfitier withAll: aRulesetCollection transitioningOn: anInstantCollection [

  identifier := anIndenfitier.
  fixedOffsetRulesets := aRulesetCollection.
  transitions := anInstantCollection
]

{ #category : 'querying' }
TimeZoneRuleset >> identifier [

  ^ identifier
]

{ #category : 'querying' }
TimeZoneRuleset >> offsetToUniversalCoordinatedTimeAt: anInstant [

  | index |
  index := ( BinarySearchAlgorithm
               searchFor: anInstant
               in: transitions
               using: [ :instant | instant ] ) execute.
  ^ ( fixedOffsetRulesets at: index ) offsetToUniversalCoordinatedTimeAt: anInstant
]

{ #category : 'private' }
TimeZoneRuleset >> oneDay [

  ^ 1 * Instant day
]

{ #category : 'printing' }
TimeZoneRuleset >> printOn: stream [

	stream nextPutAll: identifier 
]

{ #category : 'private' }
TimeZoneRuleset >> signalAmbiguousTimeErrorFor: aGregorianDateTime between: earlierOffset and: laterOffset [

  ^ AmbiguousTimeError
      signalFor: ( self convertToGregorianDate: aGregorianDateTime withOffset: earlierOffset )
      and: ( self convertToGregorianDate: aGregorianDateTime withOffset: laterOffset )
      withMessageText:
        'Cannot convert the local date time into an absolute point in time because it''s ambiguous in this timezone'
          localized
]

{ #category : 'private' }
TimeZoneRuleset >> signalSkippedTimeError [

  ^ SkippedTimeError signal:
      'The local time doesn''t exist in the timezone due to daylight saving time changes.' localized
]
