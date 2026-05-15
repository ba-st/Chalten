Class {
	#name : 'ISO8601DateParserTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Formatting-Tests',
	#package : 'Chalten-Formatting-Tests'
}

{ #category : 'tests' }
ISO8601DateParserTest >> testSuccessfulParsing [

  | date |  date := ( GregorianYear number: 2015 ) october third.  self assert: ( ISO8601DateParser new dateFrom: '2015-10-03' ) equals: date
]

{ #category : 'tests' }
ISO8601DateParserTest >> testUnuccessfulParsing [

  self
    should: [ ISO8601DateParser new dateFrom: '2015-22-03' ]
    raise: AssertionFailed
    description: 'Could not parse date: 2015-22-03'
]
