Extension { #name : 'FsBinaryFileStream' }

{ #category : '*Chalten-Core-GS64-Extensions' }
FsBinaryFileStream >> int32 [
  "Answer the next signed, 32-bit integer from this (binary) stream.
   Details: As a fast check for negative number, check the high bit of the first digit"

  | n firstDigit |
  n := firstDigit := self next.
  n := ( n bitShift: 8 ) + self next.
  n := ( n bitShift: 8 ) + self next.
  n := ( n bitShift: 8 ) + self next.
  firstDigit >= 128 ifTrue: [ n := -16r100000000 + n ]. "decode negative 32-bit integer"
  ^ n
]

{ #category : '*Chalten-Core-GS64-Extensions' }
FsBinaryFileStream >> uint32 [
  "Answer the next unsigned, 32-bit integer from this (binary) stream."

  | n |
  n := self next.
  n := ( n bitShift: 8 ) + self next.
  n := ( n bitShift: 8 ) + self next.
  n := ( n bitShift: 8 ) + self next.
  ^ n
]
