Class {
	#name : 'ISO8601DateFormatter',
	#superclass : 'Object',
	#category : 'Chalten-Formatting',
	#package : 'Chalten-Formatting'
}

{ #category : 'formatting' }
ISO8601DateFormatter >> format: aDate [

  ^ '<1s>-<2s>-<3s>'
      expandMacrosWith: ( aDate yearNumber printStringLength: 4 padded: true )
      with: ( aDate monthNumber printStringLength: 2 padded: true )
      with: ( aDate dayNumber printStringLength: 2 padded: true )
]
