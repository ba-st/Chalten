Class {
	#name : 'TimeOffsetAwareGregorianDateTime',
	#superclass : 'AbsolutePointInTime',
	#instVars : [
		'instant',
		'appliedOffset',
		'rulesetOptional'
	],
	#category : 'Chalten-Core',
	#package : 'Chalten-Core'
}

{ #category : 'instance creation' }
TimeOffsetAwareGregorianDateTime class >> at: anInstant [

  ^ self at: anInstant accordingTo: Optional unused shiftedBy: 0 * self day
]

{ #category : 'private - instance creation' }
TimeOffsetAwareGregorianDateTime class >> at: anInstant accordingTo: aTimeZoneOptional shiftedBy: offset [

  ^ self new initializeAt: anInstant accordingTo: aTimeZoneOptional shiftedBy: offset
]

{ #category : 'instance creation' }
TimeOffsetAwareGregorianDateTime class >> basedOn: anInstant accordingTo: aTimeOffsetRuleset [

  | offset |
  offset := aTimeOffsetRuleset offsetToUniversalCoordinatedTimeAt: anInstant.
  ^ self at: anInstant accordingTo: ( Optional containing: aTimeOffsetRuleset ) shiftedBy: offset
]

{ #category : 'converting' }
TimeOffsetAwareGregorianDateTime >> asInstant [

  ^ instant
]

{ #category : 'converting' }
TimeOffsetAwareGregorianDateTime >> asRelativePointInTime [

  | date |
  date := self withGregorianDayMonthYearDo: [ :dayNumber :monthNumber :yearNumber |
              ( yearNumber asGregorianYear monthAt: monthNumber ) dateAt: dayNumber ].
  ^ self withTimeOfDayDo: [ :timeOfDay | date at: timeOfDay ]
]

{ #category : 'converting' }
TimeOffsetAwareGregorianDateTime >> in: aTimeOffsetRuleset [

  ^ instant asGregorianDateTimeIn: aTimeOffsetRuleset
]

{ #category : 'converting' }
TimeOffsetAwareGregorianDateTime >> inCoordinatedUniversalTime [

  ^ instant asGregorianDateTimeInCoordinatedUniversalTime
]

{ #category : 'initialization' }
TimeOffsetAwareGregorianDateTime >> initializeAt: anInstant accordingTo: aTimeOffsetRulesetOptional shiftedBy: anOffset [

  instant := anInstant.
  rulesetOptional := aTimeOffsetRulesetOptional.
  appliedOffset := anOffset
]

{ #category : 'private - accessing' }
TimeOffsetAwareGregorianDateTime >> julianDayNumber [

  ^ ( instant next: appliedOffset ) julianDayNumber
]

{ #category : 'accessing' }
TimeOffsetAwareGregorianDateTime >> microsecondsSinceEpoch [

  ^ instant microsecondsSinceEpoch
]

{ #category : 'printing' }
TimeOffsetAwareGregorianDateTime >> printOn: stream [

  rulesetOptional
    withContentDo: [ :ruleset |
        self
          printYearMonthDateOn: stream;
          printTimeOfDayOn: stream.
        ruleset printOffset: appliedOffset on: stream
      ]
    ifUnused: [ stream print: instant ]
]

{ #category : 'private - converting' }
TimeOffsetAwareGregorianDateTime >> withTimeOfDayDo: aBlock [

  ^ ( instant next: appliedOffset ) withTimeOfDayDo: aBlock
]
