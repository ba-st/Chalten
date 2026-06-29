"
I'm a formatter of the ISO 8601 extended format for time periods (durations).
"
Class {
	#name : 'ISO8601DurationFormatter',
	#superclass : 'Formatter',
	#instVars : [
		'decimalPlaces'
	],
	#category : 'Chalten-Core',
	#package : 'Chalten-Core'
}

{ #category : 'instance creation' }
ISO8601DurationFormatter class >> withDecimalPlaces: anInteger [

  ^ self new decimalPlaces: anInteger
]

{ #category : 'private - asserting' }
ISO8601DurationFormatter >> assertHasIntegerValue: period unlessIsTheLastIn: remainingPeriods [
  "According to the ISO 8601 standard, a decimal fraction can only be applied to the lowest-order component present in the duration string."

  remainingPeriods ifNotEmpty: [
      AssertionChecker
        enforce: [ period numericalValue isInteger ]
        because: [ 'A decimal fraction can only be applied to the lowest-order component' localized ]
    ]
]

{ #category : 'private - asserting' }
ISO8601DurationFormatter >> assertNotEmpty: timePeriods [

  AssertionChecker
    enforce: [ timePeriods notEmpty ]
    because: [ 'Cannot format empty time periods' localized ]
]

{ #category : 'private - asserting' }
ISO8601DurationFormatter >> assertThereAreNotRemainingPeriodsIn: remainingPeriods [

  remainingPeriods ifNotEmpty: [
      AssertionFailed signal: 'Cannot format time periods including invalid units' localized ]
]

{ #category : 'private - accessing' }
ISO8601DurationFormatter >> day [

  ^ InternationalSystemOfUnits units >> #day
]

{ #category : 'private - accessing' }
ISO8601DurationFormatter >> decimalPlaces: anInteger [

  decimalPlaces := anInteger
]

{ #category : 'formatting' }
ISO8601DurationFormatter >> format: timePeriodOrPeriods on: stream [

  stream nextPutAll: 'P'.
  timePeriodOrPeriods isCollection
    then: [ self formatTimePeriods: timePeriodOrPeriods on: stream ]
    otherwise: [ "Week durations are specially handled"
        timePeriodOrPeriods unit = self week
          then: [ self formatSingleTimePeriod: timePeriodOrPeriods on: stream ]
          otherwise: [ self formatTimePeriods: { timePeriodOrPeriods } on: stream ]
      ]
]

{ #category : 'private - formatting' }
ISO8601DurationFormatter >> formatSingleTimePeriod: timePeriod on: stream [

  | number |
  number := timePeriod numericalValue.
  number isInteger
    then: [ number printOn: stream ]
    otherwise: [ number printOn: stream showingDecimalPlaces: decimalPlaces ].
  stream nextPut: timePeriod unit symbol first asUppercase
]

{ #category : 'private - formatting' }
ISO8601DurationFormatter >> formatTimePeriods: timePeriods on: stream [

  | remainingPeriods supportedUnitsInOrder switchToTimeSection |
  self assertNotEmpty: timePeriods.
  supportedUnitsInOrder := self supportedUnitsInOrder.
  remainingPeriods := OrderedCollection withAll: timePeriods.
  switchToTimeSection := false.

  "Try to process all the supported units in order: Y M D H M S"
  [ supportedUnitsInOrder atEnd or: [ remainingPeriods isEmpty ] ] whileFalse: [
      | unit |
      unit := supportedUnitsInOrder next.
      unit = self hour then: [ switchToTimeSection := true ].
      remainingPeriods detect: [ :period | period unit = unit ] ifFound: [ :period |
          remainingPeriods remove: period.
          switchToTimeSection then: [
              stream nextPut: $T.
              switchToTimeSection := false
            ].
          self assertHasIntegerValue: period unlessIsTheLastIn: remainingPeriods.
          self formatSingleTimePeriod: period on: stream
        ]
    ].
  self assertThereAreNotRemainingPeriodsIn: remainingPeriods
]

{ #category : 'private - accessing' }
ISO8601DurationFormatter >> hour [

  ^ TimeOfDay hour
]

{ #category : 'initialization' }
ISO8601DurationFormatter >> initialize [

  super initialize.
  self decimalPlaces: 6
]

{ #category : 'private - accessing' }
ISO8601DurationFormatter >> minute [

  ^ TimeOfDay minute
]

{ #category : 'private - accessing' }
ISO8601DurationFormatter >> month [

  ^ TimeUnits units >> #month
]

{ #category : 'private - accessing' }
ISO8601DurationFormatter >> second [

  ^ InternationalSystemOfUnits units >> #second
]

{ #category : 'private - accessing' }
ISO8601DurationFormatter >> supportedUnitsInOrder [

  ^ { self year . self month . self day . self hour . self minute . self second } readStream
]

{ #category : 'private - accessing' }
ISO8601DurationFormatter >> week [

  ^ InternationalSystemOfUnits units >> #week
]

{ #category : 'private - accessing' }
ISO8601DurationFormatter >> year [

  ^ TimeUnits units >> #year
]
