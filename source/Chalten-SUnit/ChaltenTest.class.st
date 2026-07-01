Class {
	#name : 'ChaltenTest',
	#superclass : 'TestCase',
	#instVars : [
		'day',
		'november',
		'april',
		'december',
		'february',
		'january',
		'july',
		'june',
		'march',
		'may',
		'august',
		'october',
		'september',
		'month',
		'year',
		'decade',
		'hour'
	],
	#category : 'Chalten-SUnit',
	#package : 'Chalten-SUnit'
}

{ #category : 'testing' }
ChaltenTest class >> isAbstract [

  <ignoreForCoverage>
  ^ self = ChaltenTest
]

{ #category : 'asserting' }
ChaltenTest >> assert: calendricalMagnitude isGreaterThan: anotherCalendricalMagnitude [

  self assert: calendricalMagnitude > anotherCalendricalMagnitude
]

{ #category : 'asserting' }
ChaltenTest >> assert: calendricalMagnitude isGreaterThanOrEqualTo: anotherCalendricalMagnitude [

  self assert: calendricalMagnitude >= anotherCalendricalMagnitude
]

{ #category : 'asserting' }
ChaltenTest >> assert: calendricalMagnitude isLessThan: anotherCalendricalMagnitude [

  self assert: calendricalMagnitude < anotherCalendricalMagnitude
]

{ #category : 'asserting' }
ChaltenTest >> assert: calendricalMagnitude isLessThanOrEqualTo: anotherCalendricalMagnitude [

  self assert: calendricalMagnitude <= anotherCalendricalMagnitude
]

{ #category : 'asserting' }
ChaltenTest >> assertNextOf: calendricalMagnitude is: anotherCalendricalMagnitude [

  self assert: calendricalMagnitude next equals: anotherCalendricalMagnitude
]

{ #category : 'asserting' }
ChaltenTest >> assertPreviousOf: calendricalMagnitude is: anotherCalendricalMagnitude [

  self assert: calendricalMagnitude previous equals: anotherCalendricalMagnitude
]

{ #category : 'asserting' }
ChaltenTest >> deny: calendricalMagnitude isGreaterThan: anotherCalendricalMagnitude [

  self deny: calendricalMagnitude > anotherCalendricalMagnitude
]

{ #category : 'asserting' }
ChaltenTest >> deny: calendricalMagnitude isLessThan: anotherCalendricalMagnitude [

  self deny: calendricalMagnitude < anotherCalendricalMagnitude
]

{ #category : 'private' }
ChaltenTest >> printAsISO8601String: calendarMagnitude [

  ^ ISO8601Formatter new format: calendarMagnitude
]

{ #category : 'running' }
ChaltenTest >> setUp [

  super setUp.
  hour := InternationalSystemOfUnits units >> #hour.
  day := InternationalSystemOfUnits units >> #day.
  month := TimeUnits units >> #month.
  year := TimeUnits units >> #year.
  decade := TimeUnits units >> #decade.
  self setUpMonths
]

{ #category : 'running' }
ChaltenTest >> setUpMonths [

  january := GregorianMonth january.
  february := GregorianMonth february.
  march := GregorianMonth march.
  april := GregorianMonth april.
  may := GregorianMonth may.
  june := GregorianMonth june.
  july := GregorianMonth july.
  august := GregorianMonth august.
  september := GregorianMonth september.
  october := GregorianMonth october.
  november := GregorianMonth november.
  december := GregorianMonth december
]
