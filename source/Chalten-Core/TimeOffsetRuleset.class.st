"
A ruleset that defines an offset to UTC.
This is an abstract class.
"
Class {
	#name : 'TimeOffsetRuleset',
	#superclass : 'Object',
	#category : 'Chalten-Core',
	#package : 'Chalten-Core',
	#'gs_options' : [
		'instancesInvariant'
	]
}

{ #category : 'converting' }
TimeOffsetRuleset >> convertGregorianDateTime: aGregorianDateTime [

  ^ self subclassResponsibility
]

{ #category : 'private - converting' }
TimeOffsetRuleset >> convertToGregorianDate: aGregorianDateTime withOffset: offsetToUTC [

  ^ ( Instant fromJulianDayNumber:
        aGregorianDateTime julianDayNumber - ( offsetToUTC convertTo: Instant day ) numericalValue )
      asGregorianDateTimeIn: self
]

{ #category : 'querying' }
TimeOffsetRuleset >> identifier [

  ^ self subclassResponsibility
]

{ #category : 'querying' }
TimeOffsetRuleset >> offsetToUniversalCoordinatedTimeAt: anInstant [

  ^ self subclassResponsibility
]

{ #category : 'printing' }
TimeOffsetRuleset >> printOffset: offset on: stream [

  | hours absoluteOffset minutes seconds |
  offset negative then: [ stream nextPut: $- ] otherwise: [ stream nextPut: $+ ].
  absoluteOffset := offset abs.
  hours := ( absoluteOffset convertTo: TimeOfDay hour ) truncated.
  stream
    nextPutAll: ( hours numericalValue printStringLength: 2 padded: true );
    nextPut: $:.
  minutes := ( absoluteOffset - hours convertTo: TimeOfDay minute ) truncated.
  stream nextPutAll: ( minutes numericalValue printStringLength: 2 padded: true ).
  seconds := absoluteOffset - hours - minutes convertTo: TimeOfDay second.
  seconds numericalValue strictlyPositive then: [
      stream
        nextPut: $:;
        nextPutAll: ( seconds numericalValue printStringLength: 2 padded: true )
    ]
]
