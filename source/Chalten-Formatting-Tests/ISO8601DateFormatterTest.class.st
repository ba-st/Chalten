Class {
	#name : 'ISO8601DateFormatterTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Formatting-Tests',
	#package : 'Chalten-Formatting-Tests'
}

{ #category : 'tests' }
ISO8601DateFormatterTest >> testSuccessfulFormatting [

  | date |  date := ( GregorianYear number: 2015 ) october third.  self assert: ( ISO8601DateFormatter new format: date ) equals: '2015-10-03'
]
