Class {
	#name : 'ISO8601DateFormatterTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Formatting-Tests',
	#package : 'Chalten-Formatting-Tests'
}

{ #category : 'tests' }
ISO8601DateFormatterTest >> testSuccessfulFormatting [

  self assert: ( ISO8601DateFormatter new  format: October third , 2015) equals: '2015-10-03'
]
