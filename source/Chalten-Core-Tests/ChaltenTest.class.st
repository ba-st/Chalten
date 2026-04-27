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
	#category : 'Chalten-Core-Tests',
	#package : 'Chalten-Core-Tests'
}

{ #category : 'testing' }
ChaltenTest class >> isAbstract [

  <ignoreForCoverage>
  ^ self = ChaltenTest
]

{ #category : 'asserting' }
ChaltenTest >> assert: actual equals: expected [

  super assert: actual equals: expected.
  super assert: expected equals: actual.
  "If the objects are not equal the previous statement will signal a failure exception,
	so we can assume that at this point the objects are equal"
  self assert: actual hash = expected hash description: 'Hash of equal objects must be equal too'
]

{ #category : 'asserting' }
ChaltenTest >> assert: calendricalMagnitude isGreaterThan: anotherCalendricalMagnitude [

  self assert: calendricalMagnitude > anotherCalendricalMagnitude
]

{ #category : 'asserting' }
ChaltenTest >> assert: calendricalMagnitude isGreaterThanOrEquals: anotherCalendricalMagnitude [

  self assert: calendricalMagnitude >= anotherCalendricalMagnitude
]

{ #category : 'asserting' }
ChaltenTest >> assert: calendricalMagnitude isLessThan: anotherCalendricalMagnitude [

  self assert: calendricalMagnitude < anotherCalendricalMagnitude
]

{ #category : 'asserting' }
ChaltenTest >> assert: calendricalMagnitude isLessThanOrEquals: anotherCalendricalMagnitude [

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
ChaltenTest >> deny: actual equals: expected [

  super deny: actual equals: expected.
  super deny: expected equals: actual
]

{ #category : 'asserting' }
ChaltenTest >> deny: calendricalMagnitude isGreaterThan: anotherCalendricalMagnitude [

  self deny: calendricalMagnitude > anotherCalendricalMagnitude
]

{ #category : 'asserting' }
ChaltenTest >> deny: calendricalMagnitude isLessThan: anotherCalendricalMagnitude [

  self deny: calendricalMagnitude < anotherCalendricalMagnitude
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
