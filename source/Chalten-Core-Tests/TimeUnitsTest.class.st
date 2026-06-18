"
A TimeUnitsTest is a test class for testing the behavior of TimeUnits
"
Class {
	#name : 'TimeUnitsTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Core-Tests',
	#package : 'Chalten-Core-Tests'
}

{ #category : 'private' }
TimeUnitsTest >> isUnit: unitSymbol commensurableWith: anotherUnitSymbol [

  ^ ( self unit: unitSymbol ) isCommensurableWith: ( self unit: anotherUnitSymbol )
]

{ #category : 'tests' }
TimeUnitsTest >> testAbsoluteUnits [

  self
    assert: 1 * ( self unit: #minute ) equals: 60 * ( self unit: #second );
    assert: 3 / 2 * ( self unit: #hour ) equals: 90 * ( self unit: #minute );
    assert: 3 * ( self unit: #day ) equals: 72 * ( self unit: #hour );
    assert: 2 * ( self unit: #week ) equals: 14 * ( self unit: #day )
]

{ #category : 'tests' }
TimeUnitsTest >> testCommensurability [

  self
    assert: ( self isUnit: #year commensurableWith: #decade );
    assert: ( self isUnit: #month commensurableWith: #year );
    deny: ( self isUnit: #day commensurableWith: #month );
    assert: ( self isUnit: #day commensurableWith: #week )
]

{ #category : 'tests' }
TimeUnitsTest >> testRelativeUnits [

  self
    assert: 1 * ( self unit: #year ) equals: 12 * ( self unit: #month );
    assert: 2 * ( self unit: #lustrum ) equals: 1 * ( self unit: #decade );
    assert: 1 * ( self unit: #jubilee ) equals: 1 / 2 * ( self unit: #century );
    assert: 1 * ( self unit: #millenium ) equals: 10 * ( self unit: #century )
]

{ #category : 'private' }
TimeUnitsTest >> unit: unitSymbol [

  ^ TimeUnits units at: unitSymbol ifAbsent: [ InternationalSystemOfUnits units >> unitSymbol ]
]
